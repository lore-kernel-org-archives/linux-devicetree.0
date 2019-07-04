From: Anson.Huang@nxp.com
Subject: [PATCH 1/4] dt-bindings: thermal: imx8mm-thermal: Add binding doc for i.MX8MM
Date: Thu,  4 Jul 2019 17:13:10 +0800
Message-ID: <20190704091313.9516-2-Anson.Huang@nxp.com>
References: <20190704091313.9516-1-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190704091313.9516-1-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, leonard.crestez@nxp.com, daniel.baluta@nxp.com, ping.bai@nxp.com, olof@lixom.net, maxime.ripard@bootlin.com, jagan@amarulasolutions.com, bjorn.andersson@linaro.org, dinguyen@kernel.org, enric.balletbo@collabora.com, marcin.juszkiewicz@linaro.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

Add thermal binding doc for Freescale's i.MX8MM Thermal Monitoring Unit.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 .../devicetree/bindings/thermal/imx8mm-thermal.txt        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/imx8mm-thermal.txt

diff --git a/Documentation/devicetree/bindings/thermal/imx8mm-thermal.txt b/Documentation/devicetree/bindings/thermal/imx8mm-thermal.txt
new file mode 100644
index 0000000..d09ae82
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/imx8mm-thermal.txt
@@ -0,0 +1,15 @@
+* Thermal Monitoring Unit (TMU) on Freescale i.MX8MM SoC
+
+Required properties:
+- compatible : Must be "fsl,imx8mm-tmu".
+- reg : Address range of TMU registers.
+- clocks : TMU's clock source.
+- #thermal-sensor-cells : Should be 0. See ./thermal.txt for a description.
+
+Example:
+tmu: tmu@30260000 {
+	compatible = "fsl,imx8mm-tmu";
+	reg = <0x30260000 0x10000>;
+	clocks = <&clk IMX8MM_CLK_TMU_ROOT>;
+	#thermal-sensor-cells = <0>;
+};
-- 
2.7.4
