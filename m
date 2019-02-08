From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 08/33] ARM: davinci: make irqs.h a local header
Date: Fri,  8 Feb 2019 18:34:33 +0100
Message-ID: <20190208173458.4801-9-brgl@bgdev.pl>
References: <20190208173458.4801-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190208173458.4801-1-brgl@bgdev.pl>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, David Lechner <david@lechnology.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The existence of irqs.h in mach-davinci/include/mach only makes sense
without SPARSE_IRQ as it's then expected to define NR_IRQS and is
included from asm/irq.h. As we now support SPARSE_IRQ, this header can
be moved to mach-davinci and used as the source of HW interrupt numbers.

While updating the includes in various files - also rearrange the
headers by directory (linux/asm/mach).

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/mach-davinci/board-da830-evm.c         | 5 +++--
 arch/arm/mach-davinci/board-da850-evm.c         | 5 +++--
 arch/arm/mach-davinci/board-dm644x-evm.c        | 7 ++++---
 arch/arm/mach-davinci/board-dm646x-evm.c        | 3 ++-
 arch/arm/mach-davinci/da830.c                   | 2 +-
 arch/arm/mach-davinci/da850.c                   | 2 +-
 arch/arm/mach-davinci/devices-da8xx.c           | 2 +-
 arch/arm/mach-davinci/devices.c                 | 9 ++++-----
 arch/arm/mach-davinci/dm355.c                   | 2 +-
 arch/arm/mach-davinci/dm365.c                   | 2 +-
 arch/arm/mach-davinci/dm644x.c                  | 2 +-
 arch/arm/mach-davinci/dm646x.c                  | 2 +-
 arch/arm/mach-davinci/irq.c                     | 3 ++-
 arch/arm/mach-davinci/{include/mach => }/irqs.h | 0
 arch/arm/mach-davinci/usb-da8xx.c               | 3 ++-
 arch/arm/mach-davinci/usb.c                     | 7 ++++---
 16 files changed, 31 insertions(+), 25 deletions(-)
 rename arch/arm/mach-davinci/{include/mach => }/irqs.h (100%)

diff --git a/arch/arm/mach-davinci/board-da830-evm.c b/arch/arm/mach-davinci/board-da830-evm.c
index 41f5a51fee9a..7b8c4aeca096 100644
--- a/arch/arm/mach-davinci/board-da830-evm.c
+++ b/arch/arm/mach-davinci/board-da830-evm.c
@@ -36,11 +36,12 @@
 #include <asm/mach/arch.h>
 
 #include <mach/common.h>
-#include <mach/irqs.h>
-#include "cp_intc.h"
 #include <mach/mux.h>
 #include <mach/da8xx.h>
 
+#include "cp_intc.h"
+#include "irqs.h"
+
 #define DA830_EVM_PHY_ID		""
 /*
  * USB1 VBUS is controlled by GPIO1[15], over-current is reported on GPIO2[4].
diff --git a/arch/arm/mach-davinci/board-da850-evm.c b/arch/arm/mach-davinci/board-da850-evm.c
index 317f48560534..b0814bd30a1f 100644
--- a/arch/arm/mach-davinci/board-da850-evm.c
+++ b/arch/arm/mach-davinci/board-da850-evm.c
@@ -43,10 +43,11 @@
 #include <linux/spi/flash.h>
 
 #include <mach/common.h>
-#include "cp_intc.h"
 #include <mach/da8xx.h>
 #include <mach/mux.h>
-#include <mach/irqs.h>
+
+#include "cp_intc.h"
+#include "irqs.h"
 #include "sram.h"
 
 #include <asm/mach-types.h>
diff --git a/arch/arm/mach-davinci/board-dm644x-evm.c b/arch/arm/mach-davinci/board-dm644x-evm.c
index 16ffed2525e6..a6bc48c9ecd9 100644
--- a/arch/arm/mach-davinci/board-dm644x-evm.c
+++ b/arch/arm/mach-davinci/board-dm644x-evm.c
@@ -36,10 +36,10 @@
 #include <asm/mach/arch.h>
 
 #include <mach/common.h>
-#include <mach/irqs.h>
-#include <linux/platform_data/i2c-davinci.h>
-#include <mach/serial.h>
 #include <mach/mux.h>
+#include <mach/serial.h>
+
+#include <linux/platform_data/i2c-davinci.h>
 #include <linux/platform_data/mtd-davinci.h>
 #include <linux/platform_data/mmc-davinci.h>
 #include <linux/platform_data/usb-davinci.h>
@@ -47,6 +47,7 @@
 #include <linux/platform_data/ti-aemif.h>
 
 #include "davinci.h"
+#include "irqs.h"
 
 #define DM644X_EVM_PHY_ID		"davinci_mdio-0:01"
 #define LXT971_PHY_ID	(0x001378e2)
diff --git a/arch/arm/mach-davinci/board-dm646x-evm.c b/arch/arm/mach-davinci/board-dm646x-evm.c
index 8d5be6dd2019..26c123f35350 100644
--- a/arch/arm/mach-davinci/board-dm646x-evm.c
+++ b/arch/arm/mach-davinci/board-dm646x-evm.c
@@ -44,10 +44,11 @@
 #include <asm/mach/arch.h>
 
 #include <mach/common.h>
-#include <mach/irqs.h>
+
 #include <mach/serial.h>
 
 #include "davinci.h"
+#include "irqs.h"
 
 #define NAND_BLOCK_SIZE		SZ_128K
 
diff --git a/arch/arm/mach-davinci/da830.c b/arch/arm/mach-davinci/da830.c
index aa8da725a325..ca903c9105e4 100644
--- a/arch/arm/mach-davinci/da830.c
+++ b/arch/arm/mach-davinci/da830.c
@@ -19,9 +19,9 @@
 #include <mach/common.h>
 #include <mach/cputype.h>
 #include <mach/da8xx.h>
-#include <mach/irqs.h>
 #include <mach/time.h>
 
+#include "irqs.h"
 #include "mux.h"
 
 /* Offsets of the 8 compare registers on the da830 */
