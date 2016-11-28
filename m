From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [RFC PATCH] ARM: dts: sun8i: add simplefb node for H3
Date: Mon, 28 Nov 2016 18:19:50 +0800
Message-ID: <496171480328390@web15g.yandex.ru>
References: <20161128095900.27615-1-icenowy@aosc.xyz> <CAGb2v67akcT6z-xOdCzpLQRZbgNGh3E5akYEs1BvFNP1rH8UeA@mail.gmail.com>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBSEJ6DAQKGQESDAHLMY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v67akcT6z-xOdCzpLQRZbgNGh3E5akYEs1BvFNP1rH8UeA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



28.11.2016, 18:07, "Chen-Yu Tsai" <wens-jdAy2FN1RRM@public.gmane.org>:
> On Mon, Nov 28, 2016 at 5:59 PM, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org> wrote:
>> =C2=A0As there's currently a fork of U-Boot which provides simplefb supp=
ort
>
> Please add it when its finalized...
>
>> =C2=A0for H3, a simplefb node can be added to the device tree.
>>
>> =C2=A0Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
>> =C2=A0---
>>
>> =C2=A0I'm still not sure which pipeline should I use.
>
> You are supposed to add _all_ the pipelines that are available and
> supported by U-boot. U-boot is then supposed to enable and update
> the one it set up.

I mean the pipeline string ;-)

>
> ChenYu
>
>> =C2=A0And, it seems that HDMI Slow Clock is not needed?
>>
>> =C2=A0(seems that it's only for EDID, but simplefb won't use EDID)
>>
>> =C2=A0=C2=A0arch/arm/boot/dts/sun8i-h3.dtsi | 16 ++++++++++++++++
>> =C2=A0=C2=A01 file changed, 16 insertions(+)
>>
>> =C2=A0diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/s=
un8i-h3.dtsi
>> =C2=A0index 75a8654..cacc8dd 100644
>> =C2=A0--- a/arch/arm/boot/dts/sun8i-h3.dtsi
>> =C2=A0+++ b/arch/arm/boot/dts/sun8i-h3.dtsi
>> =C2=A0@@ -50,6 +50,22 @@
>> =C2=A0=C2=A0/ {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0interrupt-parent =
=3D <&gic>;
>>
>> =C2=A0+ chosen {
>> =C2=A0+ #address-cells =3D <1>;
>> =C2=A0+ #size-cells =3D <1>;
>> =C2=A0+ ranges;
>> =C2=A0+
>> =C2=A0+ simplefb_hdmi: framebuffer@0 {
>> =C2=A0+ compatible =3D "allwinner,simple-framebuffer",
>> =C2=A0+ "simple-framebuffer";
>> =C2=A0+ allwinner,pipeline =3D "de0-lcd0-hdmi";
>> =C2=A0+ clocks =3D <&ccu CLK_BUS_TCON0>, <&ccu CLK_BUS_DE>,
>> =C2=A0+ <&ccu CLK_BUS_HDMI>, <&ccu CLK_DE>,
>> =C2=A0+ <&ccu CLK_TCON0>, <&ccu CLK_HDMI>;
>> =C2=A0+ status =3D "disabled";
>> =C2=A0+ };
>> =C2=A0+ };
>> =C2=A0+
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cpus {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#address-cells =3D <1>;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#size-cells =3D <0>;
>> =C2=A0--
>> =C2=A02.10.2

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
