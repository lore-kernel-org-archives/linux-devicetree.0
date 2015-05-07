From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH] dt-bindings: ARM: Mediatek: use more generic node name in examples
Date: Thu,  7 May 2015 10:14:58 +0200
Message-ID: <1430986498-7747-1-git-send-email-s.hauer@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Use 'clock-controller' and 'power-controller' as node names in the
examples rather than the specific names of the units.

Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt | 2 +-
 Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt   | 2 +-
 Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.txt    | 2 +-
 Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
index 5af6d73..936166f 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
@@ -16,7 +16,7 @@ The available clocks are defined in dt-bindings/clock/mt*-clk.h.
 
 Example:
 
-apmixedsys: apmixedsys@10209000 {
+apmixedsys: clock-controller@10209000 {
 	compatible = "mediatek,mt8173-apmixedsys";
 	reg = <0 0x10209000 0 0x1000>;
 	#clock-cells = <1>;
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
index 684da473..f6cd3e4 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
@@ -22,7 +22,7 @@ dt-bindings/reset-controller/mt*-resets.h
 
 Example:
 
-infracfg: infracfg@10001000 {
+infracfg: power-controller@10001000 {
 	compatible = "mediatek,mt8173-infracfg", "syscon";
 	reg = <0 0x10001000 0 0x1000>;
 	#clock-cells = <1>;
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.txt
index fdb45c6..f25b854 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.txt
@@ -22,7 +22,7 @@ dt-bindings/reset-controller/mt*-resets.h
 
 Example:
 
-pericfg: pericfg@10003000 {
+pericfg: power-controller@10003000 {
 	compatible = "mediatek,mt8173-pericfg", "syscon";
 	reg = <0 0x10003000 0 0x1000>;
 	#clock-cells = <1>;
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
index a425248..f9e9179 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
@@ -16,7 +16,7 @@ The available clocks are defined in dt-bindings/clock/mt*-clk.h.
 
 Example:
 
-topckgen: topckgen@10000000 {
+topckgen: power-controller@10000000 {
 	compatible = "mediatek,mt8173-topckgen";
 	reg = <0 0x10000000 0 0x1000>;
 	#clock-cells = <1>;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
