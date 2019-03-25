From: Claudiu Manoil <claudiu.manoil@nxp.com>
Subject: RE: [PATCH] ARM: dts: ls1021: Fix SGMII PCS link remaining down after
 PHY disconnect
Date: Mon, 25 Mar 2019 15:26:03 +0000
Message-ID: <VI1PR04MB4880FE626BF9E898FD898495965E0@VI1PR04MB4880.eurprd04.prod.outlook.com>
References: <1553506240-2584-1-git-send-email-vladimir.oltean@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553506240-2584-1-git-send-email-vladimir.oltean@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vladimir Oltean <vladimir.oltean@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "davem@davemloft.net" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

>-----Original Message-----
>From: Vladimir Oltean
>Sent: Monday, March 25, 2019 11:31 AM
>To: shawnguo@kernel.org; Leo Li <leoyang.li@nxp.com>; Claudiu Manoil
><claudiu.manoil@nxp.com>
>Cc: robh+dt@kernel.org; linux-arm-kernel@lists.infradead.org;
>devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
>netdev@vger.kernel.org; davem@davemloft.net; Vladimir Oltean
><vladimir.oltean@nxp.com>
>Subject: [PATCH] ARM: dts: ls1021: Fix SGMII PCS link remaining down after=
 PHY
>disconnect
>
>Each eTSEC MAC has its own TBI (SGMII) PCS and private MDIO bus.
>But due to a DTS oversight, both SGMII-compatible MACs of the LS1021 SoC a=
re
>pointing towards the same internal PCS. Therefore nobody is controlling th=
e
>internal PCS of eTSEC0.
>
>Upon initial ndo_open, the SGMII link is ok by virtue of U-boot initializa=
tion. But
>upon an ifdown/ifup sequence, the code path from ndo_open -> init_phy ->
>gfar_configure_serdes does not get executed for the PCS of eTSEC0 (and is
>executed twice for MAC eTSEC1). So the SGMII link remains down for eTSEC0.
>On the LS1021A-TWR board, to signal this failure condition, the PHY driver=
 keeps
>printing
>'803x_aneg_done: SGMII link is not ok'.
>
>Fixes: 055223d4d22d ("ARM: dts: ls1021a: Enable the eTSEC ports on QDS and
>TWR")
>Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Reviewed-by: Claudiu Manoil <claudiu.manoil@nxp.com>
