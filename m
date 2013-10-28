From: Shirish S <s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 2/3] ARM: dts: arndale: Add hdmi phy settings
Date: Mon, 28 Oct 2013 11:54:21 +0530
Message-ID: <1382941462-6691-3-git-send-email-s.shirish@samsung.com>
References: <1382941462-6691-1-git-send-email-s.shirish@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1382941462-6691-1-git-send-email-s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, shirish-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Shirish S <s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch moves the hdmi phy setting to arndale dts,
as its more of a per board configuration and also
shall be easier for supporting future chipsets.

Signed-off-by: Shirish S <s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/exynos5250-arndale.dts |   68 ++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index abc7272..c23f16b 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -424,6 +424,74 @@
 
 	hdmi {
 		hpd-gpio = <&gpx3 7 2>;
+		hdmiphy-confs {
+			nr-confs = <13>;
+			conf0: conf0 {
+				clock-frequency = <25200000>;
+				conf-de-emphasis-level =  /bits/ 8 <0x26>;
+				conf-clock-level =  /bits/ 8 < 0x66>;
+			};
+			conf1: conf1 {
+				clock-frequency = <27000000>;
+				conf-de-emphasis-level =  /bits/ 8 <0x26>;
+				conf-clock-level =  /bits/ 8 < 0x66>;
+			};
+			conf2: conf2 {
+				clock-frequency = <27027000>;
+				conf-de-emphasis-level =  /bits/ 8 <0x26>;
+				conf-clock-level =  /bits/ 8 < 0x66>;
+			};
+			conf3: conf3 {
+				clock-frequency = <36000000>;
+				conf-de-emphasis-level =  /bits/ 8 <0x26>;
+				conf-clock-level =  /bits/ 8 < 0x66>;
+			};
+			conf4: conf4 {
+				clock-frequency = <40000000>;
+				conf-de-emphasis-level =  /bits/ 8 <0x26>;
+				conf-clock-level =  /bits/ 8 < 0x66>;
+			};
+			conf5: conf5 {
+				clock-frequency = <65000000>;
+				conf-de-emphasis-level =  /bits/ 8 <0x26>;
+				conf-clock-level =  /bits/ 8 < 0x66>;
+			};
+			conf6: conf6 {
+				clock-frequency = <74176000>;
+				conf-de-emphasis-level =  /bits/ 8 <0x26>;
+				conf-clock-level =  /bits/ 8 < 0x66>;
+			};
+			conf7: conf7 {
+				clock-frequency = <74250000>;
+				conf-de-emphasis-level =  /bits/ 8 <0x26>;
+				conf-clock-level =  /bits/ 8 < 0x66>;
+			};
+			conf8: conf8 {
+				clock-frequency = <83500000>;
+				conf-de-emphasis-level =  /bits/ 8 <0x26>;
+				conf-clock-level =  /bits/ 8 < 0x66>;
+			};
+			conf9: conf9 {
+				clock-frequency = <106500000>;
+				conf-de-emphasis-level =  /bits/ 8 <0x26>;
+				conf-clock-level =  /bits/ 8 < 0x66>;
+			};
+			conf10: conf10 {
+				clock-frequency = <108000000>;
+				conf-de-emphasis-level =  /bits/ 8 <0x26>;
+				conf-clock-level =  /bits/ 8 < 0x66>;
+			};
+			conf11: conf11 {
+				clock-frequency = <146250000>;
+				conf-de-emphasis-level =  /bits/ 8 <0x26>;
+				conf-clock-level =  /bits/ 8 < 0x66>;
+			};
+			conf12: conf12 {
+				clock-frequency = <148500000>;
+				conf-de-emphasis-level =  /bits/ 8 <0x26>;
+				conf-clock-level =  /bits/ 8 < 0x66>;
+			};
+		};
 		vdd_osc-supply = <&ldo10_reg>;
 		vdd_pll-supply = <&ldo8_reg>;
 		vdd-supply = <&ldo8_reg>;
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
