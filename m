From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH 6/6] of/device: populate platform_device (of_device) resource
	table on allocation
Date: Tue, 08 Jun 2010 08:26:43 -0600
Message-ID: <20100608142643.26088.61366.stgit@angua>
References: <20100608142152.26088.1108.stgit@angua>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100608142152.26088.1108.stgit@angua>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: ben-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, linuxppc-dev@lists.
List-Id: devicetree@vger.kernel.org

When allocating a platform_device to represent an OF node, also allocate
space for the resource table and populate it with IRQ and reg property
information.  This change is in preparation for merging the
of_platform_bus_type with the platform_bus_type so that existing
platform_driver code can retrieve base addresses and IRQs data.

Background: a previous commit removed struct of_device and made it a
#define alias for platform_device.

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
CC: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
CC: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
CC: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
CC: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
CC: microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org
CC: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
CC: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
---
 drivers/of/platform.c |   31 ++++++++++++++++++++++++++++---
 1 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 4bb898d..10ad0b6 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -441,16 +441,41 @@ struct of_device *of_device_alloc(struct device_node *np,
 				  struct device *parent)
 {
 	struct of_device *dev;
-
-	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+	int rc, i, num_reg = 0, num_irq = 0;
+	struct resource *res, temp_res;
+
+	/* First count how many resources are needed */
+	while (of_address_to_resource(np, num_reg, &temp_res) == 0)
+		num_reg++;
+	while (of_irq_to_resource(np, num_irq, &temp_res) != NO_IRQ)
+		num_irq++;
+
+	/* Allocate the device including space for the resource table, and
+	 * initialize it. */
+	i = num_reg + num_irq;
+	dev = kzalloc(sizeof(*dev) + (sizeof(struct resource) * i), GFP_KERNEL);
 	if (!dev)
 		return NULL;
-
 	dev->dev.of_node = of_node_get(np);
 	dev->dev.dma_mask = &dev->archdata.dma_mask;
 	dev->dev.parent = parent;
 	dev->dev.release = of_release_dev;
 
+	/* Populate the resource table */
+	if (num_irq || num_reg) {
+		dev->resource = (void*)&dev[1];
+		dev->num_resources = num_reg + num_irq;
+		res = dev->resource;
+		for (i = 0; i < num_reg; i++, res++) {
+			rc = of_address_to_resource(np, i, res);
+			WARN_ON(rc);
+		}
+		for (i = 0; i < num_irq; i++, res++) {
+			rc = of_irq_to_resource(np, i, res);
+			WARN_ON(rc == NO_IRQ);
+		}
+	}
+
 	if (bus_id)
 		dev_set_name(&dev->dev, "%s", bus_id);
 	else
