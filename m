From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC] net: phy: device: Don't deassert the reset when register
 and probe
Date: Tue, 27 Nov 2018 12:18:20 +0000
Message-ID: <1543320947-32763-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: "andrew@lunn.ch" <andrew@lunn.ch>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "davem@davemloft.net" <davem@davemloft.net>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

Some PHY device needs edge signal of the reset, but the previous code
is impossible to achieve it like following:

 1) Kernel boots by using initramfs.
 --> No open the nic, so the provious code deasserts the reset by
     phy_device_register() and phy_probe().
 2) Kernel enters the suspend.
 --> So, keep the reset signal as deassert.
 --> On R-Car Salvator-XS board, unfortunately, the board power is
     turned off.
 3) Kernel returns from suspend.
 4) ifconfig eth0 up
 --> Then, since edge signal of the reset doesn't happen,
     it cannot link up.
 5) ifconfig eth0 down
 6) ifconfig eth0 up
 --> In this case, it can link up.

This patch is possible to break if ->probe() in a phy driver will
access the PHY. But, I believe ->config_init() only initializes
the PHY. However, I think this patch should be RFC at first.

Reported-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/net/phy/phy_device.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index e06613f..e01a752 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -802,16 +802,6 @@ int phy_device_register(struct phy_device *phydev)
 	if (err)
 		return err;
=20
-	/* Deassert the reset signal */
-	phy_device_reset(phydev, 0);
-
-	/* Run all of the fixups for this PHY */
-	err =3D phy_scan_fixups(phydev);
-	if (err) {
-		pr_err("PHY %d failed to initialize\n", phydev->mdio.addr);
-		goto out;
-	}
-
 	err =3D device_add(&phydev->mdio.dev);
 	if (err) {
 		pr_err("PHY %d failed to add\n", phydev->mdio.addr);
@@ -821,8 +811,6 @@ int phy_device_register(struct phy_device *phydev)
 	return 0;
=20
  out:
-	/* Assert the reset signal */
-	phy_device_reset(phydev, 1);
=20
 	mdiobus_unregister_device(&phydev->mdio);
 	return err;
@@ -2202,16 +2190,8 @@ static int phy_probe(struct device *dev)
 	/* Set the state to READY by default */
 	phydev->state =3D PHY_READY;
=20
-	if (phydev->drv->probe) {
-		/* Deassert the reset signal */
-		phy_device_reset(phydev, 0);
-
+	if (phydev->drv->probe)
 		err =3D phydev->drv->probe(phydev);
-		if (err) {
-			/* Assert the reset signal */
-			phy_device_reset(phydev, 1);
-		}
-	}
=20
 	mutex_unlock(&phydev->lock);
=20
--=20
1.9.1
