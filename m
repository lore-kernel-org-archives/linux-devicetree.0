From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3/RFT 0/2] net: phy: assert the phy reset during suspended if phy is not attached
Date: Thu, 17 Jan 2019 20:05:07 +0900
Message-ID: <1547723109-28792-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: andrew@lunn.ch, f.fainelli@gmail.com, davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch series is for R-Car Gen3 Salvator-XS boards. If we do
the following method, the phy cannot link up correctly.

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

Changes from v2:
 - Rebase on the latest net-next.
 - More generic code instead of micrel phy only code
   (https://www.spinics.net/lists/netdev/msg540462.html).
   So, I marked this patch series as RFT.

Changes from v1 (as RFC):
 - No remove the current code of phy_device.c to avoid any side effects.
 - Fix the mdio_bus_phy_resume() in phy_device.c.
 - Add toggling the phy reset in micrel.c if the PHY is not attached.


Yoshihiro Shimoda (2):
  net: phy: Fix not to call phy_resume() if PHY is not attached
  net: phy: assert the phy reset during suspended if phy is not attached

 drivers/net/phy/phy_device.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

-- 
1.9.1
