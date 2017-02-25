From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: allwinner: add support for Pinebook
Date: Sun, 26 Feb 2017 00:55:06 +0800
Message-ID: <1242601488041706@web21h.yandex.ru>
References: <20170225070032.35834-1-icenowy@aosc.xyz> <20170225163802.guxwxzp734hlqoob@localhost>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBB3HNY3CQKGQEYKATMHI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170225163802.guxwxzp734hlqoob@localhost>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rask Ingemann Lambertsen <rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org



26.02.2017, 00:38, "Rask Ingemann Lambertsen" <rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org>:
> On Sat, Feb 25, 2017 at 03:00:32PM +0800, Icenowy Zheng wrote:
> [...]
>> =C2=A0diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts=
 b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
>> =C2=A0new file mode 100644
>> =C2=A0index 000000000000..2dceba3132b0
>> =C2=A0--- /dev/null
>> =C2=A0+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
>
> [...]
>> =C2=A0+ gpio_keys {
>> =C2=A0+ compatible =3D "gpio-keys";
>> =C2=A0+
>> =C2=A0+ lid_switch {
>
> Node names should not contain underscores. You can use hyphens instead. S=
ee
> https://www.mail-archive.com/linux-kernel%40vger.kernel.org/msg1122967.ht=
ml
> https://www.mail-archive.com/linux-kernel%40vger.kernel.org/msg1145633.ht=
ml

Sorry... but here I modelled after omap3-n900.dts, maybe it should also be =
changed?

>
>> =C2=A0+&mmc0 {
>> =C2=A0+ pinctrl-names =3D "default";
>> =C2=A0+ pinctrl-0 =3D <&mmc0_pins>;
>> =C2=A0+ vmmc-supply =3D <&reg_vcc3v3>;
>> =C2=A0+ cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_HIGH>;
>> =C2=A0+ cd-inverted;
>
> You ought to be able to replace those last two lines with just
> cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>;

Before this all Allwinner boards uses GPIO_ACTIVE_HIGH and
cd-inverted.

>
>> =C2=A0+ disable-wp;
>> =C2=A0+ bus-width =3D <4>;
>> =C2=A0+ status =3D "okay";
>> =C2=A0+};
>
> --
> Rask Ingemann Lambertsen

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
