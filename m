From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Subject: [PATCH 0/2] PCI: Describe external-facing ports in device tree
Date: Mon, 18 Mar 2019 18:21:22 +0000
Message-ID: <20190318182124.53859-1-jean-philippe.brucker@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
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

Add an "external-facing" property to PCI ports in device-tree, to help
identify untrusted devices. The notion of untrusted PCI devices was
added to the v5.0 kernel to describe devices that should have strict
IOMMU protection [1], for example devices that are plugged in a
thunderbolt port. ACPI systems use the ExternalFacingPort property [2].
Add an equivalent mechanism to device tree.

[1] https://lkml.org/lkml/2018/11/26/631
[2] https://docs.microsoft.com/en-us/windows-hardware/drivers/pci/dsd-for-pcie-root-ports#identifying-externally-exposed-pcie-root-ports

Jean-Philippe Brucker (2):
  dt-bindings: Add external-facing PCIe port property
  PCI: OF: Support external-facing property

 Documentation/devicetree/bindings/pci/pci.txt | 47 +++++++++++++++++++
 drivers/pci/of.c                              |  3 ++
 2 files changed, 50 insertions(+)

-- 
2.21.0
