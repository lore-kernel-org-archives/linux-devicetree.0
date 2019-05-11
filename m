From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] arm64: dts: amlogic: remove ethernet-phy-idAAAA.BBBB
 compatible strings
Date: Sat, 11 May 2019 19:45:34 +0200
Message-ID: <20190511174534.2403-1-martin.blumenstingl@googlemail.com>
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
To: khilman@baylibre.com, linux-amlogic@lists.infradead.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
List-Id: devicetree@vger.kernel.org

The Ethernet PHY documentation
(Documentation/devicetree/bindings/net/phy.txt) states that:
  If the PHY reports an incorrect ID (or none at all) then the
  "compatible" list may contain an entry with the correct PHY ID in the
  form: "ethernet-phy-idAAAA.BBBB"

An older version of the documentation suggested that the compatible
string can be used when the PHY ID is known.

Remove the ethernet-phy-id compatible string and add a comment with the
PHY ID instead.
This is a no-op on boards which are shipped with the PHY that was
listed (= all known cases). However, if a board manufacturer decides to
ship a different PHY we will now load and use the correct driver because
we ask the PHY to identify itself.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts  | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts       | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
index 0c8e8305b1f3..767b1763a612 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
@@ -81,7 +81,7 @@
 
 &external_mdio {
 	external_phy: ethernet-phy@0 {
-		compatible = "ethernet-phy-id001c.c916", "ethernet-phy-ieee802.3-c22";
+		/* Realtek RTL8211F (0x001cc916) */
 		reg = <0>;
 		max-speed = <1000>;
 		interrupt-parent = <&gpio_intc>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
index 8acfd40090d2..a99c1ba3131c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
@@ -111,7 +111,7 @@
 
 &external_mdio {
 	external_phy: ethernet-phy@0 {
-		compatible = "ethernet-phy-id001c.c916", "ethernet-phy-ieee802.3-c22";
+		/* Realtek RTL8211F (0x001cc916) */
 		reg = <0>;
 		max-speed = <1000>;
 	};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts
index 73d656e4aade..8939c0fc5b62 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts
@@ -63,7 +63,7 @@
 
 &external_mdio {
 	external_phy: ethernet-phy@0 {
-		compatible = "ethernet-phy-id001c.c916", "ethernet-phy-ieee802.3-c22";
+		/* Realtek RTL8211F (0x001cc916) */
 		reg = <0>;
 		max-speed = <1000>;
 		interrupt-parent = <&gpio_intc>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
index 7fa20a8ede17..acb4aaf9b956 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
@@ -113,7 +113,7 @@
 
 &external_mdio {
 	external_phy: ethernet-phy@0 {
-		compatible = "ethernet-phy-id001c.c916", "ethernet-phy-ieee802.3-c22";
+		/* Realtek RTL8211F (0x001cc916) */
 		reg = <0>;
 		max-speed = <1000>;
 	};
-- 
2.21.0
