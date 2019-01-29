From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v5 2/6] dt-bindings: phy: mvebu-utmi: add UTMI PHY bindings
Date: Tue, 29 Jan 2019 10:36:31 +0100
Message-ID: <20190129093635.4321-3-miquel.raynal@bootlin.com>
References: <20190129093635.4321-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190129093635.4321-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add bindings for Marvell Armada 3700 USB2 UTMI+ PHY.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/phy/phy-mvebu-utmi.txt           | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-mvebu-utmi.txt

diff --git a/Documentation/devicetree/bindings/phy/phy-mvebu-utmi.txt b/Documentation/devicetree/bindings/phy/phy-mvebu-utmi.txt
new file mode 100644
index 000000000000..aa99ceec73b0
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-mvebu-utmi.txt
@@ -0,0 +1,38 @@
+MVEBU A3700 UTMI PHY
+--------------------
+
+USB2 UTMI+ PHY controllers can be found on the following Marvell MVEBU SoCs:
+* Armada 3700
+
+On Armada 3700, there are two USB controllers, one is compatible with the USB2
+and USB3 specifications and supports OTG. The other one is USB2 compliant and
+only supports host mode. Both of these controllers come with a slightly
+different UTMI PHY.
+
+Required Properties:
+
+- compatible: Should be one of:
+	      * "marvell,a3700-utmi-host-phy" for the PHY connected to
+	        the USB2 host-only controller.
+	      * "marvell,a3700-utmi-otg-phy" for the PHY connected to
+	        the USB3 and USB2 OTG capable controller.
+- reg: PHY IP register range.
+- marvell,usb-misc-reg: handle on the "USB miscellaneous registers" shared
+			region covering registers related to both the host
+			controller and the PHY.
+- #phy-cells: Standard property (Documentation: phy-bindings.txt) Should be 0.
+
+
+Example:
+
+	usb2_utmi_host_phy: phy@5f000 {
+		compatible = "marvell,armada-3700-utmi-host-phy";
+		reg = <0x5f000 0x800>;
+		marvell,usb-misc-reg = <&usb2_syscon>;
+		#phy-cells = <0>;
+	};
+
+	usb2_syscon: system-controller@5f800 {
+		compatible = "marvell,armada-3700-usb2-host-misc", "syscon";
+		reg = <0x5f800 0x800>;
+	};
-- 
2.19.1
