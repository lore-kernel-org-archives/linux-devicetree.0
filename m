From: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC 04/18] driver core & of: Mark of_nodes of added device as populated
Date: Mon, 23 Dec 2013 16:23:36 +0000
Message-ID: <1387815830-8794-5-git-send-email-pawel.moll@arm.com>
References: <1387815830-8794-1-git-send-email-pawel.moll@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387815830-8794-1-git-send-email-pawel.moll-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

In "Device Tree powered" systems, platform devices are usually
massively populated with of_platform_populate() call, executed
at some level of initcalls, either by generic architecture
or by platform-specific code.

There are situations though where certain devices must be
created (and bound with drivers) before all the others.
This presents small challenge in DT-driven systems, as
devices explicitly created in early code would be created
again by of_platform_populate().

This patch tries to solve that issue in a generic way,
adding a "populated" flag which is set in the device_node
structure when a device is being created in the core.
Later, of_platform_populate() skips such nodes (and
its children) in a similar way to the non-available ones.

Signed-off-by: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 drivers/base/core.c       |  4 ++++
 drivers/of/device.c       | 16 ++++++++++++++++
 drivers/of/platform.c     |  6 ++++--
 include/linux/of.h        |  6 ++++++
 include/linux/of_device.h | 11 +++++++++++
 5 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 67b180d..50dd8f3 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1086,6 +1086,8 @@ int device_add(struct device *dev)
 =09=09=09=09class_intf->add_dev(dev, class_intf);
 =09=09mutex_unlock(&dev->class->p->mutex);
 =09}
+
+=09of_device_populate(dev);
 done:
 =09put_device(dev);
 =09return error;
@@ -1188,6 +1190,8 @@ void device_del(struct device *dev)
 =09struct device *parent =3D dev->parent;
 =09struct class_interface *class_intf;
=20
+=09of_device_depopulate(dev);
+
 =09/* Notify clients of device removal.  This call must come
 =09 * before dpm_sysfs_remove().
 =09 */
diff --git a/drivers/of/device.c b/drivers/of/device.c
index f685e55..dae092a 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -187,3 +187,19 @@ int of_device_uevent_modalias(struct device *dev, stru=
ct kobj_uevent_env *env)
=20
 =09return 0;
 }
+
+void of_device_populate(struct device *dev)
+{
+=09if ((!dev) || (!dev->of_node))
+=09=09return;
+
+=09of_node_set_flag(dev->of_node, OF_POPULATED);
+}
+
+void of_device_depopulate(struct device *dev)
+{
+=09if ((!dev) || (!dev->of_node))
+=09=09return;
+
+=09of_node_clear_flag(dev->of_node, OF_POPULATED);
+}
diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 404d1da..ad43ee0 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -204,7 +204,8 @@ static struct platform_device *of_platform_device_creat=
e_pdata(
 {
 =09struct platform_device *dev;
=20
-=09if (!of_device_is_available(np))
+=09if (!of_device_is_available(np) ||
+=09=09=09of_node_check_flag(np, OF_POPULATED))
 =09=09return NULL;
=20
 =09dev =3D of_device_alloc(np, bus_id, parent);
@@ -262,7 +263,8 @@ static struct amba_device *of_amba_device_create(struct=
 device_node *node,
=20
 =09pr_debug("Creating amba device %s\n", node->full_name);
=20
-=09if (!of_device_is_available(node))
+=09if (!of_device_is_available(node) ||
+=09=09=09of_node_check_flag(node, OF_POPULATED))
 =09=09return NULL;
=20
 =09dev =3D amba_device_alloc(NULL, 0, 0);
diff --git a/include/linux/of.h b/include/linux/of.h
index 276c546..53989cf 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -114,6 +114,11 @@ static inline void of_node_set_flag(struct device_node=
 *n, unsigned long flag)
 =09set_bit(flag, &n->_flags);
 }
=20
+static inline void of_node_clear_flag(struct device_node *n, unsigned long=
 flag)
+{
+=09clear_bit(flag, &n->_flags);
+}
+
 extern struct device_node *of_find_all_nodes(struct device_node *prev);
=20
 /*
@@ -156,6 +161,7 @@ static inline unsigned long of_read_ulong(const __be32 =
*cell, int size)
 /* flag descriptions */
 #define OF_DYNAMIC=091 /* node and properties were allocated via kmalloc *=
/
 #define OF_DETACHED=092 /* node has been detached from the device tree */
+#define OF_POPULATED=093 /* device already created for the node */
=20
 #define OF_IS_DYNAMIC(x) test_bit(OF_DYNAMIC, &x->_flags)
 #define OF_MARK_DYNAMIC(x) set_bit(OF_DYNAMIC, &x->_flags)
diff --git a/include/linux/of_device.h b/include/linux/of_device.h
index 82ce324..bfb4a48 100644
--- a/include/linux/of_device.h
+++ b/include/linux/of_device.h
@@ -44,6 +44,9 @@ static inline void of_device_node_put(struct device *dev)
 =09of_node_put(dev->of_node);
 }
=20
+extern void of_device_populate(struct device *dev);
+extern void of_device_depopulate(struct device *dev);
+
 static inline struct device_node *of_cpu_device_node_get(int cpu)
 {
 =09struct device *cpu_dev;
@@ -78,6 +81,14 @@ static inline const struct of_device_id *of_match_device=
(
 =09return NULL;
 }
=20
+static inline void of_device_populate(struct device *dev)
+{
+}
+
+static inline void of_device_depopulate(struct device *dev)
+{
+}
+
 static inline struct device_node *of_cpu_device_node_get(int cpu)
 {
 =09return NULL;
--=20
1.8.3.2


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
