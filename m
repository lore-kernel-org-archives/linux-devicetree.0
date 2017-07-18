From: Rob Herring <robh@kernel.org>
Subject: [PATCH] misc: Convert to using %pOF instead of full_name
Date: Tue, 18 Jul 2017 16:43:15 -0500
Message-ID: <20170718214339.7774-35-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Now that we have a custom printf format specifier, convert users of
full_name to use %pOF instead. This is preparation to remove storing
of the full path string for each node.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/misc/eeprom/idt_89hpesx.c |  8 ++++----
 drivers/misc/sram.c               | 12 ++++++------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/misc/eeprom/idt_89hpesx.c b/drivers/misc/eeprom/idt_89hpesx.c
index ab0df6a17690..37312b548a03 100644
--- a/drivers/misc/eeprom/idt_89hpesx.c
+++ b/drivers/misc/eeprom/idt_89hpesx.c
@@ -1132,8 +1132,8 @@ static void idt_get_ofdata(struct idt_89hpesx_dev *pdev)
 		for_each_available_child_of_node(node, child) {
 			ee_id = idt_ee_match_id(child);
 			if (IS_ERR_OR_NULL(ee_id)) {
-				dev_warn(dev, "Skip unsupported child node %s",
-					child->full_name);
+				dev_warn(dev, "Skip unsupported child node %pOF",
+					child);
 				continue;
 			} else
 				break;
@@ -1151,8 +1151,8 @@ static void idt_get_ofdata(struct idt_89hpesx_dev *pdev)
 		/* Get custom EEPROM address from 'reg' attribute */
 		addr_be = of_get_property(child, "reg", &len);
 		if (!addr_be || (len < sizeof(*addr_be))) {
-			dev_warn(dev, "No reg on %s, use default address %d",
-				child->full_name, EEPROM_DEF_ADDR);
+			dev_warn(dev, "No reg on %pOF, use default address %d",
+				child, EEPROM_DEF_ADDR);
 			pdev->inieecmd = 0;
 			pdev->eeaddr = EEPROM_DEF_ADDR << 1;
 		} else {
diff --git a/drivers/misc/sram.c b/drivers/misc/sram.c
index d1185b78cf9a..fc0415771c00 100644
--- a/drivers/misc/sram.c
+++ b/drivers/misc/sram.c
@@ -196,15 +196,15 @@ static int sram_reserve_regions(struct sram_dev *sram, struct resource *res)
 		ret = of_address_to_resource(child, 0, &child_res);
 		if (ret < 0) {
 			dev_err(sram->dev,
-				"could not get address for node %s\n",
-				child->full_name);
+				"could not get address for node %pOF\n",
+				child);
 			goto err_chunks;
 		}

 		if (child_res.start < res->start || child_res.end > res->end) {
 			dev_err(sram->dev,
-				"reserved block %s outside the sram area\n",
-				child->full_name);
+				"reserved block %pOF outside the sram area\n",
+				child);
 			ret = -EINVAL;
 			goto err_chunks;
 		}
@@ -230,8 +230,8 @@ static int sram_reserve_regions(struct sram_dev *sram, struct resource *res)
 			ret = of_property_read_string(child, "label", &label);
 			if (ret && ret != -EINVAL) {
 				dev_err(sram->dev,
-					"%s has invalid label name\n",
-					child->full_name);
+					"%pOF has invalid label name\n",
+					child);
 				goto err_chunks;
 			}
 			if (!label)
--
2.11.0
