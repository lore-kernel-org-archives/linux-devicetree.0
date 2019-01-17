From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3/RFT 2/2] net: phy: assert the phy reset during suspended if phy is not attached
Date: Thu, 17 Jan 2019 20:05:09 +0900
Message-ID: <1547723109-28792-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1547723109-28792-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1547723109-28792-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: netdev-owner@vger.kernel.org
To: andrew@lunn.ch, f.fainelli@gmail.com, davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This phy_device driver deasserts the reset signal in the following
functions (expect error path):
 - phy_device_register()
 - phy_probe()
 - phy_init_hw() that is called by phy_attach_direct()

And, the phy_device asserts the reset signal in the following
functions (expect error path):
 - phy_device_remove()
 - phy_remove()
 - phy_detach()

So, if the following conditions happen, the reset signal keeps to be
deasserted during suspended:
 - The phy driver is probed
 - But a net device doesn't open
 - And then the system enters suspend

So, this patch adds to assert the reset signal in phy_suspend() if
a phy is not attached. Otherwise, R-Car Gen3 Salvator-XS board could
not link up correctly if we do the following method:

 1) Kernel boots by using initramfs.
 2) Kernel enters the suspend.
 3) Kernel returns from suspend.
 4) ifconfig eth0 up
 --> Then, since edge signal of the reset doesn't happen,
     it cannot link up.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/net/phy/phy_device.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index d86356f..09ab62a 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1346,6 +1346,10 @@ int phy_suspend(struct phy_device *phydev)
 	if (ret)
 		return ret;
 
+	/* Assert the reset signal if the phydev is not attached */
+	if (!phydev->attached_dev)
+		phy_device_reset(phydev, 1);
+
 	phydev->suspended = true;
 
 	return ret;
@@ -1359,6 +1363,10 @@ int __phy_resume(struct phy_device *phydev)
 
 	WARN_ON(!mutex_is_locked(&phydev->lock));
 
+	/* Deassert the reset signal if the phydev is not attached */
+	if (!phydev->attached_dev)
+		phy_device_reset(phydev, 0);
+
 	if (phydev->drv && phydrv->resume)
 		ret = phydrv->resume(phydev);
 
-- 
1.9.1
