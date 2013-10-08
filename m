From: Majunath Goudar <csmanjuvijay@gmail.com>
Subject: [PATCH] VEXPRESS: Fix VEXPRESS implicit declarations dependence errors.
Date: Tue,  8 Oct 2013 16:11:35 +0530
Message-ID: <1381228895-24814-1-git-send-email-csmanjuvijay@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: nataraja.km@lge.com, Majunath Goudar <csmanjuvijay@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds a of_find_node_by_phandle() and of_get_next_parent()
function declaration dependence on"#ifdef CONFIG_OF" in "include/linux/=
of.h"
else part return inline dummy implementations (returning NULL). Without
this patch,build system can lead to issues. This was discovered during
randconfig testing,in which VEXPRESS_CONFIG was enabled w/o CONFIG_OF
being enabled,leading to the following error:

CC      drivers/mfd/vexpress-config.o
drivers/mfd/vexpress-config.c: In function =E2=80=98__vexpress_config_f=
unc_get=E2=80=99:
drivers/mfd/vexpress-config.c:117:4: error: implicit declaration of fun=
ction
=E2=80=98of_find_node_by_phandle=E2=80=99 [-Werror=3Dimplicit-function-=
declaration]
    bridge_node =3D of_find_node_by_phandle(
    ^
drivers/mfd/vexpress-config.c:117:16: warning: assignment makes pointer=
 from
integer without a cast [enabled by default]
    bridge_node =3D of_find_node_by_phandle(

Signed-off-by: Manjunath Goudar <csmanjuvijay@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>
Cc: Rob Herring <rob.herring@calxeda.com>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 include/linux/of.h |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index f95aee3..968787d 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -340,6 +340,15 @@ int of_device_is_stdout_path(struct device_node *d=
n);
=20
 #else /* CONFIG_OF */
=20
+static inline struct device_node *of_find_node_by_phandle(phandle hand=
le)
+{
+	return NULL;
+}
+static inline struct device_node *of_get_next_parent(struct device_nod=
e *node)
+{
+	return NULL;
+}
+
 static inline const char* of_node_full_name(struct device_node *np)
 {
 	return "<no-node>";
--=20
1.7.9.5
