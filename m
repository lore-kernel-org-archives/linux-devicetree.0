From: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: [RFC] pinctrl: enhance reporting of errors when loading from DT
Date: Tue, 24 Apr 2012 18:53:07 +0200
Message-ID: <1335286387-18520-1-git-send-email-blogic@openwrt.org>
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

There are a few places in the api where the code simply returns -EINVAL when
it finds an error. An example is pinmux_map_to_setting() which now reports an
error if we try to match a group with a function that it does not support.

The reporting of errors in pinconf_check_ops and pinmux_check_ops now has the
same style and is located inside the according functions and not the calling
code.

When the map is loaded from DT but the default state can not be found we get
an error to know that the code at least tried.

The patch also removes a stray word from one comment and a "->" from another
for the sake of consistency.

Signed-off-by: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---

There are a few places tagged with //FIXME. These are all the error paths i
checked and decided that we dont need to make them verbose. I tried to extract
as much .name info from pointers surrounding the code as possible to make the
message explicit. Let me know what you think.


 drivers/pinctrl/core.c       |   21 ++++++++++++---------
 drivers/pinctrl/devicetree.c |    9 ++++++---
 drivers/pinctrl/pinconf.c    |   10 ++++++++--
 drivers/pinctrl/pinmux.c     |   27 +++++++++++++++++++--------
 4 files changed, 45 insertions(+), 22 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 59027ab..0c4486a 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1319,21 +1319,18 @@ struct pinctrl_dev *pinctrl_register(struct pinctrl_desc *pctldesc,
 	/* If we're implementing pinmuxing, check the ops for sanity */
 	if (pctldesc->pmxops) {
 		ret = pinmux_check_ops(pctldev);
-		if (ret) {
-			pr_err("%s pinmux ops lacks necessary functions\n",
-			       pctldesc->name);
+		if (ret)
+			//FIXME: moved to pinmux_check_ops so we se a difference
+			//between missing function name and missing callback
 			goto out_err;
-		}
 	}
 
 	/* If we're implementing pinconfig, check the ops for sanity */
 	if (pctldesc->confops) {
 		ret = pinconf_check_ops(pctldev);
-		if (ret) {
-			pr_err("%s pin config ops lacks necessary functions\n",
-			       pctldesc->name);
+		if (ret)
+			//FIXME:moved to pinconf_check_ops()
 			goto out_err;
-		}
 	}
 
 	/* Register all the pins */
@@ -1356,8 +1353,14 @@ struct pinctrl_dev *pinctrl_register(struct pinctrl_desc *pctldesc,
 		struct pinctrl_state *s =
 			pinctrl_lookup_state_locked(pctldev->p,
 						    PINCTRL_STATE_DEFAULT);
+
+		/* if it is not 0 we should not get here, clear it anyhow */
+		ret = 0;
 		if (!IS_ERR(s))
-			pinctrl_select_state_locked(pctldev->p, s);
+			ret = pinctrl_select_state_locked(pctldev->p, s);
+		if (IS_ERR(s) || ret)
+			pr_err("%s: failed to lookup/select default state\n",
+				pctldesc->name);
 	}
 
 	mutex_unlock(&pinctrl_mutex);
diff --git a/drivers/pinctrl/devicetree.c b/drivers/pinctrl/devicetree.c
index fcb1de4..06a9834 100644
--- a/drivers/pinctrl/devicetree.c
+++ b/drivers/pinctrl/devicetree.c
@@ -144,9 +144,11 @@ static int dt_to_map_one_config(struct pinctrl *p, const char *statename,
 		return -ENODEV;
 	}
 	ret = ops->dt_node_to_map(pctldev, np_config, &map, &num_maps);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err(p->dev, "failed to load mapping from DT for %s\n",
+			dev_name(pctldev->dev));
 		return ret;
-
+	}
 	/* Stash the mapping table chunk away for later use */
 	return dt_remember_or_free_map(p, statename, pctldev, map, num_maps);
 }
@@ -230,6 +232,7 @@ int pinctrl_dt_to_map(struct pinctrl *p)
 			ret = dt_to_map_one_config(p, statename, np_config);
 			of_node_put(np_config);
 			if (ret < 0)
+				//FIXME: no need for a error msg as dt_to_map_one_config is verbose
 				goto err;
 		}
 
@@ -237,10 +240,10 @@ int pinctrl_dt_to_map(struct pinctrl *p)
 		if (!size) {
 			ret = dt_remember_dummy_state(p, statename);
 			if (ret < 0)
+				//FIXME: no need for a error msg as dt_remember_dummy_state is verbose
 				goto err;
 		}
 	}
