From: Ralph Sennhauser <ralph.sennhauser-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: dts: armada-38x: label USB and SATA nodes
Date: Fri, 31 Mar 2017 09:41:15 +0200
Message-ID: <20170331074115.8111-1-ralph.sennhauser@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Ralph Sennhauser <ralph.sennhauser-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Recently most nodes got labels to make them referenceable. The USB 3.0
nodes as well as the nodes for the SATA controllers were left out,
rectify the omission.

Signed-off-by: Ralph Sennhauser <ralph.sennhauser-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---

Hi everybody

In preparation to add support for the Linksys WRT3200ACM (Rango) some
rework of the "dts-stack" is highly desirable. This patch is part of the
preparatory work but independent.

The label for the USB 2.0 port is "usb0:", so using "usb1:" and "usb2:"
would be the logical continuation. Guess you realized the catch already,
"usb2:" for an USB 3.0 controller might be very confusing.

I'm sending this patch ahead of the rest so the labels can be discussed
and finalized.

Ralph

---

 arch/arm/boot/dts/armada-38x.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/armada-38x.dtsi b/arch/arm/boot/dts/armada-38x.dtsi
index ba27ec1..78c838a 100644
--- a/arch/arm/boot/dts/armada-38x.dtsi
+++ b/arch/arm/boot/dts/armada-38x.dtsi
@@ -530,7 +530,7 @@
 				interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			sata@a8000 {
+			satac0: sata@a8000 {
 				compatible = "marvell,armada-380-ahci";
 				reg = <0xa8000 0x2000>;
 				interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
@@ -546,7 +546,7 @@
 				status = "disabled";
 			};
 
-			sata@e0000 {
+			satac1: sata@e0000 {
 				compatible = "marvell,armada-380-ahci";
 				reg = <0xe0000 0x2000>;
 				interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
@@ -590,7 +590,7 @@
 				status = "disabled";
 			};
 
-			usb3@f0000 {
+			usb3_0: usb3@f0000 {
 				compatible = "marvell,armada-380-xhci";
 				reg = <0xf0000 0x4000>,<0xf4000 0x4000>;
 				interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
@@ -598,7 +598,7 @@
 				status = "disabled";
 			};
 
-			usb3@f8000 {
+			usb3_1: usb3@f8000 {
 				compatible = "marvell,armada-380-xhci";
 				reg = <0xf8000 0x4000>,<0xfc000 0x4000>;
 				interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
