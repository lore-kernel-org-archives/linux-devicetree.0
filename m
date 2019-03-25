From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: [PATCH] dt-bindings: display/panel: Add missing unit names
Date: Mon, 25 Mar 2019 17:08:10 +0100
Message-ID: <901e836ea06889a9d91a799102b2a6b836d93dcd.1553529797.git.agx@sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
List-Id: devicetree@vger.kernel.org

Some examples were missing the unit names triggering

 Warning (unit_address_vs_reg): .../panel: node has a reg or ranges property, but no unit name

warnings when used verbatim in DTs and running dtc with W=1.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
 .../devicetree/bindings/display/panel/innolux,p079zca.txt       | 2 +-
 .../devicetree/bindings/display/panel/innolux,p097pfg.txt       | 2 +-
 .../devicetree/bindings/display/panel/kingdisplay,kd097d04.txt  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt b/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt
index d0f55161579a..3ab8c7412cf6 100644
--- a/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt
+++ b/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt
@@ -12,7 +12,7 @@ Optional properties:
 Example:
 
 	&mipi_dsi {
-		panel {
+		panel@0 {
 			compatible = "innolux,p079zca";
 			reg = <0>;
 			power-supply = <...>;
diff --git a/Documentation/devicetree/bindings/display/panel/innolux,p097pfg.txt b/Documentation/devicetree/bindings/display/panel/innolux,p097pfg.txt
index 595d9dfeffd3..d1cab3a8f0fb 100644
--- a/Documentation/devicetree/bindings/display/panel/innolux,p097pfg.txt
+++ b/Documentation/devicetree/bindings/display/panel/innolux,p097pfg.txt
@@ -13,7 +13,7 @@ Optional properties:
 Example:
 
 	&mipi_dsi {
-		panel {
+		panel@0 {
 			compatible = "innolux,p079zca";
 			reg = <0>;
 			avdd-supply = <...>;
diff --git a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd097d04.txt b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd097d04.txt
index 164a5fa236da..cfefff688614 100644
--- a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd097d04.txt
+++ b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd097d04.txt
@@ -12,7 +12,7 @@ Optional properties:
 Example:
 
 	&mipi_dsi {
-		panel {
+		panel@0 {
 			compatible = "kingdisplay,kd097d04";
 			reg = <0>;
 			power-supply = <...>;
-- 
2.20.1
