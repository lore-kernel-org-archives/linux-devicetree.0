From: Claudiu Manoil <claudiu.manoil@nxp.com>
Subject: RE: [PATCH net-next 2/3] arm64: dts: fsl: ls1028a-rdb: Add ENETC
 external eth ports for the LS1028A RDB board
Date: Thu, 14 Feb 2019 17:00:44 +0000
Message-ID: <VI1PR04MB48800F563F0C76412090459F96670@VI1PR04MB4880.eurprd04.prod.outlook.com>
References: <1550055743-15542-1-git-send-email-claudiu.manoil@nxp.com>
 <1550055743-15542-3-git-send-email-claudiu.manoil@nxp.com>
 <20190213181554.GB708@lunn.ch>
 <VI1PR04MB4880C9EF6C9EBFCAA2209DD596670@VI1PR04MB4880.eurprd04.prod.outlook.com>
 <20190214162746.GI708@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190214162746.GI708@lunn.ch>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Shawn Guo <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "David S . Miller" <davem@davemloft.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandru Marginean <alexandru.marginean@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

>-----Original Message-----
>From: Andrew Lunn <andrew@lunn.ch>
>Sent: Thursday, February 14, 2019 6:28 PM
>To: Claudiu Manoil <claudiu.manoil@nxp.com>
>Cc: Shawn Guo <shawnguo@kernel.org>; Leo Li <leoyang.li@nxp.com>; David S =
.
>Miller <davem@davemloft.net>; devicetree@vger.kernel.org; Alexandru
>Marginean <alexandru.marginean@nxp.com>; linux-kernel@vger.kernel.org;
>linux-arm-kernel@lists.infradead.org; netdev@vger.kernel.org
>Subject: Re: [PATCH net-next 2/3] arm64: dts: fsl: ls1028a-rdb: Add ENETC
>external eth ports for the LS1028A RDB board
>
>> Hi Andrew,
>>
>> The extra node for mdio seems to complicate things somewhat.
>> Just adding this node seems not enough.  How to find out easily if a
>> child of a enetc port node is a mdio node?
>
>You copy somebody else code :-)
>

Provided you find the right thing to copy : ) . Thanks for the hint.
