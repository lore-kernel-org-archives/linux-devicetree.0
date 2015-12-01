From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 3/6] pinctrl: meson: Make helper functions public
Date: Tue,  1 Dec 2015 17:24:19 +0100
Message-ID: <1448987062-31225-4-git-send-email-carlo@caione.org>
References: <1448987062-31225-1-git-send-email-carlo@caione.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448987062-31225-1-git-send-email-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, drake-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, jerry.cao-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, victor.wan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org
Cc: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>

meson_get_domain_and_bank() and meson_map_resource() are not static
anymore.

Signed-off-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 10 +++++-----
 drivers/pinctrl/meson/pinctrl-meson.h |  7 +++++++
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 84943e4..0c5655b 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -99,9 +99,9 @@ static int meson_get_bank(struct meson_domain *domain, unsigned int pin,
  *
  * Return:	0 on success, a negative value on error
  */
-static int meson_get_domain_and_bank(struct meson_pinctrl *pc, unsigned int pin,
-				     struct meson_domain **domain,
-				     struct meson_bank **bank)
+int meson_get_domain_and_bank(struct meson_pinctrl *pc, unsigned int pin,
+			      struct meson_domain **domain,
+			      struct meson_bank **bank)
 {
 	struct meson_domain *d;
 	int i;
@@ -618,8 +618,8 @@ static struct regmap_config meson_regmap_config = {
 	.reg_stride = 4,
 };
 
-static struct regmap *meson_map_resource(struct meson_pinctrl *pc,
-					 struct device_node *node, char *name)
+struct regmap *meson_map_resource(struct meson_pinctrl *pc,
+				  struct device_node *node, char *name)
 {
 	struct resource res;
 	void __iomem *base;
diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
index 374f4b6..a0bf705 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.h
+++ b/drivers/pinctrl/meson/pinctrl-meson.h
@@ -214,3 +214,10 @@ struct meson_pinctrl {
 
 extern struct meson_pinctrl_data meson8_pinctrl_data;
 extern struct meson_pinctrl_data meson8b_pinctrl_data;
+
+int meson_get_domain_and_bank(struct meson_pinctrl *pc, unsigned int pin,
+			      struct meson_domain **domain,
+			      struct meson_bank **bank);
+
+struct regmap *meson_map_resource(struct meson_pinctrl *pc,
+				  struct device_node *node, char *name);
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
