From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [RFC] driver-core: Add device node pointer to struct device
Date: Wed, 24 Feb 2010 14:10:30 -0700
Message-ID: <20100224210514.16289.86611.stgit@angua>
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
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-l3A5Bk7waGM@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kay.sievers-tD+1rO4QERM@public.gmane.org
List-Id: devicetree@vger.kernel.org

Greg and Kay,

This is a patch from a larger series of OF related cleanup patches.  This
one adds a new 'of_node' member to struct device, conditional upon
CONFIG_OF.  The goal is to move of_node out of archdata because all
arches using CONFIG_OF need it.

Before I commit too much effort down this path, I want to get your
feedback.  Do you have any objections to this change to struct device?

@@ -414,6 +415,9 @@ struct device {
 					     override */
 	/* arch specific additions */
 	struct dev_archdata	archdata;
+#ifdef CONFIG_OF
+	struct device_node	*of_node;
+#endif
 
 	dev_t			devt;	/* dev_t, creates the sysfs "dev" */

Full patch follows...

Thanks,
g.
--

Currently, platforms using CONFIG_OF add a 'struct device_node *of_node'
to dev->archdata.  However, with CONFIG_OF becoming generic for all
architectures, it makes sense for commonality to move it out of archdata
and into struct device proper.

This patch adds a struct device_node *of_node member to struct device
and updates all locations which currently write the device_node pointer
into archdata to also update dev->of_node.  Subsequent patches will
modify callers to use the new location and ultimately remove
the archdata member entirely.

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---

 arch/microblaze/kernel/of_device.c      |    3 ++-
 arch/powerpc/kernel/of_device.c         |    3 ++-
 arch/powerpc/kernel/pci-common.c        |    5 +++--
 arch/powerpc/kernel/vio.c               |    3 ++-
 arch/powerpc/platforms/ps3/system-bus.c |    3 ++-
 arch/sparc/kernel/pci.c                 |    3 ++-
 drivers/of/of_mdio.c                    |    3 ++-
 drivers/of/of_spi.c                     |    3 ++-
 include/linux/device.h                  |    4 ++++
 9 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/arch/microblaze/kernel/of_device.c b/arch/microblaze/kernel/of_device.c
index 9a0f763..12371bd 100644
--- a/arch/microblaze/kernel/of_device.c
+++ b/arch/microblaze/kernel/of_device.c
@@ -53,7 +53,8 @@ struct of_device *of_device_alloc(struct device_node *np,
 	dev->dev.dma_mask = &dev->dma_mask;
 	dev->dev.parent = parent;
 	dev->dev.release = of_release_dev;
-	dev->dev.archdata.of_node = np;
+	dev->dev.archdata.of_node = np; /* temporary; remove after merging */
+	dev->dev.of_node = np;
 
 	if (bus_id)
 		dev_set_name(&dev->dev, bus_id);
diff --git a/arch/powerpc/kernel/of_device.c b/arch/powerpc/kernel/of_device.c
index a359cb0..efbc262 100644
--- a/arch/powerpc/kernel/of_device.c
+++ b/arch/powerpc/kernel/of_device.c
@@ -73,7 +73,8 @@ struct of_device *of_device_alloc(struct device_node *np,
 	dev->dev.dma_mask = &dev->dma_mask;
 	dev->dev.parent = parent;
 	dev->dev.release = of_release_dev;
-	dev->dev.archdata.of_node = np;
+	dev->dev.archdata.of_node = np; /* temporary; remove after merging */
+	dev->dev.of_node = np;
 
 	if (bus_id)
 		dev_set_name(&dev->dev, "%s", bus_id);
diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index cadbed6..53ae0d9 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -1113,8 +1113,9 @@ void __devinit pcibios_setup_bus_devices(struct pci_bus *bus)
 		if (dev->is_added)
 			continue;
 
-		/* Setup OF node pointer in archdata */
-		sd->of_node = pci_device_to_OF_node(dev);
+		/* Setup OF node pointer in the device */
+		sd->of_node = pci_device_to_OF_node(dev); /* temporary */
+		dev->dev.of_node = pci_device_to_OF_node(dev);
 
 		/* Fixup NUMA node as it may not be setup yet by the generic
 		 * code and is needed by the DMA init
diff --git a/arch/powerpc/kernel/vio.c b/arch/powerpc/kernel/vio.c
index 77f6421..70b52c7 100644
--- a/arch/powerpc/kernel/vio.c
+++ b/arch/powerpc/kernel/vio.c
@@ -1229,7 +1229,8 @@ struct vio_dev *vio_register_device_node(struct device_node *of_node)
 		if (unit_address != NULL)
 			viodev->unit_address = *unit_address;
 	}
-	viodev->dev.archdata.of_node = of_node_get(of_node);
+	viodev->dev.of_node = of_node_get(of_node);
+	viodev->dev.archdata.of_node = viodev->dev.of_node; /* temporary */
 
 	if (firmware_has_feature(FW_FEATURE_CMO))
 		vio_cmo_set_dma_ops(viodev);
diff --git a/arch/powerpc/platforms/ps3/system-bus.c b/arch/powerpc/platforms/ps3/system-bus.c
index e34b305..5f162c0 100644
--- a/arch/powerpc/platforms/ps3/system-bus.c
+++ b/arch/powerpc/platforms/ps3/system-bus.c
@@ -765,7 +765,8 @@ int ps3_system_bus_device_register(struct ps3_system_bus_device *dev)
 		BUG();
 	};
 
-	dev->core.archdata.of_node = NULL;
+	dev->core.of_node = NULL;
+	dev->core.archdata.of_node = NULL; /* temporary */
 	set_dev_node(&dev->core, 0);
 
 	pr_debug("%s:%d add %s\n", __func__, __LINE__, dev_name(&dev->core));
diff --git a/arch/sparc/kernel/pci.c b/arch/sparc/kernel/pci.c
index 539e83f..e1e2d00 100644
--- a/arch/sparc/kernel/pci.c
+++ b/arch/sparc/kernel/pci.c
@@ -260,7 +260,7 @@ static struct pci_dev *of_create_pci_dev(struct pci_pbm_info *pbm,
 	sd->iommu = pbm->iommu;
 	sd->stc = &pbm->stc;
 	sd->host_controller = pbm;
-	sd->prom_node = node;
+	sd->prom_node = node; /* temporary */
 	sd->op = op = of_find_device_by_node(node);
 	sd->numa_node = pbm->numa_node;
 
@@ -284,6 +284,7 @@ static struct pci_dev *of_create_pci_dev(struct pci_pbm_info *pbm,
 	dev->sysdata = node;
 	dev->dev.parent = bus->bridge;
 	dev->dev.bus = &pci_bus_type;
+	dev->dev.of_node = node;
 	dev->devfn = devfn;
 	dev->multifunction = 0;		/* maybe a lie? */
 
diff --git a/drivers/of/of_mdio.c b/drivers/of/of_mdio.c
index 18ecae4..3bf20bf 100644
--- a/drivers/of/of_mdio.c
+++ b/drivers/of/of_mdio.c
@@ -79,7 +79,8 @@ int of_mdiobus_register(struct mii_bus *mdio, struct device_node *np)
 		/* Associate the OF node with the device structure so it
 		 * can be looked up later */
 		of_node_get(child);
-		dev_archdata_set_node(&phy->dev.archdata, child);
+		dev_archdata_set_node(&phy->dev.archdata, child); /* temp */
+		phy->dev.of_node = child;
 
 		/* All data is now stored in the phy struct; register it */
 		rc = phy_device_register(phy);
diff --git a/drivers/of/of_spi.c b/drivers/of/of_spi.c
index f65f48b..433d76d 100644
--- a/drivers/of/of_spi.c
+++ b/drivers/of/of_spi.c
@@ -79,7 +79,8 @@ void of_register_spi_devices(struct spi_master *master, struct device_node *np)
 
 		/* Store a pointer to the node in the device structure */
 		of_node_get(nc);
-		spi->dev.archdata.of_node = nc;
+		spi->dev.of_node = nc;
+		spi->dev.archdata.of_node = nc; /* temporary */
 
 		/* Register the new device */
 		request_module(spi->modalias);
diff --git a/include/linux/device.h b/include/linux/device.h
index a62799f..c9b199a 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -34,6 +34,7 @@ struct class;
 struct class_private;
 struct bus_type;
 struct bus_type_private;
+struct device_node;
 
 struct bus_attribute {
 	struct attribute	attr;
@@ -414,6 +415,9 @@ struct device {
 					     override */
 	/* arch specific additions */
 	struct dev_archdata	archdata;
+#ifdef CONFIG_OF
+	struct device_node	*of_node;
+#endif
 
 	dev_t			devt;	/* dev_t, creates the sysfs "dev" */
