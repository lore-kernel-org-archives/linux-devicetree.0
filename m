From: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: [PATCH v2] rtc/cmos: add OF bindings
Date: Wed, 1 Dec 2010 11:17:56 +0100
Message-ID: <20101201101756.GA31624@www.tglx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This allows to load the OF driver based informations from the device
tree. Systems without BIOS may need to perform some initialization.
PowerPC creates a PNP device from the OF information and performs this
kind of initialization in their private PCI quirk. This looks more
generic.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
CC: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Signed-off-by: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
v1 - v2:
        - changed ctrl_reg & freq_reg to changed ctrl-reg & freq-reg as
          recommended by Benh
        - added missing get_rtc_time()
        - set the default day to 1
        - added binding info

 Documentation/powerpc/dts-bindings/rtc-cmos.txt |   28 ++++++
 drivers/rtc/rtc-cmos.c                          |  108 +++++++++++++++++++++++
 2 files changed, 136 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/powerpc/dts-bindings/rtc-cmos.txt

diff --git a/Documentation/powerpc/dts-bindings/rtc-cmos.txt b/Documentation/powerpc/dts-bindings/rtc-cmos.txt
new file mode 100644
index 0000000..7382989
--- /dev/null
+++ b/Documentation/powerpc/dts-bindings/rtc-cmos.txt
@@ -0,0 +1,28 @@
+ Motorola mc146818 compatible RTC
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Required properties:
+  - compatible : "motorola,mc146818"
+  - reg : should contain registers location and length.
+
+Optional properties:
+  - interrupts : should contain interrupt.
+  - interrupt-parent : interrupt source phandle.
+  - ctrl-reg : Contains the initial value of the control register also
+    called "Register B".
+  - freq-reg : Contains the initial value of the frequency register also
+    called "Regsiter A".
+
+"Register A" and "B" are usually initialized by the firmware (BIOS for
+instance). If this is not done, it can be performed by the driver.
+
+ISA Example:
+
+	rtc@70 {
+	         compatible = "motorola,mc146818";
+	         interrupts = <8 3>;
+	         interrupt-parent = <&ioapic1>;
+	         ctrl-reg = <2>;
+	         freq-reg = <0x26>;
+	         reg = <1 0x70 2>;
+	 };
diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index 5856167..e516a4b 100644
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -36,6 +36,9 @@
 #include <linux/platform_device.h>
 #include <linux/mod_devicetable.h>
 #include <linux/log2.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
 
 /* this is for "generic access to PC-style RTC" using CMOS_READ/CMOS_WRITE */
 #include <asm-generic/rtc.h>
@@ -1120,6 +1123,98 @@ static struct pnp_driver cmos_pnp_driver = {
 };
 
 #endif	/* CONFIG_PNP */
+#ifdef CONFIG_OF
+static bool of_driver_registered;
+
+static const struct of_device_id of_cmos_match[] = {
+	{
+		.compatible = "motorola,mc146818",
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, of_cmos_match);
+
+static int __init of_cmos_probe(struct platform_device *dev,
+		const struct of_device_id *match)
+{
+	struct resource res;
+	struct device_node *node = dev->dev.of_node;
+	struct rtc_time time;
+	int ret;
+	int virq;
+	const __be32 *val;
+
+	ret = of_address_to_resource(node, 0, &res);
+	if (ret)
+		return ret;
+
+	virq = irq_of_parse_and_map(node, 0);
+
+	val = of_get_property(node, "ctrl-reg", NULL);
+	if (val)
+		CMOS_WRITE(be32_to_cpup(val), RTC_CONTROL);
+
+	val = of_get_property(node, "freq-reg", NULL);
+	if (val)
+		CMOS_WRITE(be32_to_cpup(val), RTC_FREQ_SELECT);
+
+	get_rtc_time(&time);
+	ret = rtc_valid_tm(&time);
+	if (ret) {
+		struct rtc_time def_time = {
+			.tm_year = 1,
+			.tm_mday = 1,
+		};
+		set_rtc_time(&def_time);
+	}
+
+	return cmos_do_probe(&dev->dev, &res, virq);
+}
+
+static int __exit of_cmos_remove(struct platform_device *dev)
+{
+	cmos_do_remove(&dev->dev);
+	return 0;
+}
+
+static int of_cmos_shutdown(struct platform_device *dev)
+{
+	if (system_state == SYSTEM_POWER_OFF && !cmos_poweroff(&dev->dev))
+		return 0;
+
+	cmos_do_shutdown();
+	return 0;
+}
+
+#ifdef	CONFIG_PM
+static int of_cmos_suspend(struct platform_device *dev, pm_message_t mesg)
+{
+	return cmos_suspend(&dev->dev, mesg);
+}
+
+static int of_cmos_resume(struct platform_device *dev)
+{
+	return cmos_resume(&dev->dev);
+}
+#else
+#define	of_cmos_suspend NULL
+#define	of_cmos_resume	NULL
+#endif
+
+static struct of_platform_driver cmos_of_driver_probe = {
+	.driver = {
+		.name = "motorola-mc146818",
+		.owner = THIS_MODULE,
+		.of_match_table = of_cmos_match,
+	},
+	.probe          = of_cmos_probe,
+	.remove         = of_cmos_remove,
+	.shutdown	= of_cmos_shutdown,
+	.suspend	= of_cmos_suspend,
+	.resume		= of_cmos_resume,
+};
+#endif
+
 
 /*----------------------------------------------------------------*/
 
@@ -1176,6 +1271,11 @@ static int __init cmos_init(void)
 	if (retval == 0)
 		pnp_driver_registered = true;
 #endif
+#ifdef CONFIG_OF
+	retval = of_register_platform_driver(&cmos_of_driver_probe);
+	if (retval == 0)
+		of_driver_registered = true;
+#endif
 
 	if (!cmos_rtc.dev) {
 		retval = platform_driver_probe(&cmos_platform_driver,
@@ -1191,6 +1291,10 @@ static int __init cmos_init(void)
 	if (pnp_driver_registered)
 		pnp_unregister_driver(&cmos_pnp_driver);
 #endif
+#ifdef CONFIG_OF
+	if (of_driver_registered)
+		of_unregister_platform_driver(&cmos_of_driver_probe);
+#endif
 	return retval;
 }
 module_init(cmos_init);
@@ -1201,6 +1305,10 @@ static void __exit cmos_exit(void)
 	if (pnp_driver_registered)
 		pnp_unregister_driver(&cmos_pnp_driver);
 #endif
+#ifdef CONFIG_OF
+	if (of_driver_registered)
+		of_unregister_platform_driver(&cmos_of_driver_probe);
+#endif
 	if (platform_driver_registered)
 		platform_driver_unregister(&cmos_platform_driver);
 }
-- 
1.7.3.2
