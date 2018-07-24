From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v6 5/5] mailbox: Add support for i.MX7D messaging unit
Date: Tue, 24 Jul 2018 06:38:53 +0200
Message-ID: <20270a57-6784-327a-e0c1-cb01c8eb5496@pengutronix.de>
References: <20180722063923.30222-1-o.rempel@pengutronix.de>
 <20180722063923.30222-6-o.rempel@pengutronix.de>
 <846bb908-f75e-1988-8f30-e49a537c7969@mleia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5707920935938734014=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <846bb908-f75e-1988-8f30-e49a537c7969@mleia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vladimir Zapolskiy <vz@mleia.com>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "A.s. Dong" <aisheng.dong@nxp.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============5707920935938734014==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vHmXiWmkdjGiGQxIQBPL3HWmIKso6XhV7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vHmXiWmkdjGiGQxIQBPL3HWmIKso6XhV7
Content-Type: multipart/mixed; boundary="CKXrHrVFuZaZ7viRjAjFz6DQwnTUcTUSU";
 protected-headers="v1"
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Vladimir Zapolskiy <vz@mleia.com>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, "A.s. Dong" <aisheng.dong@nxp.com>,
 Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de, dl-linux-imx <linux-imx@nxp.com>
Message-ID: <20270a57-6784-327a-e0c1-cb01c8eb5496@pengutronix.de>
Subject: Re: [PATCH v6 5/5] mailbox: Add support for i.MX7D messaging unit
References: <20180722063923.30222-1-o.rempel@pengutronix.de>
 <20180722063923.30222-6-o.rempel@pengutronix.de>
 <846bb908-f75e-1988-8f30-e49a537c7969@mleia.com>
In-Reply-To: <846bb908-f75e-1988-8f30-e49a537c7969@mleia.com>

--CKXrHrVFuZaZ7viRjAjFz6DQwnTUcTUSU
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 24.07.2018 01:31, Vladimir Zapolskiy wrote:
> Hi Oleksij,
>=20
> On 07/22/2018 09:39 AM, Oleksij Rempel wrote:
>> The Mailbox controller is able to send messages (up to 4 32 bit words)=

>> between the endpoints.
>>
>> This driver was tested using the mailbox-test driver sending messages
>> between the Cortex-A7 and the Cortex-M4.
>>
>> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
>> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>=20
> [snip]
>=20
>> +static int imx_mu_startup(struct mbox_chan *chan)
>> +{
>> +	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
>> +	struct imx_mu_con_priv *cp =3D chan->con_priv;
>> +	int ret;
>> +
>> +	cp->irq_desc =3D devm_kasprintf(priv->dev, GFP_KERNEL, "imx_mu_chan[=
%i]",
>> +				      cp->idx);
>> +	if (!cp->irq_desc)
>> +		return -ENOMEM;
>> +
>=20
> Again I would suggest to move this allocation to the loop in .probe fun=
ction.

Why? In my case I use 2 channels. Why should I allocate 4 descriptors
for using only 2 of them?

The SCU driver will use only one channel...

> [snip]
>=20
>> +
>> +	for (i =3D 0; i < IMX_MU_CHANS; i++) {
>> +		struct imx_mu_con_priv *cp =3D &priv->con_priv[i];
>> +
>> +		cp->idx =3D i;
>> +		cp->irq =3D irq;
>=20
> ^^^^ right over here.
>=20
>> +		priv->mbox_chans[i].con_priv =3D cp;
>> +	}
>> +
>=20
> please feel free to add my technical side review tag to the next versio=
n:
>=20
> Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
>=20
> FWIW I find that review comments from Lucas are pretty valid, I would
> recommend to incorporate them.

Ok


--CKXrHrVFuZaZ7viRjAjFz6DQwnTUcTUSU--

--vHmXiWmkdjGiGQxIQBPL3HWmIKso6XhV7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAltWrV0ACgkQdQOiSHVI
77SKIQgAmIK1soux+egSn59B2qr86M9je6ZtZg8R/PbbHr7nuuaVMifGv7yBe6Nz
L8QtIX9owKWx/AM1PIvakCP2CRbCvnjRpeZdn67QYrXe6uPiR2QdGMT+Y7wYob4x
vpB1z70JRsZwki6xLfoH9wLvAd1/Bh6aNePXs/XZr3N0oQ5PXrurf8jnwO+qWwa7
nyDr+k44CTrclR+khJVGYSbaQeo4w5ZL+H1XYqTf16T2+o2NuLnTWYmeUsmD+5HH
9QsBfm1Cg+iw2vb/iyD/6smevv5zG/fj0jQjkzxqvOJs5+gya2Kib5YQmGlC/sZB
qxmHaTzRpYbhv+Q0t+96lGMlIvv+vw==
=lDjU
-----END PGP SIGNATURE-----

--vHmXiWmkdjGiGQxIQBPL3HWmIKso6XhV7--


--===============5707920935938734014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5707920935938734014==--