diff --git a/arch/arm/mach-davinci/da850.c b/arch/arm/mach-davinci/da850.c
index d22b19833326..486d53481636 100644
--- a/arch/arm/mach-davinci/da850.c
+++ b/arch/arm/mach-davinci/da850.c
@@ -32,10 +32,10 @@
 #include <mach/cpufreq.h>
 #include <mach/cputype.h>
 #include <mach/da8xx.h>
-#include <mach/irqs.h>
 #include <mach/pm.h>
 #include <mach/time.h>
 
+#include "irqs.h"
 #include "mux.h"
 
 #define DA850_PLL1_BASE		0x01e1a000
diff --git a/arch/arm/mach-davinci/devices-da8xx.c b/arch/arm/mach-davinci/devices-da8xx.c
index 3104a3eb2ddf..b8dc674e06bc 100644
--- a/arch/arm/mach-davinci/devices-da8xx.c
+++ b/arch/arm/mach-davinci/devices-da8xx.c
@@ -25,10 +25,10 @@
 #include <mach/cputype.h>
 #include <mach/da8xx.h>
 #include <mach/time.h>
-#include <mach/irqs.h>
 
 #include "asp.h"
 #include "cpuidle.h"
+#include "irqs.h"
 #include "sram.h"
 
 #define DA8XX_TPCC_BASE			0x01c00000
diff --git a/arch/arm/mach-davinci/devices.c b/arch/arm/mach-davinci/devices.c
index 722c463f9b18..40bd8029e457 100644
--- a/arch/arm/mach-davinci/devices.c
+++ b/arch/arm/mach-davinci/devices.c
@@ -11,21 +11,20 @@
 
 #include <linux/init.h>
 #include <linux/platform_device.h>
+#include <linux/platform_data/i2c-davinci.h>
+#include <linux/platform_data/mmc-davinci.h>
+#include <linux/platform_data/edma.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
 #include <linux/reboot.h>
 
 #include <mach/hardware.h>
-#include <linux/platform_data/i2c-davinci.h>
-#include <mach/irqs.h>
 #include <mach/cputype.h>
 #include <mach/mux.h>
-#include <linux/platform_data/mmc-davinci.h>
 #include <mach/time.h>
-#include <linux/platform_data/edma.h>
-
 
 #include "davinci.h"
+#include "irqs.h"
 
 #define DAVINCI_I2C_BASE	     0x01C21000
 #define DAVINCI_ATA_BASE	     0x01C66000
diff --git a/arch/arm/mach-davinci/dm355.c b/arch/arm/mach-davinci/dm355.c
index cb725244fa13..b27ea4fc1d51 100644
--- a/arch/arm/mach-davinci/dm355.c
+++ b/arch/arm/mach-davinci/dm355.c
@@ -26,13 +26,13 @@
 
 #include <mach/common.h>
 #include <mach/cputype.h>
-#include <mach/irqs.h>
 #include <mach/mux.h>
 #include <mach/serial.h>
 #include <mach/time.h>
 
 #include "asp.h"
 #include "davinci.h"
+#include "irqs.h"
 #include "mux.h"
 
 #define DM355_UART2_BASE	(IO_PHYS + 0x206000)
