From: Rajesh Bhagat <rajesh.bhagat-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH] arm: dts: ls1021a: Add quirk for Erratum A009116
Date: Wed, 14 Oct 2015 11:04:12 +0530
Message-ID: <1444800852-19523-1-git-send-email-rajesh.bhagat@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ramneek.mehresh-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Rajesh Bhagat <rajesh.bhagat-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add "snps,quirk-frame-length-adjustment" property to
USB3 node for erratum A009116. This property provides
value of GFLADJ_30MHZ for post silicon frame length
adjustment.

Signed-off-by: Nikhil Badola <nikhil.badola-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Signed-off-by: Rajesh Bhagat <rajesh.bhagat-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
This patch was intiallly part of below patchset(other patches accepted), 
but patch can go independently through arm-soc tree. 
Refer: https://lkml.org/lkml/2015/10/8/46

 arch/arm/boot/dts/ls1021a.dtsi |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index c70bb27..50ac0d4 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -404,6 +404,7 @@
 			reg = <0x0 0x3100000 0x0 0x10000>;
 			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
 			dr_mode = "host";
+			snps,quirk-frame-length-adjustment = <0x20>;
 		};
 	};
 };
-- 
1.7.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
