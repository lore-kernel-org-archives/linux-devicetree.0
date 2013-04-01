From: Alexander Clouter <alex-L4GPcECwBoDe9xe1eoZjHA@public.gmane.org>
Subject: [PATCH 5/6] arm: ep93xx: move ts72xx to use rtc-m48t86 driver side
 memory interface
Date: Tue,  2 Apr 2013 00:22:44 +0100
Message-ID: <1364858565-17192-6-git-send-email-alex@digriz.org.uk>
References: <1364858565-17192-1-git-send-email-alex@digriz.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1364858565-17192-1-git-send-email-alex-L4GPcECwBoDe9xe1eoZjHA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Hartley Sweeten <hsweeten-3FF4nKcrg1dE2c76skzGb0EOCMrvLtNR@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alexander Clouter <alex-L4GPcECwBoDe9xe1eoZjHA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Remove platform_data hooks into rtc-m48t86 and use named resource regions.

Signed-off-by: Alexander Clouter <alex-L4GPcECwBoDe9xe1eoZjHA@public.gmane.org>
---
 arch/arm/mach-ep93xx/ts72xx.c |   38 +++++++-------------------------------
 1 file changed, 7 insertions(+), 31 deletions(-)

diff --git a/arch/arm/mach-ep93xx/ts72xx.c b/arch/arm/mach-ep93xx/ts72xx.c
index a278639..baadffd 100644
--- a/arch/arm/mach-ep93xx/ts72xx.c
+++ b/arch/arm/mach-ep93xx/ts72xx.c
@@ -16,7 +16,6 @@
 #include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
-#include <linux/platform_data/rtc-m48t86.h>
 #include <linux/mtd/nand.h>
 #include <linux/mtd/partitions.h>
 
@@ -45,16 +44,6 @@ static struct map_desc ts72xx_io_desc[] __initdata = {
 		.pfn		= __phys_to_pfn(TS72XX_OPTIONS2_PHYS_BASE),
 		.length		= TS72XX_OPTIONS2_SIZE,
 		.type		= MT_DEVICE,
-	}, {
-		.virtual	= (unsigned long)TS72XX_RTC_INDEX_VIRT_BASE,
-		.pfn		= __phys_to_pfn(TS72XX_RTC_INDEX_PHYS_BASE),
-		.length		= TS72XX_RTC_INDEX_SIZE,
-		.type		= MT_DEVICE,
-	}, {
-		.virtual	= (unsigned long)TS72XX_RTC_DATA_VIRT_BASE,
-		.pfn		= __phys_to_pfn(TS72XX_RTC_DATA_PHYS_BASE),
-		.length		= TS72XX_RTC_DATA_SIZE,
-		.type		= MT_DEVICE,
 	}
 };
 
@@ -179,31 +168,18 @@ static void __init ts72xx_register_flash(void)
 	}
 }
 
-
-static unsigned char ts72xx_rtc_readbyte(unsigned long addr)
-{
-	__raw_writeb(addr, TS72XX_RTC_INDEX_VIRT_BASE);
-	return __raw_readb(TS72XX_RTC_DATA_VIRT_BASE);
-}
-
-static void ts72xx_rtc_writebyte(unsigned char value, unsigned long addr)
-{
-	__raw_writeb(addr, TS72XX_RTC_INDEX_VIRT_BASE);
-	__raw_writeb(value, TS72XX_RTC_DATA_VIRT_BASE);
-}
-
-static struct m48t86_ops ts72xx_rtc_ops = {
-	.readbyte	= ts72xx_rtc_readbyte,
-	.writebyte	= ts72xx_rtc_writebyte,
+static struct resource ts72xx_rtc_resource[] = {
+	DEFINE_RES_NAMED(TS72XX_RTC_INDEX_PHYS_BASE, 4,
+				"rtc_index", IORESOURCE_MEM),
+	DEFINE_RES_NAMED(TS72XX_RTC_DATA_PHYS_BASE, 4,
+				"rtc_data", IORESOURCE_MEM),
 };
 
 static struct platform_device ts72xx_rtc_device = {
 	.name		= "rtc-m48t86",
 	.id		= -1,
-	.dev		= {
-		.platform_data	= &ts72xx_rtc_ops,
-	},
-	.num_resources	= 0,
+	.resource	= ts72xx_rtc_resource,
+	.num_resources	= ARRAY_SIZE(ts72xx_rtc_resource),
 };
 
 static struct resource ts72xx_wdt_resources[] = {
-- 
1.7.10.4
