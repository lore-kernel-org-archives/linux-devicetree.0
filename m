From: Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH v3 0/4] Add i.MX8MQ clock driver
Date: Thu,  9 Aug 2018 17:45:37 +0300
Message-ID: <1533825941-17224-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>, Dong Aisheng <aisheng.dong@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, linux-imx@nxp.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@nxp.com>
List-Id: devicetree@vger.kernel.org

This is basically just a resend of the following patchset:

https://www.spinics.net/lists/linux-clk/msg23141.html

I've just updated the patchset and implemented Shawn's
and Aisheng's comments.

I hope I haven't missed any of their comments.

Lucas Stach (4):
  dt-bindings: add binding for i.MX8MQ CCM
  clk: imx: add fractional PLL output clock
  clk: imx: add SCCG PLL type
  clk: imx: add clock driver for i.MX8MQ CCM

 .../devicetree/bindings/clock/imx8mq-clock.txt     |  20 +
 drivers/clk/imx/Makefile                           |   5 +-
 drivers/clk/imx/clk-frac-pll.c                     | 230 ++++++
 drivers/clk/imx/clk-imx8mq.c                       | 856 +++++++++++++++++++++
 drivers/clk/imx/clk-sccg-pll.c                     | 231 ++++++
 drivers/clk/imx/clk.h                              |  48 ++
 include/dt-bindings/clock/imx8mq-clock.h           | 629 +++++++++++++++
 7 files changed, 2018 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/imx8mq-clock.txt
 create mode 100644 drivers/clk/imx/clk-frac-pll.c
 create mode 100644 drivers/clk/imx/clk-imx8mq.c
 create mode 100644 drivers/clk/imx/clk-sccg-pll.c
 create mode 100644 include/dt-bindings/clock/imx8mq-clock.h

-- 
2.7.4
