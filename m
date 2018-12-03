From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v2 0/2] net: phy: micrel: add tobling phy reset
Date: Mon, 03 Dec 2018 15:20:57 -0800 (PST)
Message-ID: <20181203.152057.61263535375452379.davem@davemloft.net>
References: <1543395612-5430-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1543395612-5430-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: netdev-owner@vger.kernel.org
To: yoshihiro.shimoda.uh@renesas.com
Cc: andrew@lunn.ch, f.fainelli@gmail.com, netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Date: Wed, 28 Nov 2018 09:02:41 +0000

> This patch set is for R-Car Gen3 Salvator-XS boards. If we do
> the following method, the phy cannot link up correctly.
> 
>  1) Kernel boots by using initramfs.
>  --> No open the nic, so phy_device_register() and phy_probe()
>      deasserts the reset.
>  2) Kernel enters the suspend.
>  --> So, keep the reset signal as deassert.
>  --> On R-Car Salvator-XS board, unfortunately, the board power is
>      turned off.
>  3) Kernel returns from suspend.
>  4) ifconfig eth0 up
>  --> Then, since edge signal of the reset doesn't happen,
>      it cannot link up.
>  5) ifconfig eth0 down
>  6) ifconfig eth0 up
>  --> In this case, it can link up.
> 
> When resolving this issue after I got feedback from Andrew and Heiner,
> I found an issue that the phy_device.c didn't call phy_resume()
> if the PHY was not attached. So, patch 1 fixes it and add toggling
> the phy reset to the micrel phy driver.
> 
> Changes from v1 (as RFC):
>  - No remove the current code of phy_device.c to avoid any side effects.
>  - Fix the mdio_bus_phy_resume() in phy_device.c.
>  - Add toggling the phy reset in micrel.c if the PHY is not attached.

Series applied, thank you.
