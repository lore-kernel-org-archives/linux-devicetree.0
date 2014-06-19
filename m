From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: [patch 1/2] dts: spear: Fix sdhci compatible
Date: Thu, 19 Jun 2014 21:56:29 -0000
Message-ID: <20140619215557.784621009@linutronix.de>
References: <20140619215347.139324048@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline; filename=spear-dts-fix-sdhci-compatible.patch
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Viresh Kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Make it match the bindings and the implementation.

Signed-off-by: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
---
 arch/arm/boot/dts/spear320.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux/arch/arm/boot/dts/spear320.dtsi
===================================================================
--- linux.orig/arch/arm/boot/dts/spear320.dtsi
+++ linux/arch/arm/boot/dts/spear320.dtsi
@@ -48,7 +48,7 @@
 		};
 
 		sdhci@70000000 {
-			compatible = "st,sdhci-spear";
+			compatible = "st,spear300-sdhci";
 			reg = <0x70000000 0x100>;
 			interrupts = <10>;
 			interrupt-parent = <&shirq>;


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
