From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 1/2] dt-bindings: net: snps,dwmac: update reg minItems maxItems
Date: Tue,  6 Aug 2019 14:50:40 +0200
Message-ID: <20190806125041.16105-2-narmstrong@baylibre.com>
References: <20190806125041.16105-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190806125041.16105-1-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The Amlogic Meson DWMAC glue bindings needs a second reg cells for the
glue registers, thus update the reg minItems/maxItems to allow more
than a single reg cell.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 76fea2be66ac..4377f511a51d 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -61,7 +61,8 @@ properties:
         - snps,dwxgmac-2.10
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   interrupts:
     minItems: 1
-- 
2.22.0
