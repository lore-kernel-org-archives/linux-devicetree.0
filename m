From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: Re: [PATCH V2 3/4] ARM: dts: imx6ul: Add GPMI nand controller
 support
Date: Mon, 21 Mar 2016 10:47:18 +0100
Message-ID: <20160321104718.05834ffa@ipc1.ka-ro>
References: <1455963652-24618-1-git-send-email-michael@amarulasolutions.com>
	<1455963652-24618-4-git-send-email-michael@amarulasolutions.com>
	<CAOMZO5DTmG7Umt+H20r+tZi9zZhsK=eoPbHOBO3iwvM2GXXLgg@mail.gmail.com>
	<20160220172127.GC24064@panicking>
	<20160221112949.GB5387@panicking>
	<20160222092613.3c32a4a0@ipc1.ka-ro>
	<CAOf5uwkn6k1YfMkMMSksKjakpP-NXsU0G9x0dyBao7n7NXSYug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOf5uwkn6k1YfMkMMSksKjakpP-NXsU0G9x0dyBao7n7NXSYug-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Sun, 20 Mar 2016 09:44:19 +0100 Michael Trimarchi wrote:
> Hi Lothar
>=20
> On Mon, Feb 22, 2016 at 9:26 AM, Lothar Wa=C3=9Fmann <LW@karo-electro=
nics.de> wrote:
> > Hi,
> >
> > On Sun, 21 Feb 2016 12:29:53 +0100 Michael Trimarchi wrote:
> >> Add support for GPMI nand controller.
> >>
> >> Signed-off-by: Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> >> ---
> >> Changes V2:
> >>       - drop special IMXUL type because seems that is compatible
> >>         with IMX6Q
> >>
> >>  arch/arm/boot/dts/imx6ul.dtsi | 33 ++++++++++++++++++++++++++++++=
+++
> >>  1 file changed, 33 insertions(+)
> >>
> >> diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx=
6ul.dtsi
> >> index f4daf97..1a486ac 100644
> >> --- a/arch/arm/boot/dts/imx6ul.dtsi
> >> +++ b/arch/arm/boot/dts/imx6ul.dtsi
> >> @@ -142,6 +142,39 @@
> >>                       reg =3D <0x00900000 0x20000>;
> >>               };
> >>
> >> +             dma_apbh: dma-apbh@01804000 {
> >> +                     compatible =3D "fsl,imx6ul-dma-apbh", "fsl,i=
mx28-dma-apbh";
> >> +                     reg =3D <0x01804000 0x2000>;
> >> +                     interrupts =3D <GIC_SPI 13 IRQ_TYPE_LEVEL_HI=
GH>,
> >> +                                  <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH=
>,
> >> +                                  <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH=
>,
> >> +                                  <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH=
>;
> >> +                     interrupt-names =3D "gpmi0", "gpmi1", "gpmi2=
", "gpmi3";
> >> +                     #dma-cells =3D <1>;
> >> +                     dma-channels =3D <4>;
> >> +                     clocks =3D <&clks IMX6UL_CLK_APBHDMA>;
> >> +             };
> >> +
> >> +             gpmi: gpmi-nand@01806000 {
> >> +                     compatible =3D "fsl,imx6q-gpmi-nand";
> >>
> > You should still add an imx6ul specific compatible (likewise to the
> > dma_apbh).
> >
>=20
> I understand your point but this seems that imx6q and imx6sx are
> defined in the same way
>=20
That doesn't mean they are correct. I got the same comment from Lucas
Stach in <1452678036.3694.51.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>


Lothar Wa=C3=9Fmann
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
