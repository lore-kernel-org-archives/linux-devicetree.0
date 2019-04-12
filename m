Return-Path: <SRS0=Y+yZ=SO=jmondi.org=jacopo@kernel.org>
Date: Fri, 12 Apr 2019 09:07:31 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: rcar-csi2: List resets as a
 mandatory property
Message-ID: <20190412070730.ley3qv3wotexktoq@uno.localdomain>
References: <20190312234930.23193-1-niklas.soderlund+renesas@ragnatech.se>
 <20190312234930.23193-2-niklas.soderlund+renesas@ragnatech.se>
 <20190412070338.5n6cs55pkecwglnu@uno.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yclc63psgmrmxktg"
Content-Disposition: inline
In-Reply-To: <20190412070338.5n6cs55pkecwglnu@uno.localdomain>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
List-ID: <devicetree@vger.kernel.org>


--yclc63psgmrmxktg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Oh, I missed a pull request was sent already for this series :)

Even better!

On Fri, Apr 12, 2019 at 09:03:38AM +0200, Jacopo Mondi wrote:
> Hi Niklas,
>
> On Wed, Mar 13, 2019 at 12:49:29AM +0100, Niklas S=C3=B6derlund wrote:
> > The resets property will become mandatory to operate the device, list it
> > as such. All device tree source files have always included the reset
> > property so making it mandatory will not introduce any regressions.
> >
> > While at it improve the description for the clocks property.
> >
> > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatec=
h.se>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/renesas,rcar-csi2.=
txt b/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
> > index d63275e17afdd180..9a0d0531c67df48c 100644
> > --- a/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
> > +++ b/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
> > @@ -18,7 +18,8 @@ Mandatory properties
> >
> >   - reg: the register base and size for the device registers
> >   - interrupts: the interrupt for the device
> > - - clocks: reference to the parent clock
> > + - clocks: A phandle + clock specifier for the module clock
> > + - resets: A phandle + reset specifier for the module reset
> >
>
> Verified that all users in mainline of this bindings already contains
> a 'reset' property:
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
>
> Thanks
>    j
>
> >  The device node shall contain two 'port' child nodes according to the
> >  bindings defined in Documentation/devicetree/bindings/media/
> > --
> > 2.21.0
> >



--yclc63psgmrmxktg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAlywOTIACgkQcjQGjxah
Vjy3ThAAiU2aRR84/SSVlNW1zKt/OFok17DzWczEyOmC+P0Pu923WfNv5LLW+IEu
zdrnBU3bSxQq0PVZrbJ/XlisK+J3UUU7pMVDu34ED+9hwcIaeTyoXZeDmpCm3JKG
4zm5z8h+U49ZqJDyvGfe8ydFLLs8kqoIJI+PqHN/EwP4JkyYho1L2f6xfXV3yaPA
u36Tijx3TnRXm0c2Kb1GF9JYBohUi2XtfehhimscB0u701BCOvidXTN+dga17yW1
GwLcZZ+wzkl7qyXLG0vCWAAloZBEOq15HxULePQ1nk4rv2lInBQlXox7Hcximwsq
WY18ZlMmSoG5CHWX1qzZsiJef6xeonIr4QTqVN/jOgoQjXXsIpvrxjtVYiY9Ueau
YSO5oQhSf5LgI/bqx4+4QrOhoKJqbWhvX1bLa9fml5FkpQiGCCZ0V2olLFY8Lydc
nRQq2ULBj5vUEVYHhET0vErND6E2Tta+bgsw7W2eYRPbiFVk/RGN7Sicqyn+IAX0
2beQXa3XLIx0oSKx3NIxY4kgVl5Su1mEX7gzLgQuX1nQ8dn97tbgAnaLng9NaqUo
loG7k0dNZzgVSAyspVDEaYn5LvA2U0D6s4gEeCZOv0CIa12B0JJFeK0yL6L533rN
3SAocxW/wfMcnVs642uaeKJmRBp3SbmRfVpR+Xn1zRDHn27frIM=
=X9f5
-----END PGP SIGNATURE-----

--yclc63psgmrmxktg--
