From: Yegor Yefremov <yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH v2] Documentation: usb: fix wrong documentation paths
Date: Sun, 15 Jan 2017 13:14:28 +0100
Message-ID: <20170115121428.3255-1-yegorslists@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yegor Yefremov <yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Fixes wrong spelled "pinctrl-bindings.txt" and "qcom-dwc3-usb-phy.txt"
file names as also wrong specified "mt8173-mtu3.txt" file name.

Signed-off-by: Yegor Yefremov <yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
Changes:
	v1 -> v2: add changelog text (Greg Kroah-Hartman)

 Documentation/devicetree/bindings/usb/dwc3-st.txt     | 4 ++--
 Documentation/devicetree/bindings/usb/ehci-st.txt     | 2 +-
 Documentation/devicetree/bindings/usb/mt8173-mtu3.txt | 2 +-
 Documentation/devicetree/bindings/usb/mt8173-xhci.txt | 4 ++--
 Documentation/devicetree/bindings/usb/qcom,dwc3.txt   | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/dwc3-st.txt b/Documentation/devicetree/bindings/usb/dwc3-st.txt
index 01c71b1..50dee3b 100644
--- a/Documentation/devicetree/bindings/usb/dwc3-st.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3-st.txt
@@ -20,10 +20,10 @@ See: Documentation/devicetree/bindings/reset/reset.txt
    with 'reg' property
 
  - pinctl-names	: A pinctrl state named "default" must be defined
-See: Documentation/devicetree/bindings/pinctrl/pinctrl-binding.txt
+See: Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
 
  - pinctrl-0	: Pin control group
-See: Documentation/devicetree/bindings/pinctrl/pinctrl-binding.txt
+See: Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
 
  - ranges	: allows valid 1:1 translation between child's address space and
 		  parent's address space
diff --git a/Documentation/devicetree/bindings/usb/ehci-st.txt b/Documentation/devicetree/bindings/usb/ehci-st.txt
index fb45fa5..410d922 100644
--- a/Documentation/devicetree/bindings/usb/ehci-st.txt
+++ b/Documentation/devicetree/bindings/usb/ehci-st.txt
@@ -7,7 +7,7 @@ Required properties:
  - interrupts		: one EHCI interrupt should be described here
  - pinctrl-names	: a pinctrl state named "default" must be defined
  - pinctrl-0		: phandle referencing pin configuration of the USB controller
-See: Documentation/devicetree/bindings/pinctrl/pinctrl-binding.txt
+See: Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
  - clocks		: phandle list of usb clocks
  - clock-names		: should be "ic" for interconnect clock and "clk48"
 See: Documentation/devicetree/bindings/clock/clock-bindings.txt
diff --git a/Documentation/devicetree/bindings/usb/mt8173-mtu3.txt b/Documentation/devicetree/bindings/usb/mt8173-mtu3.txt
index e049d19..718386a 100644
--- a/Documentation/devicetree/bindings/usb/mt8173-mtu3.txt
+++ b/Documentation/devicetree/bindings/usb/mt8173-mtu3.txt
@@ -30,7 +30,7 @@ Optional properties:
 	"id_float" and "id_ground" are optinal which depends on
 	"mediatek,enable-manual-drd"
  - pinctrl-0 : pin control group
-	See: Documentation/devicetree/bindings/pinctrl/pinctrl-binding.txt
+	See: Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
 
  - maximum-speed : valid arguments are "super-speed", "high-speed" and
 	"full-speed"; refer to usb/generic.txt
diff --git a/Documentation/devicetree/bindings/usb/mt8173-xhci.txt b/Documentation/devicetree/bindings/usb/mt8173-xhci.txt
index 2a930bd..7ea3971 100644
--- a/Documentation/devicetree/bindings/usb/mt8173-xhci.txt
+++ b/Documentation/devicetree/bindings/usb/mt8173-xhci.txt
@@ -37,7 +37,7 @@ Optional properties:
  - usb3-lpm-capable : supports USB3.0 LPM
  - pinctrl-names : a pinctrl state named "default" must be defined
  - pinctrl-0 : pin control group
-	See: Documentation/devicetree/bindings/pinctrl/pinctrl-binding.txt
+	See: Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
 
 Example:
 usb30: usb@11270000 {
@@ -67,7 +67,7 @@ usb30: usb@11270000 {
 
 In the case, xhci is added as subnode to mtu3. An example and the DT binding
 details of mtu3 can be found in:
-Documentation/devicetree/bindings/usb/mtu3.txt
+Documentation/devicetree/bindings/usb/mt8173-mtu3.txt
 
 Required properties:
  - compatible : should contain "mediatek,mt8173-xhci"
diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt b/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
index 39acb08..73cc096 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
@@ -18,7 +18,7 @@ A child node must exist to represent the core DWC3 IP block. The name of
 the node is not important. The content of the node is defined in dwc3.txt.
 
 Phy documentation is provided in the following places:
-Documentation/devicetree/bindings/phy/qcom,dwc3-usb-phy.txt
+Documentation/devicetree/bindings/phy/qcom-dwc3-usb-phy.txt
 
 Example device nodes:
 
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
