Return-Path: <SRS0=UpLl=HG=ti.com=t-kristo@kernel.org>
From: Tero Kristo <t-kristo@ti.com>
Subject: [RFC 02/13] ARM: dts: add support for building DT overlays
Date: Tue, 17 Apr 2018 12:10:04 +0300
Message-ID: <1523956215-28154-3-git-send-email-t-kristo@ti.com>
In-Reply-To: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
References: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: devicetree@vger.kernel.org, robh+dt@kernel.org, frowand.list@gmail.com, mark.rutland@arm.com
Cc: wmills@ti.com, tony@atomide.com, trini@konsulko.com, rmk@armlinux.org.uk
List-ID: <devicetree@vger.kernel.org>

Add support for building DT overlay files from the kernel DT source tree.
These can be built either from the base DT source directory, or platform
specific subdir under the base directory.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index f6c90bc..ca09509 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -343,9 +343,9 @@ $(BOOT_TARGETS): vmlinux
 $(INSTALL_TARGETS):
 	$(Q)$(MAKE) $(build)=$(boot) MACHINE=$(MACHINE) $@
 
-%.dtb: dtbdir=$(patsubst %/,%,$(patsubst %./,%,$(boot)/dts/$(dir $@)))
+%.dtb %.dtbo: dtbdir=$(patsubst %/,%,$(patsubst %./,%,$(boot)/dts/$(dir $@)))
 
-%.dtb: | scripts
+%.dtb %.dtbo: | scripts
 	$(Q)$(MAKE) $(build)=$(dtbdir) MACHINE=$(MACHINE) $(boot)/dts/$@
 
 PHONY += dtbs dtbs_install
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
