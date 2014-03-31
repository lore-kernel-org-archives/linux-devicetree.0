From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH v2 3/3] arm64: Add APM X-Gene SoC RTC DTS entry
Date: Mon, 31 Mar 2014 11:36:10 -0600
Message-ID: <1396287370-1011-4-git-send-email-lho@apm.com>
References: <1396287370-1011-1-git-send-email-lho@apm.com>
 <1396287370-1011-2-git-send-email-lho@apm.com>
 <1396287370-1011-3-git-send-email-lho@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396287370-1011-3-git-send-email-lho-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org
Cc: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds APM X-Gene SoC RTC DTS entry

Signed-off-by: Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>
Signed-off-by: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
---
 arch/arm64/boot/dts/apm-storm.dtsi |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/apm-storm.dtsi b/arch/arm64/boot/dts/apm-storm.dtsi
index 93f4b2d..4917f3b 100644
--- a/arch/arm64/boot/dts/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm-storm.dtsi
@@ -257,6 +257,19 @@
 				enable-offset = <0x0>;
 				enable-mask = <0x39>;
 			};
+
+			rtcclk: rtcclk@17000000 {
+				compatible = "apm,xgene-device-clock";
+				#clock-cells = <1>;
+				clocks = <&socplldiv2 0>;
+				reg = <0x0 0x17000000 0x0 0x2000>;
+				reg-names = "csr-reg";
+				csr-offset = <0xc>;
+				csr-mask = <0x2>;
+				enable-offset = <0x10>;
+				enable-mask = <0x2>;
+				clock-output-names = "rtcclk";
+			};
 		};
 
 		serial0: serial@1c020000 {
@@ -339,5 +352,13 @@
 			phys = <&phy3 0>;
 			phy-names = "sata-phy";
 		};
+
+		rtc: rtc@10510000 {
+			compatible = "apm,xgene-rtc";
+			reg = <0x0 0x10510000 0x0 0x400>;
+			interrupts = <0x0 0x46 0x4>;
+			#clock-cells = <1>;
+			clocks = <&rtcclk 0>;
+		};
 	};
 };
-- 
1.5.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
