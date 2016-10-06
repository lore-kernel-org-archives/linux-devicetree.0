From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH 9/9] [DO NOT MERGE] ARM: dts: sun6i: Enable
 7" LCD panel on Sinlinx SinA31s
Date: Fri, 07 Oct 2016 00:23:00 +0800
Message-ID: <1057651475770980@web10h.yandex.ru>
References: <20161006160629.11198-1-wens@csie.org> <20161006160629.11198-10-wens@csie.org>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBB2HU3G7QKGQEKOGWZ6Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20161006160629.11198-10-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: "wens-jdAy2FN1RRM@public.gmane.org" <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



07.10.2016, 00:06, "Chen-Yu Tsai" <wens-jdAy2FN1RRM@public.gmane.org>:
> Sinlinx SinA31s comes with an optional 7" 1024x600 LCD panel with
> capacitive touch panel that bolts on to the board.
>
> Enable the display using a panel with close timings. This patch is more
> of a proof of concept. The LCD panel has no markings whatsoever, and
> the timings are not exactly the same, and as a result the display produce=
s
> glitch lines sometimes.

As you say, you can use the panel of SinA33...

>
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
> =C2=A0arch/arm/boot/dts/sun6i-a31s-sina31s.dts | 30 +++++++++++++++++++++=
+++++++++
> =C2=A01 file changed, 30 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun6i-a31s-sina31s.dts b/arch/arm/boot/dts=
/sun6i-a31s-sina31s.dts
> index 6ead2f5c847a..2d5cf8c9a12f 100644
> --- a/arch/arm/boot/dts/sun6i-a31s-sina31s.dts
> +++ b/arch/arm/boot/dts/sun6i-a31s-sina31s.dts
> @@ -63,6 +63,23 @@
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0gpios =3D <&pio 7 13 GPIO_ACTIVE_HIGH>; /* PH13 */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
> +
> + panel: panel {
> + compatible =3D "avic,tm070ddh03", "simple-panel";
> + #address-cells =3D <1>;
> + #size-cells =3D <0>;
> +
> + port@0 {
> + reg =3D <0>;
> + #address-cells =3D <1>;
> + #size-cells =3D <0>;
> +
> + panel_input: endpoint@0 {
> + reg =3D <0>;
> + remote-endpoint =3D <&tcon0_out_lcd>;
> + };
> + };
> + };
> =C2=A0};
>
> =C2=A0&ehci0 {
> @@ -148,6 +165,19 @@
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0regulator-name =3D =
"vcc-gmac-phy";
> =C2=A0};
>
> +&tcon0 {
> + pinctrl-names =3D "default";
> + pinctrl-0 =3D <&lcd0_rgb888_pins>;
> + status =3D "okay";
> +};
> +
> +&tcon0_out {
> + tcon0_out_lcd: endpoint@0 {
> + reg =3D <0>;
> + remote-endpoint =3D <&panel_input>;
> + };
> +};
> +
> =C2=A0&usbphy {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0status =3D "okay";
> =C2=A0};
> --
> 2.9.3
>
> --
> You received this message because you are subscribed to the Google Groups=
 "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
