From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [RFC/PATCH] pinctrl: sh-pfc: Accept standard function, pins and groups properties
Date: Tue, 27 Jan 2015 22:31:34 +0200
Message-ID: <1422390694-12389-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <CACRpkda4SBof0EaZVWtEYaeb6j_BGAVj39kje+mBz90eB3qAwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkda4SBof0EaZVWtEYaeb6j_BGAVj39kje+mBz90eB3qAwQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niso@kth.se>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-sh@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>
List-Id: devicetree@vger.kernel.org

The "function", "pins" and "groups" pinmux and pinctrl properties have
been standardized. Support them in addition to the custom "renesas,*"
properties. New-style and old-style properties can't be mixed in DT.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.=
com>
---
 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       | 20 +++++------
 drivers/pinctrl/sh-pfc/pinctrl.c                   | 41 ++++++++++++++=
+++-----
 2 files changed, 43 insertions(+), 18 deletions(-)

Hi Linus,

On Tuesday 27 January 2015 08:55:20 Linus Walleij wrote:
> On Sun, Jan 18, 2015 at 1:20 PM, Niklas S=C3=B6derlund <niso@kth.se> =
wrote:
> > Configure the pinmux on kzm9d to use the serial connector for uart1=
=2E
> >=20
> > Signed-off-by: Niklas S=C3=B6derlund <niso@kth.se>
>=20
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>=20
> > +&pfc {
> > +       uart1_pins: uart@e1030000 {
> > +               renesas,groups =3D "uart1_ctrl", "uart1_data";
> > +               renesas,function =3D "uart1";
> > +       };
> > +};
>=20
> Would be nice if the PFC driver could be augmented to also accept the
> now standard bindings "groups" and "function" simply :) we're adding =
parse
> functions for those to the core.

Something like this ?

Please note two differences between the Renesas PFC bindings and the st=
andard
bindings:

- The standard bindings state that a pinctrl node must contain either a=
 "pins"
  property or a "groups" property, while the Renesas bindings allows fo=
r both
  to coexist in the same node.

- The standard bindings don't allow a pinmux node to contain a "pins" p=
roperty,
  while the Renesas bindings do.

This patch implements the Renesas behaviour with the standard propertie=
s. The
difference in behaviour might not be desired. Please let me know what y=
ou
think.

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinc=
trl.txt b/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl=
=2Etxt
index bfe72ec055e3..60d191911e80 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
@@ -56,12 +56,12 @@ are parsed through phandles and processed purely ba=
sed on their content.
=20
 Pin Configuration Node Properties:
=20
-- renesas,pins : An array of strings, each string containing the name =
of a pin.
-- renesas,groups : An array of strings, each string containing the nam=
e of a pin
+- pins : An array of strings, each string containing the name of a pin=
=2E
+- groups : An array of strings, each string containing the name of a p=
in
   group.
=20
-- renesas,function: A string containing the name of the function to mu=
x to the
-  pin group(s) specified by the renesas,groups property
+- function: A string containing the name of the function to mux to the=
 pin
+  group(s) specified by the groups property.
=20
   Valid values for pin, group and function names can be found in the g=
roup and
   function arrays of the PFC data file corresponding to the SoC
@@ -139,19 +139,19 @@ Example 3: KZM-A9-GT (SH-Mobile AG5) default pin =
state hog and pin control maps
=20
 		mmcif_pins: mmcif {
 			mux {
-				renesas,groups =3D "mmc0_data8_0", "mmc0_ctrl_0";
-				renesas,function =3D "mmc0";
+				groups =3D "mmc0_data8_0", "mmc0_ctrl_0";
+				function =3D "mmc0";
 			};
 			cfg {
-				renesas,groups =3D "mmc0_data8_0";
-				renesas,pins =3D "PORT279";
+				groups =3D "mmc0_data8_0";
+				pins =3D "PORT279";
 				bias-pull-up;
 			};
 		};
=20
 		scifa4_pins: scifa4 {
-			renesas,groups =3D "scifa4_data", "scifa4_ctrl";
-			renesas,function =3D "scifa4";
+			groups =3D "scifa4_data", "scifa4_ctrl";
+			function =3D "scifa4";
 		};
 	};
=20
diff --git a/drivers/pinctrl/sh-pfc/pinctrl.c b/drivers/pinctrl/sh-pfc/=
pinctrl.c
index 072e7c62cab7..522909e74b2e 100644
--- a/drivers/pinctrl/sh-pfc/pinctrl.c
+++ b/drivers/pinctrl/sh-pfc/pinctrl.c
@@ -40,6 +40,10 @@ struct sh_pfc_pinctrl {
=20
 	struct pinctrl_pin_desc *pins;
 	struct sh_pfc_pin_config *configs;
+
+	const char *func_prop_name;
+	const char *groups_prop_name;
+	const char *pins_prop_name;
 };
=20
 static int sh_pfc_get_groups_count(struct pinctrl_dev *pctldev)
@@ -96,10 +100,13 @@ static int sh_pfc_map_add_config(struct pinctrl_ma=
p *map,
 	return 0;
 }
