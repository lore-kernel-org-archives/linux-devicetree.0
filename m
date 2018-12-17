From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH v2 0/2] net: phy: micrel: add tobling phy reset
Date: Mon, 17 Dec 2018 10:46:41 +0000
Message-ID: <OSAPR01MB229035772BF81EDC3F58C2F6D8BC0@OSAPR01MB2290.jpnprd01.prod.outlook.com>
References: <1543395612-5430-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20181203.152057.61263535375452379.davem@davemloft.net>
 <92358866-e231-15e7-84f4-86a6fa51ed49@gmail.com>
 <20181204104333.GC741@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181204104333.GC741@lunn.ch>
Content-Language: ja-JP
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>
Cc: David Miller <davem@davemloft.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello Andrew, Florian,

> From: Andrew Lunn, Sent: Tuesday, December 4, 2018 7:44 PM
>=20
> > > Series applied, thank you.
> >
> > Meh! I guess we should be faster at reviewing stuff :/
>=20
> And there have been things going on behind the scenes to try to get a
> real fix. Sorry, i should of mentioned that.

Sorry for the delayed response. How to try to get a real fix?
I have two ideas:

Idea 1: Assert/deassert the reset in phy_{suspend,resume}()
 - call phy_device_reset(phydev, 0); if !phydev->attached_dev in phy_suspen=
d()
 - call phy_device_reset(phydev, 1); if !phydev->attached_dev in phy_resume=
()

Idea 2: Toggle the reset in phy_resume().
 - call phy_device_reset(phydev, 0); udelay(1); phy_device_reset(phydev, 1)=
;
   if !phydev->attached_dev in phy_resume ()

I think the idea 1 is better. But, what do you think?

Best regards,
Yoshihiro Shimoda
