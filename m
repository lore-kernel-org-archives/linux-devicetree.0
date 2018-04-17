Return-Path: <SRS0=UpLl=HG=ti.com=t-kristo@kernel.org>
From: Tero Kristo <t-kristo@ti.com>
Subject: [RFC 11/13] ARM: dts: ti: add FIT image dependencies
Date: Tue, 17 Apr 2018 12:10:13 +0300
Message-ID: <1523956215-28154-12-git-send-email-t-kristo@ti.com>
In-Reply-To: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
References: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: devicetree@vger.kernel.org, robh+dt@kernel.org, frowand.list@gmail.com, mark.rutland@arm.com
Cc: wmills@ti.com, tony@atomide.com, trini@konsulko.com, rmk@armlinux.org.uk
List-ID: <devicetree@vger.kernel.org>

Add the local FIT image dependencies file to build. This allows building
the FIT image dependency file before building the FIT image, and to build
the dependencies themselves also next. Without this, none of the binaries
required by the FIT image will be found.

Also, add the built FIT images to the clean targets.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/ti/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/Makefile b/arch/arm/boot/dts/ti/Makefile
index 7d2d411..3ba8164 100644
--- a/arch/arm/boot/dts/ti/Makefile
+++ b/arch/arm/boot/dts/ti/Makefile
@@ -1,6 +1,8 @@
 DTC_FLAGS += -@ -Wno-reg_format -Wno-avoid_default_addr_size
 
+-include $(obj)/.itb-deps.d
+
 $(obj)/%.dtb: $(src)/../%.dts FORCE
 	$(call if_changed_dep,dtc)
 
-clean-files	+= *.dtbo
+clean-files	+= *.dtbo *.itb
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
