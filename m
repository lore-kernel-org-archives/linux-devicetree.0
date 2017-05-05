From: icenowy-h8G6r0blFSE@public.gmane.org
Subject: Re: [PATCH v6 11/13] ARM: dts: sun8i: add DE2 nodes for
 V3s SoC
Date: Fri, 05 May 2017 16:53:43 +0800
Message-ID: <8ad5de02ffc13348dfc71e9ec203205c@aosc.io>
References: <20170504114858.9008-1-icenowy@aosc.io>
 <20170504114858.9008-12-icenowy@aosc.io>
 <CAGb2v67uE2iuP+wrL2t0fSMY8C1qnX=pYru7pZGX+0WhC_z2EA@mail.gmail.com>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBGP3WDEAKGQEKZ6XLCQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v67uE2iuP+wrL2t0fSMY8C1qnX=pYru7pZGX+0WhC_z2EA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-kernel-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2017-05-05 11:31=EF=BC=8CChen-Yu Tsai =E5=86=99=E9=81=93=EF=BC=9A
> On Thu, May 4, 2017 at 7:48 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
>> Allwinner V3s SoC features a "Display Engine 2.0" with only one TCON
>> which have RGB LCD output.
>=20
> Please also mention that it only has one mixer.
>=20
> For the subject, you could just say "Add device nodes for the display=20
> pipeline".
>=20
>>=20
>> Add device nodes for it as well as the TCON.
>>=20
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/sun8i-v3s.dtsi | 87=20
>> ++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 87 insertions(+)
>>=20
>> diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi=20
>> b/arch/arm/boot/dts/sun8i-v3s.dtsi
>> index 71075969e5e6..0a895179d8ae 100644
>> --- a/arch/arm/boot/dts/sun8i-v3s.dtsi
>> +++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
>> @@ -41,6 +41,10 @@
>>   */
>>=20
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/clock/sun8i-v3s-ccu.h>
>> +#include <dt-bindings/clock/sun8i-de2.h>
>> +#include <dt-bindings/reset/sun8i-v3s-ccu.h>
>> +#include <dt-bindings/reset/sun8i-de2.h>
>>=20
>>  / {
>>         #address-cells =3D <1>;
>> @@ -59,6 +63,12 @@
>>                 };
>>         };
>>=20
>> +       de: display-engine {
>> +               compatible =3D "allwinner,sun8i-v3s-display-engine";
>> +               allwinner,pipelines =3D <&de2_mixer0>;
>> +               status =3D "disabled";
>> +       };
>> +
>>         timer {
>>                 compatible =3D "arm,armv7-timer";
>>                 interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) |=20
>> IRQ_TYPE_LEVEL_LOW)>,
>> @@ -93,6 +103,83 @@
>>                 #size-cells =3D <1>;
>>                 ranges;
>>=20
>> +               de2_clocks: clock@1000000 {
>> +                       compatible =3D "allwinner,sun50i-h5-de2-clk";
>=20
> I am a bit skeptical about this. Since the V3S only has one mixer, do=20
> the clocks
> for the second one even exist?

It's described in the de_clock.c in the BSP source code, and in hardware
these bits can be really set (although without clock output).

So I use this compatible which has still the extra clocks.

>=20
>> +                       reg =3D <0x01000000 0x100000>;
>> +                       clocks =3D <&ccu CLK_DE>,
>> +                                <&ccu CLK_BUS_DE>;
>> +                       clock-names =3D "mod",
>> +                                     "bus";
>> +                       resets =3D <&ccu RST_BUS_DE>;
>> +                       #clock-cells =3D <1>;
>> +                       #reset-cells =3D <1>;
>> +               };
>> +
>> +               de2_mixer0: mixer@1100000 {
>> +                       compatible =3D "allwinner,sun8i-v3s-de2-mixer";
>> +                       reg =3D <0x01100000 0x100000>;
>> +                       clocks =3D <&de2_clocks CLK_MIXER0>,
>> +                                <&de2_clocks CLK_BUS_MIXER0>;
>> +                       clock-names =3D "mod",
>> +                                     "bus";
>=20
> Nit: could you list the bus clock first?
>=20
> Regards
> ChenYu
>=20
>> +                       resets =3D <&de2_clocks RST_MIXER0>;
>> +                       assigned-clocks =3D <&de2_clocks CLK_MIXER0>;
>> +                       assigned-clock-rates =3D <150000000>;
>> +
>> +                       ports {
>> +                               #address-cells =3D <1>;
>> +                               #size-cells =3D <0>;
>> +
>> +                               mixer0_out: port@1 {
>> +                                       #address-cells =3D <1>;
>> +                                       #size-cells =3D <0>;
>> +                                       reg =3D <1>;
>> +
>> +                                       mixer0_out_tcon0: endpoint@0 {
>> +                                               reg =3D <0>;
>> +                                               remote-endpoint =3D=20
>> <&tcon0_in_mixer0>;
>> +                                       };
>> +                               };
>> +                       };
>> +               };
>> +
>> +               tcon0: lcd-controller@1c0c000 {
>> +                       compatible =3D "allwinner,sun8i-v3s-tcon";
>> +                       reg =3D <0x01c0c000 0x1000>;
>> +                       interrupts =3D <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
>> +                       clocks =3D <&ccu CLK_BUS_TCON0>,
>> +                                <&ccu CLK_TCON0>;
>> +                       clock-names =3D "ahb",
>> +                                     "tcon-ch0";
>> +                       clock-output-names =3D "tcon-pixel-clock";
>> +                       resets =3D <&ccu RST_BUS_TCON0>;
>> +                       reset-names =3D "lcd";
>> +                       status =3D "disabled";
>> +
>> +                       ports {
>> +                               #address-cells =3D <1>;
>> +                               #size-cells =3D <0>;
>> +
>> +                               tcon0_in: port@0 {
>> +                                       #address-cells =3D <1>;
>> +                                       #size-cells =3D <0>;
>> +                                       reg =3D <0>;
>> +
>> +                                       tcon0_in_mixer0: endpoint@0 {
>> +                                               reg =3D <0>;
>> +                                               remote-endpoint =3D=20
>> <&mixer0_out_tcon0>;
>> +                                       };
>> +                               };
>> +
>> +                               tcon0_out: port@1 {
>> +                                       #address-cells =3D <1>;
>> +                                       #size-cells =3D <0>;
>> +                                       reg =3D <1>;
>> +                               };
>> +                       };
>> +               };
>> +
>> +
>>                 mmc0: mmc@01c0f000 {
>>                         compatible =3D "allwinner,sun7i-a20-mmc";
>>                         reg =3D <0x01c0f000 0x1000>;
>> --
>> 2.12.2
>>=20
>> --
>> You received this message because you are subscribed to the Google=20
>> Groups "linux-sunxi" group.
>> To unsubscribe from this group and stop receiving emails from it, send=
=20
>> an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
>> For more options, visit https://groups.google.com/d/optout.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
