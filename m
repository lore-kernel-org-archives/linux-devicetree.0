From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add bindings for the
 Sitronix ST7789V panel
Date: Tue, 7 Feb 2017 17:42:58 +0100
Message-ID: <20170207164258.GA28522@ulmo.ba.sec>
References: <cover.d573d2c400f1a8ef8d2696fda74f3e860bff50ca.1486115846.git-series.maxime.ripard@free-electrons.com>
 <097eb2ad92f68f0f1a7c035c9b6b094afaf34dc1.1486115846.git-series.maxime.ripard@free-electrons.com>
 <20170206130549.GA28955@ulmo.ba.sec>
 <20170207154442.dntmddoft3zacxis@lukather>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170207154442.dntmddoft3zacxis@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 07, 2017 at 04:44:42PM +0100, Maxime Ripard wrote:
> Hi Thierry,
>=20
> On Mon, Feb 06, 2017 at 02:05:49PM +0100, Thierry Reding wrote:
> > On Fri, Feb 03, 2017 at 10:59:05AM +0100, Maxime Ripard wrote:
> > > The Sitronix ST7789V is an LCD panel controller, controlled over SPI,=
 that
> > > can drive 18-bits 240x320 LCD displays.
> > >=20
> > > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > > ---
> > >  Documentation/devicetree/bindings/display/panel/sitronix,st7789v.txt=
 | 36 ++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 36 insertions(+), 0 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/display/panel/s=
itronix,st7789v.txt
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/display/panel/sitronix=
,st7789v.txt b/Documentation/devicetree/bindings/display/panel/sitronix,st7=
789v.txt
> > > new file mode 100644
> > > index 000000000000..f70e6e9c54ed
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7789=
v.txt
> > > @@ -0,0 +1,36 @@
> > > +Sitronix ST7789V RGB panel with SPI control bus
> > > +
> > > +Required properties:
> > > +  - compatible: "sitronix,st7789v"
> > > +  - reg: Chip select of the panel on the SPI bus
> > > +  - reset-gpios: a GPIO phandle for the reset pin
> >=20
> > Shouldn't this have some sort of power supply?
>=20
> On the board I currently have, it's just tied to an always on
> regulator, but you're right, I'll add it.

Yes, we need to make sure to describe this from the panel's perspective
to make sure that when other board designers hook things up differently
we can still model it in DT.

But you already knew that...

Thierry

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliZ+REACgkQ3SOs138+
s6EIpQ//cnLKPAwCLnlUsYBqRA9Xfie5majKcPs/WwzUaZy52lBNuaakrZ1UFnkc
5lAPe+R9uOO2nHlmwyeHOJiA7ihRIzqzzBwQj4w+1elNdpc90nOC55nfMx6xMiio
e89KWkHMP5AlP/Us1mRF0Z/eglGTOcQbl2r+nRmo5BHhCI5s+sDeG2KIvMUA4io8
mbcEREByoOJ149IG4V4OPWvIpBrnlceROhcbcknQUOizvtZc33srdE4C5uaK70y6
B2YW7IGXn88jkb9ngjGZ4EZv8JYdWiP8K1q9zod8U1Xn5QEql07C54uDp3/5BU9z
jbKOVs915CEYPM2+F25yegnwjauadz682Nw3XOohyizqjF+QKSj0N+ckQv5EFvrg
+D7zeqFFEhr3Mk5L6bsD3L1BJJL3UpebsW5NcZEPvYwlglFtFiJ/RsQtYAKX9vUz
CucSUAFhgmHyTdE4exwqrC8imTzidUwP6ABNd6o51KSSBBo1vpxOaL8ye346V8aE
CZSxK0zdlQ8SSpjecB0/wu2qE+1RRIzaW1kfgdfNSwYDqu/XAOxRzJS0ZcEHolIT
Ov4opwA8OhDJQuFsr+UAeZWYg5GM/I9Gs4LrSZe/YCyuXr6EIjwqAZh1J1jUJq+M
eVn7nIlgvw+eTxVRtODw9p7bBKEaHM4iI4r/0vh8No15PPYbxbs=
=hfWR
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
