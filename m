From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: Add Mali Utgard bindings
Date: Thu, 19 Jan 2017 16:49:46 +0100
Message-ID: <20170119154946.ozuxixafsoqblxvw@lukather>
References: <20170116132424.7038-1-maxime.ripard@free-electrons.com>
 <CACRpkdbU=DeZx4a8Ax8hh6iv0n1c-6XKVrts1ff=-_E5=_dc8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6881496332706349419=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdbU=DeZx4a8Ax8hh6iv0n1c-6XKVrts1ff=-_E5=_dc8A@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>, Javier Martinez Canillas <javier@osg.samsung.com>, Kevin Hilman <khilman@baylibre.com>, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart@free-electrons.com>, Krzysztof Kozlowski <krzk@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Kukjin Kim <kgene@kernel.org>, Carlo Caione <carlo@caione.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============6881496332706349419==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3wywfvhwgv5sqliv"
Content-Disposition: inline


--3wywfvhwgv5sqliv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Thu, Jan 19, 2017 at 12:09:37AM +0100, Linus Walleij wrote:
> On Mon, Jan 16, 2017 at 2:24 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
>=20
> > The ARM Mali Utgard GPU family is embedded into a number of SoCs from
> > Allwinner, Amlogic, Mediatek or Rockchip.
> >
> > Add a binding for the GPU of that family.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  .../devicetree/bindings/gpu/arm,mali-utgard.txt    | 76 ++++++++++++++=
++++++++
> >  1 file changed, 76 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-utga=
rd.txt
> >
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
> > +    * pp: Pixel Processor broadcast interrupt (mali-450 only)
> > +    * gp: Geometry Processor interrupt
> > +    * gpmmu: Geometry Processor MMU interrupt
> > +
> > +
> > +Optional properties:
> > +  - interrupt-names:
> > +    * pmu: Power Management Unit interrupt, if implemented in hardware
>=20
> On the MALI-400 MP in the ST-Ericsson DB8500 we have an additional interr=
upt
> called "Mali400 combined". This is simply the HW designer's
> doing an OR over all the 4 IRQ lines. Is this useful to define in the
> bindings? Then it should be an optional

Do you still have all the other interrupts, or just this combined interrupt?

Either way, that should definitely be part of the binding, but maybe
as part of the vendor specific binding below?

I didn't encounter any other platform doing so when I gave it a
(quick) look.

>  * combined: all lines OR:ed together (if available)
>=20
> Also you are defining "resets" below in the examples, should
> this be listed as an optional property?

In my mind, this is not optional. For some platforms, it's mandatory,
and for some, it's not there at all. IMO, this should really be a
mandatory property, but only for the compatibles that use it (just
like the clocks are).

> > +The Mali GPU is integrated very differently from one SoC to
> > +another. In order to accommodate those differences, you have the option
> > +to specify one more vendor-specific compatible, among:
> > +
> > +  - allwinner,sun4i-a10-mali
> > +    Required properties:
> > +      * clocks: an entry for each entry in clock-names
> > +      * clock-names:
> > +        + bus: bus clock for the GPU
> > +        + core: clock driving the GPU itself
> > +      * resets: phandle to the reset line for the GPU
> > +
> > +  - allwinner,sun7i-a20-mali
> > +    Required properties:
> > +      * clocks: an entry for each entry in clock-names
> > +      * clock-names:
> > +        + bus: bus clock for the GPU
> > +        + core: clock driving the GPU itself
> > +      * resets: phandle to the reset line for the GPU
>=20
> Please add:
>=20
> - stericsson,db8500-mali: also known as the "Smart Graphics
> Accelerator" (SGA500)
>    Required properties:
>     * clocks: an entry for each entry in clock-names
>     * clock-names:
>       + bus: bus clock for the GPU (ICNCLK a.k.a. PRCMU_ACLK)
>       + core: clock driving the GPU itself (PRCMU_SGACLK)
>
> (It has no explicit reset line.)

Ack.

> With these:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--3wywfvhwgv5sqliv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYgOAaAAoJEBx+YmzsjxAg0mUQAJnJ7PS7ChqTzh3DHN3VMRE7
RBUrCGTpyqCoqr8WeSh8kYNXxELzrMaRB2NQxWMqDuRB1V/M0YYeyjmg9pHS6v2N
xTctH9B7tiqHq+FkpG6RVDrrIqo1EVdBRspH4mzGw0LlMI3BGGNhkJRmX3l29E5T
hwFldLVg+RZ4zoV++4voXke/Z3kTc0SIwHvaFRjYrSQbJRBd9Aemxfm111L5jD4P
qIqRHFkCcZu30ieDBj2k51f2xQTKXF2kutHfeYgyuTToaG+vTB1pS/Q9RoHtU7in
6ZZGvAW7p7XwA7Mqz+ZlfA3BZp6rVXCphOzdQMonTkB0xxZYLrjljv9bHES96fXb
JvsYWGB8mOMZ+dza0gHdOkhOzaI9pyahi58U46XhVp/2gHt9nlpam1x+LLlML50T
IIvVxHoqOXxU2fnvZ/AHVeBsnkD1vJS5rJyBd66cuWxmhYJsM3TS3s/jrAvrFe9l
uZylPfZD6zo5Kxqv5uufzkEtoQMRkqQdAik5kIFL92dBmiouTOu5fin20fFV9Brn
LFQs148AF6tvhbvnxCiL7dAfDMye4ANWJ9nsHSxFDmrjwUAN65+fj6SL1LbX39qx
eiBQP7sWCxgLrbLQqRcQzmBKt4ENm0wTvwwyVjMRRN47xtCqDXzDqVMiUdP4k+rf
RbcZIkXQEH6b3L7u3s4Y
=nQbP
-----END PGP SIGNATURE-----

--3wywfvhwgv5sqliv--


--===============6881496332706349419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6881496332706349419==--
