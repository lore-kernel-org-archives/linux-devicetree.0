From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] ARM: dts: brcmstb: add IRQ0 controller
Date: Wed, 18 Mar 2015 17:31:32 -0700
Message-ID: <1426725092-16392-2-git-send-email-computersforpeace@gmail.com>
References: <1426725092-16392-1-git-send-email-computersforpeace@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426725092-16392-1-git-send-email-computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This L2 controller handles multiplexing a few different interrupts. We
also need it for configuring the interrupt forwarding masks for the
UART.

With this, we can *now* boot BCM7445 to a prompt using the upstream
kernel + DTB.

Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/bcm7445.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/bcm7445.dtsi b/arch/arm/boot/dts/bcm7445.dtsi
index b183dc99111a..9eaeac8dce1b 100644
--- a/arch/arm/boot/dts/bcm7445.dtsi
+++ b/arch/arm/boot/dts/bcm7445.dtsi
@@ -96,6 +96,18 @@
 				     "syscon";
 			reg = <0x452000 0x100>;
 		};
+
+		irq0_intc: interrupt-controller@f040a780 {
+			compatible = "brcm,bcm7120-l2-intc";
+			interrupt-parent = <&gic>;
+			#interrupt-cells = <1>;
+			reg = <0x40a780 0x8>;
+			interrupt-controller;
+			interrupts = <GIC_SPI 0x45 0x0>,
+				     <GIC_SPI 0x43 0x0>;
+			brcm,int-map-mask = <0x25c>, <0x7000000>;
+			brcm,int-fwd-mask = <0x70000>;
+		};
 	};
 
 	smpboot {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
