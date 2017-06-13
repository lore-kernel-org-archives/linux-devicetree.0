From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Subject: [PATCH v6 1/3] PCI: Add DT binding for tango PCIe controller
Date: Tue, 13 Jun 2017 15:51:32 +0200
Message-ID: <3790db8d-6a4c-5c74-9ca2-431715a712a7@sigmadesigns.com>
References: <741766e5-cff2-db5f-d40b-6866e08fd966@sigmadesigns.com>
 <69f3ffe7-3c39-fa94-71f8-91744a869cc9@sigmadesigns.com>
 <20170607212907.2wr3hqbokjb74kj3@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170607212907.2wr3hqbokjb74kj3@rob-hp-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: DT <devicetree@vger.kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Mason <slash.tmp@free.fr>, Marc Zyngier <marc.zyngier@arm.com>, linux-pci <linux-pci@vger.kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, LKML <linux-kernel@vger.kernel.org>, David Laight <david.laight@aculab.com>, Bjorn Helgaas <helgaas@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Robin Murphy <robin.murphy@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Binding for the Sigma Designs SMP8759 SoC.

Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
---
Changes from v5 to v6
o Delete links to elinux.org
o Use explicit hex numbers instead of symbolic constants for sizes (in the example)
o Add bus-range to "Required properties"
---
 .../devicetree/bindings/pci/tango-pcie.txt         | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/tango-pcie.txt

diff --git a/Documentation/devicetree/bindings/pci/tango-pcie.txt b/Documentation/devicetree/bindings/pci/tango-pcie.txt
new file mode 100644
index 000000000000..244683836a79
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/tango-pcie.txt
@@ -0,0 +1,29 @@
+Sigma Designs Tango PCIe controller
+
+Required properties:
+
+- compatible: "sigma,smp8759-pcie"
+- reg: address/size of PCI configuration space, address/size of register area
+- bus-range: defined by size of PCI configuration space
+- device_type: "pci"
+- #size-cells: <2>
+- #address-cells: <3>
+- msi-controller
+- ranges: translation from system to bus addresses
+- interrupts: spec for misc interrupts, spec for MSI
+
+Example:
+
+	pcie@2e000 {
+		compatible = "sigma,smp8759-pcie";
+		reg = <0x50000000 0x400000>, <0x2e000 0x100>;
+		bus-range = <0 3>;
+		device_type = "pci";
+		#size-cells = <2>;
+		#address-cells = <3>;
+		msi-controller;
+		ranges = <0x02000000 0x0 0x00400000  0x50400000  0x0 0x3c00000>;
+		interrupts =
+			<54 IRQ_TYPE_LEVEL_HIGH>, /* misc interrupts */
+			<55 IRQ_TYPE_LEVEL_HIGH>; /* MSI */
+	};
-- 
2.11.0
