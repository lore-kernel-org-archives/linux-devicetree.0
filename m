From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH v5 1/3] mtd: nand: gpio: Add DT property to automatically
 determine bus width
Date: Wed, 13 Nov 2013 15:58:02 +0400
Message-ID: <1384343884-29622-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, Alexander Shiyan <shc_work@mail.ru>, Pawel Moll <pawel.moll@arm.com>, Artem Bityutskiy <dedekind1@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <rob.herring@calxeda.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Eric Miao <eric.y.miao@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

This patch adds a property to automatically determine the NAND
bus width by CFI/ONFI information from chip. This property works
if the bus width is not specified explicitly.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 .../devicetree/bindings/mtd/gpio-control-nand.txt        |  3 +++
 drivers/mtd/nand/gpio.c                                  | 16 ++++++++++++----
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
index 36ef07d..fe4e960 100644
--- a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
@@ -19,6 +19,9 @@ Optional properties:
   defaults to 1 byte.
 - chip-delay : chip dependent delay for transferring data from array to
   read registers (tR).  If not present then a default of 20us is used.
+- gpio-control-nand,bank-width-auto : Device bus width is determined
+  automatically by CFI/ONFI information from chip if "bank-width"
+  parameter is omitted (Boolean).
 - gpio-control-nand,io-sync-reg : A 64-bit physical address for a read
   location used to guard against bus reordering with regards to accesses to
   the GPIO's and the NAND flash data bus.  If present, then after changing
diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index e826f89..8ec731d 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -116,6 +116,9 @@ static int gpio_nand_get_config_of(const struct device *dev,
 			dev_err(dev, "invalid bank-width %u\n", val);
 			return -EINVAL;
 		}
+	} else if (of_property_read_bool(dev->of_node,
+					 "gpio-control-nand,bank-width-auto")) {
+		plat->options |= NAND_BUSWIDTH_AUTO;
 	}
 
 	plat->gpio_rdy = of_get_gpio(dev->of_node, 0);
@@ -223,6 +226,15 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	if (IS_ERR(chip->IO_ADDR_R))
 		return PTR_ERR(chip->IO_ADDR_R);
 
+	ret = gpio_nand_get_config(&pdev->dev, &gpiomtd->plat);
+	if (ret)
+		return ret;
+
+	/* Only 8-bit bus wide is possible if size is 1 */
+	if (resource_size(res) < 2)
+		gpiomtd->plat.options &= ~(NAND_BUSWIDTH_16 |
+					   NAND_BUSWIDTH_AUTO);
+
 	res = gpio_nand_get_io_sync(pdev);
 	if (res) {
 		gpiomtd->io_sync = devm_ioremap_resource(&pdev->dev, res);
@@ -230,10 +242,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
 			return PTR_ERR(gpiomtd->io_sync);
 	}
 
-	ret = gpio_nand_get_config(&pdev->dev, &gpiomtd->plat);
-	if (ret)
-		return ret;
-
 	ret = devm_gpio_request(&pdev->dev, gpiomtd->plat.gpio_nce, "NAND NCE");
 	if (ret)
 		return ret;
-- 
1.8.1.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
