From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/2] arm64: dts: renesas: r8a77995: draak: enable PWM channel 0 and 1
Date: Wed,  4 Oct 2017 19:27:31 +0900
Message-ID: <1507112851-10042-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1507112851-10042-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1507112851-10042-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch enables PWM channel 0 and 1 on the draak. Each channel
connects to LTC2644 for brightness control.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index 96b7ff5..ebd472d 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -47,6 +47,16 @@
 		};
 	};
 
+	pwm0_pins: pwm0 {
+		groups = "pwm0_c";
+		function = "pwm0";
+	};
+
+	pwm1_pins: pwm1 {
+		groups = "pwm1_c";
+		function = "pwm1";
+	};
+
 	scif2_pins: scif2 {
 		groups = "scif2_data";
 		function = "scif2";
@@ -95,6 +105,20 @@
 	status = "okay";
 };
 
+&pwm0 {
+	pinctrl-0 = <&pwm0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pwm1 {
+	pinctrl-0 = <&pwm1_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
 &rwdt {
 	timeout-sec = <60>;
 	status = "okay";
-- 
1.9.1
