From: Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH v13 0/5] Add i.MX8MQ clock driver
Date: Tue, 13 Nov 2018 16:19:56 +0000
Message-ID: <1542125975-8448-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <kernel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, "A.s. Dong" <aisheng.dong@nxp.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Abel Vesa <abelvesa@linux.com>, Abel Vesa <abel.vesa@nxp.com>
List-Id: devicetree@vger.kernel.org

Here is a link to the 12th version:
https://lkml.org/lkml/2018/11/7/642

Changes since v12:
 * replaced the division in clk_pll_recalc_rate in clk-frac
   with do_div as suggested by Stephen

Abel Vesa (2):
  clk: imx: Add imx composite clock
  clk: imx: Add clock driver for i.MX8MQ CCM

Lucas Stach (3):
  dt-bindings: add binding for i.MX8MQ CCM
  clk: imx: add fractional PLL output clock
  clk: imx: Add SCCG PLL type

 .../devicetree/bindings/clock/imx8mq-clock.txt     |  20 +
 drivers/clk/imx/Makefile                           |   6 +-
 drivers/clk/imx/clk-composite-8m.c                 | 178 +++++++
 drivers/clk/imx/clk-frac-pll.c                     | 221 ++++++++
 drivers/clk/imx/clk-imx8mq.c                       | 589 +++++++++++++++++=
++++
 drivers/clk/imx/clk-sccg-pll.c                     | 256 +++++++++
 drivers/clk/imx/clk.h                              |  64 +++
 include/dt-bindings/clock/imx8mq-clock.h           | 395 ++++++++++++++
 8 files changed, 1728 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/imx8mq-clock.tx=
t
 create mode 100644 drivers/clk/imx/clk-composite-8m.c
 create mode 100644 drivers/clk/imx/clk-frac-pll.c
 create mode 100644 drivers/clk/imx/clk-imx8mq.c
 create mode 100644 drivers/clk/imx/clk-sccg-pll.c
 create mode 100644 include/dt-bindings/clock/imx8mq-clock.h

--=20
2.7.4
