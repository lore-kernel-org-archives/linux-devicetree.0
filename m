From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: Add Mali Utgard bindings
Date: Fri, 20 Jan 2017 10:16:08 +0100
Message-ID: <20170120091608.ijdhpeq2t5no75rc@lukather>
References: <20170116132424.7038-1-maxime.ripard@free-electrons.com>
 <CALAqxLV=5ZCu8=rDUFHS9148DxzrqeTipsueA7F4i3t-mcWr=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6396217773001511511=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CALAqxLV=5ZCu8=rDUFHS9148DxzrqeTipsueA7F4i3t-mcWr=A@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: John Stultz <john.stultz@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Heiko Stuebner <heiko@sntech.de>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, John Reitan <John.Reitan@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Kukjin Kim <kgene@kernel.org>, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart@free-electrons.com>, Matthias Brugger <matthias.bgg@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Carlo Caione <carlo@caione.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Brandon Sheng <Brandon.Sh>
List-Id: devicetree@vger.kernel.org


--===============6396217773001511511==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7aicymkljya5ery3"
Content-Disposition: inline


--7aicymkljya5ery3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi John,

On Thu, Jan 19, 2017 at 11:24:38AM -0800, John Stultz wrote:
> On Mon, Jan 16, 2017 at 5:24 AM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
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
> > +
> > +Vendor-specific bindings
> > +------------------------
> > +
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
> > +
> > +Example:
> > +
> > +mali: gpu@01c40000 {
> > +       compatible =3D "allwinner,sun7i-a20-mali", "arm,mali-400",
> > +                    "arm,mali-utgard";
> > +       reg =3D <0x01c40000 0x10000>;
> > +       interrupts =3D <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
> > +                    <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
> > +                    <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
> > +                    <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
> > +                    <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
> > +                    <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
> > +                    <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
> > +       interrupt-names =3D "gp",
> > +                         "gpmmu",
> > +                         "pp0",
> > +                         "ppmmu0",
> > +                         "pp1",
> > +                         "ppmmu1",
> > +                         "pmu";
> > +       clocks =3D <&ccu CLK_BUS_GPU>, <&ccu CLK_GPU>;
> > +       clock-names =3D "bus", "core";
> > +       resets =3D <&ccu RST_BUS_GPU>;
> > +};
>=20
> Having a mali utgard binding upstream would be great. However I'm a
> little worried that the mali driver I've used sort of only half way
> uses DT, and still requires a custom built in platform driver to setup
> numerous other things.  Curious if you have a pointer to the kernel
> driver you've been using with the vendor specific bindings above?  I'd
> like to try to adapt what we have to your method to validate the above
> as generic.

I've created a custom platform driver, so just like you it seems,
because I've not managed to make ARM's DT support work.

https://github.com/mripard/sunxi-mali/blob/master/driver/src/devicedrv/mali=
/platform/sunxi/sunxi.c

I haven't updated it yet with the bindings suggested above, but only
the interrupt and clock names have changed. The rest very much
applies.

