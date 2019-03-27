From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH RFC 5/6] dt-bindings: arm: amlogic: add Odroid-N2 binding
Date: Wed, 27 Mar 2019 11:33:07 +0100
Message-ID: <20190327103308.25058-6-narmstrong@baylibre.com>
References: <20190327103308.25058-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190327103308.25058-1-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: khilman@baylibre.com, devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add compatible for the Amlogic G12B (S922X) SoC based Odroid-N2 SBC
from HardKernel.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/arm/amlogic.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
index 94bbcc646e10..eff41128268e 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.txt
+++ b/Documentation/devicetree/bindings/arm/amlogic.txt
@@ -116,6 +116,8 @@ Board compatible values (alphabetically, grouped by SoC):
   - "amediatech,x96-max" (Meson g12a s905x2)
   - "seirobotics,sei510" (Meson g12a s905x2)
 
+  - "hardkernel,odroid-n2" (Meson g12b s922x)
+
 Amlogic Meson Firmware registers Interface
 ------------------------------------------
 
-- 
2.21.0
