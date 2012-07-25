From: Afzal Mohammed <afzal-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2 3/6] rtc: omap: dt support
Date: Wed, 25 Jul 2012 11:42:20 +0530
Message-ID: <bc349a56656d9b6502a999ddc218f4e3936f9f00.1343191280.git.afzal@ti.com>
References: <cover.1343191280.git.afzal@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <cover.1343191280.git.afzal-l0cyMroinI0@public.gmane.org>
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

Enhance rtc-omap driver with DT capability

Signed-off-by: Afzal Mohammed <afzal-l0cyMroinI0@public.gmane.org>
---

v2:
 Use compatible as ti,da830-rtc instead of ti,am1808-rtc

 Documentation/devicetree/bindings/rtc/rtc-omap.txt |   20 ++++++++++++++++++++
 drivers/rtc/rtc-omap.c                             |   18 ++++++++++++++++++
 2 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-omap.txt

diff --git a/Documentation/devicetree/bindings/rtc/rtc-omap.txt b/Documentation/devicetree/bindings/rtc/rtc-omap.txt
new file mode 100644
index 0000000..8c5c584
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/rtc-omap.txt
@@ -0,0 +1,20 @@
+TI Real Time Clock
+
+Required properties:
+- compatible: "ti,da830-rtc"
+- reg: Address range of rtc register set
+- interrupts: rtc timer, alarm interrupts in order
+- interrupt-parent: phandle for the interrupt controller
+
+Alternative for reg and interrupt properties on OMAP:
+- ti,hwmods: Name of the hwmod associated to the RTC
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
index 8afbc2e..dc1a4da 100644
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
@@ -308,12 +312,25 @@ static struct platform_device_id omap_rtc_devtype[] = {
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
@@ -509,6 +526,7 @@ static struct platform_driver omap_rtc_driver = {
 	.driver		= {
 		.name	= DRIVER_NAME,
 		.owner	= THIS_MODULE,
+		.of_match_table = of_match_ptr(omap_rtc_of_match),
 	},
 	.id_table	= omap_rtc_devtype,
 };
-- 
1.7.1
