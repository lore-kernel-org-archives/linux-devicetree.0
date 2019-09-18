From: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH] dt-bindings: net: remove un-implemented property
Date: Wed, 18 Sep 2019 14:14:47 +0300
Message-ID: <20190918111447.3084-1-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: davem@davemloft.net, robh+dt@kernel.org, Alexandru Ardelean <alexandru.ardelean@analog.com>
List-Id: devicetree@vger.kernel.org

The `adi,disable-energy-detect` property was implemented in an initial
version of the `adin` driver series, but after a review it was discarded in
favor of implementing the ETHTOOL_PHY_EDPD phy-tunable option.

With the ETHTOOL_PHY_EDPD control, it's possible to disable/enable
Energy-Detect-Power-Down for the `adin` PHY, so this device-tree is not
needed.

Fixes: 767078132ff9 ("dt-bindings: net: add bindings for ADIN PHY driver")
Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 Documentation/devicetree/bindings/net/adi,adin.yaml | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/adi,adin.yaml b/Documentation/devicetree/bindings/net/adi,adin.yaml
index 69375cb28e92..d95cc691a65f 100644
--- a/Documentation/devicetree/bindings/net/adi,adin.yaml
+++ b/Documentation/devicetree/bindings/net/adi,adin.yaml
@@ -36,12 +36,6 @@ properties:
     enum: [ 4, 8, 12, 16, 20, 24 ]
     default: 8
 
-  adi,disable-energy-detect:
-    description: |
-      Disables Energy Detect Powerdown Mode (default disabled, i.e energy detect
-      is enabled if this property is unspecified)
-    type: boolean
-
 examples:
   - |
     ethernet {
@@ -68,6 +62,5 @@ examples:
             reg = <1>;
 
             adi,fifo-depth-bits = <16>;
-            adi,disable-energy-detect;
         };
     };
-- 
2.20.1
