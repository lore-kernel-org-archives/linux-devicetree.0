From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 1/2] dt-bindings: ARM: dts: rockchip: Add bindings for rk3288-veyron-mighty
Date: Fri, 22 Mar 2019 12:43:09 -0700
Message-ID: <20190322194310.61365-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: mka@chromium.org, ryandcase@chromium.org, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Alexis Ballier <aballier@gentoo.org>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>, Jagan Teki <jagan@amarulasolutions.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Akash Gajjar <Akash_Gajjar@mentor.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Mighty is basically the same Chromebook as Jaq but it has a full-sized
SD slot and some different (slightly more rugged) plastics around it.
Like Jaq, Mighty may show up with various different brandings but all
of them have the same board inside.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 Documentation/devicetree/bindings/arm/rockchip.yaml | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 0161b4a66586..89f386852bc8 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -147,7 +147,7 @@ properties:
           - const: google,gru
           - const: rockchip,rk3399
 
-      - description: Google Jaq (Haier Chromebook 11 and more)
+      - description: Google Jaq (Haier Chromebook 11 and more w/ uSD)
         items:
           - const: google,veyron-jaq-rev5
           - const: google,veyron-jaq-rev4
@@ -200,6 +200,17 @@ properties:
           - const: google,veyron
           - const: rockchip,rk3288
 
+      - description: Google Mighty (Haier Chromebook 11 and more w/ SD)
+        items:
+          - const: google,veyron-mighty-rev5
+          - const: google,veyron-mighty-rev4
+          - const: google,veyron-mighty-rev3
+          - const: google,veyron-mighty-rev2
+          - const: google,veyron-mighty-rev1
+          - const: google,veyron-mighty
+          - const: google,veyron
+          - const: rockchip,rk3288
+
       - description: Google Minnie (Asus Chromebook Flip C100P)
         items:
           - const: google,veyron-minnie-rev4
-- 
2.21.0.392.gf8f6787159e-goog
