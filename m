From: Palmer Dabbelt <palmer-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] dt-bindings: Add an enable method to RISC-V
Date: Mon, 20 Nov 2017 11:50:22 -0800
Message-ID: <20171120195022.2307-1-palmer@sifive.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: patches-q3qR2WxjNRFS9aJRtSZj7A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Palmer Dabbelt <palmer-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

RISC-V doesn't currently specify a mechanism for enabling or disabling
CPUs.  Instead, we assume that all CPUs are enabled on boot, and if
someone wants to save power we instead put a CPU to sleep via a WFI
loop.

This patch adds "enable-method" to the RISC-V CPU binding, which
currently only has the value "none".  This allows us to change the
enable method in the future.

CC: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Palmer Dabbelt <palmer-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/riscv/cpus.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.txt b/Documentation/devicetree/bindings/riscv/cpus.txt
index adf7b7af5dc3..dd9e1ae197e2 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.txt
+++ b/Documentation/devicetree/bindings/riscv/cpus.txt
@@ -82,6 +82,11 @@ described below.
                 Value type: <string>
                 Definition: Contains the RISC-V ISA string of this hart.  These
                             ISA strings are defined by the RISC-V ISA manual.
+        - cpu-enable-method:
+		Usage: required
+		Value type: <stringlist>
+		Definition: Must be one of
+			"none": This CPU's state cannot be changed.
 
 Example: SiFive Freedom U540G Development Kit
 ---------------------------------------------
@@ -105,6 +110,7 @@ Linux is allowed to run on.
                         reg = <0>;
                         riscv,isa = "rv64imac";
                         status = "disabled";
+                        enable-method = "none";
                         L10: interrupt-controller {
                                 #interrupt-cells = <1>;
                                 compatible = "riscv,cpu-intc";
@@ -130,6 +136,7 @@ Linux is allowed to run on.
                         reg = <1>;
                         riscv,isa = "rv64imafdc";
                         status = "okay";
+                        enable-method = "none";
                         tlb-split;
                         L13: interrupt-controller {
                                 #interrupt-cells = <1>;
-- 
2.13.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
