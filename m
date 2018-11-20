From: Romain Izard <romain.izard.pro@gmail.com>
Subject: Re: [PATCH] ARM: dts: at91: sama5d2: use the divided clock for SMC
Date: Tue, 20 Nov 2018 19:01:32 +0100
Message-ID: <CAGkQfmPHRKqMvm6bNDf8S5qM7uE5T-izij=jm2nob0zrOgOM-w@mail.gmail.com>
References: <20181120165737.4998-1-romain.izard.pro@gmail.com> <20181120171612.GF8367@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181120171612.GF8367@piout.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Rob Herring <robh+dt@kernel.org>, mark.rutland@arm.com, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Le mar. 20 nov. 2018 =C3=A0 18:16, Alexandre Belloni
<alexandre.belloni@bootlin.com> a =C3=A9crit :
>
> Hello Romain,
>
> On 20/11/2018 17:57:37+0100, Romain Izard wrote:
> > The SAMA5D2 is different from SAMA5D3 and SAMA5D4, as there are two
> > different clocks for the peripherals in the SoC. The Static Memory
> > controller is connected to the divided master clock.
> >
> > Unfortunately, the device tree does not correctly show this and uses th=
e
> > master clock directly. This clock is then used by the code for the NAND
> > controller to calculate the timings for the controller, and we end up w=
ith
> > slow NAND Flash access.
> >
> > Fix the device tree, and the performance of Flash access is improved.
> >
> > Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
> > ---
> >  arch/arm/boot/dts/sama5d2.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/boot/dts/sama5d2.dtsi b/arch/arm/boot/dts/sama5d2=
.dtsi
> > index 61f68e5c48e9..b405992eb601 100644
> > --- a/arch/arm/boot/dts/sama5d2.dtsi
> > +++ b/arch/arm/boot/dts/sama5d2.dtsi
> > @@ -308,7 +308,7 @@
> >                                 0x1 0x0 0x60000000 0x10000000
> >                                 0x2 0x0 0x70000000 0x10000000
> >                                 0x3 0x0 0x80000000 0x10000000>;
> > -                     clocks =3D <&mck>;
> > +                     clocks =3D <&h32ck>;
>
> You will have to rebase on top of at91-dt. And if I'm not mistaken, this
> line should be:
>
> +                       clocks =3D <&pmc PMC_TYPE_CORE PMC_MCK2>;
>
> >                       status =3D "disabled";
> >
> >                       nand_controller: nand-controller {

I guess you're right but this will only reach mainline in 4.21. I get slow
flash access with 4.19 as well...

After a second look, it looks like the SAMA5D4 is affected too.

Best regards,
--=20
Romain Izard
