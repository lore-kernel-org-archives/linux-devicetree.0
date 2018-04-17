Return-Path: <SRS0=UpLl=HG=ti.com=t-kristo@kernel.org>
From: Tero Kristo <t-kristo@ti.com>
Subject: [RFC 10/13] ARM: dts: add FIT image build support for ARM architecture
Date: Tue, 17 Apr 2018 12:10:12 +0300
Message-ID: <1523956215-28154-11-git-send-email-t-kristo@ti.com>
In-Reply-To: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
References: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: devicetree@vger.kernel.org, robh+dt@kernel.org, frowand.list@gmail.com, mark.rutland@arm.com
Cc: wmills@ti.com, tony@atomide.com, trini@konsulko.com, rmk@armlinux.org.uk
List-ID: <devicetree@vger.kernel.org>

Add basic .itb build target for ARM architecture. FIT images generally
contain the kernel and different DTB + overlay files, so an extra
dependency is made towards zImage being available.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index ca09509..8d4811b 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -343,11 +343,14 @@ $(BOOT_TARGETS): vmlinux
 $(INSTALL_TARGETS):
 	$(Q)$(MAKE) $(build)=$(boot) MACHINE=$(MACHINE) $@
 
-%.dtb %.dtbo: dtbdir=$(patsubst %/,%,$(patsubst %./,%,$(boot)/dts/$(dir $@)))
+%.dtb %.dtbo %.itb: dtbdir=$(patsubst %/,%,$(patsubst %./,%,$(boot)/dts/$(dir $@)))
 
 %.dtb %.dtbo: | scripts
 	$(Q)$(MAKE) $(build)=$(dtbdir) MACHINE=$(MACHINE) $(boot)/dts/$@
 
+%.itb: | scripts zImage
+	$(Q)$(MAKE) $(build)=$(dtbdir) MACHINE=$(MACHINE) $(boot)/dts/$@
+
 PHONY += dtbs dtbs_install
 
 dtbs: prepare scripts
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
