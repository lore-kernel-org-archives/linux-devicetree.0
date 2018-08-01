From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v8 2/4] dt-bindings: mailbox: imx-mu: add generic MU
 channel support
Date: Wed, 1 Aug 2018 07:05:30 +0200
Message-ID: <20180801050530.nzmomvvyo5pfwclz@pengutronix.de>
References: <20180731141146.10788-1-o.rempel@pengutronix.de>
 <20180731141146.10788-3-o.rempel@pengutronix.de>
 <CABb+yY1ZusgN4UVxmUgXZS9ObGdLwFAL4XkW7F1yVb6Gq=9XPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6133834961581618147=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CABb+yY1ZusgN4UVxmUgXZS9ObGdLwFAL4XkW7F1yVb6Gq=9XPA@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "A.s. Dong" <aisheng.dong@nxp.com>, Devicetree List <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, ", linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 srv_heupstream" <linux-arm-kernel@lists.infradead.org>, ",
 Sascha Hauer" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org


--===============6133834961581618147==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="omgjo4asbi4kpojs"
Content-Disposition: inline


--omgjo4asbi4kpojs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 31, 2018 at 09:28:09PM +0530, Jassi Brar wrote:
> On Tue, Jul 31, 2018 at 7:41 PM, Oleksij Rempel <o.rempel@pengutronix.de>=
 wrote:
> > Each MU has four pairs of rx/tx data register with four rx/tx interrupts
> > which can also be used as a separate channel.
> >
> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > ---
> >  .../devicetree/bindings/mailbox/fsl,mu.txt    | 28 +++++++++++++++++--
> >  1 file changed, 25 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mailbox/fsl,mu.txt b/Doc=
umentation/devicetree/bindings/mailbox/fsl,mu.txt
> > index 90e4905dfc69..9efd3a9ade44 100644
> > --- a/Documentation/devicetree/bindings/mailbox/fsl,mu.txt
> > +++ b/Documentation/devicetree/bindings/mailbox/fsl,mu.txt
> > @@ -18,11 +18,33 @@ Messaging Unit Device Node:
> >  Required properties:
> >  -------------------
> >  - compatible : should be "fsl,<chip>-mu", the supported chips include
> > -               imx8qxp, imx8qm.
> > +               imx6sx, imx7s, imx8qxp, imx8qm.
> > +               The "fsl,imx6sx-mu" compatible is seen as generic and s=
hould
> > +               be included together with SoC specific compatible.
> >  - reg :                Should contain the registers location and length
> >  - interrupts : Interrupt number. The interrupt specifier format depends
> >                 on the interrupt controller parent.
> > -- #mbox-cells:  Must be 0. Number of cells in a mailbox
> > +- #mbox-cells:  Must be 2.
> >
> This seems like modifying the bindings. But since nothing exists yet,
> maybe we should merge patch 1 and 2 ?

For some weeks I already asked to squash this patches.. it was not
ACKed. We can try again... @Rob, @Aisheng, should I merge this two
patches?

>=20
> > +                         <&phandle type channel>
> > +                           phandle   : Label name of controller
> > +                           type      : Channel type
> > +                           channel   : Channel number
> > +
> > +               This MU support 4 type of unidirectional channels, each=
 type
> > +               has 4 channels. A total of 16 channels. Following types=
 are
> > +               supported:
> > +               0 - TX channel with 32bit transmit register and IRQ tra=
nsmit
> > +               acknowledgment support.
> > +               1 - RX channel with 32bit receive register and IRQ supp=
ort
> > +               2 - TX doorbell channel. Without own register and no AC=
K support.
> > +               3 - RX doorbell channel.
> >
> Thanks. This is great.
>=20
> > +               The doorbell channels should be used with shared memory=
 and protocol
> > +               level acknowledgment if needed.
> > +
> I would avoid this. People might get notions that they have to use
> shmem with doorbell -- a trivial protocol might mean doing some fixed
> action (like reset) whenever the doorbell rings.

Ok.

>=20
> > +Optional properties:
> > +-------------------
> > +- clocks :     phandle to the input clock.
> > +- fsl,mu-side-b : Should be set for side B MU.
> >
> Nit: can we call this 'fsl,no-init' ?

No. It is HW description and not functionality which is present in
current Linux driver.

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--omgjo4asbi4kpojs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAlthP44ACgkQdQOiSHVI
77ShTAgAgjAe6sj9cLYopHdslgb31y2StyZCjqAQdKORDjd5cGIxQdUekvSZ8GkH
R9XkJTASAYhmRV8wzUdd+zt7IGv2a5zaRzdUnjkt+nz8KM99lTUBKKFyygZyJ9rv
42oZuw2aF7wEOS9VJMUqk+904LnIiEaJE2lwrx6fr4TxEiJmITbSGJQzl5t5R4Nv
2C3LVfvilpMJyaBcNrYebysQV1rRqYOu+46sLwRLr4zYBGqa8y58TDn83vKrpAgl
wlWVw77M/Y7CfOEA3v/3xKe/knYCUPyfcIMnwvTmlNhBSKr3TjA1gFlQetTNv5UL
DhRly/QnCc3cpW48l54vByew/6yk2w==
=Hvrx
-----END PGP SIGNATURE-----

--omgjo4asbi4kpojs--


--===============6133834961581618147==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6133834961581618147==--
