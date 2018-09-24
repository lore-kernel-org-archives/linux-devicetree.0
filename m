From: Sasha Levin <Alexander.Levin@microsoft.com>
Subject: [PATCH AUTOSEL 4.14 24/36] net: ethernet: cpsw-phy-sel: prefer
 phandle for phy sel
Date: Mon, 24 Sep 2018 14:49:07 +0000
Message-ID: <20180924144851.164533-24-alexander.levin@microsoft.com>
References: <20180924144851.164533-1-alexander.levin@microsoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180924144851.164533-1-alexander.levin@microsoft.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "stable@vger.kernel.org" <stable@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Tony Lindgren <tony@atomide.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, Grygorii Strashko <grygorii.strashko@ti.com>, Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Murali Karicheri <m-karicheri2@ti.com>, Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>, Sasha Levin <Alexander.Levin@microsoft.com>
List-Id: devicetree@vger.kernel.org

From: Tony Lindgren <tony@atomide.com>

[ Upstream commit 18eb8aea7fb2fb4490e578b1b8a1096c34b2fc48 ]

The cpsw-phy-sel device is not a child of the cpsw interconnect target
module. It lives in the system control module.

Let's fix this issue by trying to use cpsw-phy-sel phandle first if it
exists and if not fall back to current usage of trying to find the
cpsw-phy-sel child. That way the phy sel driver can be a child of the
system control module where it belongs in the device tree.

Without this fix, we cannot have a proper interconnect target module
hierarchy in device tree for things like genpd.

Note that deferred probe is mostly not supported by cpsw and this patch
does not attempt to fix that. In case deferred probe support is needed,
this could be added to cpsw_slave_open() and phy_connect() so they start
handling and returning errors.

For documenting it, looks like the cpsw-phy-sel is used for all cpsw device
tree nodes. It's missing the related binding documentation, so let's also
update the binding documentation accordingly.

Cc: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Murali Karicheri <m-karicheri2@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <alexander.levin@microsoft.com>
---
 drivers/net/ethernet/ti/cpsw-phy-sel.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw-phy-sel.c b/drivers/net/ethernet/=
ti/cpsw-phy-sel.c
index 0c1adad7415d..396e1cd10667 100644
--- a/drivers/net/ethernet/ti/cpsw-phy-sel.c
+++ b/drivers/net/ethernet/ti/cpsw-phy-sel.c
@@ -170,10 +170,13 @@ void cpsw_phy_sel(struct device *dev, phy_interface_t=
 phy_mode, int slave)
 	struct device_node *node;
 	struct cpsw_phy_sel_priv *priv;
=20
-	node =3D of_get_child_by_name(dev->of_node, "cpsw-phy-sel");
+	node =3D of_parse_phandle(dev->of_node, "cpsw-phy-sel", 0);
 	if (!node) {
-		dev_err(dev, "Phy mode driver DT not found\n");
-		return;
+		node =3D of_get_child_by_name(dev->of_node, "cpsw-phy-sel");
+		if (!node) {
+			dev_err(dev, "Phy mode driver DT not found\n");
+			return;
+		}
 	}
=20
 	dev =3D bus_find_device(&platform_bus_type, NULL, node, match);
--=20
2.17.1
