From: Kever Yang <kever.yang@rock-chips.com>
Subject: [PATCH v2 2/2] dt-bindings: arm: rockchip: remove reference to fennec board
Date: Wed, 21 Aug 2019 11:11:24 +0800
Message-ID: <20190821031124.17806-2-kever.yang@rock-chips.com>
References: <20190821031124.17806-1-kever.yang@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190821031124.17806-1-kever.yang@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org, Kever Yang <kever.yang@rock-chips.com>, Akash Gajjar <Akash_Gajjar@mentor.com>, Douglas Anderson <dianders@chromium.org>, Jagan Teki <jagan@amarulasolutions.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The rk3288 fennec board has been removed, remove the binding document at
the same time.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

Changes in v2: None

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 34865042f4e4..cc2f1c2d0cd0 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -424,11 +424,6 @@ properties:
               - rockchip,rk3288-evb-rk808
           - const: rockchip,rk3288
 
-      - description: Rockchip RK3288 Fennec
-        items:
-          - const: rockchip,rk3288-fennec
-          - const: rockchip,rk3288
-
       - description: Rockchip RK3328 Evaluation board
         items:
           - const: rockchip,rk3328-evb
-- 
2.17.1
