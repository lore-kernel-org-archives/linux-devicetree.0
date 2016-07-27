From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH v4] ARM: dts: sun8i: Add dts file for Olimex A33-OLinuXino
Date: Wed, 27 Jul 2016 10:38:10 +0800
Message-ID: <5601469587090@web14m.yandex.ru>
References: <1469450243-19138-1-git-send-email-stefan.mavrodiev@gmail.com> <20160726153352.GH7190@lukather>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBFN54C6AKGQEU3KETXQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160726153352.GH7190@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Mavrodiev <stefan.mavrodiev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org" <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "wens-jdAy2FN1RRM@public.gmane.org" <wens-jdAy2FN1RRM@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org



26.07.2016, 23:38, "Maxime Ripard" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> Hi Stefan,
>
> On Mon, Jul 25, 2016 at 03:37:23PM +0300, Stefan Mavrodiev wrote:
>> =C2=A0A33-OLinuXino is A33 development board designed by Olimex LTD.
>>
>> =C2=A0It has AXP233 PMU, 1GB DRAM, a micro SD card, one USB-OTG connecto=
r,
>> =C2=A0headphone and mic jacks, connector for LiPo battery and optional
>> =C2=A04GB NAND Flash.
>>
>> =C2=A0It has two 40-pin headers. One for LCD panel, and one for
>> =C2=A0additional modules. Also there is CSI/DSI connector.
>>
>> =C2=A0Signed-off-by: Stefan Mavrodiev <stefan.mavrodiev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> It looks mostly good, a few comments though.
>> =C2=A0+&pio {
>> =C2=A0+ led_pin_olinuxino: led_pins@0 {
>> =C2=A0+ allwinner,pins =3D "PB7";
>> =C2=A0+ allwinner,function =3D "gpio_out";
>
> This line is not properly indented.
>
>> =C2=A0+ allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
>> =C2=A0+ allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
>> =C2=A0+ };
>
> And this one too.
>
>> =C2=A0+&reg_dc1sw {
>> =C2=A0+ regulator-name =3D "vcc-lcd";
>> =C2=A0+};
>
> No constraints on this one?
The "regulator" dc1sw is, in fact, a switch (so it's named as "sw").
So it have only on-off status.

The constraints in dc1sw has prevented one of my A31s tablet from booting
when it's not removed.
>
>> =C2=A0+&reg_dcdc1 {
>> =C2=A0+ regulator-always-on;
>> =C2=A0+ regulator-min-microvolt =3D <3300000>;
>> =C2=A0+ regulator-max-microvolt =3D <3300000>;
>> =C2=A0+ regulator-name =3D "vcc-dsi";
>> =C2=A0+};
>
> What is it used for? Is it really necessary to keep it on at all time?
>
> Thanks,
> Maxime
>
> --
> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> ,
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
