From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: [PATCH v8 5/9] pci: Create pci_host_bridge before its associated bus
 in pci_create_root_bus.
Date: Tue,  1 Jul 2014 19:43:30 +0100
Message-ID: <1404240214-9804-6-git-send-email-Liviu.Dudau@arm.com>
References: <1404240214-9804-1-git-send-email-Liviu.Dudau@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1404240214-9804-1-git-send-email-Liviu.Dudau@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Arnd Bergmann <arnd@arndb.de>, linaro-kernel <linaro-kernel@lists.linaro.org>, Tanmay Inamdar <tinamdar@apm.com>, Grant Likely <grant.likely@secretlab.ca>, Sinan Kaya <okaya@codeaurora.org>, Jingoo Han <jg1.han@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Suravee Suthikulanit <suravee.suthikulpanit@amd.com>
Cc: Device Tree ML <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Before commit 7b5436635800 the pci_host_bridge was created before the root bus.
As that commit has added a needless dependency on the bus for pci_alloc_host_bridge()
the creation order has been changed for no good reason. Revert the order of
creation as we are going to depend on the pci_host_bridge structure to retrieve the
domain number of the root bus.

Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
Acked-by: Grant Likely <grant.likely@linaro.org>
Tested-by: Tanmay Inamdar <tinamdar@apm.com>
---
 drivers/pci/probe.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index e3cf8a2..2c92662 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -515,7 +515,7 @@ static void pci_release_host_bridge_dev(struct device *dev)
 	kfree(bridge);
 }
 
-static struct pci_host_bridge *pci_alloc_host_bridge(struct pci_bus *b)
+static struct pci_host_bridge *pci_alloc_host_bridge(void)
 {
 	struct pci_host_bridge *bridge;
 
@@ -524,7 +524,6 @@ static struct pci_host_bridge *pci_alloc_host_bridge(struct pci_bus *b)
 		return NULL;
 
 	INIT_LIST_HEAD(&bridge->windows);
-	bridge->bus = b;
 	return bridge;
 }
 
@@ -1761,9 +1760,16 @@ struct pci_bus *pci_create_root_bus(struct device *parent, int bus,
 	char bus_addr[64];
 	char *fmt;
 
+	bridge = pci_alloc_host_bridge();
+	if (!bridge)
+		return NULL;
+
+	bridge->dev.parent = parent;
+	bridge->dev.release = pci_release_host_bridge_dev;
+
 	b = pci_alloc_bus();
 	if (!b)
-		return NULL;
+		goto err_out;
 
 	b->sysdata = sysdata;
 	b->ops = ops;
@@ -1772,26 +1778,19 @@ struct pci_bus *pci_create_root_bus(struct device *parent, int bus,
 	if (b2) {
 		/* If we already got to this bus through a different bridge, ignore it */
 		dev_dbg(&b2->dev, "bus already known\n");
-		goto err_out;
+		goto err_bus_out;
 	}
 
-	bridge = pci_alloc_host_bridge(b);
-	if (!bridge)
-		goto err_out;
-
-	bridge->dev.parent = parent;
-	bridge->dev.release = pci_release_host_bridge_dev;
+	bridge->bus = b;
 	dev_set_name(&bridge->dev, "pci%04x:%02x", pci_domain_nr(b), bus);
 	error = pcibios_root_bridge_prepare(bridge);
-	if (error) {
-		kfree(bridge);
+	if (error)
 		goto err_out;
-	}
 
 	error = device_register(&bridge->dev);
 	if (error) {
 		put_device(&bridge->dev);
-		goto err_out;
+		goto err_bus_out;
 	}
 	b->bridge = get_device(&bridge->dev);
 	device_enable_async_suspend(b->bridge);
@@ -1848,8 +1847,10 @@ struct pci_bus *pci_create_root_bus(struct device *parent, int bus,
 class_dev_reg_err:
 	put_device(&bridge->dev);
 	device_unregister(&bridge->dev);
-err_out:
+err_bus_out:
 	kfree(b);
+err_out:
+	kfree(bridge);
 	return NULL;
 }
 
-- 
2.0.0
