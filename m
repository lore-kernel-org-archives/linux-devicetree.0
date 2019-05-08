Return-Path: <SRS0=DUED=TI=pengutronix.de=mkl@kernel.org>
Subject: Re: [PATCH V7 RESEND 04/10] can: mcp25xxfd: Add Microchip mcp25xxfd
 CAN FD driver
References: <20190419051432.13538-1-kernel@martin.sperl.org>
 <20190419051432.13538-5-kernel@martin.sperl.org>
From: Marc Kleine-Budde <mkl@pengutronix.de>
Message-ID: <9fe8a9bf-954e-e203-7b81-57b9460046fd@pengutronix.de>
Date: Wed, 8 May 2019 15:12:49 +0200
MIME-Version: 1.0
In-Reply-To: <20190419051432.13538-5-kernel@martin.sperl.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="9AWvklFo50bWruUHCyXyGo0NdmJc7QdPD"
To: kernel@martin.sperl.org, linux-can@vger.kernel.org, devicetree@vger.kernel.org, Wolfgang Grandegger <wg@grandegger.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9AWvklFo50bWruUHCyXyGo0NdmJc7QdPD
Content-Type: multipart/mixed; boundary="ds4ILGG6wmir7tnpuOKgh4HNhNjCI4CsP";
 protected-headers="v1"
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: kernel@martin.sperl.org, linux-can@vger.kernel.org,
 devicetree@vger.kernel.org, Wolfgang Grandegger <wg@grandegger.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Message-ID: <9fe8a9bf-954e-e203-7b81-57b9460046fd@pengutronix.de>
Subject: Re: [PATCH V7 RESEND 04/10] can: mcp25xxfd: Add Microchip mcp25xxfd
 CAN FD driver
References: <20190419051432.13538-1-kernel@martin.sperl.org>
 <20190419051432.13538-5-kernel@martin.sperl.org>
In-Reply-To: <20190419051432.13538-5-kernel@martin.sperl.org>

--ds4ILGG6wmir7tnpuOKgh4HNhNjCI4CsP
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

On 4/19/19 7:14 AM, kernel@martin.sperl.org wrote:
> From: Martin Sperl <kernel@martin.sperl.org>
>=20
> Add un-optimized Can2.0 and CanFD support.
>=20
> CAN-Transmission and Optimizations and are separate patches
>=20
> On a Rasperry pi 3 it is already able to process Can2.0 Frames
> with DLC=3D0 on a CAN bus with 1MHz. without losing any packets
> on the SPI side. Packets still get lost inside the network stack.
>=20
> Signed-off-by: Martin Sperl <kernel@martin.sperl.org>

[..]

> diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.c b/drivers/ne=
t/can/spi/mcp25xxfd/mcp25xxfd_can.c
> index f98b02ff057b..eabd7ca50645 100644
> --- a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.c
> +++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.c
> @@ -38,23 +38,162 @@
>   * for timestamping of RX frames as well as for TEF entries.
>   */
>=20
> -/* Implementation notes:
> - *
> - * Right now we only use the CAN controller block to put us into deep =
sleep
> - * this means that the oscillator clock is turned off.
> - * So this is the only thing that we implement here right now
> - */
> -
> +#include <linux/can/core.h>
> +#include <linux/can/dev.h>
>  #include <linux/device.h>
> +#include <linux/interrupt.h>
>  #include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/spi/spi.h>
>=20
> +#include "mcp25xxfd_base.h"
> +#include "mcp25xxfd_can_debugfs.h"
> +#include "mcp25xxfd_can_fifo.h"
> +#include "mcp25xxfd_can_int.h"
> +#include "mcp25xxfd_can_priv.h"
>  #include "mcp25xxfd_clock.h"
>  #include "mcp25xxfd_cmd.h"
> +#include "mcp25xxfd_int.h"
>  #include "mcp25xxfd_priv.h"
>  #include "mcp25xxfd_regs.h"
>=20
> -static int mcp25xxfd_can_get_mode(struct mcp25xxfd_priv *priv, u32 *re=
g)
> +#include <uapi/linux/can/netlink.h>
> +
> +/* module parameters */
> +unsigned int bw_sharing_log2bits;
> +module_param(bw_sharing_log2bits, uint, 0664);
> +MODULE_PARM_DESC(bw_sharing_log2bits,
> +		 "Delay between 2 transmissions in number of arbitration bit times\n=
");
> +bool enable_edge_filter;
> +module_param(enable_edge_filter, bool, 0664);
> +MODULE_PARM_DESC(enable_edge_filter,
> +		 "Enable ISO11898-1:2015 edge_filtering");
> +unsigned int tdc_mode =3D 2;
> +module_param(tdc_mode, uint, 0664);
> +MODULE_PARM_DESC(tdc_mode,
> +		 "Transmitter Delay Mode - 0 =3D disabled, 1 =3D fixed, 2 =3D auto\n=
");
> +unsigned int tdc_value;
> +module_param(tdc_value, uint, 0664);
> +MODULE_PARM_DESC(tdc_value,
> +		 "Transmission Delay Value - range: [0:63] SCLK");
> +int tdc_offset =3D 64; /* outside of range to use computed values */
> +module_param(tdc_offset, int, 0664);
> +MODULE_PARM_DESC(tdc_offset,
> +		 "Transmission Delay offset - range: [-64:63] SCLK");
> +
> +/* everything related to bit timing */
> +static
> +const struct can_bittiming_const mcp25xxfd_can_nominal_bittiming_const=
 =3D {
> +	.name           =3D DEVICE_NAME,
> +	.tseg1_min      =3D 2,
> +	.tseg1_max      =3D BIT(MCP25XXFD_CAN_NBTCFG_TSEG1_BITS),
> +	.tseg2_min      =3D 1,
> +	.tseg2_max      =3D BIT(MCP25XXFD_CAN_NBTCFG_TSEG2_BITS),
> +	.sjw_max        =3D BIT(MCP25XXFD_CAN_NBTCFG_SJW_BITS),
> +	.brp_min        =3D 1,
> +	.brp_max        =3D BIT(MCP25XXFD_CAN_NBTCFG_BRP_BITS),
> +	.brp_inc        =3D 1,
> +};
> +
> +static
> +const struct can_bittiming_const mcp25xxfd_can_data_bittiming_const =3D=
 {
> +	.name           =3D DEVICE_NAME,
> +	.tseg1_min      =3D 1,
> +	.tseg1_max      =3D BIT(MCP25XXFD_CAN_DBTCFG_TSEG1_BITS),
> +	.tseg2_min      =3D 1,
> +	.tseg2_max      =3D BIT(MCP25XXFD_CAN_DBTCFG_TSEG2_BITS),
> +	.sjw_max        =3D BIT(MCP25XXFD_CAN_DBTCFG_SJW_BITS),
> +	.brp_min        =3D 1,
> +	.brp_max        =3D BIT(MCP25XXFD_CAN_DBTCFG_BRP_BITS),
> +	.brp_inc        =3D 1,
> +};
> +
> +static int mcp25xxfd_can_do_set_nominal_bittiming(struct net_device *n=
et)
> +{
> +	struct mcp25xxfd_can_priv *cpriv =3D netdev_priv(net);
> +	struct can_bittiming *bt =3D &cpriv->can.bittiming;
> +
> +	int sjw =3D bt->sjw;
> +	int pseg2 =3D bt->phase_seg2;
> +	int pseg1 =3D bt->phase_seg1;
> +	int propseg =3D bt->prop_seg;
> +	int brp =3D bt->brp;
> +
> +	int tseg1 =3D propseg + pseg1;
> +	int tseg2 =3D pseg2;
> +
> +	/* calculate nominal bit timing */
> +	cpriv->regs.nbtcfg =3D ((sjw - 1) << MCP25XXFD_CAN_NBTCFG_SJW_SHIFT) =
|
> +		((tseg2 - 1) << MCP25XXFD_CAN_NBTCFG_TSEG2_SHIFT) |
> +		((tseg1 - 1) << MCP25XXFD_CAN_NBTCFG_TSEG1_SHIFT) |
> +		((brp - 1) << MCP25XXFD_CAN_NBTCFG_BRP_SHIFT);
> +
> +	return mcp25xxfd_cmd_write(cpriv->priv->spi, MCP25XXFD_CAN_NBTCFG,
> +				   cpriv->regs.nbtcfg);
> +}
> +
> +static int mcp25xxfd_can_do_set_data_bittiming(struct net_device *net)=

> +{
> +	struct mcp25xxfd_can_priv *cpriv =3D netdev_priv(net);
> +	struct mcp25xxfd_priv *priv =3D cpriv->priv;
> +	struct can_bittiming *bt =3D &cpriv->can.data_bittiming;
> +	struct spi_device *spi =3D priv->spi;
> +
> +	int sjw =3D bt->sjw;
> +	int pseg2 =3D bt->phase_seg2;
> +	int pseg1 =3D bt->phase_seg1;
> +	int propseg =3D bt->prop_seg;
> +	int brp =3D bt->brp;
> +
> +	int tseg1 =3D propseg + pseg1;
> +	int tseg2 =3D pseg2;
> +
> +	int tdco;
> +	int ret;
> +
> +	/* set up Transmitter delay compensation */
> +	cpriv->regs.tdc =3D 0;
> +	/* configure TDC mode */
> +	if (tdc_mode < 4)
> +		cpriv->regs.tdc =3D tdc_mode << MCP25XXFD_CAN_TDC_TDCMOD_SHIFT;
> +	else
> +		cpriv->regs.tdc =3D MCP25XXFD_CAN_TDC_TDCMOD_AUTO <<
> +			MCP25XXFD_CAN_TDC_TDCMOD_SHIFT;
> +
> +	/* configure TDC offsets */
> +	if ((tdc_offset >=3D -64) && tdc_offset < 64)
> +		tdco =3D tdc_offset;
> +	else
> +		tdco =3D clamp_t(int, bt->brp * tseg1, -64, 63);
> +	cpriv->regs.tdc |=3D (tdco << MCP25XXFD_CAN_TDC_TDCO_SHIFT) &
> +		MCP25XXFD_CAN_TDC_TDCO_MASK;
> +
> +	/* configure TDC value */
> +	if (tdc_value < 64)
> +		cpriv->regs.tdc |=3D tdc_value << MCP25XXFD_CAN_TDC_TDCV_SHIFT;
> +
> +	/* enable edge filtering */
> +	if (enable_edge_filter)
> +		cpriv->regs.tdc |=3D MCP25XXFD_CAN_TDC_EDGFLTEN;
> +
> +	/* set TDC */
> +	ret =3D mcp25xxfd_cmd_write(spi, MCP25XXFD_CAN_TDC, cpriv->regs.tdc);=

> +	if (ret)
> +		return ret;
> +
> +	/* calculate data bit timing */
> +	cpriv->regs.dbtcfg =3D ((sjw - 1) << MCP25XXFD_CAN_DBTCFG_SJW_SHIFT) =
|
> +		((tseg2 - 1) << MCP25XXFD_CAN_DBTCFG_TSEG2_SHIFT) |
> +		((tseg1 - 1) << MCP25XXFD_CAN_DBTCFG_TSEG1_SHIFT) |
> +		((brp - 1) << MCP25XXFD_CAN_DBTCFG_BRP_SHIFT);
> +
> +	return mcp25xxfd_cmd_write(spi, MCP25XXFD_CAN_DBTCFG,
> +				   cpriv->regs.dbtcfg);
> +}
> +
> +int mcp25xxfd_can_get_mode(struct mcp25xxfd_priv *priv, u32 *reg)
>  {
>  	int ret;
>=20
> @@ -66,11 +205,11 @@ static int mcp25xxfd_can_get_mode(struct mcp25xxfd=
_priv *priv, u32 *reg)
>  		MCP25XXFD_CAN_CON_OPMOD_SHIFT;
>  }
>=20
> -static int mcp25xxfd_can_switch_mode(struct mcp25xxfd_priv *priv,
> -				     u32 *reg, int mode)
> +int mcp25xxfd_can_switch_mode_no_wait(struct mcp25xxfd_priv *priv,
> +				      u32 *reg, int mode)
>  {
>  	u32 dummy;
> -	int ret, i;
> +	int ret;
>=20
>  	/* get the current mode/register - if reg is NULL
>  	 * when the can controller is not setup yet
> @@ -78,9 +217,11 @@ static int mcp25xxfd_can_switch_mode(struct mcp25xx=
fd_priv *priv,
>  	 * (this only happens during initialization phase)
>  	 */
>  	if (reg) {
> -		ret =3D mcp25xxfd_can_get_mode(priv, reg);
> -		if (ret < 0)
> -			return ret;
> +		if (!reg) {
> +			ret =3D mcp25xxfd_can_get_mode(priv, reg);
> +			if (ret < 0)
> +				return ret;
> +		}

After this patch the function reads:

> static int mcp25xxfd_can_switch_mode_no_wait(struct mcp25xxfd_priv *pri=
v,
> 					     u32 *reg, int mode)
> {
> 	u32 dummy;
> 	int ret;
>=20
> 	/* get the current mode/register - if reg is NULL
> 	 * when the can controller is not setup yet
> 	 * typically by calling mcp25xxfd_can_sleep_mode
> 	 * (this only happens during initialization phase)
> 	 */
> 	if (reg) {
> 		if (!reg) {

This looks wrong.

> 			ret =3D mcp25xxfd_can_get_mode(priv, reg);
> 			if (ret < 0)
> 				return ret;
> 		}
> 	} else {
> 		/* alternatively use dummy */
> 		dummy =3D 0;
> 		reg =3D &dummy;
> 	}
>=20

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--ds4ILGG6wmir7tnpuOKgh4HNhNjCI4CsP--

--9AWvklFo50bWruUHCyXyGo0NdmJc7QdPD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEmvEkXzgOfc881GuFWsYho5HknSAFAlzS1dEACgkQWsYho5Hk
nSCDyAgAsuFM0m3Y5vshjetwsmxPMq7F3ALb1CuXSblkItda+S3XF8veJiWUW8ZH
P0NhJ71AkD53LG7Wg/VOFdRTYqfQIXpapQrP724qzyrriyn+CzxBtrdgTcM+D/2o
nMQCT9wWiYr5p2Sja+a6ZY9Fa/c+9aNvjV76O2Oz8/X/FVuhSODaWoEFOHS4G+fw
r12D/xVmAoTDHzS9FVUY7GDSupFm0KED8TySCdGc/IduDFW/aS9UIGTaexWyWOAv
YsAgE/NFQL1YmE4sxtrCdbdBObSSTm+k7x9gjrborTW7UUtwN4VHOsx284WyprrW
RKn9pPFV5ZpWRW5d+RZzKDp0jdpS5A==
=dRB+
-----END PGP SIGNATURE-----

--9AWvklFo50bWruUHCyXyGo0NdmJc7QdPD--
