From: David Daney <ddaney.cavm@gmail.com>
Subject: [PATCH 5/6] PCI: generic: Pass proper starting bus number to
 pci_scan_root_bus().
Date: Fri, 11 Sep 2015 16:21:58 -0700
Message-ID: <1442013719-5001-6-git-send-email-ddaney.cavm@gmail.com>
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

If the bus is being configured with a bus-range that does not start at
zero, pass that starting bus number to pci_scan_root_bus().  Passing
the incorrect value of zero causes attempted config accesses outside
of the supported range, which cascades to an OOPs spew and eventual
kernel panic.

Signed-off-by: David Daney <david.daney@cavium.com>
---
 drivers/pci/host/pci-host-generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/host/pci-host-generic.c b/drivers/pci/host/pci-host-generic.c
index fce5bf7..8219c0b 100644
--- a/drivers/pci/host/pci-host-generic.c
+++ b/drivers/pci/host/pci-host-generic.c
@@ -265,7 +265,7 @@ static int gen_pci_probe(struct platform_device *pdev)
 	if (!pci_has_flag(PCI_PROBE_ONLY))
 		pci_add_flags(PCI_REASSIGN_ALL_RSRC | PCI_REASSIGN_ALL_BUS);
 
-	bus = pci_scan_root_bus(dev, 0,
+	bus = pci_scan_root_bus(dev, pci->cfg.bus_range->start,
 				&pci->cfg.ops.ops, pci, &pci->resources);
 	if (!bus) {
 		dev_err(dev, "Scanning rootbus failed");
-- 
1.7.11.7
