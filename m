From: He Yangxuan <yangxuan8282@gmail.com>
Subject: [PATCH v5 3/3] dt-bindings: arm: amlogic: Add Phicomm N1
Date: Sat, 10 Nov 2018 11:39:04 +0800
Message-ID: <20181110033904.4207-4-yangxuan8282@gmail.com>
References: <20181110033904.4207-1-yangxuan8282@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181110033904.4207-1-yangxuan8282@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, carlo@caione.org, khilman@baylibre.com, narmstrong@baylibre.com, He Yangxuan <yangxuan8282@gmail.com>
List-Id: devicetree@vger.kernel.org

Add bindings documentation for the Phicomm N1.

Signed-off-by: He Yangxuan <yangxuan8282@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
index 4498292b8..93177f38e 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.txt
+++ b/Documentation/devicetree/bindings/arm/amlogic.txt
@@ -91,6 +91,7 @@ Board compatible values (alphabetically, grouped by SoC):
 
   - "amlogic,p230" (Meson gxl s905d)
   - "amlogic,p231" (Meson gxl s905d)
+  - "phicomm,n1" (Meson gxl s905d)
 
   - "amlogic,p241" (Meson gxl s805x)
 
-- 
2.11.0
