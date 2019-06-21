From: Anson.Huang@nxp.com
Subject: [PATCH 4/4] arm64: dts: imx8mm: Add system counter node
Date: Fri, 21 Jun 2019 15:07:20 +0800
Message-ID: <20190621070720.12395-4-Anson.Huang@nxp.com>
References: <20190621070720.12395-1-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190621070720.12395-1-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: catalin.marinas@arm.com, will@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, leonard.crestez@nxp.com, aisheng.dong@nxp.com, ping.bai@nxp.com, daniel.baluta@nxp.com, peng.fan@nxp.com, abel.vesa@nxp.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

Add i.MX8MM system counter node to enable timer-imx-sysctr
broadcast timer driver.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 232a741..f606efa 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -510,6 +510,15 @@
 				#pwm-cells = <2>;
 				status = "disabled";
 			};
+
+			system_counter: timer@306a0000 {
+				compatible = "nxp,sysctr-timer";
+				reg = <0x306a0000 0x30000>;
+				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk IMX8MM_CLK_SYS_CTR>;
+				clock-names = "per";
+			};
 		};
 
 		aips3: bus@30800000 {
-- 
2.7.4
