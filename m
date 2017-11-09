From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 4/6] arm: dts: nspire: Add missing #phy-cells to usb-nop-xceiv
Date: Thu,  9 Nov 2017 16:26:12 -0600
Message-ID: <20171109222614.5719-4-robh@kernel.org>
References: <20171109222614.5719-1-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171109222614.5719-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

"usb-nop-xceiv" is using the phy binding, but is missing #phy-cells
property. This is probably because the binding was the precursor to the phy
binding.

Fixes the following warning in nspire dts files:

Warning (phys_property): Missing property '#phy-cells' in node ...

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
Doesn't seem to be a maintainer for nspire. Arnd, please apply.

 arch/arm/boot/dts/nspire.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nspire.dtsi b/arch/arm/boot/dts/nspire.dtsi
index ee5a0bb22354..6aadf6e622d2 100644
--- a/arch/arm/boot/dts/nspire.dtsi
+++ b/arch/arm/boot/dts/nspire.dtsi
@@ -56,6 +56,7 @@
 
 	usb_phy: usb_phy {
 		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
 	};
 
 	vbus_reg: vbus_reg {
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
