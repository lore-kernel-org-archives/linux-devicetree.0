From: Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH v4 0/5] Add i.MX8MQ clock driver
Date: Thu, 16 Aug 2018 18:27:11 +0300
Message-ID: <1534433236-8925-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>, Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, Anson Huang <anson.huang@nxp.com>
Cc: linux-gpio@vger.kernel.org, linux-imx@nxp.com, Shawn Guo <shawnguo@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@linux.com>, Abel Vesa <abel.vesa@nxp.com>
List-Id: devicetree@vger.kernel.org

Third version can be found here:

https://www.spinics.net/lists/arm-kernel/msg671015.html

Changes since v3:
 * Added a composite clock type to get rid of some complexity
   from clk-imx8mq. This new composite clock type will also be
   used by all the imx8 socs that will follow.
 * Added back the reviewed-by tag.

Abel Vesa (1):
  clk: imx: add imx composite clock

Lucas Stach (4):
  dt-bindings: add binding for i.MX8MQ CCM
  clk: imx: add fractional PLL output clock
  clk: imx: add SCCG PLL type
  clk: imx: add clock driver for i.MX8MQ CCM

 .../devicetree/bindings/clock/imx8mq-clock.txt     |  20 +
 drivers/clk/imx/Makefile                           |   6 +-
 drivers/clk/imx/clk-composite.c                    | 471 +++++++++++++++
 drivers/clk/imx/clk-frac-pll.c                     | 230 ++++++++
 drivers/clk/imx/clk-imx8mq.c                       | 631 +++++++++++++++++++++
 drivers/clk/imx/clk-sccg-pll.c                     | 231 ++++++++
 drivers/clk/imx/clk.h                              |  57 ++
 include/dt-bindings/clock/imx8mq-clock.h           | 410 +++++++++++++
 8 files changed, 2055 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/imx8mq-clock.txt
 create mode 100644 drivers/clk/imx/clk-composite.c
 create mode 100644 drivers/clk/imx/clk-frac-pll.c
 create mode 100644 drivers/clk/imx/clk-imx8mq.c
 create mode 100644 drivers/clk/imx/clk-sccg-pll.c
 create mode 100644 include/dt-bindings/clock/imx8mq-clock.h

-- 
2.7.4
