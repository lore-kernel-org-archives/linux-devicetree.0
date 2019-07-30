From: Philippe Schenker <dev@pschenker.ch>
Subject: [PATCH 12/22] ARM: dts: imx6: Add touchscreens used on Toradex eval boards
Date: Tue, 30 Jul 2019 16:46:39 +0200
Message-ID: <20190730144649.19022-13-dev@pschenker.ch>
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

This commit adds the touchscreens from Toradex so one can enable it.

Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
---

 arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts  | 44 +++++++++++++++++++
 arch/arm/boot/dts/imx6q-apalis-eval.dts       | 19 ++++++++
 arch/arm/boot/dts/imx6q-apalis-ixora-v1.1.dts | 19 ++++++++
 arch/arm/boot/dts/imx6q-apalis-ixora.dts      | 19 ++++++++
 4 files changed, 101 insertions(+)

diff --git a/arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts b/arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts
index 9a5d6c94cca4..63d4f9ca9ad8 100644
--- a/arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts
+++ b/arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts
@@ -168,6 +168,34 @@
 &i2c3 {
 	status = "okay";
 
+	/* Atmel maxtouch controller */
+	atmel_mxt_ts: atmel_mxt_ts@4a {
+		compatible = "atmel,maxtouch";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pcap_1>;
+		reg = <0x4a>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <9 IRQ_TYPE_EDGE_FALLING>; /* SODIMM 28 */
+		reset-gpios = <&gpio2 10 GPIO_ACTIVE_HIGH>; /* SODIMM 30 */
+		status = "disabled";
+	};
+
+	/*
+	 * the PCAPs use SODIMM 28/30, also used for PWM<B>, PWM<C>, aka pwm1,
+	 * pwm4. So if you enable one of the PCAP controllers disable the pwms.
+	 */
+	pcap: pcap@10 {
+		/* TouchRevolution Fusion 7 and 10 multi-touch controller */
+		compatible = "touchrevolution,fusion-f0710a";
+		reg = <0x10>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pcap_1>;
+		gpios = <&gpio1  9 0 /* SODIMM 28, Pen down interrupt */
+			 &gpio2 10 0 /* SODIMM 30, Reset */
+			>;
+		status = "disabled";
+	};
+
 	/* M41T0M6 real time clock on carrier board */
 	rtc_i2c: rtc@68 {
 		compatible = "st,m41t0";
@@ -175,6 +203,22 @@
 	};
 };
 
+&iomuxc {
+	pinctrl_pcap_1: pcap-1 {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_9__GPIO1_IO09	0x1b0b0 /* SODIMM 28 */
+			MX6QDL_PAD_SD4_DAT2__GPIO2_IO10	0x1b0b0 /* SODIMM 30 */
+		>;
+	};
+
+	pinctrl_mxt_ts: mxt-ts {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_CS1__GPIO2_IO24	0x130b0 /* SODIMM 107 */
+			MX6QDL_PAD_SD2_DAT1__GPIO1_IO14	0x130b0 /* SODIMM 106 */
+		>;
+	};
+};
+
 &ipu1_di0_disp0 {
 	remote-endpoint = <&lcd_display_in>;
 };
diff --git a/arch/arm/boot/dts/imx6q-apalis-eval.dts b/arch/arm/boot/dts/imx6q-apalis-eval.dts
index 0edd3043d9c1..60ec5e89d215 100644
--- a/arch/arm/boot/dts/imx6q-apalis-eval.dts
+++ b/arch/arm/boot/dts/imx6q-apalis-eval.dts
@@ -167,6 +167,25 @@
 &i2c1 {
 	status = "okay";
 
+	/* Atmel maxtouch controller */
+	atmel_mxt_ts: atmel_mxt_ts@4a {
+		compatible = "atmel,maxtouch";
+		reg = <0x4a>;
+		interrupt-parent = <&gpio6>;
+		interrupts = <10 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&gpio6 9 GPIO_ACTIVE_HIGH>; /* SODIMM 13 */
+		status = "disabled";
+	};
+
+	pcap@10 {
+		/* TouchRevolution Fusion 7 and 10 multi-touch controller */
+		compatible = "touchrevolution,fusion-f0710a";
+		reg = <0x10>;
+		gpios = <&gpio6 10 0 /* MXM3 11, Pen down interrupt */
+			 &gpio6  9 0 /* MXM3 13, Reset */
+			>;
+	};
+
 	pcie-switch@58 {
 		compatible = "plx,pex8605";
 		reg = <0x58>;
diff --git a/arch/arm/boot/dts/imx6q-apalis-ixora-v1.1.dts b/arch/arm/boot/dts/imx6q-apalis-ixora-v1.1.dts
index b94bb687be6b..98a8ae20b1f2 100644
--- a/arch/arm/boot/dts/imx6q-apalis-ixora-v1.1.dts
+++ b/arch/arm/boot/dts/imx6q-apalis-ixora-v1.1.dts
@@ -172,6 +172,25 @@
 &i2c1 {
 	status = "okay";
 
+	/* Atmel maxtouch controller */
+	atmel_mxt_ts: atmel_mxt_ts@4a {
+		compatible = "atmel,maxtouch";
+		reg = <0x4a>;
+		interrupt-parent = <&gpio6>;
+		interrupts = <10 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&gpio6 9 GPIO_ACTIVE_HIGH>; /* SODIMM 13 */
+		status = "disabled";
+	};
+
+	pcap@10 {
+		/* TouchRevolution Fusion 7 and 10 multi-touch controller */
+		compatible = "touchrevolution,fusion-f0710a";
+		reg = <0x10>;
+		gpios = <&gpio6 10 GPIO_ACTIVE_HIGH /* MXM3 11, Pen down interrupt */
+			 &gpio6  9 GPIO_ACTIVE_HIGH /* MXM3 13, Reset */
+			>;
+	};
+
 	/* M41T0M6 real time clock on carrier board */
 	rtc_i2c: rtc@68 {
 		compatible = "st,m41t0";
diff --git a/arch/arm/boot/dts/imx6q-apalis-ixora.dts b/arch/arm/boot/dts/imx6q-apalis-ixora.dts
index 302fd6adc8a7..67f6b36e6f94 100644
--- a/arch/arm/boot/dts/imx6q-apalis-ixora.dts
+++ b/arch/arm/boot/dts/imx6q-apalis-ixora.dts
@@ -171,6 +171,25 @@
 &i2c1 {
 	status = "okay";
 
+	/* Atmel maxtouch controller */
+	atmel_mxt_ts: atmel_mxt_ts@4a {
+		compatible = "atmel,maxtouch";
+		reg = <0x4a>;
+		interrupt-parent = <&gpio6>;
+		interrupts = <10 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&gpio6 9 GPIO_ACTIVE_HIGH>; /* SODIMM 13 */
+		status = "disabled";
+	};
+
+	pcap@10 {
+		/* TouchRevolution Fusion 7 and 10 multi-touch controller */
+		compatible = "touchrevolution,fusion-f0710a";
+		reg = <0x10>;
+		gpios = <&gpio6 10 GPIO_ACTIVE_HIGH /* MXM3 11, Pen down interrupt */
+			 &gpio6  9 GPIO_ACTIVE_HIGH /* MXM3 13, Reset */
+			>;
+	};
+
 	eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
-- 
2.22.0
