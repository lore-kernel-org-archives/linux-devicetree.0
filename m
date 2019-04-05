From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 1/3] dt-bindings: mtd: sunxi: Add new compatible
Date: Fri, 5 Apr 2019 11:28:13 +0200
Message-ID: <20190405112813.07d89534@xps13>
References: <20190404162111.22618-1-miquel.raynal@bootlin.com>
 <20190404162111.22618-2-miquel.raynal@bootlin.com>
 <20190405091302.mz3gox5jvoy3ygjr@flea>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4435939595436430829=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190405091302.mz3gox5jvoy3ygjr@flea>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============4435939595436430829==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/Mt2zQUa2GT7rjMNkmTVG+Na"; protocol="application/pgp-signature"

--Sig_/Mt2zQUa2GT7rjMNkmTVG+Na
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

Maxime Ripard <maxime.ripard@bootlin.com> wrote on Fri, 5 Apr 2019
11:13:02 +0200:

> Hi,
>=20
> On Thu, Apr 04, 2019 at 06:21:09PM +0200, Miquel Raynal wrote:
> > The A33 NAND controller is slightly different than the A10+ ones,
> > eg. DMA handling is a bit different and a few register offsets
> > changed.
> >
> > Introduce a new compatible to represent this version of the IP.
> >
> > Also append '-controller' to the new compatible (which is required for
> > new compatibles) as this is describing a NAND controller and not a
> > NAND chip. =20
>=20
> Out of curiosity, why are you requiring that suffix now?

Because people are confused with the terminology and we see people
mixing all the terms very often: NAND controller, NAND bus, NAND
chip, ECC engine, etc. This node only describes a NAND controller, so
let be more precise and stop naming everything just "NAND".

>=20
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  Documentation/devicetree/bindings/mtd/sunxi-nand.txt | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt b/Doc=
umentation/devicetree/bindings/mtd/sunxi-nand.txt
> > index dcd5a5d80dc0..6128d41d8c59 100644
> > --- a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
> > +++ b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
> > @@ -1,7 +1,12 @@
> >  Allwinner NAND Flash Controller (NFC)
> >
> >  Required properties:
> > -- compatible : "allwinner,sun4i-a10-nand".
> > +- compatible : Must be one of:
> > +	       - "allwinner,sun4i-a10-nand"
> > +	       - "allwinner,sun8i-a33-nand-controller"
> > +	       The former may be used by all IPs, however sun8i family
> > +	       will need the second one in order to make use of the
> > +	       internal DMA capabilities. =20
>=20
> I'm not sure we should have that statement. We have no idea whether or
> not this can be used by all IPs *today*, and we surely don't know
> about the one that are going to come out.

Shall I just drop the whole comment ("The former" ... "capabilities.")?


Thanks,
Miqu=C3=A8l

--Sig_/Mt2zQUa2GT7rjMNkmTVG+Na
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEE9HuaYnbmDhq/XIDIJWrqGEe9VoQFAlynH60ACgkQJWrqGEe9
VoQdwAgAtbI64ZDpawZ2HLgjTSLevz/kBR4Lu21liULYWueW5kEtaPmOPt2kBsdz
vgL+ZQvAWEDy+dq64Sx0RYOwP4F5D6xSkvPIbZPRtGuhIa5Zn+5vuu7BQQpXZrwD
Ca5LGh8UNUM4xkF/XQcJogymFrwG3MVjUW0T1Kes9vT5q7IML+4qDszShB/mIJ5t
HlSsAVYNicOxRlMZfCogFgp5CvlHESX9IMZa0HJd9z8LMBJK7roXq3Lh2bui8D+e
ilomXghjGuoxQeMJu+i3vPeCNE5XAxwZbTDjFUUyvKaEK7kPzXSEqCSOyIlBqk/2
vl0n+rDQffi/njJjxfB708IYEvWgdw==
=BJHf
-----END PGP SIGNATURE-----

--Sig_/Mt2zQUa2GT7rjMNkmTVG+Na--


--===============4435939595436430829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4435939595436430829==--
