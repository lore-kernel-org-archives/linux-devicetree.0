From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v7 3/6] dt-bindings: mailbox: imx-mu: add generic MU
 channel support
Date: Mon, 30 Jul 2018 16:44:35 +0200
Message-ID: <20180730144435.srxgohwgdhrmw2rz@pengutronix.de>
References: <AM0PR04MB42116C756EC78AD12EB254D6802B0@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <CABb+yY0yn9os6nqH8eUfAr3Q3ev4=TfpTp=5ZDBR7FN67eb-wg@mail.gmail.com>
 <VI1PR04MB4222672B8F7B6AF2B11A4442802A0@VI1PR04MB4222.eurprd04.prod.outlook.com>
 <CABb+yY1EkHk85H72xYoYA3JbQL03+-o3UcRVdA_Zub-Q+D=OHw@mail.gmail.com>
 <VI1PR04MB422216469EE5F3ED8E53A4F1802A0@VI1PR04MB4222.eurprd04.prod.outlook.com>
 <CABb+yY0SfdFr8TMOMosTVb5+LFWqB8nQkKj3ze8usi-s7Cko4g@mail.gmail.com>
 <VI1PR04MB4222B4877B341C0FA07A6A8D802A0@VI1PR04MB4222.eurprd04.prod.outlook.com>
 <CABb+yY1MSSQKZ6BOQXC-x=qy4VZ5HqDBjmh_BJTXSkAm3+P8mA@mail.gmail.com>
 <bf7aca98-7ec8-bcf3-b1a8-d86a7cf28d31@pengutronix.de>
 <CABb+yY3PLcjduxm7uJ9xZpPP2zkcQ5Qngs4PjnhGAXp43QVzFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3024000262410653817=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CABb+yY3PLcjduxm7uJ9xZpPP2zkcQ5Qngs4PjnhGAXp43QVzFA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: "A.s. Dong" <aisheng.dong@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, ", linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 srv_heupstream" <linux-mediatek@lists.infradead.org>linux-arm-kernel@lists.infradead.org, ", Sascha Hauer" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org


--===============3024000262410653817==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mmcru3n3kdcljymk"
Content-Disposition: inline


--mmcru3n3kdcljymk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 30, 2018 at 06:34:56PM +0530, Jassi Brar wrote:
> On Mon, Jul 30, 2018 at 1:05 PM, Oleksij Rempel <o.rempel@pengutronix.de>=
 wrote:
> > Hi Aishen, Jassie,
> >
> > i'm lost in this discussion. Please, as soon as I need to add some
> > changes to my patches, notify me. Preferably on top for email.
> >
> I am ok with however you choose to implement, 8 unidirectional or 4
> bidirectional channels or whatever.
>=20
> We just can't have protocol specific s/w modes in the controller drivers.
>=20
> The best solution is to fix the SCU firmware. If that is _really_
> impossible, I provided a solution (3 cells work around). If you have a
> better idea please feel free to propose and implement that.
>=20
> It will also help if you could share the user code of "scu-mode". If
> there is no such code (and we know the driver doesn't respect the
> "scu-mode" property) why do we even have that binding? Maybe drop it.

Tomorrow I have a time slot to address your generic iMX MU suggestions.
So, what is better, uni- or bi-directional channels? Should I implement
*all* (4TX+FIFO, 4RX+FIFO, 4TX-simple, 4RX-simple) channels in this run?
If yes, how should it be reflected in DT?
- 1 cell: &mu [0-15]
- 2 cells: &mu [0-7] [TX,RX]
- 3 cells: &mu [0-4] [FIFO,NOFIFO] [TX,RX]

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--mmcru3n3kdcljymk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAltfJE8ACgkQdQOiSHVI
77RPhwf/RM3ZhKSe4umXa/ynHNMOYnRbgZ/W4S/dIEJsRoVZdptOclcA+RyABpTL
evf0YPA8oGB455mNqvp4s8+EBekPISokWHITxCP4Ebp+OYuVZWPGLhbxOdm3smRo
DG37MpWPR/NkkWdC+kSDLKcZGmXxmp8+qD3m1FxYFhV4ccrAHn/8uNXrctq6mBv/
AHT4RU9A4cG4G47+IgB81fnQMfX0Pyl9UrlBkTC0/i+U4ij9yYLVa5z8u81OdACJ
5xtqpoiXgRiDTlsJq4V+Ag0Mu55NU1B5KyLEOwBIZdYWupFMHGAaJWG8K9Z6U9cZ
0F+6yDyEpbTmI+8F39WxY67S8/qEmw==
=QzL8
-----END PGP SIGNATURE-----

--mmcru3n3kdcljymk--


--===============3024000262410653817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3024000262410653817==--
