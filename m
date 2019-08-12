From: Anson.Huang@nxp.com
Subject: [PATCH V2 4/4] ARM: dts: imx7ulp: Add wdog1 node
Date: Mon, 12 Aug 2019 16:53:21 +0800
Message-ID: <20190812085321.13823-4-Anson.Huang@nxp.com>
References: <20190812085321.13823-1-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190812085321.13823-1-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux@armlinux.org.uk, otavio@ossystems.com.br, leonard.crestez@nxp.com, u.kleine-koenig@pengutronix.de, schnitzeltony@gmail.com, jan.tuerk@emtrion.com, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

Add wdog1 node to support watchdog driver.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No changes.
---
 arch/arm/boot/dts/imx7ulp.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/imx7ulp.dtsi b/arch/arm/boot/dts/imx7ulp.dtsi
index 6859a3a..1fdb5a35 100644
--- a/arch/arm/boot/dts/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/imx7ulp.dtsi
@@ -264,6 +264,16 @@
 			#clock-cells = <1>;
 		};
 
+		wdog1: wdog@403d0000 {
+			compatible = "fsl,imx7ulp-wdt";
+			reg = <0x403d0000 0x10000>;
+			interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&pcc2 IMX7ULP_CLK_WDG1>;
+			assigned-clocks = <&pcc2 IMX7ULP_CLK_WDG1>;
+			assigned-clocks-parents = <&scg1 IMX7ULP_CLK_FIRC_BUS_CLK>;
+			timeout-sec = <40>;
+		};
+
 		pcc2: clock-controller@403f0000 {
 			compatible = "fsl,imx7ulp-pcc2";
 			reg = <0x403f0000 0x10000>;
-- 
2.7.4
