From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [RFC PATCH 2/3] drivers: mfd: vexpress: add timeout API to vexpress config interface
Date: Fri, 24 May 2013 13:53:05 +0100
Message-ID: <1369399986-15649-3-git-send-email-lorenzo.pieralisi@arm.com>
References: <1369399986-15649-1-git-send-email-lorenzo.pieralisi@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1369399986-15649-1-git-send-email-lorenzo.pieralisi@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Samuel Ortiz <sameo@linux.intel.com>, Achin Gupta <achin.gupta@arm.com>, Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>, Pawel Moll <pawel.moll@arm.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, Jon Medhurst <tixy@linaro.org>
List-Id: devicetree@vger.kernel.org

In case some transactions to the Serial Power Controller (SPC) are lost owi=
ng
to multiple operations handled at once by the M3 controller the OS needs to
rely on a configuration API that can time out so that failures do not resul=
t
in an unusable system.

This patch adds a timeout API to the vexpress config programming interface,
and refactors the existing read/write functions so that they can be reused
seamlessly on top of the newly defined API.

Cc: Samuel Ortiz <sameo@linux.intel.com>
Cc: Achin Gupta <achin.gupta@arm.com>
Cc: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Amit Kucheria <amit.kucheria@linaro.org>
Cc: Jon Medhurst <tixy@linaro.org>
Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
---
 drivers/mfd/vexpress-config.c | 26 +++++++---
 include/linux/vexpress.h      | 23 ++++++--
 2 files changed, 37 insertions(+), 12 deletions(-)

diff --git a/drivers/mfd/vexpress-config.c b/drivers/mfd/vexpress-config.c
index 1af2b0e..6f4aa5a 100644
--- a/drivers/mfd/vexpress-config.c
+++ b/drivers/mfd/vexpress-config.c
@@ -266,8 +266,18 @@ int vexpress_config_wait(struct vexpress_config_trans =
*trans)
 }
 EXPORT_SYMBOL(vexpress_config_wait);
=20
-int vexpress_config_read(struct vexpress_config_func *func, int offset,
-=09=09u32 *data)
+int vexpress_config_wait_timeout(struct vexpress_config_trans *trans,
+=09=09=09long jiffies)
+{
+=09int ret;
+=09ret =3D wait_for_completion_timeout(&trans->completion, jiffies);
+
+=09return ret ? trans->status : -ETIMEDOUT;
+}
+EXPORT_SYMBOL(vexpress_config_wait_timeout);
+
+int vexpress_config_read_timeout(struct vexpress_config_func *func, int of=
fset,
+=09=09u32 *data, long jiffies)
 {
 =09struct vexpress_config_trans trans =3D {
 =09=09.func =3D func,
@@ -279,14 +289,14 @@ int vexpress_config_read(struct vexpress_config_func =
*func, int offset,
 =09int status =3D vexpress_config_schedule(&trans);
=20
 =09if (status =3D=3D VEXPRESS_CONFIG_STATUS_WAIT)
-=09=09status =3D vexpress_config_wait(&trans);
+=09=09status =3D vexpress_config_wait_timeout(&trans, jiffies);
=20
 =09return status;
 }
-EXPORT_SYMBOL(vexpress_config_read);
+EXPORT_SYMBOL(vexpress_config_read_timeout);
=20
-int vexpress_config_write(struct vexpress_config_func *func, int offset,
-=09=09u32 data)
+int vexpress_config_write_timeout(struct vexpress_config_func *func,
+=09=09=09=09  int offset, u32 data, long jiffies)
 {
 =09struct vexpress_config_trans trans =3D {
 =09=09.func =3D func,
@@ -298,8 +308,8 @@ int vexpress_config_write(struct vexpress_config_func *=
func, int offset,
 =09int status =3D vexpress_config_schedule(&trans);
=20
 =09if (status =3D=3D VEXPRESS_CONFIG_STATUS_WAIT)
-=09=09status =3D vexpress_config_wait(&trans);
+=09=09status =3D vexpress_config_wait_timeout(&trans, jiffies);
=20
 =09return status;
 }
-EXPORT_SYMBOL(vexpress_config_write);
+EXPORT_SYMBOL(vexpress_config_write_timeout);
diff --git a/include/linux/vexpress.h b/include/linux/vexpress.h
index 50368e0..e5015d8 100644
--- a/include/linux/vexpress.h
+++ b/include/linux/vexpress.h
@@ -15,6 +15,7 @@
 #define _LINUX_VEXPRESS_H
=20
 #include <linux/device.h>
+#include <linux/sched.h>
=20
 #define VEXPRESS_SITE_MB=09=090
 #define VEXPRESS_SITE_DB1=09=091
@@ -102,10 +103,24 @@ struct vexpress_config_func *__vexpress_config_func_g=
et(
 void vexpress_config_func_put(struct vexpress_config_func *func);
=20
 /* Both may sleep! */
-int vexpress_config_read(struct vexpress_config_func *func, int offset,
-=09=09u32 *data);
-int vexpress_config_write(struct vexpress_config_func *func, int offset,
-=09=09u32 data);
+int vexpress_config_read_timeout(struct vexpress_config_func *func, int of=
fset,
+=09=09u32 *data, long jiffies);
+int vexpress_config_write_timeout(struct vexpress_config_func *func,
+=09=09int offset, u32 data, long jiffies);
+
+static inline int vexpress_config_read(struct vexpress_config_func *func,
+=09=09=09=09 int offset, u32 *data)
+{
+=09return vexpress_config_read_timeout(func, offset, data,
+=09=09=09=09=09     MAX_SCHEDULE_TIMEOUT);
+}
+
+static inline int vexpress_config_write(struct vexpress_config_func *func,
+=09=09=09=09 int offset, u32 data)
+{
+=09return vexpress_config_write_timeout(func, offset, data,
+=09=09=09=09=09     MAX_SCHEDULE_TIMEOUT);
+}
=20
 /* Platform control */
=20
--=20
1.8.2.2
