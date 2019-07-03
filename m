Return-Path: <SRS0=cIVi=VA=bootlin.com=maxime.ripard@kernel.org>
From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH 6/7] dt-bindings: net: Use phy-mode instead of phy-connection-type
Date: Wed,  3 Jul 2019 11:55:12 +0200
Message-Id: <20190703095513.12340-6-maxime.ripard@bootlin.com>
In-Reply-To: <20190703095513.12340-1-maxime.ripard@bootlin.com>
References: <20190703095513.12340-1-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

When adding support for the DWMAC (and derivatives) bindings,
phy-connection-type was required, even though the previous binding required
the equivalent phy-mode.

Let's fix this by using phy-mode as we should have.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 .../devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml | 4 ++--
 .../bindings/net/allwinner,sun8i-a83t-emac.yaml           | 8 ++++----
 Documentation/devicetree/bindings/net/snps,dwmac.yaml     | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml
index 4b45798f0e68..06b1cc8bea14 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml
@@ -44,7 +44,7 @@ required:
   - interrupt-names
   - clocks
   - clock-names
-  - phy-connection-type
+  - phy-mode
 
 examples:
   - |
@@ -55,7 +55,7 @@ examples:
         interrupt-names = "macirq";
         clocks = <&ahb_gates 49>, <&gmac_tx>;
         clock-names = "stmmaceth", "allwinner_gmac_tx";
-        phy-connection-type = "mii";
+        phy-mode = "mii";
     };
 
 # FIXME: We should set it, but it would report all the generic
diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
index 6f68c7f5fc34..d4084c149768 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
@@ -52,8 +52,8 @@ required:
   - clock-names
   - resets
   - reset-names
-  - phy-connection-type
   - phy-handle
+  - phy-mode
   - syscon
 
 allOf:
@@ -198,7 +198,7 @@ examples:
         clock-names = "stmmaceth";
 
         phy-handle = <&int_mii_phy>;
-        phy-connection-type = "mii";
+        phy-mode = "mii";
         allwinner,leds-active-low;
 
         mdio1: mdio {
@@ -249,7 +249,7 @@ examples:
         clock-names = "stmmaceth";
 
         phy-handle = <&ext_rgmii_phy>;
-        phy-connection-type = "rgmii";
+        phy-mode = "rgmii";
         allwinner,leds-active-low;
 
         mdio2: mdio {
@@ -301,7 +301,7 @@ examples:
         clocks = <&ccu 27>;
         clock-names = "stmmaceth";
         phy-handle = <&ext_rgmii_phy1>;
-        phy-connection-type = "rgmii";
+        phy-mode = "rgmii";
 
         mdio {
             compatible = "snps,dwmac-mdio";
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 658726c620be..76fea2be66ac 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -261,7 +261,7 @@ required:
   - reg
   - interrupts
   - interrupt-names
-  - phy-connection-type
+  - phy-mode
 
 dependencies:
   snps,reset-active-low: ["snps,reset-gpio"]
@@ -384,7 +384,7 @@ examples:
         interrupt-names = "macirq", "eth_wake_irq", "eth_lpi";
         mac-address = [000000000000]; /* Filled in by U-Boot */
         max-frame-size = <3800>;
-        phy-connection-type = "gmii";
+        phy-mode = "gmii";
         snps,multicast-filter-bins = <256>;
         snps,perfect-filter-entries = <128>;
         rx-fifo-depth = <16384>;
-- 
2.21.0
