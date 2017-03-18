From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 1/2] Documentation: dt-bindings: Add documentation for the
 Meson GXL USB2 PHY
Date: Sat, 18 Mar 2017 14:00:12 +0100
Message-ID: <20170318130013.20771-2-martin.blumenstingl@googlemail.com>
References: <20170304222231.14496-1-martin.blumenstingl@googlemail.com>
 <20170318130013.20771-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170318130013.20771-1-martin.blumenstingl@googlemail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, kishon@ti.com, linux-amlogic@lists.infradead.org, carlo@caione.org, khilman@baylibre.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-kernel@lists.infradead.org, hendrik@consetetur.de
List-Id: devicetree@vger.kernel.org

This adds the DT binding documentation for the USB2 PHY(s) found in the
Meson GXL and GXM SoCs.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/phy/meson-gxl-usb2-phy.txt      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/meson-gxl-usb2-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/meson-gxl-usb2-phy.txt b/Documentation/devicetree/bindings/phy/meson-gxl-usb2-phy.txt
new file mode 100644
index 000000000000..a105494a0fc9
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/meson-gxl-usb2-phy.txt
@@ -0,0 +1,17 @@
+* Amlogic Meson GXL and GXM USB2 PHY binding
+
+Required properties:
+- compatible:	Should be "amlogic,meson-gxl-usb2-phy"
+- reg:		The base address and length of the registers
+- #phys-cells:	must be 0 (see phy-bindings.txt in this directory)
+
+Optional properties:
+- phy-supply:	see phy-bindings.txt in this directory
+
+
+Example:
+	usb2_phy0: phy@78000 {
+		compatible = "amlogic,meson-gxl-usb2-phy";
+		#phy-cells = <0>;
+		reg = <0x0 0x78000 0x0 0x20>;
+	};
-- 
2.12.0
