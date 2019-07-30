From: Philippe Schenker <dev@pschenker.ch>
Subject: [PATCH 22/22] ARM: dts: imx6ull-colibri: Add touchscreens used with Eval Board
Date: Tue, 30 Jul 2019 16:46:49 +0200
Message-ID: <20190730144649.19022-23-dev@pschenker.ch>
References: <20190730144649.19022-1-dev@pschenker.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190730144649.19022-1-dev@pschenker.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: marcel.ziswiler@toradex.com, max.krummenacher@toradex.com, stefan@agner.ch, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Philippe Schenker <philippe.schenker@toradex.com>, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

From: Philippe Schenker <philippe.schenker@toradex.com>

This adds the common touchscreens that are used with Toradex's
Eval Boards.

Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>

---

 .../arm/boot/dts/imx6ull-colibri-eval-v3.dtsi | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/imx6ull-colibri-eval-v3.dtsi b/arch/arm/boot/dts/imx6ull-colibri-eval-v3.dtsi
index d3c4809f140e..cd72d3decf6a 100644
--- a/arch/arm/boot/dts/imx6ull-colibri-eval-v3.dtsi
+++ b/arch/arm/boot/dts/imx6ull-colibri-eval-v3.dtsi
@@ -112,6 +112,34 @@
 &i2c1 {
 	status = "okay";
 
+	/*
+	 * the PCAPs use SODIMM 28/30, also used for PWM<B>, PWM<C>, aka pwm5,
+	 * pwm6. so if you enable one of the PCAP controllers disable the pwms
+	 */
+	atmel_mxt_ts: atmel_mxt_ts@4a {
+		compatible = "atmel,maxtouch";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpiotouch>;
+		reg = <0x4a>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <16 IRQ_TYPE_EDGE_FALLING>; /* SODIMM 28 */
+		reset-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>; /* SODIMM 30 */
+		status = "disabled";
+	};
+
+	touch: touchrevf0710a@10 {
+		compatible = "touchrevolution,fusion-f0710a";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpiotouch>;
+		reg = <0x10>;
+			/* SODIMM 28, Pen down interrupt */
+		gpios = <&gpio4 16 GPIO_ACTIVE_HIGH
+			/* SODIMM 30, Reset interrupt */
+			 &gpio2 5 GPIO_ACTIVE_LOW
+			>;
+		status = "disabled";
+	};
+
 	/* M41T0M6 real time clock on carrier board */
 	m41t0m6: rtc@68 {
 		compatible = "st,m41t0";
@@ -188,3 +216,12 @@
 	sd-uhs-sdr104;
 	status = "okay";
 };
+
+&iomuxc {
+	pinctrl_gpiotouch: touchgpios {
+		fsl,pins = <
+			MX6UL_PAD_NAND_DQS__GPIO4_IO16		0x74
+			MX6UL_PAD_ENET1_TX_EN__GPIO2_IO05	0x14
+		>;
+	};
+};
-- 
2.22.0
