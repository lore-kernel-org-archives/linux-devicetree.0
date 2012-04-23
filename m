From: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: [PATCH V2] pinctrl: fix signed vs unsigned conditionals inside
 pinmux_map_to_setting
Date: Mon, 23 Apr 2012 19:01:58 +0200
Message-ID: <1335200518-3640-1-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

pinmux_map_to_setting() uses setting->data.mux.func/group to store the return
code of pinmux_func_name_to_selector/pinctrl_get_group_selector(). However,
struct pinctrl_setting_mux defines these elements as unsigned, resulting in all
error codes getting lost. The conditionals following the assignments will always
evaluate to false thus breaking the error paths.

This bug can be triggered by loading a pinmux group map from the devicetree
with an invalid function/group string.

Signed-off-by: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/pinctrl/pinmux.c |   15 ++++++++-------
 1 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index c494c37..1056e68 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -328,10 +328,10 @@ int pinmux_map_to_setting(struct pinctrl_map const *map,
 		return -EINVAL;
 	}
 
-	setting->data.mux.func =
-		pinmux_func_name_to_selector(pctldev, map->data.mux.function);
-	if (setting->data.mux.func < 0)
-		return setting->data.mux.func;
+	ret = pinmux_func_name_to_selector(pctldev, map->data.mux.function);
+	if (ret < 0)
+		return ret;
+	setting->data.mux.func = ret;
 
 	ret = pmxops->get_function_groups(pctldev, setting->data.mux.func,
 					  &groups, &num_groups);
@@ -355,9 +355,10 @@ int pinmux_map_to_setting(struct pinctrl_map const *map,
 		group = groups[0];
 	}
 
-	setting->data.mux.group = pinctrl_get_group_selector(pctldev, group);
-	if (setting->data.mux.group < 0)
-		return setting->data.mux.group;
+	ret = pinctrl_get_group_selector(pctldev, group);
+	if (ret < 0)
+		return ret;
+	setting->data.mux.group = ret;
 
 	ret = pctlops->get_group_pins(pctldev, setting->data.mux.group, &pins,
 				      &num_pins);
-- 
1.7.9.1
