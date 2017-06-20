From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH v6 1/6] ARM: imx6q: provide documentation for new fsl,pmic-stby-poweroff property
Date: Tue, 20 Jun 2017 16:09:05 +0200
Message-ID: <20170620140910.7568-2-o.rempel@pengutronix.de>
References: <20170620140910.7568-1-o.rempel@pengutronix.de>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170620140910.7568-1-o.rempel@pengutronix.de>
Sender: linux-clk-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, devicetree@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>, kernel@pengutronix.de, Liam Girdwood <lgirdwood@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Leonard Crestez <leonard.crestez@nxp.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/clock/imx6q-clock.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/imx6q-clock.txt b/Documentation/devicetree/bindings/clock/imx6q-clock.txt
index 9252912a5b0e..8f93e1503e59 100644
--- a/Documentation/devicetree/bindings/clock/imx6q-clock.txt
+++ b/Documentation/devicetree/bindings/clock/imx6q-clock.txt
@@ -6,6 +6,14 @@ Required properties:
 - interrupts: Should contain CCM interrupt
 - #clock-cells: Should be <1>
 
+Optional properties:
+- fsl,pmic-stby-poweroff: Configure CCM to assert PMIC_STBY_REQ signal
+  on power off.
+  Use this property if the SoC should be powered off by external power
+  management IC (PMIC) triggered via PMIC_STBY_REQ signal.
+  Boards that are designed to initiate poweroff on PMIC_ON_REQ signal should
+  be using "syscon-poweroff" driver instead.
+
 The clock consumer should specify the desired clock by having the clock
 ID in its "clocks" phandle cell.  See include/dt-bindings/clock/imx6qdl-clock.h
 for the full list of i.MX6 Quad and DualLite clock IDs.
-- 
2.11.0

