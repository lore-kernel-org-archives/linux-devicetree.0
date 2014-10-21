From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v2 1/5] phy: berlin-sata: Move PHY_BASE into private data
 struct
Date: Tue, 21 Oct 2014 15:03:25 +0530
Message-ID: <54462865.6000205@ti.com>
References: <1413882477-27922-1-git-send-email-sebastian.hesselbarth@gmail.com> <1413882477-27922-2-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1413882477-27922-2-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: =?UTF-8?B?QW50b2luZSBUw6luYXJ0?= <antoine.tenart@free-electrons.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On Tuesday 21 October 2014 02:37 PM, Sebastian Hesselbarth wrote:
> Currently, Berlin SATA PHY driver assumes PHY_BASE address being
> constant. While this PHY_BASE is correct for BG2Q, older BG2 PHY_BASE
> is different. Prepare the driver for BG2 support by moving the phy_ba=
se
> into private driver data.
>=20
> Acked-by: Antoine T=C3=A9nart <antoine.tenart@free-electrons.com>
> Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com=
>
> ---
> Cc: Kishon Vijay Abraham I <kishon@ti.com>=20
> Cc: "Antoine T=C3=A9nart" <antoine.tenart@free-electrons.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org=20
> ---
>  drivers/phy/phy-berlin-sata.c | 42 ++++++++++++++++++++++++++++-----=
---------
>  1 file changed, 28 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/phy/phy-berlin-sata.c b/drivers/phy/phy-berlin-s=
ata.c
> index 69ced52d72aa..9682b0f66177 100644
> --- a/drivers/phy/phy-berlin-sata.c
> +++ b/drivers/phy/phy-berlin-sata.c
> @@ -30,7 +30,7 @@
>  #define MBUS_WRITE_REQUEST_SIZE_128	(BIT(2) << 16)
>  #define MBUS_READ_REQUEST_SIZE_128	(BIT(2) << 19)
> =20
> -#define PHY_BASE		0x200
> +#define BG2Q_PHY_BASE		0x200
> =20
>  /* register 0x01 */
>  #define REF_FREF_SEL_25		BIT(0)
> @@ -61,15 +61,16 @@ struct phy_berlin_priv {
>  	struct clk		*clk;
>  	struct phy_berlin_desc	**phys;
>  	unsigned		nphys;
> +	u32			phy_base;
>  };
> =20
> -static inline void phy_berlin_sata_reg_setbits(void __iomem *ctrl_re=
g, u32 reg,
> -					       u32 mask, u32 val)
> +static inline void phy_berlin_sata_reg_setbits(void __iomem *ctrl_re=
g,
> +			       u32 phy_base, u32 reg, u32 mask, u32 val)
>  {
>  	u32 regval;
> =20
>  	/* select register */
> -	writel(PHY_BASE + reg, ctrl_reg + PORT_VSR_ADDR);
> +	writel(phy_base + reg, ctrl_reg + PORT_VSR_ADDR);
> =20
>  	/* set bits */
>  	regval =3D readl(ctrl_reg + PORT_VSR_DATA);
> @@ -103,17 +104,20 @@ static int phy_berlin_sata_power_on(struct phy =
*phy)
>  	writel(regval, priv->base + HOST_VSA_DATA);
> =20
>  	/* set PHY mode and ref freq to 25 MHz */
> -	phy_berlin_sata_reg_setbits(ctrl_reg, 0x1, 0xff,
> -				    REF_FREF_SEL_25 | PHY_MODE_SATA);
> +	phy_berlin_sata_reg_setbits(ctrl_reg, priv->phy_base, 0x01,
> +				    0x00ff, REF_FREF_SEL_25 | PHY_MODE_SATA);
> =20
>  	/* set PHY up to 6 Gbps */
> -	phy_berlin_sata_reg_setbits(ctrl_reg, 0x25, 0xc00, PHY_GEN_MAX_6_0)=
;
> +	phy_berlin_sata_reg_setbits(ctrl_reg, priv->phy_base, 0x25,
> +				    0x0c00, PHY_GEN_MAX_6_0);
> =20
>  	/* set 40 bits width */
> -	phy_berlin_sata_reg_setbits(ctrl_reg, 0x23,  0xc00, DATA_BIT_WIDTH_=
40);
> +	phy_berlin_sata_reg_setbits(ctrl_reg, priv->phy_base, 0x23,
> +				    0x0c00, DATA_BIT_WIDTH_40);
> =20
>  	/* use max pll rate */
> -	phy_berlin_sata_reg_setbits(ctrl_reg, 0x2, 0x0, USE_MAX_PLL_RATE);
> +	phy_berlin_sata_reg_setbits(ctrl_reg, priv->phy_base, 0x02,
> +				    0x0000, USE_MAX_PLL_RATE);
> =20
>  	/* set Gen3 controller speed */
>  	regval =3D readl(ctrl_reg + PORT_SCR_CTL);
> @@ -182,9 +186,22 @@ static u32 phy_berlin_power_down_bits[] =3D {
>  	POWER_DOWN_PHY1,
>  };
> =20
> +static u32 bg2q_sata_phy_base =3D BG2Q_PHY_BASE;
> +
> +static const struct of_device_id phy_berlin_sata_of_match[] =3D {
> +	{
> +		.compatible =3D "marvell,berlin2q-sata-phy",
> +		.data =3D &bg2q_sata_phy_base,

Can't the base directly come from dt?

Thanks
Kishon
