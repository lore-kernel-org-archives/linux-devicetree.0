From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] pinctrl: phandle entries will be applied sequentially
Date: Wed, 9 Oct 2013 13:42:04 +0800
Message-ID: <1381297324-19006-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

It's naturally expected that when there are multiple phandle entries
specified in pinctrl-* property, these entries will be applied
sequentially.  And this is how Linux kernel works.  So let's define
this behavior in the binding doc.

The behavior is useful when people want to reuse a group of predefined
pins with only minor configuration adjustment on one particular pin.
They will only need to add another entry after the predefined one with
needed configuration on that particular pin to overwrite the predefined
configuration.

Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../bindings/pinctrl/pinctrl-bindings.txt          |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
index 1958ca9..404ba32 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
@@ -50,7 +50,13 @@ pinctrl-0:	List of phandles, each pointing at a pin configuration
 		entries may exist in this list so that multiple pin
 		controllers may be configured, or so that a state may be built
 		from multiple nodes for a single pin controller, each
-		contributing part of the overall configuration. See the next
+		contributing part of the overall configuration. These entries
+		will be applied sequentially. If there are multiple entries
+		contributing the configuration of the same pin, the latter
+		will overwrite the former. However, this 'overwrite' mechanism
+		should be used with the caution that it could cause some ill
+		effect, e.g. a glitch on the pin when pull down/up setting
+		gets flipped in this 'overwrite'.  See the next
 		section of this document for details of the format of these
 		pin configuration nodes.
 
-- 
1.7.9.5


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
