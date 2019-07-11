From: Jonathan Chocron <jonnyc@amazon.com>
Subject: [PATCH 5/8] dt-bindings: PCI: Add Amazon's Annapurna Labs PCIe host
 bridge binding
Date: Thu, 11 Jul 2019 17:45:41 +0300
Message-ID: <20190710164519.17883-6-jonnyc@amazon.com>
References: <20190710164519.17883-1-jonnyc@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190710164519.17883-1-jonnyc@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lorenzo.pieralisi@arm.com, bhelgaas@google.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: dwmw@amazon.co.uk, benh@kernel.crashing.org, alisaidi@amazon.com, ronenk@amazon.com, barakw@amazon.com, talel@amazon.com, hanochu@amazon.com, hhhawa@amazon.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, jonnyc@amazon.com
List-Id: devicetree@vger.kernel.org

Document Amazon's Annapurna Labs PCIe host bridge.

Signed-off-by: Jonathan Chocron <jonnyc@amazon.com>
---
 .../devicetree/bindings/pci/pcie-al.txt       | 45 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/pcie-al.txt

diff --git a/Documentation/devicetree/bindings/pci/pcie-al.txt b/Documentat=
ion/devicetree/bindings/pci/pcie-al.txt
new file mode 100644
index 000000000000..d92cc529490e
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/pcie-al.txt
@@ -0,0 +1,45 @@
+* Amazon Annapurna Labs PCIe host bridge
+
+Annapurna Labs' PCIe Host Controller is based on the Synopsys DesignWare
+PCI core.
+It shares common functions with the PCIe DesignWare core driver and inheri=
ts
+common properties defined in Documentation/devicetree/bindings/pci/designw=
are-pcie.txt.
+Properties of the host controller node that differ from it are:
+
+- compatible:
+	Usage: required
+	Value type: <stringlist>
+	Definition: Value should contain
+			- "amazon,al-pcie"
+
+- reg:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: Register ranges as listed in the reg-names property
+
+- reg-names:
+	Usage: required
+	Value type: <stringlist>
+	Definition: Must include the following entries
+			- "config"	PCIe ECAM space
+			- "controller"	AL proprietary registers
+			- "dbi"		Designware PCIe registers
+
+Example:
+
+	pcie-external0 {
+		compatible =3D "amazon,al-pcie";
+		reg =3D <0x0 0xfb600000 0x0 0x00100000
+		       0x0 0xfd800000 0x0 0x00010000
+		       0x0 0xfd810000 0x0 0x00001000>;
+		reg-names =3D "config", "controller", "dbi";
+		bus-range =3D <0 255>;
+		device_type =3D "pci";
+		#address-cells =3D <3>;
+		#size-cells =3D <2>;
+		#interrupt-cells =3D <1>;
+		interrupts =3D <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-map-mask =3D <0x00 0 0 7>;
+		interrupt-map =3D <0x0000 0 0 1 &gic_main GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH=
>; /* INTa */
+		ranges =3D <0x02000000 0x0 0xc0010000 0x0 0xc0010000 0x0 0x07ff0000>;
+	};
diff --git a/MAINTAINERS b/MAINTAINERS
index 5a6137df3f0e..d555beb794bb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12205,6 +12205,7 @@ PCIE DRIVER FOR ANNAPURNA LABS
 M:	Jonathan Chocron <jonnyc@amazon.com>
 L:	linux-pci@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/pci/pcie-al.txt
 F:	drivers/pci/controller/dwc/pcie-al.c
=20
 PCIE DRIVER FOR AMLOGIC MESON
--=20
2.17.1
