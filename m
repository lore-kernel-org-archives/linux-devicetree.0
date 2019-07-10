From: Anson.Huang@nxp.com
Subject: [PATCH V5 4/5] arm64: dts: imx8mq: Add system counter node
Date: Wed, 10 Jul 2019 14:30:55 +0800
Message-ID: <20190710063056.35689-4-Anson.Huang@nxp.com>
References: <20190710063056.35689-1-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190710063056.35689-1-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: catalin.marinas@arm.com, will@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, daniel.lezcano@linaro.org, tglx@linutronix.de, leonard.crestez@nxp.com, aisheng.dong@nxp.com, daniel.baluta@nxp.com, ping.bai@nxp.com, l.stach@pengutronix.de, abel.vesa@nxp.com, andrew.smirnov@gmail.com, ccaione@baylibre.com, angus@akkea.ca, agx@sigxcpu.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

Add i.MX8MQ system counter node to enable timer-imx-sysctr
broadcast timer driver.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Changes since V4:
	- update the clock info using fixed clock node;
	- correct the reg range;
	- update the interrupt number as the system counter driver ONLY uses 1 irq now.
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index a1bbd80..2991172 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -644,6 +644,14 @@
 				#pwm-cells = <2>;
 				status = "disabled";
 			};
+
+			system_counter: timer@306a0000 {
+				compatible = "nxp,sysctr-timer";
+				reg = <0x306a0000 0x20000>;
+				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&osc_25m>;
+				clock-names = "per";
+			};
 		};
 
 		bus@30800000 { /* AIPS3 */
-- 
2.7.4
