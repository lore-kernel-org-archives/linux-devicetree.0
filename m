From: Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4] dtb: Create a common home for cross-architecture dtsi files.
Date: Mon, 3 Aug 2015 09:55:11 +0100
Message-ID: <1438592111-8471-1-git-send-email-ian.campbell@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Kristina Martsenko <kristina.martsenko-5wv7dgnIgG8@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Commit 9ccd608070b6 ("arm64: dts: add device tree for ARM SMM-A53x2 on
LogicTile Express 20MG") added a new dts file to arch/arm64 which
included "../../../../arm/boot/dts/vexpress-v2m-rs1.dtsi", i.e. a
.dtsi supplied by arch/arm.

Unfortunately this causes some issues for the split device tree
repository[0], since things get moved around there. In that context
the new .dts ends up at src/arm64/arm/vexpress-v2f-1xv7-ca53x2.dts
while the include is at src/arm/vexpress-v2m-rs1.dtsi.

The sharing of the .dtsi is legitimate since the baseboard is the same
for various vexpress systems whatever processor they use.

Rather than using ../../ tricks to pickup .dtsi files from another
arch this patch creates a new directory kernel/dts as a home for such
cross-arch .dtsi files, arranges for it to be in the include path when
the .dts files are processed by cpp and switches the .dts files to use
cpp #include instead of /include/. The dtsi file itself is moved into
a vendor subdir in this case "arm" (the vendor, not the ARCH=).

[0] https://git.kernel.org/cgit/linux/kernel/git/devicetree/devicetree-rebasing.git/

Signed-off-by: Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Kristina Martsenko <kristina.martsenko-5wv7dgnIgG8@public.gmane.org>
Cc: Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Acked-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Reviewed-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
---
v2: Move to include/dt-dtsi and introduce a per-vendor subdirectory.

v3: Move to kernel/dts.
    Include new directory in DTC include path as well as cpp path, and
    therefore switch back to /include/.
    Update MAINTAINERS

v4: Change path in changelog too.
    Add ()s to title of 9ccd608070b6.
---
 Documentation/devicetree/bindings/arm/vexpress.txt          | 2 +-
 MAINTAINERS                                                 | 1 +
 arch/arm/boot/dts/vexpress-v2p-ca15-tc1.dts                 | 2 +-
 arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts                  | 2 +-
 arch/arm/boot/dts/vexpress-v2p-ca5s.dts                     | 2 +-
 arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts        | 2 +-
 {arch/arm/boot/dts => kernel/dts/arm}/vexpress-v2m-rs1.dtsi | 0
 scripts/Makefile.lib                                        | 3 ++-
 8 files changed, 8 insertions(+), 6 deletions(-)
 rename {arch/arm/boot/dts => kernel/dts/arm}/vexpress-v2m-rs1.dtsi (100%)

diff --git a/Documentation/devicetree/bindings/arm/vexpress.txt b/Documentation/devicetree/bindings/arm/vexpress.txt
index 39844cd..b6031d9 100644
--- a/Documentation/devicetree/bindings/arm/vexpress.txt
+++ b/Documentation/devicetree/bindings/arm/vexpress.txt
@@ -223,7 +223,7 @@ Example of a VE tile description (simplified)
 		/* Active high IRQ 0 is connected to GIC's SPI0 */
 		interrupt-map = <0 0 0 &gic 0 0 4>;
 
-		/include/ "vexpress-v2m-rs1.dtsi"
+		/include/ "arm/vexpress-v2m-rs1.dtsi"
 	};
 };
 
diff --git a/MAINTAINERS b/MAINTAINERS
index a226416..1941078 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7537,6 +7537,7 @@ S:	Maintained
 F:	Documentation/devicetree/
 F:	arch/*/boot/dts/
 F:	include/dt-bindings/
+F:	kernel/dts/
 
 OPEN FIRMWARE AND DEVICE TREE OVERLAYS
 M:	Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
diff --git a/arch/arm/boot/dts/vexpress-v2p-ca15-tc1.dts b/arch/arm/boot/dts/vexpress-v2p-ca15-tc1.dts
index 9420053..b144092 100644
--- a/arch/arm/boot/dts/vexpress-v2p-ca15-tc1.dts
+++ b/arch/arm/boot/dts/vexpress-v2p-ca15-tc1.dts
@@ -278,6 +278,6 @@
 				<0 0 41 &gic 0 41 4>,
 				<0 0 42 &gic 0 42 4>;
 
-		/include/ "vexpress-v2m-rs1.dtsi"
+		/include/ "arm/vexpress-v2m-rs1.dtsi"
 	};
 };
diff --git a/arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts b/arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts
index 17f63f7..350f402 100644
--- a/arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts
+++ b/arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts
@@ -636,6 +636,6 @@
 				<0 0 41 &gic 0 41 4>,
 				<0 0 42 &gic 0 42 4>;
 
-		/include/ "vexpress-v2m-rs1.dtsi"
+		/include/ "arm/vexpress-v2m-rs1.dtsi"
 	};
 };
diff --git a/arch/arm/boot/dts/vexpress-v2p-ca5s.dts b/arch/arm/boot/dts/vexpress-v2p-ca5s.dts
index d2709b7..585ced0 100644
--- a/arch/arm/boot/dts/vexpress-v2p-ca5s.dts
+++ b/arch/arm/boot/dts/vexpress-v2p-ca5s.dts
@@ -248,6 +248,6 @@
 				<0 0 41 &gic 0 41 4>,
 				<0 0 42 &gic 0 42 4>;
 
-		/include/ "vexpress-v2m-rs1.dtsi"
+		/include/ "arm/vexpress-v2m-rs1.dtsi"
 	};
 };
diff --git a/arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts b/arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts
index 5b1d018..c044804 100644
--- a/arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts
+++ b/arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts
@@ -186,6 +186,6 @@
 				<0 0 41 &gic GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
 				<0 0 42 &gic GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
 
-		/include/ "../../../../arm/boot/dts/vexpress-v2m-rs1.dtsi"
+		/include/ "arm/vexpress-v2m-rs1.dtsi"
 	};
 };
diff --git a/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi b/kernel/dts/arm/vexpress-v2m-rs1.dtsi
similarity index 100%
rename from arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
rename to kernel/dts/arm/vexpress-v2m-rs1.dtsi
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 79e8661..b4d9fb6 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -163,6 +163,7 @@ dtc_cpp_flags  = -Wp,-MD,$(depfile).pre.tmp -nostdinc                    \
 		 -I$(srctree)/arch/$(SRCARCH)/boot/dts                   \
 		 -I$(srctree)/arch/$(SRCARCH)/boot/dts/include           \
 		 -I$(srctree)/drivers/of/testcase-data                   \
+		 -I$(srctree)/kernel/dts                                 \
 		 -undef -D__DTS__
 
 # Finds the multi-part object the current object will be linked into
@@ -285,7 +286,7 @@ quiet_cmd_dtc = DTC     $@
 cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
 	$(CPP) $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
 	$(objtree)/scripts/dtc/dtc -O dtb -o $@ -b 0 \
-		-i $(dir $<) $(DTC_FLAGS) \
+		-i $(dir $<) -i $(srctree)/kernel/dts $(DTC_FLAGS) \
 		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
 	cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
