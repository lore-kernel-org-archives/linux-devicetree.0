From: Afzal Mohammed <afzal-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v4 3/5] rtc: omap: dt support
Date: Fri, 19 Oct 2012 15:29:38 +0530
Message-ID: <061c670b0a05570d7b83d8a8f105ee5b35583f7f.1350633036.git.afzal@ti.com>
References: <cover.1350633036.git.afzal@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <cover.1350633036.git.afzal-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Kevin Hilman <khilman-l0cyMroinI0@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Afzal Mohammed <afzal-l0cyMroinI0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

enhance rtc-omap driver with DT capability

Signed-off-by: Afzal Mohammed <afzal-l0cyMroinI0@public.gmane.org>
Acked-by: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
---

v4:
 Proper devicetree documentation

v2:
 Use compatible as ti,da830-rtc instead of ti,am1808-rtc

 Documentation/devicetree/bindings/rtc/rtc-omap.txt | 17 +++++++++++++++++
 drivers/rtc/rtc-omap.c                             | 18 ++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-omap.txt

diff --git a/Documentation/devicetree/bindings/rtc/rtc-omap.txt b/Documentation/devicetree/bindings/rtc/rtc-omap.txt
new file mode 100644
index 0000000..b47aa41
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/rtc-omap.txt
@@ -0,0 +1,17 @@
+TI Real Time Clock
+
+Required properties:
+- compatible: "ti,da830-rtc"
+- reg: Address range of rtc register set
+- interrupts: rtc timer, alarm interrupts in order
+- interrupt-parent: phandle for the interrupt controller
+
+Example:
+
+rtc@1c23000 {
+	compatible = "ti,da830-rtc";
+	reg = <0x23000 0x1000>;
+	interrupts = <19
+		      19>;
+	interrupt-parent = <&intc>;
+};
diff --git a/drivers/rtc/rtc-omap.c b/drivers/rtc/rtc-omap.c
index d948426..dff9ff4 100644
--- a/drivers/rtc/rtc-omap.c
+++ b/drivers/rtc/rtc-omap.c
@@ -20,6 +20,8 @@
 #include <linux/rtc.h>
 #include <linux/bcd.h>
 #include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
 
 #include <asm/io.h>
 
@@ -298,6 +300,8 @@ static struct rtc_class_ops omap_rtc_ops = {
 static int omap_rtc_alarm;
 static int omap_rtc_timer;
 
+#define	OMAP_RTC_DATA_DA830_IDX	1
+
 static struct platform_device_id omap_rtc_devtype[] = {
 	{
 		.name	= DRIVER_NAME,
@@ -309,12 +313,25 @@ static struct platform_device_id omap_rtc_devtype[] = {
 };
 MODULE_DEVICE_TABLE(platform, omap_rtc_devtype);
 
+static const struct of_device_id omap_rtc_of_match[] = {
+	{	.compatible	= "ti,da830-rtc",
+		.data		= &omap_rtc_devtype[OMAP_RTC_DATA_DA830_IDX],
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, omap_rtc_of_match);
+
 static int __init omap_rtc_probe(struct platform_device *pdev)
 {
 	struct resource		*res, *mem;
 	struct rtc_device	*rtc;
 	u8			reg, new_ctrl;
 	const struct platform_device_id *id_entry;
+	const struct of_device_id *of_id;
+
+	of_id = of_match_device(omap_rtc_of_match, &pdev->dev);
+	if (of_id)
+		pdev->id_entry = of_id->data;
 
 	omap_rtc_timer = platform_get_irq(pdev, 0);
 	if (omap_rtc_timer <= 0) {
@@ -510,6 +527,7 @@ static struct platform_driver omap_rtc_driver = {
 	.driver		= {
 		.name	= DRIVER_NAME,
 		.owner	= THIS_MODULE,
+		.of_match_table = of_match_ptr(omap_rtc_of_match),
 	},
 	.id_table	= omap_rtc_devtype,
 };
-- 
1.7.12
