# index.py
from fastapi import FastAPI, Query
from fastapi.middleware.cors import CORSMiddleware
from larry_williams_day_api import calculate_breakout_price, backtest_breakout_daily, calculate_today_breakout_price, Config
from larry_williams_day_fine_api import backtest_with_stop_take, Config
from larry_connors_api import connors_api

app = FastAPI(title="Backtest-Labs")

origins = [
    "http://localhost:3000",
    "http://127.0.0.1:3000"
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True, 
    allow_methods=["*"],
    allow_headers=["*"]
)

@app.get("/larry_connors_rsi4")
def larry_connors_rsi4(
    ticker: str = Query("QQQ", description="종목 티커"),
    start: str = Query("2020-08-01", description="시작 날짜 YYYY-MM-DD"),
    end: str = Query("2025-10-01", description="종료 날짜 YYYY-MM-DD"),
    first_rsi4: float = Query(30, description="첫 매수 기준 rsi4 수치"),
    second_rsi4: float = Query(25, description="두번쨰 매수 기준 rsi4 수치"),
    sell_rsi4: float = Query(80, description="매도 기준 rsi4 수치"),
):
    result = connors_api(
        ticker=ticker, 
        start=start, 
        end=end, 
        first_rsi4=first_rsi4, 
        second_rsi4=second_rsi4, 
        sell_rsi4=sell_rsi4
    )
    return {
        "ticker": ticker,
        "test_period": start + ' - ' + end,
        "seed_money": 100000,
        "result_money": result
    }

@app.get("/larry_backtest")
def larry_backtest(
    ticker: str = Query("ETHU", description="티커 심볼"),
    start: str = Query("2020-08-01", description="시작 날짜 YYYY-MM-DD"),
    end: str = Query("2025-10-01", description="종료 날짜 YYYY-MM-DD"),
    k: float = Query(0.5, description="변동성 돌파 계수"),
    take_profit: float = Query(0.05, description="익절 비율")
):
    cfg = Config(k=k, take_profit=take_profit)
    trades, summary = backtest_breakout_daily(ticker, start, end, cfg)
    trades_json = trades.reset_index().to_dict(orient="records")
    return {
        "summary": summary,
        "trades": trades_json
    }

@app.get("/larry_backtest_fine")
def larry_backtest_fine(
    ticker: str = Query("AAPL", description="티커 심볼"),
    start: str = Query("2023-01-01", description="시작 날짜 YYYY-MM-DD"),
    end: str = Query("2023-01-31", description="종료 날짜 YYYY-MM-DD"),
    k: float = Query(0.5, description="변동성 돌파 계수"),
    take_profit: float = Query(0.05, description="익절 비율"),
    stop_loss: float = Query(0.02, description="손절 비율")
):
    cfg = Config(k=k, take_profit=take_profit, stop_loss=stop_loss)
    trades, summary = backtest_with_stop_take(ticker, start, end, cfg)
    trades_json = trades.reset_index().to_dict(orient="records")
    return {
        "summary": summary,
        "trades": trades_json
    }

@app.get("/calculate_breakout")
def calc_breakout(
    today_open: float = Query(..., description="오늘 시초가"),
    prev_high: float = Query(..., description="전일 고가"),
    prev_low: float = Query(..., description="전일 저가"),
    k: float = Query(0.5, description="변동성 돌파 계수")
):
    price = calculate_breakout_price(today_open, prev_high, prev_low, k)
    return {"breakout_price": price}


@app.get("/calculate_today_breakout")
def calc_today_breakout(
    ticker: str = Query("ETHU", description="티커 심볼"),
    k: float = Query(0.5, description="변동성 돌파 계수")
):
    result = calculate_today_breakout_price(ticker, k)
    return result
