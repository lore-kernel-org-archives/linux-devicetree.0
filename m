From: Alexander Clouter <alex@digriz.org.uk>
Subject: plat-nand DT support
Date: Sun, 3 Mar 2013 15:52:26 +0000
Message-ID: <20130303155226.GA1976@edkhil>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="AhhlLboLdkugWU4S"
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: linux-mtd@lists.infradead.org
Cc: hsweeten@visionengravers.com, devicetree-discuss@lists.ozlabs.org, blogic@openwrt.org
List-Id: devicetree@vger.kernel.org


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

Hi,

I have been busy porting an ARM board (that uses plat_nand) to devicetree and stumbled on John 
Crispin's patch from last year[1].  There was not much online about how to use it, so I went 
about building upon his work it what seemed to be natural and a good fit.

Attached is the work I have done to the driver its-self (including the much needed bindings 
documentation), whilst on my github page I have put up an example of its usage:

https://github.com/jimdigriz/ts78xx/blob/gen-nand-dt/arch/arm/mach-orion5x/board-ts7800.c
https://github.com/jimdigriz/ts78xx/blob/gen-nand-dt/arch/arm/boot/dts/orion5x-ts7800.dts

Am I going in the right direction here?  plat_nand, by its nature, is not very DT, the 
alternative would be a custom driver for my platform[2] but then are we not just littering 
drivers/mtd/nand rather than arch/arm/mach-foobar?

Cheers

[1] http://lists.infradead.org/pipermail/linux-mtd/2012-April/041025.html
[2] could also support the NAND used by arch/arm/mach-ep93xx/ts72xx.c but the whole SoC has not 
	been ported to DT

-- 
Alexander Clouter
.sigmonster says: How many weeks are there in a light year?

--AhhlLboLdkugWU4S
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="plat-nand-dt.patch"

diff --git a/Documentation/devicetree/bindings/mtd/plat-nand.txt b/Documentation/devicetree/bindings/mtd/plat-nand.txt
new file mode 100644
index 0000000..8df90d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/plat-nand.txt
@@ -0,0 +1,92 @@
+NAND support for Generic NAND driver
+
+Required properties:
+- compatible : "gen_nand"
+- reg : Array of base physical addresses of the NAND and the length of memory
+	mapped regions.  Typically only one element in size, but some users
+	(see board-ts7800.c) need additional addresses.  The first reg *must*
+	be the data io region, additional ones are platform defined
+- nr-chips : Number of physical chips
+
+Optional properties:
+- reg-name : First *should* be "data", additional ones are platform defined
+- bank-width : Width in bytes of the device. Default is 1 (8bit), 2 (16bit)
+		implies NAND_BUSWIDTH_16 and any other value is invalid
+- chip-delay : Chip dependent delay for transferring data from array to read
+		registers in usecs
+- bbt-use-flash : Use a flash based bad block table.  Default, OOB identifier
+		is saved in OOB area
+
+The device tree may optionally contain sub-nodes describing partitions of the
+address space. See partition.txt for more detail.
+
+Example:
+
+nand@800 {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "technologicsystems,nand", "gen_nand";
+	reg =   <0x804 0x04>,
+		<0x800 0x04>;
+	reg-names = "data", "ctrl";
+	nr-chips = <1>;
+	chip-delay = <15>;
+	bbt-use-flash;
+
+	partition@0 {
+		label = "mbr";
+		reg = <0x00000000 0x00020000>;
+		read-only;
+	};
+
+	partition@20000 {
+		label = "kernel";
+		reg = <0x00020000 0x00400000>;
+	};
+
+	partition@420000 {
+		label = "initrd";
+		reg = <0x00420000 0x00400000>;
+	};
+
+	partition@820000 {
+		label = "rootfs";
+		reg = <0x00820000 0x1f7e0000>;
+	};
+};
+
+N.B. to use the plat-nand driver, the platform board code does still need to
+	setup platform_nand_data and hook it into the platform_device so
+	the callbacks (for at least .cmd_ctrl and .dev_ready) are available.
+
+Example (relevant snippets from board-ts7800.c):
+
+static struct platform_nand_data ts7800_nand_data = {
+        .ctrl   = {
+                .cmd_ctrl               = ts7800_nand_cmd_ctrl,
+                .dev_ready              = ts7800_nand_dev_ready,
+        },
+};
+
+static int ts7800_platform_notifier(struct notifier_block *nb,
+                                  unsigned long event, void *__dev)
+{
+        struct device *dev = __dev;
+
+        if (event != BUS_NOTIFY_ADD_DEVICE)
+                return NOTIFY_DONE;
+
+        if (of_device_is_compatible(dev->of_node, "technologicsystems,nand"))
+                dev->platform_data = &ts7800_nand_data;
+
+        return NOTIFY_OK;
+}
+
+static struct notifier_block ts7800_platform_nb = {
+        .notifier_call = ts7800_platform_notifier,
+};
+
+void __init ts7800_init(void)
+{
+        bus_register_notifier(&platform_bus_type, &ts7800_platform_nb);
+}
diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index c004566..0b07388 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -12,6 +12,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/of.h>
 #include <linux/slab.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/nand.h>
