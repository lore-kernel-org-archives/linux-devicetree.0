From: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v4] mfd: max77693: Add muic of_compatible in mfd_cell
Date: Wed, 23 Aug 2017 08:30:12 +0200
Message-ID: <1503469812-3668-1-git-send-email-m.purski@samsung.com>
References: <CGME20170823063057eucas1p18045ff589bef62e656594d0bcf6ec5b3@eucas1p1.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds muic of_compatible in order to use the muic device
driver in device tree.

Signed-off-by: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
v2:
- added muic to documentation
v3:
- removed duplication
v4:
- fixed commit message

 Documentation/devicetree/bindings/mfd/max77693.txt | 6 ++++++
 drivers/mfd/max77693.c                             | 5 ++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/max77693.txt b/Documentation/devicetree/bindings/mfd/max77693.txt
index 6a1ae3a..e675497 100644
--- a/Documentation/devicetree/bindings/mfd/max77693.txt
+++ b/Documentation/devicetree/bindings/mfd/max77693.txt
@@ -127,6 +127,12 @@ Required properties for the LED child node:
 Optional properties for the LED child node:
 - label : see Documentation/devicetree/bindings/leds/common.txt
 
+Optional nodes:
+- max77693-muic :
+	Node used only by extcon consumers.
+	Required properties:
+		- compatible : "maxim,max77693-muic"
+
 Example:
 #include <dt-bindings/leds/common.h>
 
diff --git a/drivers/mfd/max77693.c b/drivers/mfd/max77693.c
index 662ae0d..1c05ea0 100644
--- a/drivers/mfd/max77693.c
+++ b/drivers/mfd/max77693.c
@@ -48,7 +48,10 @@ static const struct mfd_cell max77693_devs[] = {
 		.name = "max77693-charger",
 		.of_compatible = "maxim,max77693-charger",
 	},
-	{ .name = "max77693-muic", },
+	{
+		.name = "max77693-muic",
+		.of_compatible = "maxim,max77693-muic",
+	},
 	{
 		.name = "max77693-haptic",
 		.of_compatible = "maxim,max77693-haptic",
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
