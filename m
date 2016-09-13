From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/3] ARM: dts: lpc18xx: add otp node
Date: Tue, 13 Sep 2016 18:12:41 +0200
Message-ID: <20160913161241.22492-4-manabian@gmail.com>
References: <20160913161241.22492-1-manabian@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160913161241.22492-1-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add node for the internal OTP (One Time Programmable) memory found
on all LPC18xx/43xx SoCs.

Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/lpc18xx.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/lpc18xx.dtsi b/arch/arm/boot/dts/lpc18xx.dtsi
index c6508ed..7ef0bc8 100644
--- a/arch/arm/boot/dts/lpc18xx.dtsi
+++ b/arch/arm/boot/dts/lpc18xx.dtsi
@@ -250,6 +250,18 @@
 			};
 		};
 
+		otp@40045000 {
+			compatible = "nxp,lpc1850-otp";
+			reg = <0x40045000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			/* Flashless devices has part ID in OTP bank 0 */
+			part_id: identification@0 {
+				reg = <0x0 0x10>;
+			};
+		};
+
 		rtc: rtc@40046000 {
 			compatible = "nxp,lpc1850-rtc", "nxp,lpc1788-rtc";
 			reg = <0x40046000 0x1000>;
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
