From: Shirish S <s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 3/4] ARM: exynos: dts: cros5250: Add hdmi phy settings
Date: Tue, 26 Nov 2013 15:27:37 +0530
Message-ID: <1385459858-3972-4-git-send-email-s.shirish@samsung.com>
References: <1385459858-3972-1-git-send-email-s.shirish@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1385459858-3972-1-git-send-email-s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, shirish-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Shirish S <s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch moves the hdmi phy setting to arndale dts,
as its more of a per board configuration and also
shall be easier for supporting future chipsets.

Signed-off-by: Shirish S <s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/cros5250-common.dtsi |   74 ++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm/boot/dts/cros5250-common.dtsi b/arch/arm/boot/dts/cros5250-common.dtsi
index dc259e8b..77408c6 100644
--- a/arch/arm/boot/dts/cros5250-common.dtsi
+++ b/arch/arm/boot/dts/cros5250-common.dtsi
@@ -301,6 +301,80 @@
 
 	hdmi {
 		hpd-gpio = <&gpx3 7 0>;
+		hdmiphy-configs {
+			/*
+			* Eye diagram test passed for:
+			* Data de-emphasis: -0.7dB & Data Level: 880mV
+			* i.e., 0010 0110 = 0x26
+			* and Clock level of 515mV and diff 1030mV
+			* i.e., 0x66
+			*/
+			config0: config0 {
+				pixel-clock = <25200000>;
+				config-de-emphasis-level =  /bits/ 8 <0x26>;
+				config-clock-level =  /bits/ 8 < 0x66>;
+			};
+			config1: config1 {
+				pixel-clock = <27000000>;
+				config-de-emphasis-level =  /bits/ 8 <0x26>;
+				config-clock-level =  /bits/ 8 < 0x66>;
+			};
+			config2: config2 {
+				pixel-clock = <27027000>;
+				config-de-emphasis-level =  /bits/ 8 <0x26>;
+				config-clock-level =  /bits/ 8 < 0x66>;
+			};
+			config3: config3 {
+				pixel-clock = <36000000>;
+				config-de-emphasis-level =  /bits/ 8 <0x26>;
+				config-clock-level =  /bits/ 8 < 0x66>;
+			};
+			config4: config4 {
+				pixel-clock = <40000000>;
+				config-de-emphasis-level =  /bits/ 8 <0x26>;
+				config-clock-level =  /bits/ 8 < 0x66>;
+			};
+			config5: config5 {
+				pixel-clock = <65000000>;
+				config-de-emphasis-level =  /bits/ 8 <0x26>;
+				config-clock-level =  /bits/ 8 < 0x66>;
+			};
+			config6: config6 {
+				pixel-clock = <74176000>;
+				config-de-emphasis-level =  /bits/ 8 <0x26>;
+				config-clock-level =  /bits/ 8 < 0x66>;
+			};
+			config7: config7 {
+				pixel-clock = <74250000>;
+				config-de-emphasis-level =  /bits/ 8 <0x26>;
+				config-clock-level =  /bits/ 8 < 0x66>;
+			};
+			config8: config8 {
+				pixel-clock = <83500000>;
+				config-de-emphasis-level =  /bits/ 8 <0x26>;
+				config-clock-level =  /bits/ 8 < 0x66>;
+			};
+			config9: config9 {
+				pixel-clock = <106500000>;
+				config-de-emphasis-level =  /bits/ 8 <0x26>;
+				config-clock-level =  /bits/ 8 < 0x66>;
+			};
+			config10: config10 {
+				pixel-clock = <108000000>;
+				config-de-emphasis-level =  /bits/ 8 <0x26>;
+				config-clock-level =  /bits/ 8 < 0x66>;
+			};
+			config11: config11 {
+				pixel-clock = <146250000>;
+				config-de-emphasis-level =  /bits/ 8 <0x26>;
+				config-clock-level =  /bits/ 8 < 0x66>;
+			};
+			config12: config12 {
+				pixel-clock = <148500000>;
+				config-de-emphasis-level =  /bits/ 8 <0x26>;
+				config-clock-level =  /bits/ 8 < 0x66>;
+			};
+		};
 	};
 
 	gpio-keys {
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
