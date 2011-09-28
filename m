From: Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/3] mfd: link vx855 with device tree
Date: Wed, 28 Sep 2011 10:08:26 +0100 (BST)
Message-ID: <20110928090826.B98509D401D@zog.reactivated.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Set the of_node of the mfd device, and use it to assign the of_node
of the child gpio cell. The child driver will then pass the handle to
gpiolib, which enables device-tree-probed gpio-leds and more.

Signed-off-by: Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
---
 drivers/mfd/vx855.c |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/drivers/mfd/vx855.c b/drivers/mfd/vx855.c
index d698703..d223840 100644
--- a/drivers/mfd/vx855.c
+++ b/drivers/mfd/vx855.c
@@ -30,6 +30,7 @@
 #include <linux/platform_device.h>
 #include <linux/pci.h>
 #include <linux/mfd/core.h>
+#include <linux/of.h>
 
 /* offset into pci config space indicating the 16bit register containing
  * the power management IO space base */
@@ -72,6 +73,27 @@ static struct mfd_cell vx855_cells[] = {
 	},
 };
 
+static __devinit void vx855_set_of_nodes(struct pci_dev *pdev)
+{
+#ifdef CONFIG_OF
+	struct device_node *isa_node;
+	struct device_node *child;
+
+	isa_node = of_find_compatible_node(NULL, NULL, "via,vx855-isa");
+	pdev->dev.of_node = isa_node;
+
+	if (!isa_node)
+		return;
+
+	for_each_child_of_node(isa_node, child) {
+		if (of_device_is_compatible(child, "via,vx855-gpio")) {
+			vx855_cells[0].of_node = child;
+			break;
+		}
+	}
+#endif
+}
+
 static __devinit int vx855_probe(struct pci_dev *pdev,
 				 const struct pci_device_id *id)
 {
@@ -90,6 +112,8 @@ static __devinit int vx855_probe(struct pci_dev *pdev,
 		goto out;
 	}
 
+	vx855_set_of_nodes(pdev);
+
 	/* mask out the lowest seven bits, as they are always zero, but
 	 * hardware returns them as 0x01 */
 	gpio_io_offset &= 0xff80;
-- 
1.7.6.2
