From: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH 3/3] arm64: dts: add random number generator dts node to APM X-Gene platform.
Date: Fri, 22 Aug 2014 16:26:40 -0700
Message-ID: <1408750000-28453-4-git-send-email-fkan@apm.com>
References: <1408750000-28453-1-git-send-email-fkan@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408750000-28453-1-git-send-email-fkan-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: patches-qTEPVZfXA3Y@public.gmane.org, mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org, herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dann.frazier-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
Cc: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds random number generator dts node to APM X-Gene platform.

Signed-off-by: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
---
 arch/arm64/boot/dts/apm-storm.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/apm-storm.dtsi b/arch/arm64/boot/dts/apm-storm.dtsi
index 40aa96c..6e46dfd 100644
--- a/arch/arm64/boot/dts/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm-storm.dtsi
@@ -270,6 +270,19 @@
 				enable-mask = <0x2>;
 				clock-output-names = "rtcclk";
 			};
+
+			rngpkaclk: rngpkaclk@17000000 {
+				compatible = "apm,xgene-device-clock";
+				#clock-cells = <1>;
+				clocks = <&socplldiv2 0>;
+				reg = <0x0 0x17000000 0x0 0x2000>;
+				reg-names = "csr-reg";
+				csr-offset = <0xc>;
+				csr-mask = <0x10>;
+				enable-offset = <0x10>;
+				enable-mask = <0x10>;
+				clock-output-names = "rngpkaclk";
+			};
 		};
 
 		serial0: serial@1c020000 {
@@ -397,5 +410,13 @@
 			#clock-cells = <1>;
 			clocks = <&rtcclk 0>;
 		};
+
+		rng: rng@10520000 {
+			compatible = "apm,xgene-rng";
+			reg = <0x0 0x10520000 0x0 0x100>;
+			interrupts = <0x0 0x41 0x4>;
+			clocks = <&rngpkaclk 0>;
+		};
+
 	};
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
