From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 3/6] dt-bindings: arm: amlogic: add bindings for the Amlogic G12B based A311D SoC
Date: Wed, 31 Jul 2019 14:39:57 +0200
Message-ID: <20190731124000.22072-4-narmstrong@baylibre.com>
References: <20190731124000.22072-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190731124000.22072-1-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: khilman@baylibre.com, devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, christianshewitt@gmail.com
List-Id: devicetree@vger.kernel.org

Add a specific compatible for the Amlogic G12B bases A311D SoC used
in the Khadas VIM3.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 3c3bc806cd23..efa032d12402 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -135,6 +135,11 @@ properties:
               - amlogic,u200
           - const: amlogic,g12a
 
+      - description: Boards with the Amlogic Meson G12B A311D SoC
+        items:
+          - const: amlogic,a311d
+          - const: amlogic,g12b
+
       - description: Boards with the Amlogic Meson G12B S922X SoC
         items:
           - enum:
-- 
2.22.0
