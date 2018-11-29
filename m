From: Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH v14 0/5] Add i.MX8MQ clock driver
Date: Thu, 29 Nov 2018 09:28:32 +0000
Message-ID: <1543483640-4585-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <kernel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, Aisheng DONG <aisheng.dong@nxp.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Abel Vesa <abelvesa@linux.com>, Abel Vesa <abel.vesa@nxp.com>
List-Id: devicetree@vger.kernel.org

Here is a link to the 13th version:
https://lkml.org/lkml/2018/11/13/1020

Changes since v13:
 * included changes suggested by Stephen Boyd

Abel Vesa (2):
  clk: imx: Add imx composite clock
  clk: imx: Add clock driver for i.MX8MQ CCM

Lucas Stach (3):
  dt-bindings: Add binding for i.MX8MQ CCM
  clk: imx: Add fractional PLL output clock
  clk: imx: Add SCCG PLL type

 .../devicetree/bindings/clock/imx8mq-clock.txt     |  20 +
 drivers/clk/imx/Makefile                           |   6 +-
 drivers/clk/imx/clk-composite-8m.c                 | 178 +++++++
 drivers/clk/imx/clk-frac-pll.c                     | 223 ++++++++
 drivers/clk/imx/clk-imx8mq.c                       | 589 +++++++++++++++++=
++++
 drivers/clk/imx/clk-sccg-pll.c                     | 256 +++++++++
 drivers/clk/imx/clk.h                              |  64 +++
 include/dt-bindings/clock/imx8mq-clock.h           | 395 ++++++++++++++
 8 files changed, 1730 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/imx8mq-clock.tx=
t
 create mode 100644 drivers/clk/imx/clk-composite-8m.c
 create mode 100644 drivers/clk/imx/clk-frac-pll.c
 create mode 100644 drivers/clk/imx/clk-imx8mq.c
 create mode 100644 drivers/clk/imx/clk-sccg-pll.c
 create mode 100644 include/dt-bindings/clock/imx8mq-clock.h

--=20
2.7.4
