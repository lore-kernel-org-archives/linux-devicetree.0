From: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH] dt-bindings: net: dwmac: fix 'mac-mode' type
Date: Tue, 17 Sep 2019 13:30:52 +0300
Message-ID: <20190917103052.13456-1-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: davem@davemloft.net, robh+dt@kernel.org, peppe.cavallaro@st.com, alexandre.torgue@st.com, andrew@lunn.ch, f.fainelli@gmail.com, Alexandru Ardelean <alexandru.ardelean@analog.com>
List-Id: devicetree@vger.kernel.org

The 'mac-mode' property is similar to 'phy-mode' and 'phy-connection-type',
which are enums of mode strings.

The 'dwmac' driver supports almost all modes declared in the 'phy-mode'
enum (except for 1 or 2). But in general, there may be a case where
'mac-mode' becomes more generic and is moved as part of phylib or netdev.

In any case, the 'mac-mode' field should be made an enum, and it also makes
sense to just reference the 'phy-connection-type' from
'ethernet-controller.yaml'. That will also make it more future-proof for new
modes.

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index ebe4537a7cce..4845e29411e4 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -113,7 +113,7 @@ properties:
     const: stmmaceth
 
   mac-mode:
-    maxItems: 1
+    $ref: ethernet-controller.yaml#/properties/phy-connection-type
     description:
       The property is identical to 'phy-mode', and assumes that there is mode
       converter in-between the MAC & PHY (e.g. GMII-to-RGMII). This converter
-- 
2.20.1
