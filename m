From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 1/5] dt-bindings: vendor: Escape single quote
Date: Wed, 12 Jun 2019 17:48:27 +0200
Message-ID: <20190612154827.ykrxtuv2q7uxmwoj@flea>
References: <20190525134140.6220-1-maxime.ripard@bootlin.com>
 <CAL_JsqK829bfc4VX1hmYRuLYWQXaixAgSwU2N7veA41vfxLXvw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3434485603240582558=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqK829bfc4VX1hmYRuLYWQXaixAgSwU2N7veA41vfxLXvw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============3434485603240582558==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ojdig4ufr3fvpwhg"
Content-Disposition: inline


--ojdig4ufr3fvpwhg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, Jun 11, 2019 at 03:18:51PM -0600, Rob Herring wrote:
> On Sat, May 25, 2019 at 7:41 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
> > Single quotes need to be escaped in YAML, make sure it's the case.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > index 19cc3240a445..ec53162e900d 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -672,7 +672,7 @@ patternProperties:
> >    "^plantower,.*":
> >      description: Plantower Co., Ltd
> >    "^plathome,.*":
> > -    description: Plat'Home Co., Ltd.
> > +    description: Plat\'Home Co., Ltd.
>
> Actually, I think this isn't necessary. Where was this causing a
> problem? Only in single quoted strings do you have to escape a single
> quote and it is done with 2 single quotes rather than a backslash.

I guess I misread the YAML spec though... Sorry.

> However, to maintain a json compatible subset of yaml, maybe we do
> need it.

If you don't want it anymore, I guess we can drop or revert it.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ojdig4ufr3fvpwhg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXQEeywAKCRDj7w1vZxhR
xbQTAP9aeBEzFtsrAUI/WlTsmFq1tfkJJNyS0XOvprvVnIF4vwEA/8L4kV9E7v0K
/oXbZNPQojz/la/iqD91nAmsPXcDtQg=
=Y1ER
-----END PGP SIGNATURE-----

--ojdig4ufr3fvpwhg--


--===============3434485603240582558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3434485603240582558==--
