From: Soren Brinkmann <soren.brinkmann@xilinx.com>
Subject: [PATCH v3 1/7] pinctrl: pinconf-generic: Infer map type from DT property
Date: Fri, 12 Dec 2014 08:34:52 -0800
Message-ID: <9a21e4de1eac4c3e81a860b69ae99713@BL2FFO11FD060.protection.gbl>
References: <1418402098-3811-1-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1418402098-3811-1-git-send-email-soren.brinkmann@xilinx.com>
Sender: linux-sh-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>
Cc: =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Alessandro Rubini <rubini@unipv.it>, Heiko Stuebner <heiko@sntech.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-rockchip@lists.infradead.org, linux-sh@vger.kernel.org, "Ivan T. Ivanov" <iivanov@mm-sol.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Beniamino Galvani <b.galvani@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

With the new 'groups' property, the DT parser can infer the map type
from the fact whether 'pins' or 'groups' is used to specify the pin
group to work on.
To maintain backwards compatibitliy with current usage of the DT
binding, this is only done when PIN_MAP_TYPE_INVALID is passed to the
parsing function as type.
Also, a new helper 'pinconf_generic_dt_node_to_map_all()' is introduced=
,
which can be used by drivers as generic callback for dt_node_to_map() t=
o
leverage the new feature.

Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
Tested-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
Changes since v2:
 - rename dt_pin_specifier to subnode_target_type
 - add additional comment in header file explaining passing an invalid
   map type
 - mention map_all() helper in commit message
Changes since RFC v2:
 - none
---
 drivers/pinctrl/pinconf-generic.c       | 17 ++++++++++++++---
 include/linux/pinctrl/pinconf-generic.h | 11 +++++++++++
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pincon=
f-generic.c
index f78b416d7984..21b3d90ebb2d 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -264,6 +264,7 @@ int pinconf_generic_dt_subnode_to_map(struct pinctr=
l_dev *pctldev,
 	unsigned reserve;
 	struct property *prop;
 	const char *group;
+	const char *subnode_target_type =3D "pins";
=20
 	ret =3D of_property_read_string(np, "function", &function);
 	if (ret < 0) {
@@ -284,10 +285,20 @@ int pinconf_generic_dt_subnode_to_map(struct pinc=
trl_dev *pctldev,
 		reserve++;
 	if (num_configs)
 		reserve++;
+
 	ret =3D of_property_count_strings(np, "pins");
 	if (ret < 0) {
-		dev_err(dev, "could not parse property pins\n");
-		goto exit;
+		ret =3D of_property_count_strings(np, "groups");
+		if (ret < 0) {
+			dev_err(dev, "could not parse property pins/groups\n");
+			goto exit;
+		}
+		if (type =3D=3D PIN_MAP_TYPE_INVALID)
+			type =3D PIN_MAP_TYPE_CONFIGS_GROUP;
+		subnode_target_type =3D "groups";
+	} else {
+		if (type =3D=3D PIN_MAP_TYPE_INVALID)
+			type =3D PIN_MAP_TYPE_CONFIGS_PIN;
 	}
 	reserve *=3D ret;
=20
@@ -296,7 +307,7 @@ int pinconf_generic_dt_subnode_to_map(struct pinctr=
l_dev *pctldev,
 	if (ret < 0)
 		goto exit;
=20
-	of_property_for_each_string(np, "pins", prop, group) {
+	of_property_for_each_string(np, subnode_target_type, prop, group) {
 		if (function) {
 			ret =3D pinctrl_utils_add_map_mux(pctldev, map,
 					reserved_maps, num_maps, group,
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pi=
nctrl/pinconf-generic.h
index d578a60eff23..83c89f5ab705 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -174,6 +174,17 @@ static inline int pinconf_generic_dt_node_to_map_p=
in(
 			PIN_MAP_TYPE_CONFIGS_PIN);
 }
=20
+static inline int pinconf_generic_dt_node_to_map_all(
+		struct pinctrl_dev *pctldev, struct device_node *np_config,
+		struct pinctrl_map **map, unsigned *num_maps)
+{
+	/*
+	 * passing the type as PIN_MAP_TYPE_INVALID causes the underlying par=
ser
+	 * to infer the map type from the DT properties used.
+	 */
+	return pinconf_generic_dt_node_to_map(pctldev, np_config, map, num_ma=
ps,
+			PIN_MAP_TYPE_INVALID);
+}
 #endif
=20
 #endif /* CONFIG_GENERIC_PINCONF */
--=20
2.2.0.1.g9ee0458

