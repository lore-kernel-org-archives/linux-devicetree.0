From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 03/10] ARM: bcm: Add support for Broadcom Hurricane 2 SoC
Date: Mon, 25 Sep 2017 17:09:24 -0700
Message-ID: <20170926000931.670-4-f.fainelli@gmail.com>
References: <20170926000931.670-1-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170926000931.670-1-f.fainelli@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Ray Jui <rjui@broadcom.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "maintainer:BROADCOM IPROC ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Olof Johansson <olof@lixom.net>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Add a Kconfig entry point and basic machine board code for the Broadcom
Hurricane 2 SoCs used in 1G/10G switching products.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/arm/mach-bcm/Kconfig   |  9 +++++++++
 arch/arm/mach-bcm/Makefile  |  3 +++
 arch/arm/mach-bcm/bcm_hr2.c | 25 +++++++++++++++++++++++++
 3 files changed, 37 insertions(+)
 create mode 100644 arch/arm/mach-bcm/bcm_hr2.c

diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
index 73be3d578851..76807581f9f3 100644
--- a/arch/arm/mach-bcm/Kconfig
+++ b/arch/arm/mach-bcm/Kconfig
@@ -36,6 +36,15 @@ config ARCH_BCM_CYGNUS
 	  BCM11300, BCM11320, BCM11350, BCM11360,
 	  BCM58300, BCM58302, BCM58303, BCM58305.
 
+config ARCH_BCM_HR2
+	bool "Broadcom Hurricane 2 SoC support"
+	depends on ARCH_MULTI_V7
+	select ARCH_BCM_IPROC
+	help
+	  Enable support for the Hurricane 2 family,
+	  which includes the following variants:
+	  BCM53342, BCM53343, BCM53344, BCM53346.
+
 config ARCH_BCM_NSP
 	bool "Broadcom Northstar Plus SoC Support"
 	depends on ARCH_MULTI_V7
diff --git a/arch/arm/mach-bcm/Makefile b/arch/arm/mach-bcm/Makefile
index 980f5850097c..ec93c849a100 100644
--- a/arch/arm/mach-bcm/Makefile
+++ b/arch/arm/mach-bcm/Makefile
@@ -13,6 +13,9 @@
 # Cygnus
 obj-$(CONFIG_ARCH_BCM_CYGNUS) +=  bcm_cygnus.o
 
+# Hurricane 2
+obj-$(CONFIG_ARCH_BCM_HR2)	+= bcm_hr2.o
+
 # Northstar Plus
 obj-$(CONFIG_ARCH_BCM_NSP)	+= bcm_nsp.o
 
diff --git a/arch/arm/mach-bcm/bcm_hr2.c b/arch/arm/mach-bcm/bcm_hr2.c
new file mode 100644
index 000000000000..c104f28995d7
--- /dev/null
+++ b/arch/arm/mach-bcm/bcm_hr2.c
@@ -0,0 +1,25 @@
+/*
+ * Copyright (C) 2017 Broadcom
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
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
+static const char * const bcm_hr2_dt_compat[] __initconst = {
+	"brcm,hr2",
+	NULL,
+};
+
+DT_MACHINE_START(BCM_HR2_DT, "Broadcom Hurricane 2 SoC")
+	.l2c_aux_val	= 0,
+	.l2c_aux_mask	= ~0,
+	.dt_compat = bcm_hr2_dt_compat,
+MACHINE_END
-- 
2.14.1