The only thing that might be vendor specific would be the (optional)
declaration of the mali_gpu_device_data structure. As far as I know,
there's two things of importance there:
  - the list of the valid OPPs in order to do DVFS, but that could be
    made generic too using the operating-points binding

  - And the valid area for the buffers for the fbdev blobs (fb_start,
    fb_size and shared_mem_size). I'm not entirely happy with this one
    so far (which is also why I've not pushed it). We'd need to come
    up with a way to get the base address and size of the CMA region
    backing the framebuffer allocation, but I haven't find any trivial
    way to do so, so for now I just hardcoded it. Worst case scenario,
    we can hardcode values based on the compatible.

> And, just for context, here's the node we've been using with hikey:
>=20
>                 mali:mali@f4080000 {
>                         compatible =3D "arm,mali-450", "arm,mali-utgard";
>                         reg =3D <0x0 0x3f100000 0x0 0x00708000>;

This is because the hikey is using a 64 bits CPU, right?

>                         clocks =3D <&media_ctrl HI6220_G3D_CLK>,
>                                  <&media_ctrl HI6220_G3D_PCLK>;
>                         clock-names =3D "clk_g3d", "pclk_g3d";
>                         mali_def_freq =3D <500>;
>                         pclk_freq =3D <144>;
>                         dfs_steps =3D <2>;
>                         dfs_lockprf =3D <1>;
>                         dfs_limit_max_prf =3D <1>;
>                         dfs_profile_num =3D <2>;
>                         dfs_profiles =3D <250 3 0>, <500 1 0>;
>                         mali_type =3D <2>;
>=20
>                         interrupt-parent =3D <&gic>;
>                         interrupts =3D    <1 126 4>, /*gp*/
>                                         <1 126 4>, /*gp mmu*/
>                                         <1 126 4>, /*pp bc*/
>                                         <1 126 4>, /*pmu*/
>                                         <1 126 4>, /*pp0*/
>                                         <1 126 4>,
>                                         <1 126 4>, /*pp1*/
>                                         <1 126 4>,
>                                         <1 126 4>, /*pp2*/
>                                         <1 126 4>,
>                                         <1 126 4>, /*pp4*/
>                                         <1 126 4>,
>                                         <1 126 4>, /*pp5*/
>                                         <1 126 4>,
>                                         <1 126 4>, /*pp6*/
>                                         <1 126 4>;
>                         interrupt-names =3D "IRQGP", "IRQGPMMU",
> "IRQPP", "IRQPMU",
>                                         "IRQPP0", "IRQPPMMU0",
> "IRQPP1", "IRQPPMMU1",
>                                         "IRQPP2",
> "IRQPPMMU2","IRQPP4", "IRQPPMMU4",
>                                         "IRQPP5", "IRQPPMMU5",
> "IRQPP6", "IRQPPMMU6";
>                 };

So all your interrupts are shared?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--7aicymkljya5ery3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYgdVTAAoJEBx+YmzsjxAgCGIP/012eXQyrkfD8emKqPcCSSWV
LORZ1Vrz3oM1wjfU20ro725QpUCyGchttL7j6ErOLGNpvsXT2FlHdhUKOwUCdXJ4
E+7LNByCKwLGqJOJ0JlNvAaIKpNhtUp88nhLEJj7Y6wGDyPGHKrpep5Rl7SoPo8r
v3Eq85cTSo3Vc6a7zT9eRniozY5BMdUrXat30sO8sZq/Pd9PwYEUAF5frR4i9zLG
ws7e1AxHbiU9jlDfz8ooK5PiRfcVicJw35a/ObZiNkflnyQ3DcJKvxI+wpUSXbX1
NHsP9lKkEBuMsJksUE8GZfIeIcxT/+SOxBuPJkkIEjRQb6cuzVer4lcOlGmBI+kR
oDfb6oYVC73KcFSgfYAUeDLGBAI7nlXKPKaEzOMv3x5+4qb1N3tK/bFeF+xowxiQ
aTHyfwHaVBaZPqtyXRy30VeY0DIvCTdPJcX/M734KgIV0czDdo8g7Sbh6WDP2B+w
3fPyNcScNiyISRe6gGPl92ShY+kAYAC6ItLfn2bjTwdKB0nxo9LlOcvFTjvfth7Z
UTAEim60xOwQIN3xZkzGVRNpLISfm9KJ0q6G6zlFErDt1QYPAwYKuo9jW7fw0aqP
bBUNqAZjZPf0ZbyGYbh6ihP/4JyP6Vt4kYKnELcYpNaL4nCS2/6N8hG/tXUqDsNn
OUWDGnI9joEPIVx0QcKi
=feMd
-----END PGP SIGNATURE-----

--7aicymkljya5ery3--


--===============6396217773001511511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6396217773001511511==--
