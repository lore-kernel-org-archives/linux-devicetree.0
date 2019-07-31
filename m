From: Claudiu Manoil <claudiu.manoil@nxp.com>
Subject: RE: [PATCH net-next v4 0/4] enetc: Add mdio bus driver for the PCIe
 MDIO endpoint
Date: Wed, 31 Jul 2019 15:30:10 +0000
Message-ID: <VI1PR04MB48808FF2BC4DBA4A6C32DB2D96DF0@VI1PR04MB4880.eurprd04.prod.outlook.com>
References: <1564479919-18835-1-git-send-email-claudiu.manoil@nxp.com>
        <20190730.094436.855806617449032791.davem@davemloft.net>
 <20190730.095344.401137621326119500.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190730.095344.401137621326119500.davem@davemloft.net>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: "andrew@lunn.ch" <andrew@lunn.ch>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Leo Li <leoyang.li@nxp.com>, Alexandru Marginean <alexandru.marginean@nxp.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

>-----Original Message-----
>From: David Miller <davem@davemloft.net>
>Sent: Tuesday, July 30, 2019 7:54 PM
>To: Claudiu Manoil <claudiu.manoil@nxp.com>
>Cc: andrew@lunn.ch; robh+dt@kernel.org; Leo Li <leoyang.li@nxp.com>;
>Alexandru Marginean <alexandru.marginean@nxp.com>;
>netdev@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
>kernel@lists.infradead.org; linux-kernel@vger.kernel.org
>Subject: Re: [PATCH net-next v4 0/4] enetc: Add mdio bus driver for the PC=
Ie
>MDIO endpoint
>
>From: David Miller <davem@davemloft.net>
>Date: Tue, 30 Jul 2019 09:44:36 -0700 (PDT)
>
>> From: Claudiu Manoil <claudiu.manoil@nxp.com>
>> Date: Tue, 30 Jul 2019 12:45:15 +0300
>>
>>> First patch fixes a sparse issue and cleans up accessors to avoid
>>> casting to __iomem.
>>> Second patch just registers the PCIe endpoint device containing
>>> the MDIO registers as a standalone MDIO bus driver, to allow
>>> an alternative way to control the MDIO bus.  The same code used
>>> by the ENETC ports (eth controllers) to manage MDIO via local
>>> registers applies and is reused.
>>>
>>> Bindings are provided for the new MDIO node, similarly to ENETC
>>> port nodes bindings.
>>>
>>> Last patch enables the ENETC port 1 and its RGMII PHY on the
>>> LS1028A QDS board, where the MDIO muxing configuration relies
>>> on the MDIO support provided in the first patch.
>>  ...
>>
>> Series applied, thank you.
>
>Actually this doesn't compile, I had to revert:
>

Sorry, I overlooked the module part.  Turns out I have to define a separate
module for this driver (mdio), refactor common code between the mdio module
and the enetc-pf module, clean up the Makefile...  and do more checks.
