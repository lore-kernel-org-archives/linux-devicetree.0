From: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH 5/6] ARM: dts: imx53-qsb-common: Fix 'led_gpio7_7@0' node with unit name and no reg property
Date: Mon, 16 Oct 2017 10:48:29 -0200
Message-ID: <1508158110-5188-5-git-send-email-marco.franchi@nxp.com>
References: <1508158110-5188-1-git-send-email-marco.franchi@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1508158110-5188-1-git-send-email-marco.franchi-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marcofrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The following build warning is seen with W=1:

Warning (unit_address_vs_reg): Node /soc/aips@50000000/iomuxc@53fa8000/
imx53-qsb/led_gpio7_7@0 has a unit name, but no reg property

Fix this warning by removing '@0' from such node.

Signed-off-by: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
---
 arch/arm/boot/dts/imx53-qsb-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx53-qsb-common.dtsi b/arch/arm/boot/dts/imx53-qsb-common.dtsi
index 683dcbe..d214e1f 100644
--- a/arch/arm/boot/dts/imx53-qsb-common.dtsi
+++ b/arch/arm/boot/dts/imx53-qsb-common.dtsi
@@ -172,7 +172,7 @@
 			>;
 		};
 
-		led_pin_gpio7_7: led_gpio7_7@0 {
+		led_pin_gpio7_7: led_gpio7_7 {
 			fsl,pins = <
 				MX53_PAD_PATA_DA_1__GPIO7_7 0x80000000
 			>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
