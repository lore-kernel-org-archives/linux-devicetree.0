From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v3 3/5] dt-bindings: ARM: dts: rockchip: Add bindings for rk3288-veyron-{fievel,tiger}
Date: Thu, 25 Jul 2019 09:26:40 -0700
Message-ID: <20190725162642.250709-4-mka@chromium.org>
References: <20190725162642.250709-1-mka@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190725162642.250709-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

Fievel is a Chromebox and Tiger a Chromebase with a 10" display and
touchscreen. Tiger and Fievel are based on the same board.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes in v3:
- patch added to the series
---
 .../devicetree/bindings/arm/rockchip.yaml     | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 34865042f4e4..01eb1e107ea6 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -128,6 +128,21 @@ properties:
           - const: google,veyron
           - const: rockchip,rk3288
 
+      - description: Google Fievel (AOPEN Chromebox Mini)
+        items:
+          - const: google,veyron-fievel-rev8
+          - const: google,veyron-fievel-rev7
+          - const: google,veyron-fievel-rev6
+          - const: google,veyron-fievel-rev5
+          - const: google,veyron-fievel-rev4
+          - const: google,veyron-fievel-rev3
+          - const: google,veyron-fievel-rev2
+          - const: google,veyron-fievel-rev1
+          - const: google,veyron-fievel-rev0
+          - const: google,veyron-fievel
+          - const: google,veyron
+          - const: rockchip,rk3288
+
       - description: Google Gru (dev-board)
         items:
           - const: google,gru-rev15
@@ -311,6 +326,21 @@ properties:
           - const: google,veyron
           - const: rockchip,rk3288
 
+      - description: Google Tiger (AOpen Chromebase Mini)
+        items:
+          - const: google,veyron-tiger-rev8
+          - const: google,veyron-tiger-rev7
+          - const: google,veyron-tiger-rev6
+          - const: google,veyron-tiger-rev5
+          - const: google,veyron-tiger-rev4
+          - const: google,veyron-tiger-rev3
+          - const: google,veyron-tiger-rev2
+          - const: google,veyron-tiger-rev1
+          - const: google,veyron-tiger-rev0
+          - const: google,veyron-tiger
+          - const: google,veyron
+          - const: rockchip,rk3288
+
       - description: Haoyu MarsBoard RK3066
         items:
           - const: haoyu,marsboard-rk3066
-- 
2.22.0.709.g102302147b-goog
