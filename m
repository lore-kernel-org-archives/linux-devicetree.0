From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 09/20] SEAD3: Probe parallel flash via DT
Date: Tue, 9 Aug 2016 13:35:34 +0100
Message-ID: <20160809123546.10190-10-paul.burton@imgtec.com>
References: <20160809123546.10190-1-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160809123546.10190-1-paul.burton@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Probe the system parallel flash using device tree rather than platform
code, in order to reduce the amount of the latter.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/boot/dts/mti/sead3.dts     | 17 +++++++++++++++++
 arch/mips/mti-sead3/sead3-platform.c | 37 ------------------------------------
 2 files changed, 17 insertions(+), 37 deletions(-)

diff --git a/arch/mips/boot/dts/mti/sead3.dts b/arch/mips/boot/dts/mti/sead3.dts
index 66f7947..7799826 100644
--- a/arch/mips/boot/dts/mti/sead3.dts
+++ b/arch/mips/boot/dts/mti/sead3.dts
@@ -67,6 +67,23 @@
 		interrupts = <0>; /* GIC 0 or CPU 6 */
 	};
 
+	pflash@1c000000 {
+		compatible = "intel,28f128j3", "cfi-flash";
+		reg = <0x1c000000 0x2000000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		user-fs@0 {
+			label = "User FS";
+			reg = <0x0 0x1fc0000>;
+		};
+
+		board-config@3e0000 {
+			label = "Board Config";
+			reg = <0x1fc0000 0x40000>;
+		};
+	};
+
 	/* UART connected to FTDI & miniUSB socket */
 	uart0: uart@1f000900 {
 		compatible = "ns16550a";
diff --git a/arch/mips/mti-sead3/sead3-platform.c b/arch/mips/mti-sead3/sead3-platform.c
index 21047b5..5c1f42a 100644
--- a/arch/mips/mti-sead3/sead3-platform.c
+++ b/arch/mips/mti-sead3/sead3-platform.c
@@ -8,44 +8,8 @@
 #include <linux/dma-mapping.h>
 #include <linux/init.h>
 #include <linux/leds.h>
-#include <linux/mtd/physmap.h>
 #include <linux/platform_device.h>
 
-static struct mtd_partition sead3_mtd_partitions[] = {
-	{
-		.name =		"User FS",
-		.offset =	0x00000000,
-		.size =		0x01fc0000,
-	}, {
-		.name =		"Board Config",
-		.offset =	0x01fc0000,
-		.size =		0x00040000,
-		.mask_flags =	MTD_WRITEABLE
-	},
-};
-
-static struct physmap_flash_data sead3_flash_data = {
-	.width		= 4,
-	.nr_parts	= ARRAY_SIZE(sead3_mtd_partitions),
-	.parts		= sead3_mtd_partitions
-};
-
-static struct resource sead3_flash_resource = {
-	.start		= 0x1c000000,
-	.end		= 0x1dffffff,
-	.flags		= IORESOURCE_MEM
-};
-
-static struct platform_device sead3_flash = {
-	.name		= "physmap-flash",
-	.id		= 0,
-	.dev		= {
-		.platform_data	= &sead3_flash_data,
-	},
-	.num_resources	= 1,
-	.resource	= &sead3_flash_resource,
-};
-
 #define LEDFLAGS(bits, shift)		\
 	((bits << 8) | (shift << 8))
 
@@ -113,7 +77,6 @@ static struct platform_device sead3_led_device = {
 };
 
 static struct platform_device *sead3_platform_devices[] __initdata = {
-	&sead3_flash,
 	&pled_device,
 	&fled_device,
 	&sead3_led_device,
-- 
2.9.2
