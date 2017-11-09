From: David Daney <david.daney@cavium.com>
Subject: [PATCH v2 1/8] dt-bindings: Add Cavium Octeon Common Ethernet Interface.
Date: Wed,  8 Nov 2017 16:51:19 -0800
Message-ID: <20171109005126.21341-2-david.daney@cavium.com>
References: <20171109005126.21341-1-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171109005126.21341-1-david.daney@cavium.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org, ralf@linux-mips.org, James Hogan <james.hogan@mips.com>, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, "Steven J. Hill" <steven.hill@cavium.com>, devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Carlos Munoz <cmunoz@cavium.com>, "Steven J . Hill" <Steven.Hill@cavium.com>, David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

From: Carlos Munoz <cmunoz@cavium.com>

Add bindings for Common Ethernet Interface (BGX) block.

Signed-off-by: Carlos Munoz <cmunoz@cavium.com>
Signed-off-by: Steven J. Hill <Steven.Hill@cavium.com>
Signed-off-by: David Daney <david.daney@cavium.com>
---
 .../devicetree/bindings/net/cavium-bgx.txt         | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/cavium-bgx.txt

diff --git a/Documentation/devicetree/bindings/net/cavium-bgx.txt b/Documentation/devicetree/bindings/net/cavium-bgx.txt
new file mode 100644
index 000000000000..6b1f8b994c20
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/cavium-bgx.txt
@@ -0,0 +1,61 @@
+* Common Ethernet Interface (BGX) block
+
+Properties:
+
+- compatible: "cavium,octeon-7890-bgx": Compatibility with all cn7xxx SOCs.
+
+- reg: The base address of the BGX block.
+
+- #address-cells: Must be <1>.
+
+- #size-cells: Must be <0>.  BGX addresses have no size component.
+
+A BGX block has several children, each representing an Ethernet
+interface.
+
+
+* Ethernet Interface (BGX port) connects to PKI/PKO
+
+Properties:
+
+- compatible: "cavium,octeon-7890-bgx-port": Compatibility with all
+	      cn7xxx SOCs.
+
+	      "cavium,octeon-7360-xcv": Compatibility with cn73xx SOCs
+	      for RGMII.
+
+- reg: The index of the interface within the BGX block.
+
+Optional properties:
+
+- local-mac-address: Mac address for the interface.
+
+- phy-handle: phandle to the phy node connected to the interface.
+
+- phy-mode: described in ethernet.txt.
+
+- fixed-link: described in fixed-link.txt.
+
+Example:
+
+	ethernet-mac-nexus@11800e0000000 {
+		compatible = "cavium,octeon-7890-bgx";
+		reg = <0x00011800 0xe0000000 0x00000000 0x01000000>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethernet-mac@0 {
+			compatible = "cavium,octeon-7360-xcv";
+			reg = <0>;
+			local-mac-address = [ 00 01 23 45 67 89 ];
+			phy-handle = <&phy3>;
+			phy-mode = "rgmii-rxid"
+		};
+		ethernet-mac@1 {
+			compatible = "cavium,octeon-7890-bgx-port";
+			reg = <1>;
+			local-mac-address = [ 00 01 23 45 67 8a ];
+			phy-handle = <&phy4>;
+			phy-mode = "sgmii"
+		};
+	};
-- 
2.13.6
