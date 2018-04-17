Return-Path: <SRS0=UpLl=HG=ti.com=t-kristo@kernel.org>
From: Tero Kristo <t-kristo@ti.com>
Subject: [RFC 03/13] ARM: dts: add subdir for TI SoC DT files
Date: Tue, 17 Apr 2018 12:10:05 +0300
Message-ID: <1523956215-28154-4-git-send-email-t-kristo@ti.com>
In-Reply-To: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
References: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: devicetree@vger.kernel.org, robh+dt@kernel.org, frowand.list@gmail.com, mark.rutland@arm.com
Cc: wmills@ti.com, tony@atomide.com, trini@konsulko.com, rmk@armlinux.org.uk
List-ID: <devicetree@vger.kernel.org>

Add subdir for TI SoC DT files under the main DT source directory.
Initially, this directory will only be used for DT overlay build purposes.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/Makefile    | 4 ++++
 arch/arm/boot/dts/ti/Makefile | 1 +
 2 files changed, 5 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/Makefile

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 7e24249..02f28fc 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -729,6 +729,7 @@ dtb-$(CONFIG_SOC_DRA7XX) += \
 	dra72-evm-revc.dtb \
 	dra71-evm.dtb \
 	dra76-evm.dtb
+dts-dirs-$(CONFIG_SOC_DRA7XX) += ti
 dtb-$(CONFIG_ARCH_ORION5X) += \
 	orion5x-kuroboxpro.dtb \
 	orion5x-lacie-d2-network.dtb \
@@ -1163,3 +1164,6 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-opp-witherspoon.dtb \
 	aspeed-bmc-opp-zaius.dtb \
 	aspeed-bmc-quanta-q71l.dtb
+
+subdir-y	+= $(dts-dirs-y)
+subdir-		+= $(dts-dirs-)
diff --git a/arch/arm/boot/dts/ti/Makefile b/arch/arm/boot/dts/ti/Makefile
new file mode 100644
index 0000000..b26328b
--- /dev/null
+++ b/arch/arm/boot/dts/ti/Makefile
@@ -0,0 +1 @@
+clean-files	+= *.dtbo
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
