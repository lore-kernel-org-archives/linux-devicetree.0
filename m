From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v8 4/4] mailbox: Add support for i.MX7D messaging unit
Date: Wed, 1 Aug 2018 10:00:43 +0200
Message-ID: <20180801080043.xzoyz4xijjcxlaid@pengutronix.de>
References: <20180731141146.10788-1-o.rempel@pengutronix.de>
 <20180731141146.10788-5-o.rempel@pengutronix.de>
 <AM0PR04MB42113FA3268A1DA75006702B802D0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2267723956201486305=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <AM0PR04MB42113FA3268A1DA75006702B802D0@AM0PR04MB4211.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "A.s. Dong" <aisheng.dong@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org


--===============2267723956201486305==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="socpfouxmughlwfw"
Content-Disposition: inline


--socpfouxmughlwfw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 01, 2018 at 07:52:43AM +0000, A.s. Dong wrote:
> > -----Original Message-----
> > From: Oleksij Rempel [mailto:o.rempel@pengutronix.de]
> > Sent: Tuesday, July 31, 2018 10:12 PM
> > To: Shawn Guo <shawnguo@kernel.org>; Fabio Estevam
> > <fabio.estevam@nxp.com>; Rob Herring <robh+dt@kernel.org>; Mark
> > Rutland <mark.rutland@arm.com>; A.s. Dong <aisheng.dong@nxp.com>;
> > Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>; Jassi Brar
> > <jassisinghbrar@gmail.com>
> > Cc: Oleksij Rempel <o.rempel@pengutronix.de>; kernel@pengutronix.de;
> > linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org; dl-li=
nux-
> > imx <linux-imx@nxp.com>
> > Subject: [PATCH v8 4/4] mailbox: Add support for i.MX7D messaging unit
> >=20
> > The Mailbox controller is able to send messages (up to 4 32 bit words)
> > between the endpoints.
> >=20
>=20
> I'm not sure but is this still valid after change to multi channels mode?
> We actually lost the HW capability to send messages up to 4 words
> in the multi channels mode.
> And such commit message probably will confuse people.
> Worth a improve?
>=20
> Otherwise this patch mostly is okay to me except a few bits already
> pointed out by Jassi.

Ok, I schedule this task for Thursday or Friday.

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--socpfouxmughlwfw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAlthaKQACgkQdQOiSHVI
77RgBAf+IfWwjwjCUErVFV1t4y1OWZtfmlsLkbfSNrzu6xLfscJToy7A7DoVTs5w
i5fVxS+7e9WkB63SjZGh2bFO+H/EZQhPfmFaEUAM255hLJzWJ0q706QqEsK/lbD7
n9O9ddl8r0iGLCOvty7OfiB1swTCrWl5T+9CkhlJdY0ITFQkDFQ8/87q1xyqjpEi
plRhLa6uPyPssIl6BSp2OL/vuuyMviRK/Z1CVh5gzeGyMqzHBiyzL6C9yl/0Ec+s
ZMg09VS09ziwA6M7WtNYkWbSSlVeJntIV6fFZHTYPOlT77ryH7hhB9NeRIqZZMJF
m8SfbGpDij1mFqO92AikqWU1yKXC5g==
=y2wv
-----END PGP SIGNATURE-----

--socpfouxmughlwfw--


--===============2267723956201486305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2267723956201486305==--
