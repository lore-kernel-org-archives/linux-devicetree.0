From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH] of: Add stub for of_get_next_parent()
Date: Wed, 27 Apr 2016 14:11:40 +0300
Message-ID: <1461755500-889-1-git-send-email-heikki.krogerus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Grant Likely <grant.likely@linaro.org>
Cc: Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

=46ixes a compiler error:

drivers/phy/phy-core.c: In function =E2=80=98__of_phy_provider_register=
=E2=80=99:
drivers/phy/phy-core.c:848:13: error: implicit declaration of function
=E2=80=98of_get_next_parent=E2=80=99 [-Werror=3Dimplicit-function-decla=
ration]
    parent =3D of_get_next_parent(parent);
                 ^

=46ixes: 2f7600bc981c ("phy: core: Allow children node to be overridden=
")
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 include/linux/of.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index c7292e8..00ab231 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -468,6 +468,12 @@ static inline struct device_node *of_get_parent(co=
nst struct device_node *node)
 	return NULL;
 }
=20
+static inline struct device_node *of_get_next_parent(
+	const struct device_node *node)
+{
+	return NULL;
+}
+
 static inline struct device_node *of_get_next_child(
 	const struct device_node *node, struct device_node *prev)
 {
--=20
2.8.0.rc3
