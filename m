From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [RFC PATCH] ARM: dts: add panel and tcon nodes to
 Allwinner A33 Q8 tablet dts
Date: Mon, 07 Nov 2016 00:53:27 +0800
Message-ID: <2578261478451207@web24j.yandex.ru>
References: <20161106111119.14927-1-icenowy@aosc.xyz> <948897e3-12a2-b02c-ed26-929921ff04b2@redhat.com>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBCWA7XAAKGQEQAHH77Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <948897e3-12a2-b02c-ed26-929921ff04b2-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



06.11.2016, 22:27, "Hans de Goede" <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>:
> Hi,
>
> On 06-11-16 12:11, Icenowy Zheng wrote:
>> =C2=A0All A33 Q8 tablets features a LCD panel, with a resolution of eith=
er
>> =C2=A0800x480 or 1024x600.
>>
>> =C2=A0Add "bone" device nodes to the device tree.
>
> Bone ?
>
>> =C2=A0Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
>
> He, as discussed in the other thread since sun8i-a33-q8-tablet.dts
> is used for both 800x480 and 1024x600 versions we really need to
> introduce new sun8i-a33-q8-tablet-800x600.dts and
> sun8i-a33-q8-tablet-1024x600.dts files, which include
> sun8i-a33-q8-tablet.dts and then add just the panel bits; and patch
> newer u-boots to use those instead.
>
> This way people who stick with an old u-boot will just not get
> the drm driver, rather then all of a sudden getting a wrong
> resolution.
>
> Icenowy, can you please also submit a matching u-boot patch
> (both the new dts file, as well as updating the defconfig you
> =C2=A0=C2=A0use to the new dts file)?

Could you choose a compatible for 1024x600 variant?

(Since I have never such a Q8 tablet)

>
> Regards,
>
> Hans
>
>> =C2=A0---
>>
>> =C2=A0Maybe it will be better to add them to sun8i-q8-reference-tablet.d=
tsi, as
>> =C2=A0these pin configurations are part of reference design of both A23 =
and A33,
>> =C2=A0not only restricted to Q8.
>>
>> =C2=A0The DTS file is tested by me, after cherry-picks this patch from C=
hen-Yu Tsai:
>> =C2=A0https://github.com/wens/linux/commit/2823b887a289fbee5f97f3c6b45ed=
6c74a6368c6
>>
>> =C2=A0And add these commands to my U-Boot boot command:
>>
>> =C2=A0fdt addr 0x43000000
>> =C2=A0fdt resize
>> =C2=A0fdt set /panel compatible "urt,umsh-8596md-t"
>> =C2=A0fdt set /panel status "okay"
>> =C2=A0fdt set /display-engine status "okay"
>> =C2=A0fdt set /soc@01c00000/lcd-controller@01c0c000 status "okay"
>>
>> =C2=A0=C2=A0arch/arm/boot/dts/sun8i-a33-q8-tablet.dts | 44 +++++++++++++=
++++++++++++++++++
>> =C2=A0=C2=A01 file changed, 44 insertions(+)
>>
>> =C2=A0diff --git a/arch/arm/boot/dts/sun8i-a33-q8-tablet.dts b/arch/arm/=
boot/dts/sun8i-a33-q8-tablet.dts
>> =C2=A0index b0bc236..871a20c 100644
>> =C2=A0--- a/arch/arm/boot/dts/sun8i-a33-q8-tablet.dts
>> =C2=A0+++ b/arch/arm/boot/dts/sun8i-a33-q8-tablet.dts
>> =C2=A0@@ -47,4 +47,48 @@
>> =C2=A0=C2=A0/ {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0model =3D "Q=
8 A33 Tablet";
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0compatible =
=3D "allwinner,q8-a33", "allwinner,sun8i-a33";
>> =C2=A0+
>> =C2=A0+ panel: panel {
>> =C2=A0+ /* compatible should be set according to the panel */
>> =C2=A0+ pinctrl-names =3D "default";
>> =C2=A0+ pinctrl-0 =3D <&lcd_en_q8>;
>> =C2=A0+ backlight =3D <&backlight>;
>> =C2=A0+ enable-gpios =3D <&pio 7 7 GPIO_ACTIVE_HIGH>; /* PH7 */
>> =C2=A0+ power-supply =3D <&reg_dc1sw>;
>> =C2=A0+ status =3D "disabled";
>> =C2=A0+ #address-cells =3D <1>;
>> =C2=A0+ #size-cells =3D <0>;
>> =C2=A0+
>> =C2=A0+ port@0 {
>> =C2=A0+ reg =3D <0>;
>> =C2=A0+ #address-cells =3D <1>;
>> =C2=A0+ #size-cells =3D <0>;
>> =C2=A0+
>> =C2=A0+ panel_input: endpoint@0 {
>> =C2=A0+ reg =3D <0>;
>> =C2=A0+ remote-endpoint =3D <&tcon0_out_lcd>;
>> =C2=A0+ };
>> =C2=A0+ };
>> =C2=A0+ };
>> =C2=A0+};
>> =C2=A0+
>> =C2=A0+&tcon0 {
>> =C2=A0+ pinctrl-names =3D "default";
>> =C2=A0+ pinctrl-0 =3D <&lcd_rgb666_pins>;
>> =C2=A0+};
>> =C2=A0+
>> =C2=A0+&tcon0_out {
>> =C2=A0+ tcon0_out_lcd: endpoint@0 {
>> =C2=A0+ reg =3D <0>;
>> =C2=A0+ remote-endpoint =3D <&panel_input>;
>> =C2=A0+ };
>> =C2=A0+};
>> =C2=A0+
>> =C2=A0+&pio {
>> =C2=A0+ lcd_en_q8: lcd_en@0 {
>> =C2=A0+ allwinner,pins =3D "PH7";
>> =C2=A0+ allwinner,function =3D "gpio_out";
>> =C2=A0+ allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
>> =C2=A0+ allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
>> =C2=A0+ };
>> =C2=A0=C2=A0};

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
