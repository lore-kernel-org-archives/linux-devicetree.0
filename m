Return-Path: <SRS0=UpLl=HG=ti.com=t-kristo@kernel.org>
From: Tero Kristo <t-kristo@ti.com>
Subject: [RFC 05/13] ARM: dts: ti: add support for building .dtb files containing symbols
Date: Tue, 17 Apr 2018 12:10:07 +0300
Message-ID: <1523956215-28154-6-git-send-email-t-kristo@ti.com>
In-Reply-To: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
References: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: devicetree@vger.kernel.org, robh+dt@kernel.org, frowand.list@gmail.com, mark.rutland@arm.com
Cc: wmills@ti.com, tony@atomide.com, trini@konsulko.com, rmk@armlinux.org.uk
List-ID: <devicetree@vger.kernel.org>

Symbols in the DTB files are needed so that overlays can be applied
properly. Add support for building TI SoC specific .dtb files, the
source is fetched from parent directory.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/ti/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/ti/Makefile b/arch/arm/boot/dts/ti/Makefile
index b26328b..7d2d411 100644
--- a/arch/arm/boot/dts/ti/Makefile
+++ b/arch/arm/boot/dts/ti/Makefile
@@ -1 +1,6 @@
+DTC_FLAGS += -@ -Wno-reg_format -Wno-avoid_default_addr_size
+
+$(obj)/%.dtb: $(src)/../%.dts FORCE
+	$(call if_changed_dep,dtc)
+
 clean-files	+= *.dtbo
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
