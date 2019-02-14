From: Claudiu Manoil <claudiu.manoil@nxp.com>
Subject: RE: [PATCH net-next 3/3] enetc: Add ENETC PF level external MDIO
 support
Date: Thu, 14 Feb 2019 15:48:44 +0000
Message-ID: <VI1PR04MB4880C8E3E302C7D3856DB68396670@VI1PR04MB4880.eurprd04.prod.outlook.com>
References: <1550055743-15542-1-git-send-email-claudiu.manoil@nxp.com>
 <1550055743-15542-4-git-send-email-claudiu.manoil@nxp.com>
 <20190213181323.GA708@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190213181323.GA708@lunn.ch>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Shawn Guo <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "David S . Miller" <davem@davemloft.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandru Marginean <alexandru.marginean@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

>-----Original Message-----
>From: Andrew Lunn <andrew@lunn.ch>
>Sent: Wednesday, February 13, 2019 8:13 PM
>To: Claudiu Manoil <claudiu.manoil@nxp.com>
>Cc: Shawn Guo <shawnguo@kernel.org>; Leo Li <leoyang.li@nxp.com>; David S =
.
>Miller <davem@davemloft.net>; devicetree@vger.kernel.org; Alexandru
>Marginean <alexandru.marginean@nxp.com>; linux-kernel@vger.kernel.org;
>linux-arm-kernel@lists.infradead.org; netdev@vger.kernel.org
>Subject: Re: [PATCH net-next 3/3] enetc: Add ENETC PF level external MDIO
>support
>
[...]
>> +static int enetc_mdio_write(struct mii_bus *bus, int phy_id, int regnum=
,
>> +			    u16 value)
>> +{
>> +	struct enetc_mdio_regs __iomem *regs =3D bus_to_enetc_regs(bus);
>> +	u32 mdio_ctl, mdio_cfg;
>> +	u16 dev_addr;
>> +	int ret;
>> +
>> +	mdio_cfg =3D MDIO_CFG_CLKDIV(ENETC_MDC_DIV) | MDIO_CFG_NEG;
>
>What does MDIO_CFG_NEG mean?
>

I'll add a comment in the code to clarify this define.
It means the MDIO is driven by master on MDC negative edge, which is how=20
the external mdio busses work on this hardware. For internal MDIO CFG_NEG i=
s 0.

 [...]
>
>Maybe MDIO_CFG_ENC could be called MDIO_CFG_C45? Assuming that is what
>it actually means?
>
You're right, in the hardware manual this bit is actually called "ENC45", s=
o
I'll change the define name to that.  Should be more clear like this.

[...]
>
>It is a good idea to have an mdio node which contains the list of
>PHYs. You can get into odd situations if you don't do that.
>

Hopefully this doesn't complicate things since these are not platform devic=
es.
It's not as easy as adding new platform device driver for mdio...

Ok for the rest of the comments too.
Thanks for the review.

Claudiu
