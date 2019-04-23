From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 4/6] dt-bindings: arm: amlogic: add G12B bindings
Date: Tue, 23 Apr 2019 11:15:01 +0200
Message-ID: <20190423091503.10847-5-narmstrong@baylibre.com>
References: <20190423091503.10847-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190423091503.10847-1-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: khilman@baylibre.com, devicetree@vger.kernel.org, jbrunet@baylibre.com
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

Add compatible for the Amlogic G12B SoC, sharing most of the
features and architecture with the G12A SoC.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/amlogic.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
index 061f7b98a07f..94bbcc646e10 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.txt
+++ b/Documentation/devicetree/bindings/arm/amlogic.txt
@@ -61,6 +61,10 @@ Boards with the Amlogic Meson G12A S905D2 SoC shall have the following propertie
   Required root node property:
     compatible: "amlogic,g12a";
 
+Boards with the Amlogic Meson G12B S922X SoC shall have the following properties:
+  Required root node property:
+    compatible: "amlogic,g12b";
+
 Board compatible values (alphabetically, grouped by SoC):
 
   - "geniatech,atv1200" (Meson6)
-- 
2.21.0
