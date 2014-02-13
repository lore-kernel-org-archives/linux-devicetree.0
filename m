From: Paolo Pisati <paolo.pisati@canonical.com>
Subject: [PATCH] ARM/dts: hdmi-codec: panda/es dt entries
Date: Thu, 13 Feb 2014 16:25:58 +0100
Message-ID: <1392305158-6667-1-git-send-email-paolo.pisati@canonical.com>
Return-path: <linux-omap-owner@vger.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-omap@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Paolo Pisati <paolo.pisati@canonical.com>
---
 arch/arm/boot/dts/omap4-panda-common.dtsi |    9 ++++++++-
 arch/arm/boot/dts/omap4-panda-es.dts      |    3 ++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-panda-common.dtsi b/arch/arm/boot/dts/omap4-panda-common.dtsi
index 88c6a05..f4aeaa1 100644
--- a/arch/arm/boot/dts/omap4-panda-common.dtsi
+++ b/arch/arm/boot/dts/omap4-panda-common.dtsi
@@ -36,9 +36,15 @@
 		};
 	};
 
+	hdmi_audio: hdmi_audio@0 {
+		compatible = "linux,hdmi-audio";
+		status = "okay";
+	};
+
 	sound: sound {
 		compatible = "ti,abe-twl6040";
 		ti,model = "PandaBoard";
+		ti,audio-codec = <&hdmi_audio>;
 
 		ti,mclk-freq = <38400000>;
 
@@ -57,7 +63,8 @@
 			"HSMIC", "Headset Mic",
 			"Headset Mic", "Headset Mic Bias",
 			"AFML", "Line In",
-			"AFMR", "Line In";
+			"AFMR", "Line In",
+			"HDMI Out", "TX";
 	};
 
 	/* HS USB Port 1 Power */
diff --git a/arch/arm/boot/dts/omap4-panda-es.dts b/arch/arm/boot/dts/omap4-panda-es.dts
index 816d1c9..70152d6 100644
--- a/arch/arm/boot/dts/omap4-panda-es.dts
+++ b/arch/arm/boot/dts/omap4-panda-es.dts
@@ -23,7 +23,8 @@
 		"Line Out", "AUXL",
 		"Line Out", "AUXR",
 		"AFML", "Line In",
-		"AFMR", "Line In";
+		"AFMR", "Line In",
+		"HDMI Out", "TX";
 };
 
 /* PandaboardES has external pullups on SCL & SDA */
-- 
1.7.9.5

