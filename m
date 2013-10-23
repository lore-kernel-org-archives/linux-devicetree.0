From: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Subject: [PATCH 3/4] ARM: dts: disable flexcan by default
Date: Tue, 22 Oct 2013 21:51:27 -0700
Message-ID: <1382503888-3962-4-git-send-email-tharvey@gateworks.com>
References: <1382503888-3962-1-git-send-email-tharvey@gateworks.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1382503888-3962-1-git-send-email-tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Typically nodes are disabled by default and enabled when needed.

Signed-off-by: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl.dtsi |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index caa88f9..226ce75 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -331,6 +331,7 @@
 				interrupts = <0 110 0x04>;
 				clocks = <&clks 108>, <&clks 109>;
 				clock-names = "ipg", "per";
+				status = "disabled";
 			};
 
 			can2: flexcan@02094000 {
@@ -339,6 +340,7 @@
 				interrupts = <0 111 0x04>;
 				clocks = <&clks 110>, <&clks 111>;
 				clock-names = "ipg", "per";
+				status = "disabled";
 			};
 
 			gpt: gpt@02098000 {
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
