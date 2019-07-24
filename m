From: Claudiu Manoil <claudiu.manoil@nxp.com>
Subject: RE: [PATCH net-next 1/3] enetc: Add mdio bus driver for the PCIe MDIO
 endpoint
Date: Wed, 24 Jul 2019 12:57:34 +0000
Message-ID: <VI1PR04MB48805982F057B8DE4DF9FCAE96C60@VI1PR04MB4880.eurprd04.prod.outlook.com>
References: <1563894955-545-1-git-send-email-claudiu.manoil@nxp.com>
 <1563894955-545-2-git-send-email-claudiu.manoil@nxp.com>
 <20190723222454.GE13517@lunn.ch>
 <VI1PR04MB4880DAE881769F6DC845CEEF96C60@VI1PR04MB4880.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <VI1PR04MB4880DAE881769F6DC845CEEF96C60@VI1PR04MB4880.eurprd04.prod.outlook.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Claudiu Manoil <claudiu.manoil@nxp.com>, Andrew Lunn <andrew@lunn.ch>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Alexandru Marginean <alexandru.marginean@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



>-----Original Message-----
>From: netdev-owner@vger.kernel.org <netdev-owner@vger.kernel.org> On
>Behalf Of Claudiu Manoil
>Sent: Wednesday, July 24, 2019 12:53 PM
>To: Andrew Lunn <andrew@lunn.ch>
>Cc: David S . Miller <davem@davemloft.net>; devicetree@vger.kernel.org;
>netdev@vger.kernel.org; Alexandru Marginean
><alexandru.marginean@nxp.com>; linux-kernel@vger.kernel.org; Leo Li
><leoyang.li@nxp.com>; Rob Herring <robh+dt@kernel.org>; linux-arm-
>kernel@lists.infradead.org
>Subject: RE: [PATCH net-next 1/3] enetc: Add mdio bus driver for the PCIe MDIO
>endpoint
>
>>-----Original Message-----
>>From: Andrew Lunn <andrew@lunn.ch>
>>Sent: Wednesday, July 24, 2019 1:25 AM
>>To: Claudiu Manoil <claudiu.manoil@nxp.com>
>>Cc: David S . Miller <davem@davemloft.net>; devicetree@vger.kernel.org;
>>netdev@vger.kernel.org; Alexandru Marginean
>><alexandru.marginean@nxp.com>; linux-kernel@vger.kernel.org; Leo Li
>><leoyang.li@nxp.com>; Rob Herring <robh+dt@kernel.org>; linux-arm-
>>kernel@lists.infradead.org
>>Subject: Re: [PATCH net-next 1/3] enetc: Add mdio bus driver for the
>>PCIe MDIO endpoint
>>
>>> +	bus = mdiobus_alloc_size(sizeof(u32 *));
>>> +	if (!bus)
>>> +		return -ENOMEM;
>>> +
>>
>>> +	bus->priv = pci_iomap_range(pdev, 0, ENETC_MDIO_REG_OFFSET, 0);
>>
>>This got me confused for a while. You allocate space for a u32 pointer.
>>bus->priv will point to this space. However, you are not using this
>>space, you {ab}use the pointer to directly hold the return from
>>pci_iomap_range(). This works, but sparse is probably unhappy, and you
>>are wasting the space the u32 pointer takes.
>>
>
>Thanks Andrew,
>This is not what I wanted to do, don't ask me how I got to this, it's confusing
>indeed.
>What's needed here is mdiobus_alloc() or better, devm_mdiobus_alloc().
>I've got to do some cleanup in the local mdio bus probing too.
>Will send v2.
>

This is tricky actually, mdiobus_alloc won't do it, I still need to allocate space
for the pointer.
So it's not ok to store the register space pointer directly into priv
(even if iomap returns void *), it's unusual.
Looks like I will have to use double pointers!