-
 	return 0;
 
 err:
diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
index 384dcc1..2c56f60 100644
--- a/drivers/pinctrl/pinconf.c
+++ b/drivers/pinctrl/pinconf.c
@@ -28,11 +28,17 @@ int pinconf_check_ops(struct pinctrl_dev *pctldev)
 	const struct pinconf_ops *ops = pctldev->desc->confops;
 
 	/* We must be able to read out pin status */
-	if (!ops->pin_config_get && !ops->pin_config_group_get)
+	if (!ops->pin_config_get && !ops->pin_config_group_get) {
+		dev_err(pctldev->dev,
+			"pinconf must be able to read out pin status\n");
 		return -EINVAL;
+	}
 	/* We have to be able to config the pins in SOME way */
-	if (!ops->pin_config_set && !ops->pin_config_group_set)
+	if (!ops->pin_config_set && !ops->pin_config_group_set) {
+		dev_err(pctldev->dev,
+			"pinconf has to be able to set a pins config\n");
 		return -EINVAL;
+	}
 	return 0;
 }
 
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 1056e68..588156b 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -42,9 +42,10 @@ int pinmux_check_ops(struct pinctrl_dev *pctldev)
 	    !ops->get_function_name ||
 	    !ops->get_function_groups ||
 	    !ops->enable ||
-	    !ops->disable)
+	    !ops->disable) {
+		dev_err(pctldev->dev, "pinmux ops lacks necessary functions\n");
 		return -EINVAL;
-
+	}
 	/* Check that all functions registered have names */
 	nfuncs = ops->get_functions_count(pctldev);
 	while (selector < nfuncs) {
@@ -142,7 +143,7 @@ static int pin_request(struct pinctrl_dev *pctldev,
 		status = 0;
 
 	if (status) {
-		dev_err(pctldev->dev, "->request on device %s failed for pin %d\n",
+		dev_err(pctldev->dev, "request on device %s failed for pin %d\n",
 		       pctldev->desc->name, pin);
 		module_put(pctldev->owner);
 	}
@@ -304,7 +305,7 @@ static int pinmux_func_name_to_selector(struct pinctrl_dev *pctldev,
 		selector++;
 	}
 
-	pr_err("%s does not support function %s\n",
+	pr_err("%s: function \"%s\" not supported\n",
 	       pinctrl_dev_get_name(pctldev), function);
 	return -EINVAL;
 }
@@ -330,16 +331,21 @@ int pinmux_map_to_setting(struct pinctrl_map const *map,
 
 	ret = pinmux_func_name_to_selector(pctldev, map->data.mux.function);
 	if (ret < 0)
+		//FIXME: pinmux_func_name_to_selector is verbose
 		return ret;
 	setting->data.mux.func = ret;
 
 	ret = pmxops->get_function_groups(pctldev, setting->data.mux.func,
 					  &groups, &num_groups);
 	if (ret < 0)
+		//FIXME: safe to assume that get_function_groups() is verbose ?
 		return ret;
-	if (!num_groups)
+	if (!num_groups) {
+		//FIXME: we still need to check if returned data is valid
+		dev_err(pctldev->dev, "could not get mux groups \"%s\"",
+		                                map->data.mux.function);
 		return -EINVAL;
-
+	}
 	if (map->data.mux.group) {
 		bool found = false;
 		group = map->data.mux.group;
@@ -349,14 +355,19 @@ int pinmux_map_to_setting(struct pinctrl_map const *map,
 				break;
 			}
 		}
-		if (!found)
+		if (!found) {
+			dev_err(pctldev->dev,
+				"invalid group \"%s\" for function \"%s\"\n",
+				group, map->data.mux.function);
 			return -EINVAL;
+		}
 	} else {
 		group = groups[0];
 	}
 
 	ret = pinctrl_get_group_selector(pctldev, group);
 	if (ret < 0)
+		//FIXME: pinctrl_get_group_selector is verbose
 		return ret;
 	setting->data.mux.group = ret;
 
@@ -374,7 +385,7 @@ int pinmux_map_to_setting(struct pinctrl_map const *map,
 		ret = pin_request(pctldev, pins[i], map->dev_name, NULL);
 		if (ret) {
 			dev_err(pctldev->dev,
-				"could not get request pin %d on device %s\n",
+				"could not request pin %d on device %s\n",
 				pins[i], pinctrl_dev_get_name(pctldev));
 			/* On error release all taken pins */
 			i--; /* this pin just failed */
-- 
1.7.9.1