diff --git a/arch/arm/mach-davinci/dm365.c b/arch/arm/mach-davinci/dm365.c
index ae1b53ea956a..d9c6ab9215a6 100644
--- a/arch/arm/mach-davinci/dm365.c
+++ b/arch/arm/mach-davinci/dm365.c
@@ -31,13 +31,13 @@
 
 #include <mach/common.h>
 #include <mach/cputype.h>
-#include <mach/irqs.h>
 #include <mach/mux.h>
 #include <mach/serial.h>
 #include <mach/time.h>
 
 #include "asp.h"
 #include "davinci.h"
+#include "irqs.h"
 #include "mux.h"
 
 #define DM365_REF_FREQ		24000000	/* 24 MHz on the DM365 EVM */
diff --git a/arch/arm/mach-davinci/dm644x.c b/arch/arm/mach-davinci/dm644x.c
index 5ccb49196a71..b2748c82b747 100644
--- a/arch/arm/mach-davinci/dm644x.c
+++ b/arch/arm/mach-davinci/dm644x.c
@@ -23,13 +23,13 @@
 
 #include <mach/common.h>
 #include <mach/cputype.h>
-#include <mach/irqs.h>
 #include <mach/mux.h>
 #include <mach/serial.h>
 #include <mach/time.h>
 
 #include "asp.h"
 #include "davinci.h"
+#include "irqs.h"
 #include "mux.h"
 
 /*
diff --git a/arch/arm/mach-davinci/dm646x.c b/arch/arm/mach-davinci/dm646x.c
index 2b55625e8fb5..cf210741dfe5 100644
--- a/arch/arm/mach-davinci/dm646x.c
+++ b/arch/arm/mach-davinci/dm646x.c
@@ -24,13 +24,13 @@
 
 #include <mach/common.h>
 #include <mach/cputype.h>
-#include <mach/irqs.h>
 #include <mach/mux.h>
 #include <mach/serial.h>
 #include <mach/time.h>
 
 #include "asp.h"
 #include "davinci.h"
+#include "irqs.h"
 #include "mux.h"
 
 #define DAVINCI_VPIF_BASE       (0x01C12000)
diff --git a/arch/arm/mach-davinci/irq.c b/arch/arm/mach-davinci/irq.c
index 16ac28833eb4..88c30759d1c5 100644
--- a/arch/arm/mach-davinci/irq.c
+++ b/arch/arm/mach-davinci/irq.c
@@ -28,10 +28,11 @@
 #include <mach/hardware.h>
 #include <mach/cputype.h>
 #include <mach/common.h>
-#include <mach/irqs.h>
 #include <asm/mach/irq.h>
 #include <asm/exception.h>
 
+#include "irqs.h"
+
 #define FIQ_REG0_OFFSET		0x0000
 #define FIQ_REG1_OFFSET		0x0004
 #define IRQ_REG0_OFFSET		0x0008
diff --git a/arch/arm/mach-davinci/include/mach/irqs.h b/arch/arm/mach-davinci/irqs.h
similarity index 100%
rename from arch/arm/mach-davinci/include/mach/irqs.h
rename to arch/arm/mach-davinci/irqs.h
diff --git a/arch/arm/mach-davinci/usb-da8xx.c b/arch/arm/mach-davinci/usb-da8xx.c
index 2de5a04ffc24..25f21ee86f1a 100644
--- a/arch/arm/mach-davinci/usb-da8xx.c
+++ b/arch/arm/mach-davinci/usb-da8xx.c
@@ -18,7 +18,8 @@
 #include <mach/common.h>
 #include <mach/cputype.h>
 #include <mach/da8xx.h>
-#include <mach/irqs.h>
+
+#include "irqs.h"
 
 #define DA8XX_USB0_BASE		0x01e00000
 #define DA8XX_USB1_BASE		0x01e25000
diff --git a/arch/arm/mach-davinci/usb.c b/arch/arm/mach-davinci/usb.c
index 9d4a58a3113a..cde72ba35dc3 100644
--- a/arch/arm/mach-davinci/usb.c
+++ b/arch/arm/mach-davinci/usb.c
@@ -5,13 +5,14 @@
 #include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/dma-mapping.h>
-
+#include <linux/platform_data/usb-davinci.h>
 #include <linux/usb/musb.h>
 
 #include <mach/common.h>
-#include <mach/irqs.h>
 #include <mach/cputype.h>
-#include <linux/platform_data/usb-davinci.h>
+
+
+#include "irqs.h"
 
 #define DAVINCI_USB_OTG_BASE	0x01c64000
 
-- 
2.20.1
