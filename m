From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sun8i: enable UART1 for iNet
 D978 Rev2 board
Date: Sun, 28 Aug 2016 18:26:59 +0800
Message-ID: <32051472380019@web17j.yandex.ru>
References: <20160828005521.58221-1-icenowy@aosc.xyz> <20160828080334.e7kul4n75i3hqk5t@vip.cybercity.dk>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBB57YRK7AKGQEOBJ6H7Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160828080334.e7kul4n75i3hqk5t-1EA3ORoCGBhoJ7GROcy7lA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rask Ingemann Lambertsen <ccc94453-1EA3ORoCGBhoJ7GROcy7lA@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org



28.08.2016, 16:17, "Rask Ingemann Lambertsen" <ccc94453-1EA3ORoCGBhoJ7GROcy7lA@public.gmane.org>:
> On Sun, Aug 28, 2016 at 08:55:21AM +0800, Icenowy Zheng wrote:
>> =C2=A0+ uart1_pins_cts_rts_a: uart1_cts_rts@0 {
>> =C2=A0+ allwinner,pins =3D "PG8", "PG9";
>> =C2=A0+ allwinner,function =3D "uart1";
>> =C2=A0+ allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
>> =C2=A0+ allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
>> =C2=A0+ };
>
> Node names should not contain underscores. Use hyphens instead.

Sorry. It's my fault.
In the v1 patch the name is hyphens... but I rewrote the part in v2.

> https://www.mail-archive.com/linux-kernel%40vger.kernel.org/msg1122967.ht=
ml
> https://www.mail-archive.com/linux-kernel%40vger.kernel.org/msg1145633.ht=
ml
>
> --
> Rask Ingemann Lambertsen
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
