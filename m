From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH v3 14/18] arm64: dts: ulcb-kf: enable TCA9539 on I2C2
Date: Fri,  6 Oct 2017 05:44:05 +0300
Message-ID: <1507257845-12106-1-git-send-email-vladimir.barinov@cogentembedded.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Vladimir Barinov <vladimir.barinov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

This supports TCA9539 gpio expanders on I2C2 bus on ULCB Kingfisher board

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
---
Changes in version 2:
- use generic node name "gpio"
Changes in version 3:
- changed pca9539 to tca9539

 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index 71dee77..40885e7 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -48,6 +48,28 @@
 	status = "okay";
 };
 
+&i2c2 {
+	gpio_exp_74: gpio@74 {
+		compatible = "ti,tca9539";
+		reg = <0x74>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		interrupt-parent = <&gpio6>;
+		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
+	};
+
+	gpio_exp_75: gpio@75 {
+		compatible = "ti,tca9539";
+		reg = <0x75>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		interrupt-parent = <&gpio6>;
+		interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
 &ohci0 {
 	status = "okay";
 };
-- 
1.9.1
