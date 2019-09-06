From: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH 2/2] dt-bindings: net: dwmac: document 'mac-mode' property
Date: Fri, 6 Sep 2019 16:02:56 +0300
Message-ID: <20190906130256.10321-2-alexandru.ardelean@analog.com>
References: <20190906130256.10321-1-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190906130256.10321-1-alexandru.ardelean@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: davem@davemloft.net, robh+dt@kernel.org, peppe.cavallaro@st.com, alexandre.torgue@st.com, --cc=andrew@lunn.ch, Alexandru Ardelean <alexandru.ardelean@analog.com>
List-Id: devicetree@vger.kernel.org

This change documents the 'mac-mode' property that was introduced in the
'stmmac' driver to support passive mode converters that can sit in-between
the MAC & PHY.

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index c78be15704b9..ebe4537a7cce 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -112,6 +112,14 @@ properties:
   reset-names:
     const: stmmaceth
 
+  mac-mode:
+    maxItems: 1
+    description:
+      The property is identical to 'phy-mode', and assumes that there is mode
+      converter in-between the MAC & PHY (e.g. GMII-to-RGMII). This converter
+      can be passive (no SW requirement), and requires that the MAC operate
+      in a different mode than the PHY in order to function.
+
   snps,axi-config:
     $ref: /schemas/types.yaml#definitions/phandle
     description:
-- 
2.20.1
