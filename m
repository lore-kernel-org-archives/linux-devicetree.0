From: Grzegorz Jaszczyk <jaz-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
Subject: [PATCH 16/18] ARM: mvebu: a398-db: enable supported usb interfaces
Date: Thu, 21 Jul 2016 14:44:13 +0200
Message-ID: <1469105055-25181-18-git-send-email-jaz@semihalf.com>
References: <1469105055-25181-1-git-send-email-jaz@semihalf.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1469105055-25181-1-git-send-email-jaz-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, mw-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org, jaz-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org, alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Grzegorz Jaszczyk <jaz-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/armada-398-db.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/armada-398-db.dts b/arch/arm/boot/dts/armada-398-db.dts
index 788c3ba..969b49f 100644
--- a/arch/arm/boot/dts/armada-398-db.dts
+++ b/arch/arm/boot/dts/armada-398-db.dts
@@ -108,6 +108,10 @@
 				status = "okay";
 			};
 
+			usb@58000 {
+				status = "okay";
+			};
+
 			flash@d0000 {
 				status = "okay";
 				pinctrl-0 = <&nand_pins>;
@@ -132,6 +136,10 @@
 					reg = <0x1000000 0x3f000000>;
 				};
 			};
+
+			usb3@f8000 {
+				status = "okay";
+			};
 		};
 
 		pcie-controller {
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
