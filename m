From: Florian Fainelli <florian@openwrt.org>
Subject: Re: [PATCH] of/mdio: fix fixed link bus name
Date: Mon, 27 Feb 2012 15:46:32 +0100
Message-ID: <4F4B9748.8020509@openwrt.org>
References: <8ebe6a3f11343c392a7353581d5f648980206e8e.1330346765.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <8ebe6a3f11343c392a7353581d5f648980206e8e.1330346765.git.baruch@tkos.co.il>
Sender: netdev-owner@vger.kernel.org
To: Baruch Siach <baruch@tkos.co.il>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org, netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org



Le 02/27/12 13:48, Baruch Siach a =C3=A9crit :
> Since 9e6c643b (phy/fixed: use an unique MDIO bus name) the name of t=
he fixed
> PHY bus is "fixed-0". Teach of_phy_connect_fixed_link() the new name.
>
> Tested on a P1020RDB PowerPC system.
>
> Signed-off-by: Baruch Siach<baruch@tkos.co.il>

Acked-by: Florian Fainelli <florian@openwrt.org>

> ---
>   drivers/of/of_mdio.c |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/of/of_mdio.c b/drivers/of/of_mdio.c
> index 980c079..483c0ad 100644
> --- a/drivers/of/of_mdio.c
> +++ b/drivers/of/of_mdio.c
> @@ -182,7 +182,7 @@ struct phy_device *of_phy_connect_fixed_link(stru=
ct net_device *dev,
>   	if (!phy_id || sz<  sizeof(*phy_id))
>   		return NULL;
>
> -	sprintf(bus_id, PHY_ID_FMT, "0", be32_to_cpu(phy_id[0]));
> +	sprintf(bus_id, PHY_ID_FMT, "fixed-0", be32_to_cpu(phy_id[0]));
>
>   	phy =3D phy_connect(dev, bus_id, hndlr, 0, iface);
>   	return IS_ERR(phy) ? NULL : phy;
