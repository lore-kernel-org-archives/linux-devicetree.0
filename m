From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: [patch 2/2] dts: spear: Add missing i2c1 interrupt
Date: Thu, 19 Jun 2014 21:56:29 -0000
Message-ID: <20140619215557.875556819@linutronix.de>
References: <20140619215347.139324048@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline; filename=spear-dts-add-i2c1-interrupt.patch
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Viresh Kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
---
 arch/arm/boot/dts/spear320.dtsi |    5 +++++
 1 file changed, 5 insertions(+)

Index: linux/arch/arm/boot/dts/spear320.dtsi
===================================================================
--- linux.orig/arch/arm/boot/dts/spear320.dtsi
+++ linux/arch/arm/boot/dts/spear320.dtsi
@@ -123,6 +123,11 @@
 				status = "disabled";
 			};
 
+			i2c1: i2c@a7000000 {
+				interrupts = <21>;
+				interrupt-parent = <&shirq>;
+			};
+
 			gpiopinctrl: gpio@b3000000 {
 				compatible = "st,spear-plgpio";
 				reg = <0xb3000000 0x1000>;


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
