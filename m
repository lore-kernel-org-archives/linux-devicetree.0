From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: [PATCH v3 4/4] staging: mt7621-pci-phy: dt-bindings: add bindings for
 Mediatek MT7621 Pcie PHY
Date: Fri,  4 Jan 2019 08:08:24 +0100
Message-ID: <20190104070824.25210-5-sergio.paracuellos@gmail.com>
References: <20190104070824.25210-1-sergio.paracuellos@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20190104070824.25210-1-sergio.paracuellos@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: gregkh@linuxfoundation.org
Cc: neil@brown.name, Device Tree mailing list <devicetree@vger.kernel.org>, driverdev-devel@linuxdriverproject.org
List-Id: devicetree@vger.kernel.org

Add bindings documentation for PCie PHY of Mediatek MT7621.
This file will be moved into its appropiate documentation bindings'place
when this driver is mainlined.

CC: Device Tree mailing list <devicetree@vger.kernel.org>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../mediatek,mt7621-pci-phy.txt               | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 drivers/staging/mt7621-pci-phy/mediatek,mt7621-pci-phy.txt

diff --git a/drivers/staging/mt7621-pci-phy/mediatek,mt7621-pci-phy.txt b/drivers/staging/mt7621-pci-phy/mediatek,mt7621-pci-phy.txt
new file mode 100644
index 000000000000..33a8a698bdd0
--- /dev/null
+++ b/drivers/staging/mt7621-pci-phy/mediatek,mt7621-pci-phy.txt
@@ -0,0 +1,54 @@
+Mediatek Mt7621 PCIe PHY
+
+Required properties:
+- compatible: must be "mediatek,mt7621-pci-phy"
+- reg: base address and length of the PCIe PHY block
+- #address-cells: must be 1
+- #size-cells: must be 0
+
+Each PCIe PHY should be represented by a child node
+
+Required properties For the child node:
+- reg: the PHY ID
+0 - PCIe RC 0
+1 - PCIe RC 1
+- #phy-cells: must be 0
+
+Example:
+	pcie0_phy: pcie-phy@1a149000 {
+		compatible = "mediatek,mt7621-pci-phy";
+		reg = <0x1a149000 0x0700>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pcie0_port: pcie-phy@0 {
+			reg = <0>;
+			#phy-cells = <0>;
+		};
+
+		pcie1_port: pcie-phy@1 {
+			reg = <1>;
+			#phy-cells = <0>;
+		};
+	};
+
+	pcie1_phy: pcie-phy@1a14a000 {
+		compatible = "mediatek,mt7621-pci-phy";
+		reg = <0x1a14a000 0x0700>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pcie2_port: pcie-phy@0 {
+			reg = <0>;
+			#phy-cells = <0>;
+		};
+	};
+
+	/* users of the PCIe phy */
+
+	pcie: pcie@1e140000 {
+		...
+		...
+		phys = <&pcie0_port>, <&pcie1_port>, <&pcie2_port>;
+		phy-names = "pcie-phy0", "pcie-phy1", "pcie-phy2";
+	};
\ No newline at end of file
-- 
2.19.1
