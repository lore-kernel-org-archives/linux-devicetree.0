From: <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCH 2/4] ARM: socfpga: dts: add "altr,modrst-offset" property
Date: Mon, 27 Jul 2015 13:57:22 -0500
Message-ID: <1438023444-11881-3-git-send-email-dinguyen@opensource.altera.com>
References: <1438023444-11881-1-git-send-email-dinguyen@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438023444-11881-1-git-send-email-dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

The "altr,modrst-offset" property represents the offset into the reset manager
that is the first register to be used by the driver to bring peripherals out
of reset.

Signed-off-by: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
---
 Documentation/devicetree/bindings/reset/socfpga-reset.txt | 2 ++
 arch/arm/boot/dts/socfpga.dtsi                            | 1 +
 arch/arm/boot/dts/socfpga_arria10.dtsi                    | 1 +
 3 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/reset/socfpga-reset.txt b/Documentation/devicetree/bindings/reset/socfpga-reset.txt
index 32c1c8b..98c9f56 100644
--- a/Documentation/devicetree/bindings/reset/socfpga-reset.txt
+++ b/Documentation/devicetree/bindings/reset/socfpga-reset.txt
@@ -3,6 +3,7 @@ Altera SOCFPGA Reset Manager
 Required properties:
 - compatible : "altr,rst-mgr"
 - reg : Should contain 1 register ranges(address and length)
+- altr,modrst-offset : Should contain the offset of the first modrst register.
 - #reset-cells: 1
 
 Example:
@@ -10,4 +11,5 @@ Example:
 		#reset-cells = <1>;
 		compatible = "altr,rst-mgr";
 		reg = <0xffd05000 0x1000>;
+		altr,modrst-offset = <0x10>;
 	};
diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index 86e0fb6..0bda96a 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -783,6 +783,7 @@
 			#reset-cells = <1>;
 			compatible = "altr,rst-mgr";
 			reg = <0xffd05000 0x1000>;
+			altr,modrst-offset = <0x10>;
 		};
 
 		usbphy0: usbphy@0 {
diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
index a252905..22e7d82 100644
--- a/arch/arm/boot/dts/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
@@ -593,6 +593,7 @@
 			#reset-cells = <1>;
 			compatible = "altr,rst-mgr";
 			reg = <0xffd05000 0x100>;
+			altr,modrst-offset = <0x20>;
 		};
 
 		scu: snoop-control-unit@ffffc000 {
-- 
2.4.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
