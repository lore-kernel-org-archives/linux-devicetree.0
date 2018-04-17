Return-Path: <SRS0=UpLl=HG=ti.com=t-kristo@kernel.org>
From: Tero Kristo <t-kristo@ti.com>
Subject: [RFC 01/13] ARM: dts: allow building .dtb files under platform subdirs
Date: Tue, 17 Apr 2018 12:10:03 +0300
Message-ID: <1523956215-28154-2-git-send-email-t-kristo@ti.com>
In-Reply-To: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
References: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: devicetree@vger.kernel.org, robh+dt@kernel.org, frowand.list@gmail.com, mark.rutland@arm.com
Cc: wmills@ti.com, tony@atomide.com, trini@konsulko.com, rmk@armlinux.org.uk
List-ID: <devicetree@vger.kernel.org>

Add support to base ARM makefile for building .dtb files under platform
specific subdirs (e.g. arch/arm/boot/dts/ti for TI SoCs.)

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index e4e537f..f6c90bc 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -343,8 +343,10 @@ $(BOOT_TARGETS): vmlinux
 $(INSTALL_TARGETS):
 	$(Q)$(MAKE) $(build)=$(boot) MACHINE=$(MACHINE) $@
 
+%.dtb: dtbdir=$(patsubst %/,%,$(patsubst %./,%,$(boot)/dts/$(dir $@)))
+
 %.dtb: | scripts
-	$(Q)$(MAKE) $(build)=$(boot)/dts MACHINE=$(MACHINE) $(boot)/dts/$@
+	$(Q)$(MAKE) $(build)=$(dtbdir) MACHINE=$(MACHINE) $(boot)/dts/$@
 
 PHONY += dtbs dtbs_install
 
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
