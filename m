From: Harvey Hunt <harvey.hunt@imgtec.com>
Subject: [V7] dt-bindings: phy: Add bindings for ralink-usb PHY
Date: Thu, 17 Aug 2017 11:33:23 +0100
Message-ID: <1502966003-3776-2-git-send-email-harvey.hunt@imgtec.com>
References: <1502966003-3776-1-git-send-email-harvey.hunt@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502966003-3776-1-git-send-email-harvey.hunt@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, matthias.bgg@gmail.com, kishon@ti.com
Cc: james.hogan@imgtec.com, John Crispin <john@phrozen.org>, Harvey Hunt <harvey.hunt@imgtec.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: John Crispin <john@phrozen.org>

Add a binding for the USB phy on Mediatek/Ralink SoCs.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Harvey Hunt <harvey.hunt@imgtec.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
---
Changes in V7:
* Add required ralink,sysctl property

Changes in V6:
* Add MT7628 binding
* Add optional reg property

Changes in V5:
* None

Changes in V4:
* None

Changes in V3:
* Split out from first patch

 .../devicetree/bindings/phy/ralink-usb-phy.txt     | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/ralink-usb-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/ralink-usb-phy.txt b/Documentation/devicetree/bindings/phy/ralink-usb-phy.txt
new file mode 100644
index 0000000..9d2868a
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/ralink-usb-phy.txt
@@ -0,0 +1,23 @@
+Mediatek/Ralink USB PHY
+
+Required properties:
+ - compatible: "ralink,rt3352-usbphy"
+	       "mediatek,mt7620-usbphy"
+	       "mediatek,mt7628-usbphy"
+ - reg: required for "mediatek,mt7628-usbphy", unused otherwise
+ - #phy-cells: should be 0
+ - ralink,sysctl: a phandle to a ralink syscon register region
+ - resets: the two reset controllers for host and device
+ - reset-names: the names of the 2 reset controllers
+
+Example:
+
+usbphy: phy {
+	compatible = "mediatek,mt7628-usbphy";
+	reg = <0x10120000 0x1000>;
+	#phy-cells = <0>;
+
+	ralink,sysctl = <&sysc>;
+	resets = <&rstctrl 22 &rstctrl 25>;
+	reset-names = "host", "device";
+};
-- 
2.7.4
