From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v2 5/7] arm64: allwinner: a64: add necessary
 device tree nodes for DE2 CCU
Date: Sat, 23 Jun 2018 22:18:21 +0800
Message-ID: <3BDC9318-95A5-41BA-801E-6E0814249AFB@aosc.io>
References: <20180622124540.56203-1-icenowy@aosc.io> <20180622124540.56203-4-icenowy@aosc.io> <CAGRGNgUuEjmEcvJ3OUcQ9_6bPs9fDvKzUFm_NfCsYyjxVOVw3A@mail.gmail.com>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBYNUXHMQKGQEOZXYLAY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGRGNgUuEjmEcvJ3OUcQ9_6bPs9fDvKzUFm_NfCsYyjxVOVw3A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.orgJulian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org, jernej.skrabec-gGgVlfcn5nU@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Mailing List, Arm" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2018=E5=B9=B46=E6=9C=8823=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=8810=
:06:27, Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =E5=86=99=E5=88=B0:
>Hi Icenowy,
>
>On Fri, Jun 22, 2018 at 10:49 PM Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
>>
>> As we have all necessary parts to enable the DE2 CCU on the Allwinner
>> A64 SoC, add the needed device tree nodes, including the DE2 CCU
>itself
>> and the DE2 bus.
>>
>> The "mixer0-lcd0" simplefb device node is updated to use the DE2 CCU.
>>
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> ---
>> Changes in v2:
>> - Drop SRAM controller device tree node addition (as it's already
>added
>>   as part of syscon change.)
>> - Fix the clock reference in LCD SimpleFB.
>>
>>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 30
>+++++++++++++++----
>>  1 file changed, 24 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>> index ff2ddde1e117..318c4ba8ae9f 100644
>> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>> @@ -58,17 +60,12 @@
>>                 #size-cells =3D <1>;
>>                 ranges;
>>
>> -/*
>> - * The pipeline mixer0-lcd0 depends on clock CLK_MIXER0 from DE2
>CCU.
>> - * However there is no support for this clock on A64 yet, so we
>depend
>> - * on the upstream clocks here to keep them (and thus CLK_MIXER0)
>up.
>> - */
>>                 simplefb_lcd: framebuffer-lcd {
>>                         compatible =3D "allwinner,simple-framebuffer",
>>                                      "simple-framebuffer";
>>                         allwinner,pipeline =3D "mixer0-lcd0";
>>                         clocks =3D <&ccu CLK_TCON0>,
>> -                                <&ccu CLK_DE>, <&ccu CLK_BUS_DE>;
>> +                                <&display_clocks CLK_MIXER0>;
>
>Doesn't this technically break simplefb if this DT is used with a
>Linux that doesn't have the display clock driver?

1. DT doesn't care forware compatibility.

2. This is a fix for not accurate HW representation. In
fact I have sent the DT with simplefb using DE2 CCU before, but
when they're pending, someone who just wants the simplefb
sent the not temporary version.This must be fixed.

>
>Do we care about breaking that use-case?
>
>Thanks,

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
