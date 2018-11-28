From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 2/2] net: phy: micrel: add toggling phy reset if PHY is not
 attached
Date: Wed, 28 Nov 2018 09:02:42 +0000
Message-ID: <1543395612-5430-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
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

This patch adds toggling phy reset if PHY is not attached. Otherwise,
some boards (e.g. R-Car H3 Salvator-XS) cannot link up correctly if
we do the following method:

 1) Kernel boots by using initramfs.
 --> No open the nic, so phy_device_register() and phy_probe()
     deasserts the reset.
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

Reported-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/net/phy/micrel.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/phy/micrel.c b/drivers/net/phy/micrel.c
index c333847..fcb561b 100644
--- a/drivers/net/phy/micrel.c
+++ b/drivers/net/phy/micrel.c
@@ -23,6 +23,7 @@
  *			 ksz9477
  */
=20
+#include <linux/delay.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/phy.h>
@@ -840,6 +841,13 @@ static int kszphy_resume(struct phy_device *phydev)
 {
 	int ret;
=20
+	if (!phydev->attached_dev) {
+		/* If the PHY is not attached, toggle the reset */
+		phy_device_reset(phydev, 1);
+		udelay(1);
+		phy_device_reset(phydev, 0);
+	}
+
 	genphy_resume(phydev);
=20
 	ret =3D kszphy_config_reset(phydev);
--=20
1.9.1
