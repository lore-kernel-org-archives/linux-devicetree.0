From: Christoph Muellner <christoph.muellner@theobroma-systems.com>
Subject: [PATCH 2/2] dt-bindings: simple-panel: Set compatible string to "simple-panel".
Date: Wed, 10 Apr 2019 16:10:45 +0200
Message-ID: <20190410141045.58097-2-christoph.muellner@theobroma-systems.com>
References: <20190410141045.58097-1-christoph.muellner@theobroma-systems.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190410141045.58097-1-christoph.muellner@theobroma-systems.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: heiko@sntech.de, Christoph Muellner <christoph.muellner@theobroma-systems.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The documentation for simple-panel lists "cptt,claa101wb01" as
compatible string. However, the kernel contains no driver, which
recognizes this string. Therefore this patch replaces the compatible
string with "simple-panel".

Signed-off-by: Christoph Muellner <christoph.muellner@theobroma-systems.com>
---
 Documentation/devicetree/bindings/display/panel/simple-panel.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/simple-panel.txt b/Documentation/devicetree/bindings/display/panel/simple-panel.txt
index b2b872c710f2..2000692ba44f 100644
--- a/Documentation/devicetree/bindings/display/panel/simple-panel.txt
+++ b/Documentation/devicetree/bindings/display/panel/simple-panel.txt
@@ -18,7 +18,7 @@ Optional properties:
 Example:
 
 	panel: panel {
-		compatible = "cptt,claa101wb01";
+		compatible = "simple-panel";
 		ddc-i2c-bus = <&panelddc>;
 
 		power-supply = <&vdd_pnl_reg>;
-- 
2.11.0
