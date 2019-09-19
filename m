From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 2/6] dt-bindings: arm: rockchip: Use libretech for roc-pc binding
Date: Thu, 19 Sep 2019 10:58:18 +0530
Message-ID: <20190919052822.10403-3-jagan@amarulasolutions.com>
References: <20190919052822.10403-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190919052822.10403-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Levin Du <djw@t-chip.com.cn>, Akash Gajjar <akash@openedev.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Da Xue <da@lessconfused.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Though the ROC-PC is manufactured by firefly, it is co-designed
by libretch like other Libretech computer boards from allwinner,
amlogic does.

So, it is always meaningful to keep maintain those vendors who
are part of design participation so-that the linux mainline
code will expose outside world who are the makers of such
hardware prototypes.

So, update the dt-bindings of ROC-PC with libretch notation
like other libretech computer boards does.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 110fcca1a94e..bb65a10e85ce 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -87,11 +87,6 @@ properties:
           - const: firefly,roc-rk3328-cc
           - const: rockchip,rk3328
 
-      - description: Firefly ROC-RK3399-PC
-        items:
-          - const: firefly,roc-rk3399-pc
-          - const: rockchip,rk3399
-
       - description: FriendlyElec NanoPi4 series boards
         items:
           - enum:
@@ -364,6 +359,12 @@ properties:
           - const: leez,p710
           - const: rockchip,rk3399
 
+      - description: Libre Computer Board ROC-RK3399-PC
+        items:
+          - const: libretech,roc-rk3399-pc
+          - const: firefly,roc-rk3399-pc
+          - const: rockchip,rk3399
+
       - description: Mecer Xtreme Mini S6
         items:
           - const: mecer,xms6
-- 
2.18.0.321.gffc6fa0e3
