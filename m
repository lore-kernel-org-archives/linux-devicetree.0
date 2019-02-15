From: Claudiu Manoil <claudiu.manoil@nxp.com>
Subject: RE: [PATCH net-next v2 3/3] enetc: Add ENETC PF level external MDIO
 support
Date: Fri, 15 Feb 2019 14:41:47 +0000
Message-ID: <VI1PR04MB488080895C871B6B3ABA571D96600@VI1PR04MB4880.eurprd04.prod.outlook.com>
References: <1550225414-12125-1-git-send-email-claudiu.manoil@nxp.com>
 <1550225414-12125-4-git-send-email-claudiu.manoil@nxp.com>
 <20190215133459.GH5699@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190215133459.GH5699@lunn.ch>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Shawn Guo <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "David S . Miller" <davem@davemloft.net>, Alexandru Marginean <alexandru.marginean@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



>-----Original Message-----
>From: Andrew Lunn <andrew@lunn.ch>
>Sent: Friday, February 15, 2019 3:35 PM
>To: Claudiu Manoil <claudiu.manoil@nxp.com>
>Cc: Shawn Guo <shawnguo@kernel.org>; Leo Li <leoyang.li@nxp.com>; David S =
.
>Miller <davem@davemloft.net>; Alexandru Marginean
><alexandru.marginean@nxp.com>; linux-arm-kernel@lists.infradead.org;
>devicetree@vger.kernel.org; netdev@vger.kernel.org; linux-
>kernel@vger.kernel.org
>Subject: Re: [PATCH net-next v2 3/3] enetc: Add ENETC PF level external MD=
IO
>support
>
>On Fri, Feb 15, 2019 at 12:10:14PM +0200, Claudiu Manoil wrote:
>> Each ENETC PF has its own MDIO interface, the corresponding
>> MDIO registers are mapped in the ENETC's Port register block.
>> The current patch adds a driver for these PF level MDIO buses,
>> so that each PF can manage directly its own external link.
>>
>> Signed-off-by: Alex Marginean <alexandru.marginean@nxp.com>
>> Signed-off-by: Claudiu Manoil <claudiu.manoil@nxp.com>
>> ---
>> v2 - used readx_poll_timeout()
>>    - added mdio node child to the port node
>
>Hi Claudiu
>
>Please document this in the device tree binding.
>

Hi,
I don't really see what bindings would need to be documented, as the node
names and properties used so far are common.  Like, the "mdio" node name
is common, the enetc ports are "pci" nodes, nothing special for these.
What's missing?

Regards,
Claudiu
