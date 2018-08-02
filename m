From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v9 4/4] mailbox: Add support for i.MX messaging unit
Date: Thu, 2 Aug 2018 11:47:03 +0200
Message-ID: <df93c03d-a982-2aa4-f3eb-11caa4817dab@pengutronix.de>
References: <20180802072325.22991-1-o.rempel@pengutronix.de>
 <20180802072325.22991-5-o.rempel@pengutronix.de>
 <4d6931be-8caa-5168-d980-40dbe949386c@mentor.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8407279775892903948=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4d6931be-8caa-5168-d980-40dbe949386c@mentor.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "A.s. Dong" <aisheng.dong@nxp.com>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8407279775892903948==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="nE242v8rcWKwgcYRq8ybSBnAsasKdmjWN"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nE242v8rcWKwgcYRq8ybSBnAsasKdmjWN
Content-Type: multipart/mixed; boundary="oOMnUAZtk18bdTWk8507UCMkyG89187FT";
 protected-headers="v1"
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 "A.s. Dong" <aisheng.dong@nxp.com>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, dl-linux-imx <linux-imx@nxp.com>
Message-ID: <df93c03d-a982-2aa4-f3eb-11caa4817dab@pengutronix.de>
Subject: Re: [PATCH v9 4/4] mailbox: Add support for i.MX messaging unit
References: <20180802072325.22991-1-o.rempel@pengutronix.de>
 <20180802072325.22991-5-o.rempel@pengutronix.de>
 <4d6931be-8caa-5168-d980-40dbe949386c@mentor.com>
In-Reply-To: <4d6931be-8caa-5168-d980-40dbe949386c@mentor.com>

--oOMnUAZtk18bdTWk8507UCMkyG89187FT
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Vladimir,

thank you for review.

Jassi, Dong, any other comments? If no, i'll send tomorrow updated versio=
n.

