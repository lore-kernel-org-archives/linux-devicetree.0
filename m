From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v2 1/2] dt-bindings: arm: amlogic: Add NanoPi K2
Date: Sun, 21 May 2017 20:51:04 +0200
Message-ID: <20170521185105.23448-2-afaerber@suse.de>
References: <20170521185105.23448-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170521185105.23448-1-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-amlogic@lists.infradead.org
Cc: Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, techsupport@friendlyarm.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The FriendlyARM NanoPi K2 is a single-board computer.

Cc: techsupport@friendlyarm.com
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 v1 -> v2: Unchanged
 * Added Acked-by
 
 Documentation/devicetree/bindings/arm/amlogic.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
index cad5b5a48d92..d517c8b41758 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.txt
+++ b/Documentation/devicetree/bindings/arm/amlogic.txt
@@ -40,6 +40,7 @@ Board compatible values (alphabetically, grouped by SoC):
 
   - "amlogic,p200" (Meson gxbb)
   - "amlogic,p201" (Meson gxbb)
+  - "friendlyarm,nanopi-k2" (Meson gxbb)
   - "hardkernel,odroid-c2" (Meson gxbb)
   - "nexbox,a95x" (Meson gxbb or Meson gxl s905x)
   - "tronsmart,vega-s95-pro", "tronsmart,vega-s95" (Meson gxbb)
-- 
2.12.0
