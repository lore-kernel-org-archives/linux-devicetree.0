From: Kapil Hali <kapilh@broadcom.com>
Subject: [PATCH RESEND 4/4] ARM: BCM: Add SMP support for Broadcom 4708
Date: Thu, 5 Nov 2015 00:51:21 -0500
Message-ID: <1446702681-45339-5-git-send-email-kapilh@broadcom.com>
References: <1446702681-45339-1-git-send-email-kapilh@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446702681-45339-1-git-send-email-kapilh@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: Gregory Fong <gregory.0xf0@gmail.com>, Lee Jones <lee@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Olof Johansson <olof@lixom.net>, Paul Walmsley <paul@pwsan.com>, Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Kapil Hali <kapilh@broadcom.com>
List-Id: devicetree@vger.kernel.org

From: Jon Mason <jonmason@broadcom.com>

Add SMP support for Broadcom's 4708 SoCs.

Signed-off-by: Jon Mason <jonmason@broadcom.com>
Acked-by: Hauke Mehrtens <hauke@hauke-m.de>
Tested-by: Hauke Mehrtens <hauke@hauke-m.de>
Signed-off-by: Kapil Hali <kapilh@broadcom.com>
---
 arch/arm/boot/dts/bcm4708.dtsi | 2 ++
 arch/arm/mach-bcm/Kconfig      | 1 +
 arch/arm/mach-bcm/Makefile     | 3 +++
 3 files changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/bcm4708.dtsi b/arch/arm/boot/dts/bcm4708.dtsi
index 31141e8..22a41df 100644
--- a/arch/arm/boot/dts/bcm4708.dtsi
+++ b/arch/arm/boot/dts/bcm4708.dtsi
@@ -15,6 +15,8 @@
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
+		enable-method = "brcm,bcm-nsp-smp";
+		secondary-boot-reg = <0xffff0400>;
 
 		cpu@0 {
 			device_type = "cpu";
diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
index 2e9dbb5..4fc8fa3 100644
--- a/arch/arm/mach-bcm/Kconfig
+++ b/arch/arm/mach-bcm/Kconfig
@@ -54,6 +54,7 @@ config ARCH_BCM_NSP
 config ARCH_BCM_5301X
 	bool "Broadcom BCM470X / BCM5301X ARM SoC" if ARCH_MULTI_V7
 	select ARCH_BCM_IPROC
+	select HAVE_SMP
 	help
 	  Support for Broadcom BCM470X and BCM5301X SoCs with ARM CPU cores.
 
diff --git a/arch/arm/mach-bcm/Makefile b/arch/arm/mach-bcm/Makefile
index 36a4ca30..3ca1cf1 100644
--- a/arch/arm/mach-bcm/Makefile
+++ b/arch/arm/mach-bcm/Makefile
@@ -43,6 +43,9 @@ obj-$(CONFIG_ARCH_BCM2835)	+= board_bcm2835.o
 
 # BCM5301X
 obj-$(CONFIG_ARCH_BCM_5301X)	+= bcm_5301x.o
+ifeq ($(CONFIG_ARCH_BCM_5301X),y)
+obj-$(CONFIG_SMP)		+= headsmp.o platsmp.o
+endif
 
 # BCM63XXx
 ifeq ($(CONFIG_ARCH_BCM_63XX),y)
-- 
2.1.0
