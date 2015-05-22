From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 10/15] MIPS: malta: probe RTC via DT
Date: Fri, 22 May 2015 16:51:09 +0100
Message-ID: <1432309875-9712-11-git-send-email-paul.burton@imgtec.com>
References: <1432309875-9712-1-git-send-email-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432309875-9712-1-git-send-email-paul.burton@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Paul Burton <paul.burton@imgtec.com>, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>
List-Id: devicetree@vger.kernel.org

Add the DT node required to probe the RTC, and remove the platform code
that was previously doing it.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/boot/dts/mti/malta.dts     |  8 ++++++++
 arch/mips/mti-malta/malta-platform.c | 20 --------------------
 2 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/arch/mips/boot/dts/mti/malta.dts b/arch/mips/boot/dts/mti/malta.dts
index 905a347..66df923 100644
--- a/arch/mips/boot/dts/mti/malta.dts
+++ b/arch/mips/boot/dts/mti/malta.dts
@@ -49,6 +49,14 @@
 		#size-cells = <1>;
 		ranges = <1 0 0 0x1000>;
 
+		rtc: mc146818@70 {
+			compatible = "motorola,mc146818";
+			reg = <1 0x70 0x8>;
+
+			interrupt-parent = <&i8259>;
+			interrupts = <8>;
+		};
+
 		uart0: uart@3f8 {
 			compatible = "ns16550";
 			reg = <1 0x3f8 0x8>;
diff --git a/arch/mips/mti-malta/malta-platform.c b/arch/mips/mti-malta/malta-platform.c
index 184c00d5..c41b0e0 100644
--- a/arch/mips/mti-malta/malta-platform.c
+++ b/arch/mips/mti-malta/malta-platform.c
@@ -32,25 +32,6 @@
 #include <asm/mips-boards/maltaint.h>
 #include <mtd/mtd-abi.h>
 
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
@@ -92,7 +73,6 @@ static struct platform_device malta_flash_device = {
 };
 
 static struct platform_device *malta_devices[] __initdata = {
-	&malta_rtc_device,
 	&malta_flash_device,
 };
 
-- 
2.4.1
