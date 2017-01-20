From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: Add Mali Utgard bindings
Date: Fri, 20 Jan 2017 09:59:49 +0100
Message-ID: <20170120085949.ccptp76bnlyw7nxy@lukather>
References: <20170116132424.7038-1-maxime.ripard@free-electrons.com>
 <20170119161648.u6tta5mogadli7ih@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3533914873463152316=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170119161648.u6tta5mogadli7ih@rob-hp-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Javier Martinez Canillas <javier@osg.samsung.com>, Kevin Hilman <khilman@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart@free-electrons.com>, Carlo Caione <carlo@caione.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============3533914873463152316==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rlvicnmf2k7bdoel"
Content-Disposition: inline


--rlvicnmf2k7bdoel
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Thu, Jan 19, 2017 at 10:16:48AM -0600, Rob Herring wrote:
> On Mon, Jan 16, 2017 at 02:24:23PM +0100, Maxime Ripard wrote:
> > The ARM Mali Utgard GPU family is embedded into a number of SoCs from
> > Allwinner, Amlogic, Mediatek or Rockchip.
> >=20
> > Add a binding for the GPU of that family.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  .../devicetree/bindings/gpu/arm,mali-utgard.txt    | 76 ++++++++++++++=
++++++++
> >  1 file changed, 76 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-utga=
rd.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt =
b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
> > new file mode 100644
> > index 000000000000..df05ba0ec357
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
> > @@ -0,0 +1,76 @@
> > +ARM Mali Utgard GPU
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Required properties:
> > +  - compatible:
> > +    * "arm,mali-utgard" and one of the following:
>=20
> Drop this. It's meaningless and 3 compatibles to match is the kernel is=
=20
> not a big deal.

Ok.

> > +      + "arm,mali-300"
> > +      + "arm,mali-400"
> > +      + "arm,mali-450"
> > +
> > +  - reg: Physical base address and length of the GPU registers
> > +
> > +  - interrupts: an entry for each entry in interrupt-names.
> > +    See ../interrupt-controller/interrupts.txt for details.
> > +
> > +  - interrupt-names:
> > +    * ppX: Pixel Processor X interrupt (X from 0 to 7)
> > +    * ppmmuX: Pixel Processor X MMU interrupt (X from 0 to 7)
>=20
> Is the number of pixel processors probe-able? If not, then it needs to=20
> be implied by the vendor compatible string or a property.

Yes, this is something that can be discovered by reading the pixel
processors version register. If the value is not 0, the processor is
there, otherwise it's not.

> > +    * pp: Pixel Processor broadcast interrupt (mali-450 only)
> > +    * gp: Geometry Processor interrupt
> > +    * gpmmu: Geometry Processor MMU interrupt
>=20
> That's a lot of interrupts. Was going to ask about combining, but=20
> I see Linus raised that.

Yes, apparently, some SoCs use that, but that doesn't seem to be a
standard feature (or at least, it's not used on our SoCs). So we're
stuck with those :/

> > +Optional properties:
> > +  - interrupt-names:
> > +    * pmu: Power Management Unit interrupt, if implemented in hardware
> > +
> > +Vendor-specific bindings
> > +------------------------
> > +
> > +The Mali GPU is integrated very differently from one SoC to
> > +another. In order to accommodate those differences, you have the option
> > +to specify one more vendor-specific compatible, among:
> > +
> > +  - allwinner,sun4i-a10-mali
>=20
> List this with the compatible strings. I assume one of the arm,mali-???=
=20
> strings applies too.

Yep.

> > +    Required properties:
> > +      * clocks: an entry for each entry in clock-names
> > +      * clock-names:
> > +        + bus: bus clock for the GPU
> > +        + core: clock driving the GPU itself
>=20
> This should be in the core binding. The number of clocks should not=20
> vary. We often get this wrong because the IP blocks get integrated and=20
> connected to the same clock source. But this should be equal to the=20
> number of clock inputs.

Ok. So far, the Allwinner one and the examples from Linus and John
have been using two clocks, but apparently on rockchip it's using a
single one, which is why I made it that way. I'll move that to the
core binding.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--rlvicnmf2k7bdoel
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYgdGAAAoJEBx+YmzsjxAgEoUQAJCPrJHwmd4ZNBc/gowvBvqu
GzdRXK8gXAK0YNXWCDU6QffwEE2oxngIIghOvHupauAifgtSQBL2DqO5wpwngBft
tFMtLAVevQhLak5nm8MjvccTCuPfU7imdQrHgDklVWY0hFkzM1FlE7tj6tA6vgAx
kfkUQ/2xV+4cvNFj6crdks9CVZnOv4KCext7ry9W/d05JNFMQLId5PaWf4msi3+g
UlSr/b1kmhhob4wX7N+N24VEt9YEqP8f9rNlrOQCQ6W2cXfUwv9rTD4gfAZt4cey
IHOjiUqFiHxmUqdK45szbEix+7vkZiVeogAQCVRTvhcYj1nTgKTwYuWyiirff/my
g/v7PVd5X+Fzg2clJgtIdODM/doD9VzGL5grp1jzPu/lkmeXcnpYced/8wEFYMXU
Xv7UEu9dEf6pBTM7n9RlqKt5eH+cS6d/IbrgrrTUalS1YgpMozs2ELY+jDqmAy1I
ig6qkegDWg8hea+4GsIlwvg2PWrAU7UOpuARMMC5/QjOnbli/6n0d3/wKnsuDNyD
D/YmoN7+U8KMWR3jV88XqGC7NTx+rKLMXmZovL2L40/jtqROCHvF3hZH1e7uEpxU
o2FlT7y1WZNGLcJaNSWgWB43DfCQRQ/1MlYJNESe78QgxOQYJrIgfSs+v4dCyvXV
DU+9W6WkVp5ORbK+KZEE
=zwVu
-----END PGP SIGNATURE-----

--rlvicnmf2k7bdoel--


--===============3533914873463152316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3533914873463152316==--
