#모형의 식별 가급적 적은 모수를 포함하는 모형설정.  
#1) draw 시도표(정상성 여부 검토, 분산이랑 평균) // 2) 비정상이면
#분산안정화 또는 차분을 선택해서 정상으로 변환.
#필요한 차분 정도를 확인하기 위해 시계열의 acf, pacf를 관찰.

library(tseries)
hw<-read.csv("....",header=F)
ht<-ts(hw)
ts.plot(ht)

par(mfrow=c(2,1))
acf(ht, main="ACF", lag=36)
pacf(ht, main="PACF", lag=36)

#모수추정
#ols, 우도함수?

#분산안정화

log_htk<-log(ht)
plot(log_ht)

##차분해야 할 경우 1차로 추세 없애기

diff_ht<-diff(ht, lag=1)
plot(diff_ht)

##2차 차분으로 계절성 없애기?

diff12_ht<-diff(diff_ht, lag=12)
plot(diff12_ht)

par(mfrow=c(2,1))
acf(diff12_ht, main="ACF", lag=36)
pacf(diff12_ht, main="PACF", lag=36)

library(forecast)

auto.arima(diff_ht)

#모수추정

fit<-arima(ht, c(0,1,1), seasonal=list(order=c(0,1,0), period=12))
fit


#모형 적합성 진단 모형의 오차항이 평균0, 분산의 정규분포를 따르는 백색잡음이라
#가정하고 있기 때문에 이에 대한 검증이 필요.
#잔차에 대해 정규성(정규확률도표 활용), 등분산성 및 패턴유무(잔차산점도)
#랜덤성(잔차의 acf, pacf으로 시차별 상관계수가 0인지 확인)
#포트만토 검정: 시차별 자기상관계수가 모두 0인지 검정(ljung-box 사용)

tsdiag(fit)


#모형의 확정 및 예측 

f20<-predict(fit, n.ahead=20)
f20

##
forecase(fit,h=20)
plot(forecase(fit, h=20))


plot(AirPassengers)
AirPassengers

plot(stl(AirPassengers, s.window="periodic"))

logair<-log(AirPassengers)
plot(logair)

log_diff1_air<-diff(logair)
plot(log_diff1_air)

log_diff12_air<-diff(log_diff1_air, lag=12)
plot(log_diff12_air)

par (mfrow=c(2,1))
acf(log_diff12_air, main="ACF")
pacf(log_diff12_air, main="PACF")

library(forecast)
auto.arima(log_diff12_air)

fit<-arima(logair, c(0,1,1), seasonal=list(order=c(0,1,1), period=12))
fit


tsdiag(fit)

pred<-predict(fit, n.ahead=12*12)
pred

ts.plot(AirPassengers, 2.718^pred$pred, lty=c(1,3))



#############################

plot(AirPassengers)
plot(stl(finalts, s.window="periodic"))
finalts
AirPassengers
logair<-log(AirPassengers)
plot(logair)

log_diff1_air<-diff(logair)
plot(log_diff1_air)

plot(log_diff12_air)

par(mfrow=c(2,1))
acf(log_diff12_air, main="acf")
pacf(log_diff12_air, main="pacf")

library(forecast)
auto.arima(log_diff12_air)

fit<-arima(logair, c(0,1,1), seasonal=list(order=c(0,1,1), period=12))
fit

tsdiag(fit)

pred<-predict(fit, n.ahead=12*12)
pred

ts.plot(AirPassengers, 2.718^pred$pred, lty=c(1,3))


########

getwd()

air<-AirPassengers

save(air, file="air.RData")


library(tseries)
library(forecast)

ts.plot(air)

plot(stl(air, s.window="periodic"))



logair<-log(air)
plot(logair)

log_diff_air<-diff(logair)
plot(log_diff_air)


log_diff12_air<-diff(log_diff_air, lag=12)
plot(log_diff12_air)

par(mfrow=c(2,1))
acf(log_diff12_air, main="ACF")
pacf(log_diff12_air, main="PACF")

auto.arima(log_diff12_air)

fit<-arima(logair, c(0,1,1), seasonal=list(order=c(0,1,1), period=12))
fit

tsdiag(fit)

pred<-predict(fit, n.ahead=12*12)
pred

ts.plot(air, 2.718^pred$pred, lty=c(1,3))



#######################final exam#####################################

library(tseries)
library(forecast)

final<-read.csv("Desktop/final.csv", header=F)
finalts<-ts(final)
plot(finalts)

plot.ts(final)

par(mfrow=c(2,1))
acf(finalts, main="ACF", lag=36)
pacf(finalts, main="PACF", lag=36)

finalts_1<-1/sqrt(finalts)
plot(finalts_1)


finalts_2<-diff(finalts_1)
plot(finalts_2)


finalts_3<-diff(finalts_2, lag=12)
plot(finalts_3)


par(mfrow=c(2,1))
acf(finalts_3, main="ACF", lag=36)
pacf(finalts_3, main="PACF", lag=36)

auto.arima(finalts_3)

fit<-arima(finalts_1, c(0,1,1), seasonal=list(order=c(0,1,1), period=12))
fit

fit1<-arima(finalts_1, c(2,1,1), seasonal=list(order=c(0,1,0), period=12))
fit1

tsdiag(fit)
pred<-predict(fit, n.ahead=12)
pred



forecast(fit)
plot(forecast(fit))

ts.plot(finalts, pred$pred^-2, lty=c(1,3))


pred$pred^-2