=20
-static int sh_pfc_dt_subnode_to_map(struct device *dev, struct device_=
node *np,
+static int sh_pfc_dt_subnode_to_map(struct pinctrl_dev *pctldev,
+				    struct device_node *np,
 				    struct pinctrl_map **map,
 				    unsigned int *num_maps, unsigned int *index)
 {
+	struct sh_pfc_pinctrl *pmx =3D pinctrl_dev_get_drvdata(pctldev);
+	struct device *dev =3D pmx->pfc->dev;
 	struct pinctrl_map *maps =3D *map;
 	unsigned int nmaps =3D *num_maps;
 	unsigned int idx =3D *index;
@@ -113,10 +120,27 @@ static int sh_pfc_dt_subnode_to_map(struct device=
 *dev, struct device_node *np,
 	const char *pin;
 	int ret;
=20
+	/* Support both the old Renesas-specific properties and the new stand=
ard
+	 * properties. Mixing old and new properties isn't allowed, neither
+	 * inside a subnode nor across subnodes.
+	 */
+	if (!pmx->func_prop_name) {
+		if (of_find_property(np, "groups", NULL) ||
+		    of_find_property(np, "pins", NULL)) {
+			pmx->func_prop_name =3D "function";
+			pmx->groups_prop_name =3D "groups";
+			pmx->pins_prop_name =3D "pins";
+		} else {
+			pmx->func_prop_name =3D "renesas,function";
+			pmx->groups_prop_name =3D "renesas,groups";
+			pmx->pins_prop_name =3D "renesas,pins";
+		}
+	}
+
 	/* Parse the function and configuration properties. At least a functi=
on
 	 * or one configuration must be specified.
 	 */
-	ret =3D of_property_read_string(np, "renesas,function", &function);
+	ret =3D of_property_read_string(np, pmx->func_prop_name, &function);
 	if (ret < 0 && ret !=3D -EINVAL) {
 		dev_err(dev, "Invalid function in DT\n");
 		return ret;
@@ -129,11 +153,12 @@ static int sh_pfc_dt_subnode_to_map(struct device=
 *dev, struct device_node *np,
 	if (!function && num_configs =3D=3D 0) {
 		dev_err(dev,
 			"DT node must contain at least a function or config\n");
+		ret =3D -ENODEV;
 		goto done;
 	}
=20
 	/* Count the number of pins and groups and reallocate mappings. */
-	ret =3D of_property_count_strings(np, "renesas,pins");
+	ret =3D of_property_count_strings(np, pmx->pins_prop_name);
 	if (ret =3D=3D -EINVAL) {
 		num_pins =3D 0;
 	} else if (ret < 0) {
@@ -143,7 +168,7 @@ static int sh_pfc_dt_subnode_to_map(struct device *=
dev, struct device_node *np,
 		num_pins =3D ret;
 	}
=20
-	ret =3D of_property_count_strings(np, "renesas,groups");
+	ret =3D of_property_count_strings(np, pmx->groups_prop_name);
 	if (ret =3D=3D -EINVAL) {
 		num_groups =3D 0;
 	} else if (ret < 0) {
@@ -174,7 +199,7 @@ static int sh_pfc_dt_subnode_to_map(struct device *=
dev, struct device_node *np,
 	*num_maps =3D nmaps;
=20
 	/* Iterate over pins and groups and create the mappings. */
-	of_property_for_each_string(np, "renesas,groups", prop, group) {
+	of_property_for_each_string(np, pmx->groups_prop_name, prop, group) {
 		if (function) {
 			maps[idx].type =3D PIN_MAP_TYPE_MUX_GROUP;
 			maps[idx].data.mux.group =3D group;
@@ -198,7 +223,7 @@ static int sh_pfc_dt_subnode_to_map(struct device *=
dev, struct device_node *np,
 		goto done;
 	}
=20
-	of_property_for_each_string(np, "renesas,pins", prop, pin) {
+	of_property_for_each_string(np, pmx->pins_prop_name, prop, pin) {
 		ret =3D sh_pfc_map_add_config(&maps[idx], pin,
 					    PIN_MAP_TYPE_CONFIGS_PIN,
 					    configs, num_configs);
@@ -246,7 +271,7 @@ static int sh_pfc_dt_node_to_map(struct pinctrl_dev=
 *pctldev,
 	index =3D 0;
=20
 	for_each_child_of_node(np, child) {
-		ret =3D sh_pfc_dt_subnode_to_map(dev, child, map, num_maps,
+		ret =3D sh_pfc_dt_subnode_to_map(pctldev, child, map, num_maps,
 					       &index);
 		if (ret < 0)
 			goto done;
@@ -254,7 +279,7 @@ static int sh_pfc_dt_node_to_map(struct pinctrl_dev=
 *pctldev,
=20
 	/* If no mapping has been found in child nodes try the config node. *=
/
 	if (*num_maps =3D=3D 0) {
-		ret =3D sh_pfc_dt_subnode_to_map(dev, np, map, num_maps, &index);
+		ret =3D sh_pfc_dt_subnode_to_map(pctldev, np, map, num_maps, &index)=
;
 		if (ret < 0)
 			goto done;
 	}
--=20
Regards,

Laurent Pinchart
