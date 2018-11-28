From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 1/2] net: phy: Fix not to call phy_resume() if PHY is not
 attached
Date: Wed, 28 Nov 2018 09:02:41 +0000
Message-ID: <1543395612-5430-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1543395612-5430-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1543395612-5430-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: "andrew@lunn.ch" <andrew@lunn.ch>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "davem@davemloft.net" <davem@davemloft.net>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch fixes an issue that mdio_bus_phy_resume() doesn't call
phy_resume() if the PHY is not attached.

Fixes: 803dd9c77ac3 ("net: phy: avoid suspending twice a PHY")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/net/phy/phy_device.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index e06613f..ecf5e3a9 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -227,7 +227,7 @@ static void phy_mdio_device_remove(struct mdio_device *=
mdiodev)
 static DEFINE_MUTEX(phy_fixup_lock);
=20
 #ifdef CONFIG_PM
-static bool mdio_bus_phy_may_suspend(struct phy_device *phydev)
+static bool mdio_bus_phy_may_suspend(struct phy_device *phydev, bool suspe=
nd)
 {
 	struct device_driver *drv =3D phydev->mdio.dev.driver;
 	struct phy_driver *phydrv =3D to_phy_driver(drv);
@@ -239,10 +239,11 @@ static bool mdio_bus_phy_may_suspend(struct phy_devic=
e *phydev)
 	/* PHY not attached? May suspend if the PHY has not already been
 	 * suspended as part of a prior call to phy_disconnect() ->
 	 * phy_detach() -> phy_suspend() because the parent netdev might be the
-	 * MDIO bus driver and clock gated at this point.
+	 * MDIO bus driver and clock gated at this point. Also may resume if
+	 * PHY is not attached.
 	 */
 	if (!netdev)
-		return !phydev->suspended;
+		return suspend ? !phydev->suspended : phydev->suspended;
=20
 	if (netdev->wol_enabled)
 		return false;
@@ -277,7 +278,7 @@ static int mdio_bus_phy_suspend(struct device *dev)
 	if (phydev->attached_dev && phydev->adjust_link)
 		phy_stop_machine(phydev);
=20
-	if (!mdio_bus_phy_may_suspend(phydev))
+	if (!mdio_bus_phy_may_suspend(phydev, true))
 		return 0;
=20
 	return phy_suspend(phydev);
@@ -288,7 +289,7 @@ static int mdio_bus_phy_resume(struct device *dev)
 	struct phy_device *phydev =3D to_phy_device(dev);
 	int ret;
=20
-	if (!mdio_bus_phy_may_suspend(phydev))
+	if (!mdio_bus_phy_may_suspend(phydev, false))
 		goto no_resume;
=20
 	ret =3D phy_resume(phydev);
--=20
1.9.1
