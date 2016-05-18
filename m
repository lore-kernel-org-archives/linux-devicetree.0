From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: PATH[1/3] ARM: axp20x_usb_power.c add device tree
 configuration options for REG 30H: VBUS-IPSOUT
Date: Wed, 18 May 2016 08:21:45 +0100
Message-ID: <20160518072145.GI17238@dell>
References: <0f58d2b3-f3d3-45a3-a307-e54df26c1ab1@googlegroups.com>
Reply-To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDA7X7F2WUEBB65P6C4QKGQEXKADTCA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <0f58d2b3-f3d3-45a3-a307-e54df26c1ab1-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Ene Alexandru <ene.alexandru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

What on earth are all these emails you're sending to the list?

Please read the following documentation to ensure you're using correct
processes to send patches. If you require any help with a particular
aspect, please feel free to ask.

 Documentation/HOWTO=20
 Documentation/CodingSytle
 Documentation/email-clients.txt=20
 Documentation/SubmittingPatches=20

The last one being the most prevalent in this case.

NB: If you use Git to create your patches `git format-patch` and to
email your patches out `git send-email`, then you'll be most of the
way there.

> The AXP20X chips have a configuration register "REG 30H: VBUS-IPSOUT Powe=
r=20
> Path Management" that provide USB power supply protection.
> The current axp20x_usb_power.c provides support only for reading those=20
> values.
>=20
> From the datasheet:
> In order not to affect the USB communication, VBUS is always working unde=
r=20
> Voltage-Limit mode by default. In this mode, AXP209 ensures that VBUS=20
> voltage remains above a configurable reference voltage VHOLD which can me=
et=20
> the USB specification. The default VHOLD is 4.4V, adjustable in Reg30H=20
> [5:3] register. If the system has limit on current obtained from USB VBUS=
,=20
> a current-limit mode is provided (See REG30H[1] register), with=20
> 900mA/500mA/100mA (Reg30H [0]) selectable.
>=20
> The following entries are added in the axp209.dtsi=20
> file: vhold-enable, vhold-set and ibus-limit
> The chosen default values are the AXP20X reset values, as described in th=
e=20
> data sheet.
>=20
> Signed-off-by: Ene Alexandru <ene.alexandru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>=20
>=20
> ---
> diff -uprN -X linux-sunxi-original/Documentation/dontdiff=20
> linux-sunxi-original/arch/arm/boot/dts/axp209.dtsi=20
> linux-sunxi/arch/arm/boot/dts/axp209.dtsi
> --- linux-sunxi-original/arch/arm/boot/dts/axp209.dtsi         2016-05-11=
=20
> 09:21:47.470923679 +0200
> +++ linux-sunxi/arch/arm/boot/dts/axp209.dtsi     2016-05-10=20
> 18:45:32.795158651 +0200
> @@ -98,5 +98,8 @@
>            usb_power_supply: usb_power_supply {
>                        compatible =3D "x-powers,axp202-usb-power-supply";
>                        status =3D "disabled";
> +                      vhold-enable =3D <0x01>;
> +                      vhold-set =3D <0x04>;
> +                      ibus-limit =3D <0x01>;
>            };
> };
> ---
>=20


--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