@@ -23,7 +24,7 @@ struct plat_nand_data {
 	void __iomem		*io_base;
 };
 
-static const char *part_probe_types[] = { "cmdlinepart", NULL };
+static const char *part_probe_types[] = { "cmdlinepart", "ofpart", NULL };
 
 /*
  * Probe for the NAND device.
@@ -42,11 +43,6 @@ static int plat_nand_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	if (pdata->chip.nr_chips < 1) {
-		dev_err(&pdev->dev, "invalid number of chips specified\n");
-		return -EINVAL;
-	}
-
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res)
 		return -ENXIO;
@@ -79,15 +75,40 @@ static int plat_nand_probe(struct platform_device *pdev)
 
 	data->chip.IO_ADDR_R = data->io_base;
 	data->chip.IO_ADDR_W = data->io_base;
+
+	if (pdev->dev.of_node) {
+		int i;
+
+		if (!of_property_read_u32(pdev->dev.of_node,
+						"nr-chips", &i))
+			data->chip.numchips = i;
+		if (!of_property_read_u32(pdev->dev.of_node,
+						"chip-delay", &i))
+			data->chip.chip_delay = (u8)i;
+		if (!of_property_read_u32(pdev->dev.of_node,
+						"bank-width", &i)) {
+			if (i == 2)
+				data->chip.options |= NAND_BUSWIDTH_16;
+			else if (i != 1) {
+				dev_warn(&pdev->dev,
+					"%d bit bus width out of range\n", i);
+			}
+		}
+		if (of_get_property(pdev->dev.of_node, "bbt-use-flash", &i))
+			data->chip.bbt_options |= NAND_BBT_USE_FLASH;
+	} else {
+		data->chip.numchips = pdata->chip.nr_chips;
+		data->chip.chip_delay = pdata->chip.chip_delay;
+		data->chip.options |= pdata->chip.options;
+		data->chip.bbt_options |= pdata->chip.bbt_options;
+	}
+
 	data->chip.cmd_ctrl = pdata->ctrl.cmd_ctrl;
 	data->chip.dev_ready = pdata->ctrl.dev_ready;
 	data->chip.select_chip = pdata->ctrl.select_chip;
 	data->chip.write_buf = pdata->ctrl.write_buf;
 	data->chip.read_buf = pdata->ctrl.read_buf;
 	data->chip.read_byte = pdata->ctrl.read_byte;
-	data->chip.chip_delay = pdata->chip.chip_delay;
-	data->chip.options |= pdata->chip.options;
-	data->chip.bbt_options |= pdata->chip.bbt_options;
 
 	data->chip.ecc.hwctl = pdata->ctrl.hwcontrol;
 	data->chip.ecc.layout = pdata->chip.ecclayout;
@@ -102,8 +123,14 @@ static int plat_nand_probe(struct platform_device *pdev)
 			goto out;
 	}
 
+	if (data->chip.numchips < 1) {
+		dev_err(&pdev->dev, "invalid number of chips specified\n");
+		err = -EINVAL;
+		goto out;
+	}
+
 	/* Scan to find existence of the device */
-	if (nand_scan(&data->mtd, pdata->chip.nr_chips)) {
+	if (nand_scan(&data->mtd, data->chip.numchips)) {
 		err = -ENXIO;
 		goto out;
 	}

--AhhlLboLdkugWU4S
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--AhhlLboLdkugWU4S--
