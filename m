From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 1/4] dt-bindings: media: meson-ir: Add Meson8b and GXBB compatible strings
Date: Tue, 28 Jun 2016 21:17:59 +0200
Message-ID: <20160628191802.21227-2-martin.blumenstingl@googlemail.com>
References: <20160626210622.5257-1-martin.blumenstingl@googlemail.com>
 <20160628191802.21227-1-martin.blumenstingl@googlemail.com>
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20160628191802.21227-1-martin.blumenstingl@googlemail.com>
Sender: linux-media-owner@vger.kernel.org
To: linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, carlo@caione.org, khilman@baylibre.com, mchehab@kernel.org, devicetree@vger.kernel.org, narmstrong@baylibre.com, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

From: Neil Armstrong <narmstrong@baylibre.com>

New bindings are needed as the register layout on the newer platforms
is slightly different compared to Meson6b.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 Documentation/devicetree/bindings/media/meson-ir.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/meson-ir.txt b/Documentation/devicetree/bindings/media/meson-ir.txt
index 407848e..e7e3f3c 100644
--- a/Documentation/devicetree/bindings/media/meson-ir.txt
+++ b/Documentation/devicetree/bindings/media/meson-ir.txt
@@ -1,7 +1,10 @@
 * Amlogic Meson IR remote control receiver
 
 Required properties:
- - compatible	: should be "amlogic,meson6-ir"
+ - compatible	: depending on the platform this should be one of:
+		  - "amlogic,meson6-ir"
+		  - "amlogic,meson8b-ir"
+		  - "amlogic,meson-gxbb-ir"
  - reg		: physical base address and length of the device registers
  - interrupts	: a single specifier for the interrupt from the device
 
-- 
2.9.0
