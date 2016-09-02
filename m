From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 07/12] MIPS: Malta: Probe RTC via DT
Date: Fri, 2 Sep 2016 16:48:53 +0100
Message-ID: <20160902154859.24269-8-paul.burton@imgtec.com>
References: <20160902154859.24269-1-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160902154859.24269-1-paul.burton@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Add the DT node required to probe the RTC, and remove the platform code
that was previously doing it.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/boot/dts/mti/malta.dts     | 15 +++++++++++++++
 arch/mips/mti-malta/malta-platform.c | 21 ---------------------
 2 files changed, 15 insertions(+), 21 deletions(-)

diff --git a/arch/mips/boot/dts/mti/malta.dts b/arch/mips/boot/dts/mti/malta.dts
index af765af..ee43296 100644
--- a/arch/mips/boot/dts/mti/malta.dts
+++ b/arch/mips/boot/dts/mti/malta.dts
@@ -49,4 +49,19 @@
 		interrupt-parent = <&gic>;
 		interrupts = <GIC_SHARED 3 IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	isa {
+		compatible = "isa";
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges = <1 0 0 0x1000>;
+
+		rtc: mc146818@70 {
+			compatible = "motorola,mc146818";
+			reg = <1 0x70 0x8>;
+
+			interrupt-parent = <&i8259>;
+			interrupts = <8>;
+		};
+	};
 };
diff --git a/arch/mips/mti-malta/malta-platform.c b/arch/mips/mti-malta/malta-platform.c
index e1dd1c1..6433a39 100644
--- a/arch/mips/mti-malta/malta-platform.c
+++ b/arch/mips/mti-malta/malta-platform.c
@@ -23,7 +23,6 @@
  */
 #include <linux/init.h>
 #include <linux/serial_8250.h>
-#include <linux/mc146818rtc.h>
 #include <linux/module.h>
 #include <linux/irq.h>
 #include <linux/mtd/partitions.h>
@@ -68,25 +67,6 @@ static struct platform_device malta_uart8250_device = {
 	},
 };
 
-struct resource malta_rtc_resources[] = {
-	{
-		.start	= RTC_PORT(0),
-		.end	= RTC_PORT(7),
-		.flags	= IORESOURCE_IO,
-	}, {
-		.start	= RTC_IRQ,
-		.end	= RTC_IRQ,
-		.flags	= IORESOURCE_IRQ,
-	}
-};
-
-static struct platform_device malta_rtc_device = {
-	.name		= "rtc_cmos",
-	.id		= -1,
-	.resource	= malta_rtc_resources,
-	.num_resources	= ARRAY_SIZE(malta_rtc_resources),
-};
-
 static struct mtd_partition malta_mtd_partitions[] = {
 	{
 		.name =		"YAMON",
@@ -129,7 +109,6 @@ static struct platform_device malta_flash_device = {
 
 static struct platform_device *malta_devices[] __initdata = {
 	&malta_uart8250_device,
-	&malta_rtc_device,
 	&malta_flash_device,
 };
 
-- 
2.9.3
