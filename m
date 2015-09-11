From: David Daney <ddaney.cavm@gmail.com>
Subject: [PATCH 3/6] PCI: generic: Quit clobbering our pci_ops.
Date: Fri, 11 Sep 2015 16:21:56 -0700
Message-ID: <1442013719-5001-4-git-send-email-ddaney.cavm@gmail.com>
References: <1442013719-5001-1-git-send-email-ddaney.cavm@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1442013719-5001-1-git-send-email-ddaney.cavm@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, Will Deacon <will.deacon@arm.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
Cc: David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

From: David Daney <david.daney@cavium.com>

The pci-host-generic driver keeps a global struct pci_ops which it
then patches with the .map_bus method appropriate for the bus device.
A problem arises when the driver is used for two different types of
bus devices, the .map_bus method for the last device probed clobbers
the method for all previous devices.  The result, only the last bus
device probed has the proper .map_bus, and the others fail.

Move the struct pci_ops into the bus specific structure, and
initialize it when the bus device is probed.  Keep a copy of the
gen_pci_cfg_bus_ops structure, instead of a pointer to a global copy,
to future proof against the addition of bus specific elements to
struct pci_ops.

Signed-off-by: David Daney <david.daney@cavium.com>
---
 drivers/pci/host/pci-host-generic.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/host/pci-host-generic.c b/drivers/pci/host/pci-host-generic.c
index a0fb241..cd6f898 100644
--- a/drivers/pci/host/pci-host-generic.c
+++ b/drivers/pci/host/pci-host-generic.c
@@ -27,7 +27,7 @@
 
 struct gen_pci_cfg_bus_ops {
 	u32 bus_shift;
-	void __iomem *(*map_bus)(struct pci_bus *, unsigned int, int);
+	struct pci_ops ops;
 };
 
 struct gen_pci_cfg_windows {
@@ -35,7 +35,7 @@ struct gen_pci_cfg_windows {
 	struct resource				*bus_range;
 	void __iomem				**win;
 
-	const struct gen_pci_cfg_bus_ops	*ops;
+	struct gen_pci_cfg_bus_ops		ops;
 };
 
 /*
@@ -65,7 +65,11 @@ static void __iomem *gen_pci_map_cfg_bus_cam(struct pci_bus *bus,
 
 static struct gen_pci_cfg_bus_ops gen_pci_cfg_cam_bus_ops = {
 	.bus_shift	= 16,
-	.map_bus	= gen_pci_map_cfg_bus_cam,
+	.ops		= {
+		.map_bus	= gen_pci_map_cfg_bus_cam,
+		.read		= pci_generic_config_read,
+		.write		= pci_generic_config_write,
+	}
 };
 
 static void __iomem *gen_pci_map_cfg_bus_ecam(struct pci_bus *bus,
@@ -80,12 +84,11 @@ static void __iomem *gen_pci_map_cfg_bus_ecam(struct pci_bus *bus,
 
 static struct gen_pci_cfg_bus_ops gen_pci_cfg_ecam_bus_ops = {
 	.bus_shift	= 20,
-	.map_bus	= gen_pci_map_cfg_bus_ecam,
-};
-
-static struct pci_ops gen_pci_ops = {
-	.read	= pci_generic_config_read,
-	.write	= pci_generic_config_write,
+	.ops		= {
+		.map_bus	= gen_pci_map_cfg_bus_ecam,
+		.read		= pci_generic_config_read,
+		.write		= pci_generic_config_write,
+	}
 };
 
 static const struct of_device_id gen_pci_of_match[] = {
@@ -175,7 +178,7 @@ static int gen_pci_parse_map_cfg_windows(struct gen_pci *pci)
 
 	/* Limit the bus-range to fit within reg */
 	bus_max = pci->cfg.bus_range->start +
-		  (resource_size(&pci->cfg.res) >> pci->cfg.ops->bus_shift) - 1;
+		  (resource_size(&pci->cfg.res) >> pci->cfg.ops.bus_shift) - 1;
 	pci->cfg.bus_range->end = min_t(resource_size_t,
 					pci->cfg.bus_range->end, bus_max);
 
@@ -193,7 +196,7 @@ static int gen_pci_parse_map_cfg_windows(struct gen_pci *pci)
 	bus_range = pci->cfg.bus_range;
 	for (busn = bus_range->start; busn <= bus_range->end; ++busn) {
 		u32 idx = busn - bus_range->start;
-		u32 sz = 1 << pci->cfg.ops->bus_shift;
+		u32 sz = 1 << pci->cfg.ops.bus_shift;
 
 		pci->cfg.win[idx] = devm_ioremap(dev,
 						 pci->cfg.res.start + busn * sz,
@@ -240,8 +243,7 @@ static int gen_pci_probe(struct platform_device *pdev)
 	}
 
 	of_id = of_match_node(gen_pci_of_match, np);
-	pci->cfg.ops = of_id->data;
-	gen_pci_ops.map_bus = pci->cfg.ops->map_bus;
+	pci->cfg.ops = *(struct gen_pci_cfg_bus_ops *)of_id->data;
 	pci->host.dev.parent = dev;
 	INIT_LIST_HEAD(&pci->host.windows);
 	INIT_LIST_HEAD(&pci->resources);
@@ -262,7 +264,8 @@ static int gen_pci_probe(struct platform_device *pdev)
 	if (!pci_has_flag(PCI_PROBE_ONLY))
 		pci_add_flags(PCI_REASSIGN_ALL_RSRC | PCI_REASSIGN_ALL_BUS);
 
-	bus = pci_scan_root_bus(dev, 0, &gen_pci_ops, pci, &pci->resources);
+	bus = pci_scan_root_bus(dev, 0,
+				&pci->cfg.ops.ops, pci, &pci->resources);
 	if (!bus) {
 		dev_err(dev, "Scanning rootbus failed");
 		return -ENODEV;
-- 
1.7.11.7
