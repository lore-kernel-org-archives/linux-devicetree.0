From: Afzal Mohammed <afzal-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 1/6] rtc: omap: kicker mechanism support
Date: Mon, 23 Jul 2012 19:12:22 +0530
Message-ID: <e7ad30d9470906ac66e92affde5864767988ab26.1343046707.git.afzal@ti.com>
References: <cover.1343046707.git.afzal@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <cover.1343046707.git.afzal-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, khilman-l0cyMroinI0@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Afzal Mohammed <afzal-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

OMAP RTC IP can have kicker feature. This prevents spurious
writes to register. To write to registers kicker lock has to
be released. Procedure to do it as follows,

1. write to kick0 register, 0x83e70b13
2. write to kick1 register, 0x95a4f1e0

Writing value other than 0x83e70b13 to kick0 enables write
locking, more details about kicker mechanism can be found in
section 20.3.3.5.3 of AM335X TRM @www.ti.com/am335x

Here id table information is added and is used to distinguish
those that require kicker handling and the ones that doesn't
need it. There are more features in the newer IP's compared
to legacy ones other than kicker, which driver currently
doesn't handle, supporting additional features would be
easier with the addition of id table.

Signed-off-by: Afzal Mohammed <afzal-l0cyMroinI0@public.gmane.org>
---
 drivers/rtc/rtc-omap.c |   39 ++++++++++++++++++++++++++++++++++++++-
 1 files changed, 38 insertions(+), 1 deletions(-)

diff --git a/drivers/rtc/rtc-omap.c b/drivers/rtc/rtc-omap.c
index 0b614e3..65eda29 100644
--- a/drivers/rtc/rtc-omap.c
+++ b/drivers/rtc/rtc-omap.c
@@ -38,6 +38,8 @@
  * the SoC). See the BOARD-SPECIFIC CUSTOMIZATION comment.
  */
 
+#define	DRIVER_NAME			"omap_rtc"
+
 #define OMAP_RTC_BASE			0xfffb4800
 
 /* RTC registers */
@@ -64,6 +66,9 @@
 #define OMAP_RTC_COMP_MSB_REG		0x50
 #define OMAP_RTC_OSC_REG		0x54
 
+#define OMAP_RTC_KICK0_R		0x6c
+#define OMAP_RTC_KICK1_R		0x70
+
 /* OMAP_RTC_CTRL_REG bit fields: */
 #define OMAP_RTC_CTRL_SPLIT		(1<<7)
 #define OMAP_RTC_CTRL_DISABLE		(1<<6)
@@ -88,11 +93,19 @@
 #define OMAP_RTC_INTERRUPTS_IT_ALARM    (1<<3)
 #define OMAP_RTC_INTERRUPTS_IT_TIMER    (1<<2)
 
+/* OMAP_RTC_KICKER values */
+#define	KICK0_VALUE			(0x83e70b13)
+#define	KICK1_VALUE			(0x95a4f1e0)
+
+#define	OMAP_RTC_HAS_KICKER		0x1
+
 static void __iomem	*rtc_base;
 
 #define rtc_read(addr)		__raw_readb(rtc_base + (addr))
 #define rtc_write(val, addr)	__raw_writeb(val, rtc_base + (addr))
 
+#define rtc_writel(val, addr)	writel(val, rtc_base + (addr))
+
 
 /* we rely on the rtc framework to handle locking (rtc->ops_lock),
  * so the only other requirement is that register accesses which
@@ -285,11 +298,22 @@ static struct rtc_class_ops omap_rtc_ops = {
 static int omap_rtc_alarm;
 static int omap_rtc_timer;
 
+static struct platform_device_id omap_rtc_devtype[] = {
+	{
+		.name	= DRIVER_NAME,
+	}, {
+		.name	= "am1808-rtc",
+		.driver_data = OMAP_RTC_HAS_KICKER,
+	}
+};
+MODULE_DEVICE_TABLE(platform, omap_rtc_devtype);
+
 static int __init omap_rtc_probe(struct platform_device *pdev)
 {
 	struct resource		*res, *mem;
 	struct rtc_device	*rtc;
 	u8			reg, new_ctrl;
+	const struct platform_device_id *id_entry;
 
 	omap_rtc_timer = platform_get_irq(pdev, 0);
 	if (omap_rtc_timer <= 0) {
@@ -322,6 +346,12 @@ static int __init omap_rtc_probe(struct platform_device *pdev)
 		goto fail;
 	}
 
+	id_entry = platform_get_device_id(pdev);
+	if (id_entry && (id_entry->driver_data & OMAP_RTC_HAS_KICKER)) {
+		rtc_writel(KICK0_VALUE, OMAP_RTC_KICK0_R);
+		rtc_writel(KICK1_VALUE, OMAP_RTC_KICK1_R);
+	}
+
 	rtc = rtc_device_register(pdev->name, &pdev->dev,
 			&omap_rtc_ops, THIS_MODULE);
 	if (IS_ERR(rtc)) {
@@ -398,6 +428,8 @@ fail2:
 fail1:
 	rtc_device_unregister(rtc);
 fail0:
+	if (id_entry && (id_entry->driver_data & OMAP_RTC_HAS_KICKER))
+		rtc_writel(0, OMAP_RTC_KICK0_R);
 	iounmap(rtc_base);
 fail:
 	release_mem_region(mem->start, resource_size(mem));
@@ -408,6 +440,8 @@ static int __exit omap_rtc_remove(struct platform_device *pdev)
 {
 	struct rtc_device	*rtc = platform_get_drvdata(pdev);
 	struct resource		*mem = dev_get_drvdata(&rtc->dev);
+	const struct platform_device_id *id_entry =
+				platform_get_device_id(pdev);
 
 	device_init_wakeup(&pdev->dev, 0);
 
@@ -420,6 +454,8 @@ static int __exit omap_rtc_remove(struct platform_device *pdev)
 		free_irq(omap_rtc_alarm, rtc);
 
 	rtc_device_unregister(rtc);
+	if (id_entry && (id_entry->driver_data & OMAP_RTC_HAS_KICKER))
+		rtc_writel(0, OMAP_RTC_KICK0_R);
 	iounmap(rtc_base);
 	release_mem_region(mem->start, resource_size(mem));
 	return 0;
@@ -471,9 +507,10 @@ static struct platform_driver omap_rtc_driver = {
 	.resume		= omap_rtc_resume,
 	.shutdown	= omap_rtc_shutdown,
 	.driver		= {
-		.name	= "omap_rtc",
+		.name	= DRIVER_NAME,
 		.owner	= THIS_MODULE,
 	},
+	.id_table	= omap_rtc_devtype,
 };
 
 static int __init rtc_init(void)
-- 
1.7.1
