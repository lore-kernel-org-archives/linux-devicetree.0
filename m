From: Peter Rosin <peda@axentia.se>
Subject: [PATCH v3 5/5] drm/bridge: lvds-encoder: add powerdown-gpios support
Date: Sat, 29 Dec 2018 07:07:43 +0000
Message-ID: <20181229070649.21308-6-peda@axentia.se>
References: <20181229070649.21308-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181229070649.21308-1-peda@axentia.se>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Peter Rosin <peda@axentia.se>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Optionally power down the LVDS-encoder when it is not in use.

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 drivers/gpu/drm/bridge/lvds-encoder.c | 34 +++++++++++++++++++++++++++++++=
+++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/bridge/lvds-encoder.c b/drivers/gpu/drm/bridge=
/lvds-encoder.c
index f6770e83d49d..36d8557bc097 100644
--- a/drivers/gpu/drm/bridge/lvds-encoder.c
+++ b/drivers/gpu/drm/bridge/lvds-encoder.c
@@ -11,11 +11,13 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_panel.h>
=20
+#include <linux/gpio/consumer.h>
 #include <linux/of_graph.h>
=20
 struct lvds_encoder {
 	struct drm_bridge bridge;
 	struct drm_bridge *panel_bridge;
+	struct gpio_desc *powerdown_gpio;
 };
=20
 static int lvds_encoder_attach(struct drm_bridge *bridge)
@@ -28,8 +30,30 @@ static int lvds_encoder_attach(struct drm_bridge *bridge=
)
 				 bridge);
 }
=20
+static void lvds_encoder_enable(struct drm_bridge *bridge)
+{
+	struct lvds_encoder *lvds_encoder =3D container_of(bridge,
+							 struct lvds_encoder,
+							 bridge);
+
+	if (lvds_encoder->powerdown_gpio)
+		gpiod_set_value_cansleep(lvds_encoder->powerdown_gpio, 0);
+}
+
+static void lvds_encoder_disable(struct drm_bridge *bridge)
+{
+	struct lvds_encoder *lvds_encoder =3D container_of(bridge,
+							 struct lvds_encoder,
+							 bridge);
+
+	if (lvds_encoder->powerdown_gpio)
+		gpiod_set_value_cansleep(lvds_encoder->powerdown_gpio, 1);
+}
+
 static struct drm_bridge_funcs funcs =3D {
 	.attach =3D lvds_encoder_attach,
+	.enable =3D lvds_encoder_enable,
+	.disable =3D lvds_encoder_disable,
 };
=20
 static int lvds_encoder_probe(struct platform_device *pdev)
@@ -45,6 +69,16 @@ static int lvds_encoder_probe(struct platform_device *pd=
ev)
 	if (!lvds_encoder)
 		return -ENOMEM;
=20
+	lvds_encoder->powerdown_gpio =3D devm_gpiod_get_optional(dev, "powerdown"=
,
+							       GPIOD_OUT_HIGH);
+	if (IS_ERR(lvds_encoder->powerdown_gpio)) {
+		int err =3D PTR_ERR(lvds_encoder->powerdown_gpio);
+
+		if (err !=3D -EPROBE_DEFER)
+			dev_err(dev, "powerdown GPIO failure: %d\n", err);
+		return err;
+	}
+
 	/* Locate the panel DT node. */
 	port =3D of_graph_get_port_by_id(dev->of_node, 1);
 	if (!port) {
--=20
2.11.0
