From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH v3 5/5] ARM: dts: sun8i: h2+: enable USB OTG
 for Orange Pi Zero board
Date: Wed, 15 Mar 2017 17:09:59 +0800
Message-ID: <20170320113931.dPmCTite@smtp2h.mail.yandex.net>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBTVKX3DAKGQEN52JSIY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


2017=E5=B9=B43=E6=9C=8815=E6=97=A5 15:16=E4=BA=8E Chen-Yu Tsai <wens@csie.o=
rg>=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,=20
>
> On Tue, Mar 7, 2017 at 6:34 AM, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org> wrote:=
=20
> > Orange Pi Zero board features a USB OTG port, which has a ID pin, and=
=20
> > can be used to power up the board. However, even if the board is powere=
d=20
> > via +5V pin in GPIO/expansion headers, the VBUS in the OTG port cannot=
=20
> > be powered up, thus it's impossible to use it in host mode with simple=
=20
> > OTG cables.=20
> >=20
> > Add support for it in peripheral mode.=20
> >=20
> > If someone really want to use it in host mode, the mode of PHY can be=
=20
> > switch via sysfs, then use a powered USB OTG cable or powered USB HUB t=
o=20
> > power up external USB devices.=20
> >=20
> > Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>=20
> > ---=20
> > New patch in v3.=20
> >=20
> >=C2=A0 arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts | 14 ++++++++++=
++++=20
> >=C2=A0 1 file changed, 14 insertions(+)=20
> >=20
> > diff --git a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts b/arch/a=
rm/boot/dts/sun8i-h2-plus-orangepi-zero.dts=20
> > index b7ca916d871d..63f819394b98 100644=20
> > --- a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts=20
> > +++ b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts=20
> > @@ -96,6 +96,10 @@=20
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };=20
> >=C2=A0 };=20
> >=20
> > +&ehci0 {=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";=20
> > +};=20
> > +=20
> >=C2=A0 &ehci1 {=20
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";=20
> >=C2=A0 };=20
> > @@ -132,6 +136,10 @@=20
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bias-pull-up;=20
> >=C2=A0 };=20
> >=20
> > +&ohci0 {=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";=20
> > +};=20
> > +=20
> >=C2=A0 &ohci1 {=20
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";=20
> >=C2=A0 };=20
> > @@ -154,7 +162,13 @@=20
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "disabled";=
=20
> >=C2=A0 };=20
> >=20
> > +&usb_otg {=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dr_mode =3D "peripheral";=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";=20
> > +};=20
> > +=20
> >=C2=A0 &usbphy {=20
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* USB VBUS is always o=
n */=20
>
> This comment does not match your commit message, which says it's always o=
ff.=20

Oh I should say "USB Type-A port VBUS".

>
> ChenYu=20
>
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usb0_id_det-gpios =3D <&pio 6 12 =
GPIO_ACTIVE_HIGH>; /* PG12 */=20
> >=C2=A0 };=20
> > --=20
> > 2.11.1=20
> >=20
> > --=20
> > You received this message because you are subscribed to the Google Grou=
ps "linux-sunxi" group.=20
> > To unsubscribe from this group and stop receiving emails from it, send =
an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org=20
> > For more options, visit https://groups.google.com/d/optout.=20
>
> --=20
> You received this message because you are subscribed to the Google Groups=
 "linux-sunxi" group.=20
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org=20
> For more options, visit https://groups.google.com/d/optout.=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
