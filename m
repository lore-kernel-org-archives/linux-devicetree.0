From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [RFC PATCH v4 1/2] drivers: mfd: refactor the vexpress config bridge API
Date: Mon, 17 Jun 2013 16:51:08 +0100
Message-ID: <1371484269-11743-2-git-send-email-lorenzo.pieralisi@arm.com>
References: <1371484269-11743-1-git-send-email-lorenzo.pieralisi@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1371484269-11743-1-git-send-email-lorenzo.pieralisi@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
Cc: Pawel Moll <pawel.moll@arm.com>, Samuel Ortiz <sameo@linux.intel.com>, Achin Gupta <achin.gupta@arm.com>, Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>, Amit Kucheria <amit.kucheria@linaro.org>, Jon Medhurst <tixy@linaro.org>, Olof Johansson <olof@lixom.net>, Nicolas Pitre <nicolas.pitre@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Pawel Moll <pawel.moll@arm.com>

The introduction of Serial Power Controller (SPC) requires the vexpress
config interface to change slightly since the SPC memory mapped interface
can be used as configuration bus but also for operating points
programming and retrieval. The helper that allocates the bridge functions
requires an additional parameter allowing to request component specific
functions that need not be initialized through device tree bindings but
just using simple look-up and statically defined constants.

This patch introduces the necessary changes to the vexpress config layer
to cater for the new vexpress bridge interface requirements.

Cc: Samuel Ortiz <sameo@linux.intel.com>
Cc: Achin Gupta <achin.gupta@arm.com>
Cc: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Amit Kucheria <amit.kucheria@linaro.org>
Cc: Jon Medhurst <tixy@linaro.org>
Signed-off-by: Pawel Moll <pawel.moll@arm.com>
Acked-by: Nicolas Pitre <nico@linaro.org>
---
 drivers/mfd/vexpress-config.c | 61 ++++++----
 drivers/mfd/vexpress-sysreg.c |  2 +-
 include/linux/vexpress.h      | 16 ++-
 3 files changed, 51 insertions(+), 28 deletions(-)

diff --git a/drivers/mfd/vexpress-config.c b/drivers/mfd/vexpress-config.c
index 84ce6b9..1af2b0e 100644
--- a/drivers/mfd/vexpress-config.c
+++ b/drivers/mfd/vexpress-config.c
@@ -86,29 +86,13 @@ void vexpress_config_bridge_unregister(struct vexpress_=
config_bridge *bridge)
 }
 EXPORT_SYMBOL(vexpress_config_bridge_unregister);
