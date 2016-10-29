From: Jiancheng Xue <xuejiancheng@hisilicon.com>
Subject: [PATCH 0/2] clk: hisilicon: add CRG driver for Hi3798CV200 and Hi3516CV300 SoCs
Date: Sat, 29 Oct 2016 14:13:36 +0800
Message-ID: <1477721618-10809-1-git-send-email-xuejiancheng@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, bin.chen@linaro.org, elder@linaro.org, hermit.wangheming@hisilicon.com, yanhaifeng@hisilicon.com, wenpan@hisilicon.com, howell.yang@hisilicon.com, Jiancheng Xue <xuejiancheng@hisilicon.com>
List-Id: devicetree@vger.kernel.org

Add CRG driver for Hi3798CV200 and Hi3516CV200 SoCs.

Jiancheng Xue (2):
  clk: hisilicon: add CRG driver for Hi3798CV200 SoC
  clk: hisilicon: add CRG driver for Hi3516CV300 SoC

 .../clock/{hi3519-crg.txt => hisi-crg.txt}         |  12 +-
 drivers/clk/hisilicon/Kconfig                      |  16 +
 drivers/clk/hisilicon/Makefile                     |   2 +
 drivers/clk/hisilicon/crg-hi3516cv300.c            | 330 ++++++++++++++++++++
 drivers/clk/hisilicon/crg-hi3798cv200.c            | 337 +++++++++++++++++++++
 drivers/clk/hisilicon/crg.h                        |  34 +++
 include/dt-bindings/clock/hi3516cv300-clock.h      |  48 +++
 include/dt-bindings/clock/histb-clock.h            |  66 ++++
 8 files changed, 841 insertions(+), 4 deletions(-)
 rename Documentation/devicetree/bindings/clock/{hi3519-crg.txt => hisi-crg.txt} (80%)
 create mode 100644 drivers/clk/hisilicon/crg-hi3516cv300.c
 create mode 100644 drivers/clk/hisilicon/crg-hi3798cv200.c
 create mode 100644 drivers/clk/hisilicon/crg.h
 create mode 100644 include/dt-bindings/clock/hi3516cv300-clock.h
 create mode 100644 include/dt-bindings/clock/histb-clock.h

-- 
1.9.1
