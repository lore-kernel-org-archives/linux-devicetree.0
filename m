From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: [PATCH 1/2] dt: bindings: add allwinner,
 otg-routed property for phy-sun4i-usb
Date: Wed, 21 Sep 2016 15:04:05 +0800
Message-ID: <20160921070406.27445-1-icenowy@aosc.xyz>
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
To: Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Andre Przywara <andre.przywara@arm.com>, Hans de Goede <hdegoede@redhat.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Reinder de Haan <patchesrdh@mveas.com>, linux-kernel@vger.kernel.org, Icenowy Zheng <icenowy@aosc.xyz>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On some newer Allwinner SoCs (H3 or A64), the PHY0 can be either routed to
the MUSB controller (which is an OTG controller) or the OHCI/EHCI pair
(which is a Host-only controller, but more stable and easy to implement).

This property marks whether on a certain board which controller should be
attached to the PHY.

Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
---
 Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt b/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
index 287150d..5c11d57 100644
--- a/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
+++ b/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
@@ -36,6 +36,13 @@ Optional properties:
 - usb1_vbus-supply : regulator phandle for controller usb1 vbus
 - usb2_vbus-supply : regulator phandle for controller usb2 vbus
 
+Optional properties for H3 or A64 SoCs:
+- allwinner,otg-routed : USB0 (OTG) PHY is routed to OHCI/EHCI pair rather than
+			 MUSB. (boolean, if this property is set, the OHCI/EHCI
+			 controllers at PHY0 should be enabled and the MUSB
+			 controller must *NOT* be enabled, and thus the PHY can
+			 only work in host mode)
+
 Example:
 	usbphy: phy@0x01c13400 {
 		#phy-cells = <1>;
-- 
2.10.0
