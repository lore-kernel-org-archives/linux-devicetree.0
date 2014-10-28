From: Scott Branden <sbranden@broadcom.com>
Subject: [PATCH v9 1/8] ARM: cygnus: Initial support for Broadcom Cygnus SoC
Date: Tue, 28 Oct 2014 16:15:04 -0700
Message-ID: <1414538111-11668-2-git-send-email-sbranden@broadcom.com>
References: <Scott Branden <sbranden@broadcom.com>
 <1414538111-11668-1-git-send-email-sbranden@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1414538111-11668-1-git-send-email-sbranden@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Russell King <linux@arm.linux.org.uk>, bcm-kernel-feedback-list@broadcom.com, Mike Turquette <mturquette@linaro.org>, Alex Elder <elder@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>, Mauro Carvalho Chehab <m.chehab@samsung.com>, Antti Palosaari <crope@iki.fi>
Cc: JD Zheng <jdzheng@broadcom.com>, Ray Jui <rjui@broadcom.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jonathan Richardson <jonathar@broadcom.com>, Scott Branden <sbranden@broadcom.com>
List-Id: devicetree@vger.kernel.org

=46rom: Jonathan Richardson <jonathar@broadcom.com>

Adds initial support for the Cygnus SoC based on Broadcom=E2=80=99s iPr=
oc series.

Reviewed-by: Ray Jui <rjui@broadcom.com>
Reviewed-by: Desmond Liu <desmondl@broadcom.com>
Reviewed-by: JD (Jiandong) Zheng <jdzheng@broadcom.com>
Tested-by: Jonathan Richardson <jonathar@broadcom.com>
Signed-off-by: Scott Branden <sbranden@broadcom.com>
---
 arch/arm/mach-bcm/Kconfig      |   32 ++++++++++++++++++++++++++++++++
 arch/arm/mach-bcm/Makefile     |    3 +++
 arch/arm/mach-bcm/bcm_cygnus.c |   26 ++++++++++++++++++++++++++
 3 files changed, 61 insertions(+)
 create mode 100644 arch/arm/mach-bcm/bcm_cygnus.c

diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
index 2abad74..73d95c2 100644
--- a/arch/arm/mach-bcm/Kconfig
+++ b/arch/arm/mach-bcm/Kconfig
@@ -5,6 +5,36 @@ menuconfig ARCH_BCM
=20
 if ARCH_BCM
=20
+comment "IPROC architected SoCs"
+
+config ARCH_BCM_IPROC
+	bool
+	select ARM_GIC
+	select CACHE_L2X0
+	select HAVE_ARM_SCU if SMP
+	select HAVE_ARM_TWD if SMP
+	select ARM_GLOBAL_TIMER
+
+	select CLKSRC_MMIO
+	select ARCH_REQUIRE_GPIOLIB
+	select ARM_AMBA
+	select PINCTRL
+	help
+	  This enables support for systems based on Broadcom IPROC architecte=
d SoCs.
+	  The IPROC complex contains one or more ARM CPUs along with common
+	  core periperals. Application specific SoCs are created by adding a
+	  uArchitecture containing peripherals outside of the IPROC complex.
+	  Currently supported SoCs are Cygnus.
+
+config ARCH_BCM_CYGNUS
+	bool "Broadcom Cygnus Support" if ARCH_MULTI_V7
+	select ARCH_BCM_IPROC
+	help
+	  Enable support for the Cygnus family,
+	  which includes the following variants:
+	  BCM11300, BCM11320, BCM11350, BCM11360,
+	  BCM58300, BCM58302, BCM58303, BCM58305.
+
 config ARCH_BCM_MOBILE
 	bool "Broadcom Mobile SoC Support" if ARCH_MULTI_V7
 	select ARCH_REQUIRE_GPIOLIB
@@ -65,6 +95,8 @@ endmenu
=20
 endif
=20
+comment "Other Architectures"
+
 config ARCH_BCM2835
 	bool "Broadcom BCM2835 family" if ARCH_MULTI_V6
 	select ARCH_REQUIRE_GPIOLIB
diff --git a/arch/arm/mach-bcm/Makefile b/arch/arm/mach-bcm/Makefile
index 300ae4b..34d45ba 100644
--- a/arch/arm/mach-bcm/Makefile
+++ b/arch/arm/mach-bcm/Makefile
@@ -10,6 +10,9 @@
 # of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 # GNU General Public License for more details.
=20
+# Cygnus
+obj-$(CONFIG_ARCH_BCM_CYGNUS) +=3D  bcm_cygnus.o
+
 # BCM281XX
 obj-$(CONFIG_ARCH_BCM_281XX)	+=3D board_bcm281xx.o
=20
diff --git a/arch/arm/mach-bcm/bcm_cygnus.c b/arch/arm/mach-bcm/bcm_cyg=
nus.c
new file mode 100644
index 0000000..41b4933
--- /dev/null
+++ b/arch/arm/mach-bcm/bcm_cygnus.c
@@ -0,0 +1,26 @@
+/*
+ * Copyright 2014 Broadcom Corporation.  All rights reserved.
+ *
+ * Unless you and Broadcom execute a separate written software license
+ * agreement governing use of this software, this software is licensed=
 to you
+ * under the terms of the GNU General Public License as
+ * published by the Free Software Foundation version 2.
+ *
+ * This program is distributed "as is" WITHOUT ANY WARRANTY of any
+ * kind, whether express or implied; without even the implied warranty
+ * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <asm/mach/arch.h>
+
+static const char const *bcm_cygnus_dt_compat[] =3D {
+	"brcm,cygnus",
+	NULL,
+};
+
+DT_MACHINE_START(BCM_CYGNUS_DT, "Broadcom Cygnus SoC")
+	.l2c_aux_val	=3D 0,
+	.l2c_aux_mask	=3D ~0,
+	.dt_compat =3D bcm_cygnus_dt_compat,
+MACHINE_END
--=20
1.7.9.5
