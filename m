From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: [PATCH 2/6] ARM: dts: pxa: add dma engine node to pxa3xx-nand
Date: Sat,  6 Jun 2015 23:09:09 +0200
Message-ID: <1433624953-28165-2-git-send-email-robert.jarzmik@free.fr>
References: <1433624953-28165-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433624953-28165-1-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the dma client description for pxa3xx-nand to use its dma through
device-tree.

Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
---
 arch/arm/boot/dts/pxa3xx.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/pxa3xx.dtsi b/arch/arm/boot/dts/pxa3xx.dtsi
index 4eb1563..d90489b 100644
--- a/arch/arm/boot/dts/pxa3xx.dtsi
+++ b/arch/arm/boot/dts/pxa3xx.dtsi
@@ -30,6 +30,8 @@
 			reg = <0x43100000 90>;
 			interrupts = <45>;
 			clocks = <&clks CLK_NAND>;
+			dmas = <&pdma 97>;
+			dma-names = "data";
 			#address-cells = <1>;
 			#size-cells = <1>;	
 			status = "disabled";
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
