From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpu: Add Mali Utgard bindings
Date: Mon, 30 Jan 2017 14:48:24 +0100
Message-ID: <20170130134824.u37svxphyy266tzz@lukather>
References: <a4d90de597cfcfab5fddeeb538505774a980818b.1485180017.git-series.maxime.ripard@free-electrons.com>
 <20170127201913.jjhdw57jmxifqpxa@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7vxpkbzz4ky4l7yn"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170127201913.jjhdw57jmxifqpxa@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--7vxpkbzz4ky4l7yn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Fri, Jan 27, 2017 at 02:19:13PM -0600, Rob Herring wrote:
> On Mon, Jan 23, 2017 at 03:00:45PM +0100, Maxime Ripard wrote:
> > The ARM Mali Utgard GPU family is embedded into a number of SoCs from
> > Allwinner, Amlogic, Mediatek or Rockchip.
> >=20
> > Add a binding for the GPU of that family.
> >=20
> > Reviewed-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> >=20
> > ---
> >=20
> > Changes from v1:
> >   - Dropped the arm,mali-utgard compatible
> >   - Made the clocks mandatory
> >   - Added Linus Walleij Reviewed-by, and the ST compatible for the Mali
> > ---
> >  Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt | 79 +++++++=
+-
> >  1 file changed, 79 insertions(+), 0 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-utga=
rd.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt =
b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
> > new file mode 100644
> > index 000000000000..ba0edcdd1b00
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
> > @@ -0,0 +1,79 @@
> > +ARM Mali Utgard GPU
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Required properties:
> > +  - compatible
> > +    * Must be one of the following:
> > +      + "arm,mali-300"
> > +      + "arm,mali-400"
> > +      + "arm,mali-450"
> > +    * And, optionally, one of the vendor specific compatible:
> > +      + allwinner,sun4i-a10-mali
> > +      + allwinner,sun7i-a20-mali
>=20
> And stericsson,db8500-mali?

Good catch, I'll add it.

> > +
> > +  - reg: Physical base address and length of the GPU registers
> > +
> > +  - interrupts: an entry for each entry in interrupt-names.
> > +    See ../interrupt-controller/interrupts.txt for details.
> > +
> > +  - interrupt-names:
> > +    * ppX: Pixel Processor X interrupt (X from 0 to 7)
> > +    * ppmmuX: Pixel Processor X MMU interrupt (X from 0 to 7)
> > +    * pp: Pixel Processor broadcast interrupt (mali-450 only)
> > +    * gp: Geometry Processor interrupt
> > +    * gpmmu: Geometry Processor MMU interrupt
> > +
> > +  - clocks: an entry for each entry in clock-names
> > +  - clock-names:
> > +    * bus: bus clock for the GPU
> > +    * core: clock driving the GPU itself
>=20
> assigned-clocks?

I didn't put it in there because it's optional, and was looking
orthogonal to me, since it depends on the clock frequency out of reset
and out of the bootloader running (and it's documented already as part
of the generic clock bindings).

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--7vxpkbzz4ky4l7yn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYj0QjAAoJEBx+YmzsjxAgneUP/jmPPsIbVy3M8TX5y90mIUth
xJuYYJD7dGgX+QXa8f9ZO2oOsVoZnsJhKbiEREb7ibL8KsM83+zc0/MnarmNlkLV
HrY+ruSNhoV6Xt3NCoAQbe+Ky91VuzNz5Ek9Gg33e5h53VYtf/BlzMmKuRPdyXLt
pNa7r5NAoXcRyXMk8T2yrXzG1Bt6OT2CXLHl5bFkuoNkPhxyPcf3uISJEFPCxOIC
jYhWPvfzAuCI5/IFYBCs8oTsZYb9tu8YA1dVnCL2+qPv4taJXjkn/zhDff7Ewz1I
5t384jhjHUP6Egutm5Uh2efoHIbE8libWcIK5T2fk27quIHlH3SA6W5ozSAcaY8Q
BUEDhpWJoIMAPFtMoffKM7ZnrpesOT0hjMTp8zwXs3VffQV2fPqdzeJ1N0m/yf97
76OJS9LXAXof6WWRjsgVjb+IuzcENpMiK8vIeRQOPoF9hlZ/OrdiA18bSmMZfyGa
kp6VwmSpJm7rnROfyIUrWQXvDavIRwBZ9ivYNKVchJRuSqxCD0rMO0l7Yg4nkPQN
0zYBXMh7sUFXJeCZJJ35wnzW2XUgSe/oXGLm480d7JyEcwKrNGQ7/lx3Pai9Kkie
xTOrO4ZaNzdgwRVILtpjwUAw8NOUp9CT8pk3HzX0q21grTYYF8gQF/Fwn3WJJrbF
TMuhBvOCXHD6RMHpUATt
=q/V3
-----END PGP SIGNATURE-----

--7vxpkbzz4ky4l7yn--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
