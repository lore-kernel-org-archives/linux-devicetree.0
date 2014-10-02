From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] pinctrl: specify bindings for pins and groups
Date: Thu,  2 Oct 2014 09:44:15 +0200
Message-ID: <1412235855-19418-1-git-send-email-linus.walleij@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Pin configurations can be per-pin or per-group. Make sure that the
per-group case is covered by the bindings.

Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/pinctrl/pinctrl-bindings.txt          | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
index 4f5a0c3af8b9..98eb94d91a1c 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
@@ -157,7 +157,12 @@ structure of the DT nodes that contain these properties.
 Supported generic properties are:
 
 pins			- the list of pins that properties in the node
-			  apply to
+			  apply to (either this or "group" has to be
+			  specified)
+group			- the group to apply the properties to, if the driver
+			  supports configuration of whole groups rather than
+			  individual pins (either this or "pins" has to be
+			  specified)
 bias-disable		- disable any pin bias
 bias-high-impedance	- high impedance mode ("third-state", "floating")
 bias-bus-hold		- latch weakly
@@ -190,6 +195,10 @@ state_1_node_a {
 	pins = "GPIO1_AJ3", "GPIO3_AH3"; /* RTS+TXD */
 	output-high;
 };
+state_2_node_a {
+	group = "foo-group";
+	bias-pull-up;
+};
 
 Some of the generic properties take arguments. For those that do, the
 arguments are described below.
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
