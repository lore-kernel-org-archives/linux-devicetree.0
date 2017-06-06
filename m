From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: amlogic: Add SoC information bindings
Date: Tue,  6 Jun 2017 11:45:38 +0200
Message-ID: <1496742340-10307-2-git-send-email-narmstrong@baylibre.com>
References: <1496742340-10307-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1496742340-10307-1-git-send-email-narmstrong@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: khilman@baylibre.com, carlo@caione.org
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

Add bindings for the SoC information register of the Amlogic SoCs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/arm/amlogic.txt | 32 +++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
index 5c01e65..ae3e8ed 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.txt
+++ b/Documentation/devicetree/bindings/arm/amlogic.txt
@@ -60,3 +60,35 @@ Board compatible values (alphabetically, grouped by SoC):
   - "amlogic,q201" (Meson gxm s912)
   - "kingnovel,r-box-pro" (Meson gxm S912)
   - "nexbox,a1" (Meson gxm s912)
+
+Amlogic Meson Firmware registers Interface
+------------------------------------------
+
+The Meson SoCs have a register bank with status and data shared with the
+secure firmware.
+
+Required properties:
+ - compatible: For Meson GX SoCs, must be "amlogic,meson-gx-ao-secure", "syscon", "simple-mfd"
+
+Sub-nodes should indentify components of this register interface :
+
+Meson GX SoC Information
+------------------------
+A firmware register encodes the SoC type, package and revision information on
+the Meson GX SoCs.
+If present, a device node for this register should be added.
+
+Required properties:
+  - compatible: For Meson GX SoCs, must be "amlogic,meson-gx-chipid".
+
+Example
+-------
+
+ao-secure@140 {
+	compatible = "amlogic,meson-gx-ao-secure", "syscon", "simple-mfd";
+	reg = <0x0 0x140 0x0 0x140>;
+
+	chipid {
+		compatible = "amlogic,meson-gx-chipid";
+	};
+};
-- 
1.9.1
