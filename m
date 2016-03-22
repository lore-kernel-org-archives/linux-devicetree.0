From: Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH V2 3/4] ARM: dts: imx6ul: Add GPMI nand controller support
Date: Tue, 22 Mar 2016 08:44:48 +0100
Message-ID: <CAOf5uw=WavOpy-qTPU3T5ybpUuVH3hgzeMnNrc42_TX65+atkA@mail.gmail.com>
References: <1455963652-24618-1-git-send-email-michael@amarulasolutions.com>
	<1455963652-24618-4-git-send-email-michael@amarulasolutions.com>
	<CAOMZO5DTmG7Umt+H20r+tZi9zZhsK=eoPbHOBO3iwvM2GXXLgg@mail.gmail.com>
	<20160220172127.GC24064@panicking>
	<20160221112949.GB5387@panicking>
	<20160222092613.3c32a4a0@ipc1.ka-ro>
	<CAOf5uwkn6k1YfMkMMSksKjakpP-NXsU0G9x0dyBao7n7NXSYug@mail.gmail.com>
	<20160321104718.05834ffa@ipc1.ka-ro>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160321104718.05834ffa-VjFSrY7JcPWvSplVBqRQBQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Lothar_Wa=C3=9Fmann?= <LW-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Cc: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi

On Mon, Mar 21, 2016 at 10:47 AM, Lothar Wa=C3=9Fmann <LW@karo-electron=
ics.de> wrote:
> Hi,
>
> On Sun, 20 Mar 2016 09:44:19 +0100 Michael Trimarchi wrote:
>> Hi Lothar
>>
>> On Mon, Feb 22, 2016 at 9:26 AM, Lothar Wa=C3=9Fmann <LW@karo-electr=
onics.de> wrote:
>> > Hi,
>> >
>> > On Sun, 21 Feb 2016 12:29:53 +0100 Michael Trimarchi wrote:
>> >> Add support for GPMI nand controller.
>> >>
>> >> Signed-off-by: Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
>> >> ---
>> >> Changes V2:
>> >>       - drop special IMXUL type because seems that is compatible
>> >>         with IMX6Q
>> >>
>> >>  arch/arm/boot/dts/imx6ul.dtsi | 33 +++++++++++++++++++++++++++++=
++++
>> >>  1 file changed, 33 insertions(+)
>> >>
>> >> diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/im=
x6ul.dtsi
>> >> index f4daf97..1a486ac 100644
>> >> --- a/arch/arm/boot/dts/imx6ul.dtsi
>> >> +++ b/arch/arm/boot/dts/imx6ul.dtsi
>> >> @@ -142,6 +142,39 @@
>> >>                       reg =3D <0x00900000 0x20000>;
>> >>               };
>> >>
>> >> +             dma_apbh: dma-apbh@01804000 {
>> >> +                     compatible =3D "fsl,imx6ul-dma-apbh", "fsl,=
imx28-dma-apbh";
>> >> +                     reg =3D <0x01804000 0x2000>;
>> >> +                     interrupts =3D <GIC_SPI 13 IRQ_TYPE_LEVEL_H=
IGH>,
>> >> +                                  <GIC_SPI 13 IRQ_TYPE_LEVEL_HIG=
H>,
>> >> +                                  <GIC_SPI 13 IRQ_TYPE_LEVEL_HIG=
H>,
>> >> +                                  <GIC_SPI 13 IRQ_TYPE_LEVEL_HIG=
H>;
>> >> +                     interrupt-names =3D "gpmi0", "gpmi1", "gpmi=
2", "gpmi3";
>> >> +                     #dma-cells =3D <1>;
>> >> +                     dma-channels =3D <4>;
>> >> +                     clocks =3D <&clks IMX6UL_CLK_APBHDMA>;
>> >> +             };
>> >> +
>> >> +             gpmi: gpmi-nand@01806000 {
>> >> +                     compatible =3D "fsl,imx6q-gpmi-nand";
>> >>
>> > You should still add an imx6ul specific compatible (likewise to th=
e
>> > dma_apbh).
>> >
>>
>> I understand your point but this seems that imx6q and imx6sx are
>> defined in the same way
>>
> That doesn't mean they are correct. I got the same comment from Lucas
> Stach in <1452678036.3694.51.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>

Ok, it's fine. I will fix it and re-post the series

Michael

>
> Lothar Wa=C3=9Fmann



--=20
| Michael Nazzareno Trimarchi                     Amarula Solutions BV =
|
| COO  -  Founder                                      Cruquiuskade 47 =
|
| +31(0)851119172                                 Amsterdam 1018 AM NL =
|
|                  [`as] http://www.amarulasolutions.com               =
|
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
