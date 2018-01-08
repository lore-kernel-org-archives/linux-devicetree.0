From: Madalin-cristian Bucur <madalin.bucur@nxp.com>
Subject: RE: [PATCH net] of_mdio: avoid MDIO bus removal when a PHY is missing
Date: Mon, 8 Jan 2018 08:48:02 +0000
Message-ID: <DB3PR0402MB3849C3D31E60A819E1F674A9EC130@DB3PR0402MB3849.eurprd04.prod.outlook.com>
References: <1515144974-31377-1-git-send-email-madalin.bucur@nxp.com>
 <20180105151235.GD4038@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180105151235.GD4038@lunn.ch>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "davem@davemloft.net" <davem@davemloft.net>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "frowand.list@gmail.com" <frowand.list@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Andrew Lunn [mailto:andrew@lunn.ch]
> Sent: Friday, January 05, 2018 5:13 PM
> To: Madalin-cristian Bucur <madalin.bucur@nxp.com>
> Subject: Re: [PATCH net] of_mdio: avoid MDIO bus removal when a PHY is
> missing
>=20
> On Fri, Jan 05, 2018 at 11:36:14AM +0200, Madalin Bucur wrote:
> > If one of the child devices is missing the of_mdiobus_register_phy()
> > call will return -ENODEV. When a missing device is encountered the
> > registration of the remaining PHYs is stopped and the MDIO bus will
> > fail to register. Propagate all errors except ENODEV to avoid it.
>=20
> Hi Madalin
>=20
> This is is not clear cut. If the PHY is in device tree, the PHY should
> exist. So returning ENODEV is justified. The device tree blob is
> broken. But i can also see the value for continuing. There is a chance
> some of your other interfaces come up, allowing you to get the correct
> device tree blob for the hardware.
>=20
> Please add
>=20
> dev_err(&mdio->dev, "MDIO device at address %d is missing.\n");
>=20
> 	Andrew

This appears on boards that include in the device tree the description
for the PHYs found on an optional riser card. When the riser card is
removed, this issue is triggered. I'll send a v2 with the dev_err()
included.

Thanks,
Madalin
