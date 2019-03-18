From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Subject: [PATCH 2/2] PCI: OF: Support external-facing property
Date: Mon, 18 Mar 2019 18:21:24 +0000
Message-ID: <20190318182124.53859-3-jean-philippe.brucker@arm.com>
References: <20190318182124.53859-1-jean-philippe.brucker@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190318182124.53859-1-jean-philippe.brucker@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-pci@vger.kernel.org, Jeremy.Linton@arm.com, Grant.Likely@arm.com, Robin.Murphy@arm.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Set the "untrusted" attribute to any PCIe port that has an
"external-facing" device tree property. Any device downstream of this
port will inherit the attribute and have only the strictest IOMMU
protection.

Signed-off-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
---
 drivers/pci/of.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 3d32da15c215..3e7ac7748d90 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -35,6 +35,9 @@ void pci_set_bus_of_node(struct pci_bus *bus)
 		bus->dev.of_node = pcibios_get_phb_of_node(bus);
 	else
 		bus->dev.of_node = of_node_get(bus->self->dev.of_node);
+
+	if (of_get_property(bus->dev.of_node, "external-facing", NULL))
+		bus->self->untrusted = true;
 }
 
 void pci_release_bus_of_node(struct pci_bus *bus)
-- 
2.21.0