On 02.08.2018 09:54, Vladimir Zapolskiy wrote:
> Hi Oleksij,
>=20
> two more nitpickings fro my side.
>=20
> On 08/02/2018 10:23 AM, Oleksij Rempel wrote:
>> The i.MX Messaging Unit is a two side block which allows applications
>> implement communication over this sides.
>>
>> The MU includes the following features:
>> - Messaging control by interrupts or by polling
>> - Four general-purpose interrupt requests reflected to the other side
>> - Three general-purpose flags reflected to the other side
>> - Four receive registers with maskable interrupt
>> - Four transmit registers with maskable interrupt
>>
>> Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
>> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
>> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>=20
> [snip]
>=20
>> +static irqreturn_t imx_mu_isr(int irq, void *p)
>> +{
>> +	struct mbox_chan *chan =3D p;
>> +	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
>> +	struct imx_mu_con_priv *cp =3D chan->con_priv;
>> +	u32 val, ctrl, dat;
>> +
>> +	ctrl =3D imx_mu_read(priv, IMX_MU_xCR);
>> +	val =3D imx_mu_read(priv, IMX_MU_xSR);
>> +
>> +	switch (cp->type) {
>> +	case IMX_MU_TYPE_TX:
>> +		val &=3D IMX_MU_xSR_TEn(cp->idx) &
>> +			(ctrl & IMX_MU_xCR_TIEn(cp->idx));
>> +		break;
>> +	case IMX_MU_TYPE_RX:
>> +		val &=3D IMX_MU_xSR_RFn(cp->idx) &
>> +			(ctrl & IMX_MU_xCR_RIEn(cp->idx));
>> +		break;
>> +	case IMX_MU_TYPE_RXDB:
>> +		val &=3D IMX_MU_xSR_GIPn(cp->idx) &
>> +			(ctrl & IMX_MU_xCR_GIEn(cp->idx));
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +
>> +	if (!val) {
>> +		return IRQ_NONE;
>> +	} else if (val =3D=3D IMX_MU_xSR_TEn(cp->idx)) {
>=20
> Please drop the 'else' branch above.
>=20
> Here you can either just start from a new 'if', or all together drop 'i=
f (!val)'
> and return IRQ_NONE at the end of the if-else construction.
>=20
>> +		imx_mu_xcr_rmw(priv, 0, IMX_MU_xCR_TIEn(cp->idx));
>> +		mbox_chan_txdone(chan, 0);
>> +	} else if (val =3D=3D IMX_MU_xSR_RFn(cp->idx)) {
>> +		dat =3D imx_mu_read(priv, IMX_MU_xRRn(cp->idx));
>> +		mbox_chan_received_data(chan, (void *)&dat);
>> +	} else if (val =3D=3D IMX_MU_xSR_GIPn(cp->idx)) {
>> +		imx_mu_write(priv, IMX_MU_xSR_GIPn(cp->idx), IMX_MU_xSR);
>> +		mbox_chan_received_data(chan, NULL);
>> +	} else {
>> +		dev_warn_ratelimited(priv->dev, "Not handled interrupt\n");
>> +		return IRQ_NONE;
>> +	}
>> +
>> +	return IRQ_HANDLED;
>> +}
>=20
> [snip]
>=20
>> +	for (i =3D 0; i < IMX_MU_CHANS; i++) {
>> +		struct imx_mu_con_priv *cp =3D &priv->con_priv[i];
>> +
>> +		cp->idx =3D i % 4;
>> +		cp->type =3D (i - cp->idx) >> 2;
>=20
> cp->type =3D i >> 2;
>=20
>> +		cp->chan =3D &priv->mbox_chans[i];
>> +		priv->mbox_chans[i].con_priv =3D cp;
>> +		snprintf(cp->irq_desc, sizeof(cp->irq_desc),
>> +			 "imx_mu_chan[%i-%i]", cp->type, cp->idx);
>> +	}
>> +
>> +	priv->side_b =3D of_property_read_bool(np, "fsl,mu-side-b");
>> +
>> +	spin_lock_init(&priv->xcr_lock);
>> +
>> +	priv->mbox.dev =3D dev;
>> +	priv->mbox.ops =3D &imx_mu_ops;
>> +	priv->mbox.chans =3D priv->mbox_chans;
>> +	priv->mbox.num_chans =3D IMX_MU_CHANS;
>> +	priv->mbox.of_xlate =3D imx_mu_xlate;
>> +	priv->mbox.txdone_irq =3D true;
>> +
>> +	platform_set_drvdata(pdev, priv);
>> +
>> +	imx_mu_init_generic(priv);
>> +
>> +	return mbox_controller_register(&priv->mbox);
>> +}
>=20
> --
> Best wishes,
> Vladimir
>=20


--oOMnUAZtk18bdTWk8507UCMkyG89187FT--

--nE242v8rcWKwgcYRq8ybSBnAsasKdmjWN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAlti0xgACgkQdQOiSHVI
77SAlQf/VJfxkvrIdAe50xbV32bSGkH9Jy7y+X8VURcrjylapc8XW/M9muUjMdV9
8JbQAKWfj32+MSNwDyoY6Jgx7GbX+Qk+7LtFjQgzR4tlg2DvQcseP4oUGB8vXHG5
f9y3wfGKB847uEZmQ9t5oRERDiU6SLZ7P/Y8ylM51JHdhfDB+NJSWO/bYiU7b8ff
lQZS/HOxB7yByDIdOH8BlbFUifr99+FXrFerlBYNcKIbk0MPPqAC16N9IPwLW51y
Y3DvopMVZYRNTzHryWhyl7HmloFNBAGv6N4vl4TSOwjD/rGxIWat/k9pbX4d6yLa
SYU+l5/xUV0hpjWnYlqHp2JgkoUwQg==
=OaQV
-----END PGP SIGNATURE-----

--nE242v8rcWKwgcYRq8ybSBnAsasKdmjWN--


--===============8407279775892903948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8407279775892903948==--
