From: Dong Aisheng <aisheng.dong-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH V4 1/7] dt-bindings: pinctrl: extend the pinmux property to support integers array
Date: Wed, 21 Jun 2017 19:59:49 +0800
Message-ID: <1498046395-30001-2-git-send-email-aisheng.dong@nxp.com>
References: <1498046395-30001-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1498046395-30001-1-git-send-email-aisheng.dong-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org, ping.bai-3arQi8VN3Tc@public.gmane.org, fugang.duan-3arQi8VN3Tc@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Dong Aisheng <aisheng.dong-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some platforms may need more than one integer to represent a complete
pinmux binding, so let's extend the pinmux property to allow to accept
integer array instead of only a single integer.

Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Signed-off-by: Dong Aisheng <aisheng.dong-3arQi8VN3Tc@public.gmane.org>

---
ChangeLog:
 * new patch
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
index f01d154..1b954b5 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
@@ -205,10 +205,11 @@ maintain.
 
 For cases like this, the pin controller driver may use the pinmux helper
 property, where the pin identifier is packed with mux configuration settings
-in a single integer.
+in a single integer or integers array which depends on platform binding
+specific.
 
-The pinmux property accepts an array of integers, each of them describing
-a single pin multiplexing configuration.
+The pinmux property accepts an array of group of integers, each group
+describing a single pin multiplexing configuration.
 
 pincontroller {
 	state_0_node_a {
@@ -300,7 +301,7 @@ arguments are described below.
 - pinmux takes a list of pin IDs and mux settings as required argument. The
   specific bindings for the hardware defines:
   - How pin IDs and mux settings are defined and assembled together in a single
-    integer.
+    integer or integers array.
 
 - bias-pull-up, -down and -pin-default take as optional argument on hardware
   supporting it the pull strength in Ohm. bias-disable will disable the pull.
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
