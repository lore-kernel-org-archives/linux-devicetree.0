From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Subject: [PATCH v3 2/2] PCI: OF: Support external-facing property
Date: Thu, 11 Apr 2019 13:40:27 +0100
Message-ID: <20190411124027.9490-3-jean-philippe.brucker@arm.com>
References: <20190411124027.9490-1-jean-philippe.brucker@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190411124027.9490-1-jean-philippe.brucker@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: bhelgaas@google.com
Cc: Mark.Rutland@arm.com, devicetree@vger.kernel.org, Grant.Likely@arm.com, linux-pci@vger.kernel.org, robh+dt@kernel.org, Robin.Murphy@arm.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Set the "untrusted" attribute to any PCIe port that has an
"external-facing" device tree property. Any device downstream of this
port will inherit the attribute and have only the strictest IOMMU
protection.

Signed-off-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
---
v2->v3:
* Use of_property_read_bool().
* Firmware can in theory set the property on the host bridge node.
  Handle this case.
* Don't pass a NULL node to the of driver. Although it is handled
  gracefully at the moment, it isn't documented and we might as well
  proof this too.
---
 drivers/pci/of.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 3d32da15c215..67376cf45880 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -31,10 +31,16 @@ void pci_release_of_node(struct pci_dev *dev)
 
 void pci_set_bus_of_node(struct pci_bus *bus)
 {
-	if (bus->self == NULL)
-		bus->dev.of_node = pcibios_get_phb_of_node(bus);
-	else
-		bus->dev.of_node = of_node_get(bus->self->dev.of_node);
+	struct device_node *node;
+
+	if (bus->self == NULL) {
+		node = pcibios_get_phb_of_node(bus);
+	} else {
+		node = of_node_get(bus->self->dev.of_node);
+		if (node && of_property_read_bool(node, "external-facing"))
+			bus->self->untrusted = true;
+	}
+	bus->dev.of_node = node;
 }
 
 void pci_release_bus_of_node(struct pci_bus *bus)
-- 
2.21.0