=20
-
-struct vexpress_config_func {
-=09struct vexpress_config_bridge *bridge;
-=09void *func;
-};
-
-struct vexpress_config_func *__vexpress_config_func_get(struct device *dev=
,
-=09=09struct device_node *node)
+static struct vexpress_config_bridge *
+=09=09vexpress_config_bridge_find(struct device_node *node)
 {
-=09struct device_node *bridge_node;
-=09struct vexpress_config_func *func;
 =09int i;
+=09struct vexpress_config_bridge *res =3D NULL;
+=09struct device_node *bridge_node =3D of_node_get(node);
=20
-=09if (WARN_ON(dev && node && dev->of_node !=3D node))
-=09=09return NULL;
-=09if (dev && !node)
-=09=09node =3D dev->of_node;
-
-=09func =3D kzalloc(sizeof(*func), GFP_KERNEL);
-=09if (!func)
-=09=09return NULL;
-
-=09bridge_node =3D of_node_get(node);
 =09while (bridge_node) {
 =09=09const __be32 *prop =3D of_get_property(bridge_node,
 =09=09=09=09"arm,vexpress,config-bridge", NULL);
@@ -129,13 +113,46 @@ struct vexpress_config_func *__vexpress_config_func_g=
et(struct device *dev,
=20
 =09=09if (test_bit(i, vexpress_config_bridges_map) &&
 =09=09=09=09bridge->node =3D=3D bridge_node) {
-=09=09=09func->bridge =3D bridge;
-=09=09=09func->func =3D bridge->info->func_get(dev, node);
+=09=09=09res =3D bridge;
 =09=09=09break;
 =09=09}
 =09}
 =09mutex_unlock(&vexpress_config_bridges_mutex);
=20
+=09return res;
+}
+
+
+struct vexpress_config_func {
+=09struct vexpress_config_bridge *bridge;
+=09void *func;
+};
+
+struct vexpress_config_func *__vexpress_config_func_get(
+=09=09struct vexpress_config_bridge *bridge,
+=09=09struct device *dev,
+=09=09struct device_node *node,
+=09=09const char *id)
+{
+=09struct vexpress_config_func *func;
+
+=09if (WARN_ON(dev && node && dev->of_node !=3D node))
+=09=09return NULL;
+=09if (dev && !node)
+=09=09node =3D dev->of_node;
+
+=09if (!bridge)
+=09=09bridge =3D vexpress_config_bridge_find(node);
+=09if (!bridge)
+=09=09return NULL;
+
+=09func =3D kzalloc(sizeof(*func), GFP_KERNEL);
+=09if (!func)
+=09=09return NULL;
+
+=09func->bridge =3D bridge;
+=09func->func =3D bridge->info->func_get(dev, node, id);
+
 =09if (!func->func) {
 =09=09of_node_put(node);
 =09=09kfree(func);
diff --git a/drivers/mfd/vexpress-sysreg.c b/drivers/mfd/vexpress-sysreg.c
index 96a020b..d2599aa 100644
--- a/drivers/mfd/vexpress-sysreg.c
+++ b/drivers/mfd/vexpress-sysreg.c
@@ -165,7 +165,7 @@ static u32 *vexpress_sysreg_config_data;
 static int vexpress_sysreg_config_tries;
=20
 static void *vexpress_sysreg_config_func_get(struct device *dev,
-=09=09struct device_node *node)
+=09=09struct device_node *node, const char *id)
 {
 =09struct vexpress_sysreg_config_func *config_func;
 =09u32 site;
diff --git a/include/linux/vexpress.h b/include/linux/vexpress.h
index 6e7980d..50368e0 100644
--- a/include/linux/vexpress.h
+++ b/include/linux/vexpress.h
@@ -68,7 +68,8 @@
  */
 struct vexpress_config_bridge_info {
 =09const char *name;
-=09void *(*func_get)(struct device *dev, struct device_node *node);
+=09void *(*func_get)(struct device *dev, struct device_node *node,
+=09=09=09  const char *id);
 =09void (*func_put)(void *func);
 =09int (*func_exec)(void *func, int offset, bool write, u32 *data);
 };
@@ -87,12 +88,17 @@ void vexpress_config_complete(struct vexpress_config_br=
idge *bridge,
=20
 struct vexpress_config_func;
=20
-struct vexpress_config_func *__vexpress_config_func_get(struct device *dev=
,
-=09=09struct device_node *node);
+struct vexpress_config_func *__vexpress_config_func_get(
+=09=09struct vexpress_config_bridge *bridge,
+=09=09struct device *dev,
+=09=09struct device_node *node,
+=09=09const char *id);
+#define vexpress_config_func_get(bridge, id) \
+=09=09__vexpress_config_func_get(bridge, NULL, NULL, id)
 #define vexpress_config_func_get_by_dev(dev) \
-=09=09__vexpress_config_func_get(dev, NULL)
+=09=09__vexpress_config_func_get(NULL, dev, NULL, NULL)
 #define vexpress_config_func_get_by_node(node) \
-=09=09__vexpress_config_func_get(NULL, node)
+=09=09__vexpress_config_func_get(NULL, NULL, node, NULL)
 void vexpress_config_func_put(struct vexpress_config_func *func);
=20
 /* Both may sleep! */
--=20
1.8.2.2
