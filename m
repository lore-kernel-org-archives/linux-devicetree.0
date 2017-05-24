From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [RFC PATCH 10/11] ARM: sun8i: h3: add display
 engine pipeline for TVE
Date: Wed, 24 May 2017 13:36:53 +0800
Message-ID: <8358C867-68B8-43CB-A6FA-76A073B29958@aosc.io>
References: <20170517164354.16399-1-icenowy@aosc.io> <20170517164354.16399-11-icenowy@aosc.io> <CAGb2v64nVA=hHjXkVNMN68vQizMBE6vyYfaE895b0L6umv_Ycw@mail.gmail.com> <299627EE-8D9C-451A-9F74-0C5037D19DCC@aosc.io> <CAGb2v64-3TYDgCBhGFNDqvoTa1ch=j3k__rnbB80dsFQn3JsKw@mail.gmail.com>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBA5YSTEQKGQEM3CNLBI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v64-3TYDgCBhGFNDqvoTa1ch=j3k__rnbB80dsFQn3JsKw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: wens-jdAy2FN1RRM@public.gmane.orgChen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2017=E5=B9=B45=E6=9C=8824=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=881:=
34:58, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> =E5=86=99=E5=88=B0:
>On Wed, May 24, 2017 at 1:28 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
>>
>>
>> =E4=BA=8E 2017=E5=B9=B45=E6=9C=8824=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=
=881:24:29, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> =E5=86=99=E5=88=B0:
>>>On Thu, May 18, 2017 at 12:43 AM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>>>wrote:
>>>> As we have already the support for the TV encoder on Allwinner H3,
>>>add
>>>> the display engine pipeline device tree nodes to its DTSI file.
>>>>
>>>> The H5 pipeline has some differences and will be enabled later.
>>>>
>>>> The currently-unused mixer0 and tcon0 are also needed, for the
>>>> completement of the pipeline.
>>>>
>>>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>>>> ---
>>>>  arch/arm/boot/dts/sun8i-h3.dtsi | 189
>>>++++++++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 189 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi
>>>b/arch/arm/boot/dts/sun8i-h3.dtsi
>>>> index b36f9f423c39..20172ef92415 100644
>>>> --- a/arch/arm/boot/dts/sun8i-h3.dtsi
>>>> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
>>>> @@ -41,6 +41,8 @@
>>>>   */
>>>>
>>>>  #include "sunxi-h3-h5.dtsi"
>>>> +#include <dt-bindings/clock/sun8i-de2.h>
>>>> +#include <dt-bindings/reset/sun8i-de2.h>
>>>>
>>>>  / {
>>>>         cpus {
>>>> @@ -72,6 +74,193 @@
>>>>                 };
>>>>         };
>>>>
>>>> +       de: display-engine {
>>>> +               compatible =3D "allwinner,sun8i-h3-display-engine";
>>>> +               allwinner,pipelines =3D <&mixer0>,
>>>> +                                     <&mixer1>;
>>>> +               status =3D "disabled";
>>>> +       };
>>>> +
>>>> +       soc {
>>>> +               display_clocks: clock@1000000 {
>>>> +                       compatible =3D
>"allwinner,sun8i-a83t-de2-clk";
>>>> +                       reg =3D <0x01000000 0x100000>;
>>>> +                       clocks =3D <&ccu CLK_BUS_DE>,
>>>> +                                <&ccu CLK_DE>;
>>>> +                       clock-names =3D "bus",
>>>> +                                     "mod";
>>>> +                       resets =3D <&ccu RST_BUS_DE>;
>>>> +                       #clock-cells =3D <1>;
>>>> +                       #reset-cells =3D <1>;
>>>> +                       assigned-clocks =3D <&ccu CLK_DE>;
>>>> +                       assigned-clock-parents =3D <&ccu CLK_PLL_DE>;
>>>> +                       assigned-clock-rates =3D <432000000>;
>>>> +               };
>>>> +
>>>> +               mixer0: mixer@1100000 {
>>>> +                       compatible =3D
>"allwinner,sun8i-h3-de2-mixer0";
>>>> +                       reg =3D <0x01100000 0x100000>;
>>>> +                       clocks =3D <&display_clocks CLK_BUS_MIXER0>,
>>>> +                                <&display_clocks CLK_MIXER0>;
>>>> +                       clock-names =3D "bus",
>>>> +                                     "mod";
>>>> +                       resets =3D <&display_clocks RST_MIXER0>;
>>>> +                       status =3D "disabled";
>>>> +
>>>> +                       ports {
>>>> +                               #address-cells =3D <1>;
>>>> +                               #size-cells =3D <0>;
>>>> +
>>>> +                               mixer0_out: port@1 {
>>>> +                                       #address-cells =3D <1>;
>>>> +                                       #size-cells =3D <0>;
>>>> +                                       reg =3D <1>;
>>>> +
>>>> +                                       mixer0_out_tcon0:
>endpoint@0
>>>{
>>>> +                                               reg =3D <0>;
>>>> +                                               remote-endpoint =3D
>>><&tcon0_in_mixer0>;
>>>> +                                       };
>>>> +
>>>> +                                       mixer0_out_tcon1:
>endpoint@1
>>>{
>>>> +                                               reg =3D <1>;
>>>> +                                               remote-endpoint =3D
>>><&tcon1_in_mixer0>;
>>>> +                                       };
>>>> +                               };
>>>> +                       };
>>>> +               };
>>>> +
>>>> +               mixer1: mixer@1200000 {
>>>> +                       compatible =3D
>"allwinner,sun8i-h3-de2-mixer1";
>>>> +                       reg =3D <0x01200000 0x100000>;
>>>> +                       clocks =3D <&display_clocks CLK_BUS_MIXER1>,
>>>> +                                <&display_clocks CLK_MIXER1>;
>>>> +                       clock-names =3D "bus",
>>>> +                                     "mod";
>>>> +                       resets =3D <&display_clocks RST_WB>;
>>>> +
>>>> +                       ports {
>>>> +                               #address-cells =3D <1>;
>>>> +                               #size-cells =3D <0>;
>>>> +
>>>> +                               mixer1_out: port@1 {
>>>> +                                       #address-cells =3D <1>;
>>>> +                                       #size-cells =3D <0>;
>>>> +                                       reg =3D <1>;
>>>> +
>>>> +                                       mixer1_out_tcon1:
>endpoint@0
>>>{
>>>> +                                               reg =3D <0>;
>>>
>>>I would prefer if you could stick to the numbering scheme we're using
>>>for
>>>Display Engine 1.0, as in endpoint 0 links to component 0 of whatever
>>>type.
>>
>> If we keep this we will need a ugly id property in mixer node,
>> otherwise we cannot know which TCON to be bind.
>
>Why? You can simply change the logic in your driver from:
>
>    if (remote_endpoint.id) { continue; }
>
>to:
>
>    if (local_endpoint.id !=3D remote_endpoint.id) { continue; }

Thanks, I forgot that there's two endpoint ids...

So silly I am.

>
>I don't see the need for any ID property in the mixer node in this
>case.
>The ID is already encoded into the endpoint IDs.
>
>ChenYu
>
>>>
>>>We're probably going to stick to that for the R40's incredibly
>>>complicated
>>>pipeline. I don't want to have any outliers unless absolutely
>>>necessary.
>>>
>>>ChenYu
>>>
>>>> +                                               remote-endpoint =3D
>>><&tcon1_in_mixer1>;
>>>> +                                       };
>>>> +
>>>> +                                       mixer1_out_tcon0:
>endpoint@1
>>>{
>>>> +                                               reg =3D <1>;
>>>> +                                               remote-endpoint =3D
>>><&tcon0_in_mixer1>;
>>>> +                                       };
>>>> +                               };
>>>> +                       };
>>>> +               };
>>>> +
>>>> +               tcon0: lcd-controller@1c0c000 {
>>>> +                       compatible =3D "allwinner,sun8i-h3-tcon0";
>>>> +                       reg =3D <0x01c0c000 0x1000>;
>>>> +                       interrupts =3D <GIC_SPI 86
>>>IRQ_TYPE_LEVEL_HIGH>;
>>>> +                       clocks =3D <&ccu CLK_BUS_TCON0>,
>>>> +                                <&ccu CLK_TCON0>;
>>>> +                       clock-names =3D "ahb",
>>>> +                                     "tcon-ch1";
>>>> +                       resets =3D <&ccu RST_BUS_TCON0>;
>>>> +                       reset-names =3D "lcd";
>>>> +                       status =3D "disabled";
>>>> +
>>>> +                       ports {
>>>> +                               #address-cells =3D <1>;
>>>> +                               #size-cells =3D <0>;
>>>> +
>>>> +                               tcon0_in: port@0 {
>>>> +                                       #address-cells =3D <1>;
>>>> +                                       #size-cells =3D <0>;
>>>> +                                       reg =3D <0>;
>>>> +
>>>> +                                       tcon0_in_mixer0: endpoint@0
>{
>>>> +                                               reg =3D <0>;
>>>> +                                               remote-endpoint =3D
>>><&mixer0_out_tcon0>;
>>>> +                                       };
>>>> +
>>>> +                                       tcon0_in_mixer1: endpoint@1
>{
>>>> +                                               reg =3D <1>;
>>>> +                                               remote-endpoint =3D
>>><&mixer1_out_tcon0>;
>>>> +                                       };
>>>> +                               };
>>>> +                       };
>>>> +               };
>>>> +
>>>> +               tcon1: lcd-controller@1c0d000 {
>>>> +                       compatible =3D "allwinner,sun8i-h3-tcon1";
>>>> +                       reg =3D <0x01c0d000 0x1000>;
>>>> +                       interrupts =3D <GIC_SPI 87
>>>IRQ_TYPE_LEVEL_HIGH>;
>>>> +                       clocks =3D <&ccu CLK_BUS_TCON1>;
>>>> +                       clock-names =3D "ahb";
>>>> +                       resets =3D <&ccu RST_BUS_TCON1>;
>>>> +                       reset-names =3D "lcd";
>>>> +                       status =3D "disabled";
>>>> +
>>>> +                       ports {
>>>> +                               #address-cells =3D <1>;
>>>> +                               #size-cells =3D <0>;
>>>> +
>>>> +                               tcon1_in: port@0 {
>>>> +                                       #address-cells =3D <1>;
>>>> +                                       #size-cells =3D <0>;
>>>> +                                       reg =3D <0>;
>>>> +
>>>> +                                       tcon1_in_mixer1: endpoint@0
>{
>>>> +                                               reg =3D <0>;
>>>> +                                               remote-endpoint =3D
>>><&mixer1_out_tcon1>;
>>>> +                                       };
>>>> +
>>>> +                                       tcon1_in_mixer0: endpoint@1
>{
>>>> +                                               reg =3D <1>;
>>>> +                                               remote-endpoint =3D
>>><&mixer0_out_tcon1>;
>>>> +                                       };
>>>> +                               };
>>>> +
>>>> +                               tcon1_out: port@1 {
>>>> +                                       #address-cells =3D <1>;
>>>> +                                       #size-cells =3D <0>;
>>>> +                                       reg =3D <1>;
>>>> +
>>>> +                                       tcon1_out_tve0: endpoint@1
>{
>>>> +                                               reg =3D <1>;
>>>> +                                               remote-endpoint =3D
>>><&tve0_in_tcon1>;
>>>> +                                       };
>>>> +                               };
>>>> +                       };
>>>> +               };
>>>> +
>>>> +               tve0: tv-encoder@1e00000 {
>>>> +                       compatible =3D
>"allwinner,sun8i-h3-tv-encoder";
>>>> +                       reg =3D <0x01e00000 0x1000>;
>>>> +                       clocks =3D <&ccu CLK_BUS_TVE>, <&ccu
>CLK_TVE>;
>>>> +                       clock-names =3D "bus", "mod";
>>>> +                       resets =3D <&ccu RST_BUS_TVE>;
>>>> +                       status =3D "disabled";
>>>> +
>>>> +                       assigned-clocks =3D <&ccu CLK_TVE>;
>>>> +                       assigned-clock-parents =3D <&ccu CLK_PLL_DE>;
>>>> +                       assigned-clock-rates =3D <216000000>;
>>>> +
>>>> +                       port {
>>>> +                               #address-cells =3D <1>;
>>>> +                               #size-cells =3D <0>;
>>>> +
>>>> +                               tve0_in_tcon1: endpoint@0 {
>>>> +                                       reg =3D <0>;
>>>> +                                       remote-endpoint =3D
>>><&tcon1_out_tve0>;
>>>> +                               };
>>>> +                       };
>>>> +               };
>>>> +       };
>>>> +
>>>>         timer {
>>>>                 compatible =3D "arm,armv7-timer";
>>>>                 interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) |
>>>IRQ_TYPE_LEVEL_LOW)>,
>>>> --
>>>> 2.12.2
>>>>
>>>> --
>>>> You received this message because you are subscribed to the Google
>>>Groups "linux-sunxi" group.
>>>> To unsubscribe from this group and stop receiving emails from it,
>>>send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
>>>> For more options, visit https://groups.google.com/d/optout.
>>
>> --
>> You received this message because you are subscribed to the Google
>Groups "linux-sunxi" group.
>> To unsubscribe from this group and stop receiving emails from it,
>send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
>> For more options, visit https://groups.google.com/d/optout.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
