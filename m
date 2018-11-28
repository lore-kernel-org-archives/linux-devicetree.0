From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/2] net: phy: micrel: add tobling phy reset
Date: Wed, 28 Nov 2018 09:02:41 +0000
Message-ID: <1543395612-5430-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: "andrew@lunn.ch" <andrew@lunn.ch>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "davem@davemloft.net" <davem@davemloft.net>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch set is for R-Car Gen3 Salvator-XS boards. If we do
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

When resolving this issue after I got feedback from Andrew and Heiner,
I found an issue that the phy_device.c didn't call phy_resume()
if the PHY was not attached. So, patch 1 fixes it and add toggling
the phy reset to the micrel phy driver.

Changes from v1 (as RFC):
 - No remove the current code of phy_device.c to avoid any side effects.
 - Fix the mdio_bus_phy_resume() in phy_device.c.
 - Add toggling the phy reset in micrel.c if the PHY is not attached.

Yoshihiro Shimoda (2):
  net: phy: Fix not to call phy_resume() if PHY is not attached
  net: phy: micrel: add toggling phy reset if PHY is not attached

 drivers/net/phy/micrel.c     |  8 ++++++++
 drivers/net/phy/phy_device.c | 11 ++++++-----
 2 files changed, 14 insertions(+), 5 deletions(-)

--=20
1.9.1
