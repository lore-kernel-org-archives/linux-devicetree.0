From: Ran Bi <ran.bi@mediatek.com>
Subject: [PATCH v2 0/4] Add Support for MediaTek MT2712 RTC
Date: Thu, 1 Aug 2019 19:01:18 +0800
Message-ID: <20190801110122.26834-1-ran.bi@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "David S . Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Linus Walleij <linus.walleij@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, YT Shen <yt.shen@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Flora Fu <flora.fu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Ran Bi <ran.bi@media>
List-Id: devicetree@vger.kernel.org

This patchset add support to MT2712 RTC. MT2712 RTC is a SoC based RTC
with different architecture compared to MT7622 RTC.

Changes in V2:
1. change minimum year from 1968 to 2000
2. fix lock usage
3. stop to calculate useless day of week
4. stop to set default date after init
5. change the prefix of functions
6. use devm_request_threaded_irq() to replace request_threaded_irq()
7. add mt2712 rtc related files into MAINTAINERS

Ran Bi (4):
  bindings: rtc: add bindings for MT2712 RTC
  rtc: Add support for the MediaTek MT2712 RTC
  arm64: dts: add RTC nodes for MT2712
  MAINTAINERS: add MT2712 RTC files

 .../devicetree/bindings/rtc/rtc-mt2712.txt    |  14 +
 MAINTAINERS                                   |   2 +
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi     |   6 +
 drivers/rtc/Kconfig                           |  10 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-mt2712.c                      | 444 ++++++++++++++++++
 6 files changed, 477 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-mt2712.txt
 create mode 100644 drivers/rtc/rtc-mt2712.c

-- 
2.21.0
