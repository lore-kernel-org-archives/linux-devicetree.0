From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/2] dt-bindings: arm: amlogic: Add Tronsmart Vega S96 binding
Date: Tue, 19 Sep 2017 14:05:48 +0200
Message-ID: <1505822748-23431-3-git-send-email-narmstrong@baylibre.com>
References: <1505822748-23431-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1505822748-23431-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: khilman@baylibre.com, carlo@caione.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, balbes-150@yandex.ru, support@tronsmart.com
List-Id: devicetree@vger.kernel.org

Cc: support@tronsmart.com
Signed-off-by: Oleg <balbes-150@yandex.ru>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/arm/amlogic.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
index 4e4bc0b..d6163ac 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.txt
+++ b/Documentation/devicetree/bindings/arm/amlogic.txt
@@ -73,6 +73,7 @@ Board compatible values (alphabetically, grouped by SoC):
   - "amlogic,q201" (Meson gxm s912)
   - "kingnovel,r-box-pro" (Meson gxm S912)
   - "nexbox,a1" (Meson gxm s912)
+  - "tronsmart,vega-s96" (Meson gxm s912)
 
 Amlogic Meson Firmware registers Interface
 ------------------------------------------
-- 
1.9.1
