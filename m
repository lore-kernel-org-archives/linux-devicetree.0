From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH v3 -next 1/2] ARM: sunxi: add support for
 H2+ SoC
Date: Mon, 05 Dec 2016 14:44:02 +0800
Message-ID: <20161205115958.xp80pInw@smtp3h.mail.yandex.net>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBJGZSTBAKGQEBOJT6SY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Alexey Kardashevskiy <aik-sLpHqDYs0B2HXe+LvDLADg@public.gmane.org>
Cc: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


2016=E5=B9=B412=E6=9C=885=E6=97=A5 =E4=B8=8A=E5=8D=8810:27=E4=BA=8E Alexey =
Kardashevskiy <aik-sLpHqDYs0B2HXe+LvDLADg@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A
>
> On 03/12/16 02:05, Icenowy Zheng wrote:=20
> > Allwinner H2+ is a quad-core Cortex-A7 SoC.=20
> >=20
> > It is very like H3, that they share the same SoC ID (0x1680), and H3=20
> > memory maps as well as drivers works well on the SoC.=20
>
>
> What git tree is this made against of? Thanks.=20

linux-next. See the title ;-)

>
>
> >=20
> > Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>=20
> > ---=20
> > Changes since v2:=20
> > - Changed compatible from allwinner,sun8i-h2plus to allwinner,sun8i-h2-=
plus.=20
> >=C2=A0 Documentation/arm/sunxi/README=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 +=
+++=20
> >=C2=A0 Documentation/devicetree/bindings/arm/sunxi.txt | 1 +=20
> >=C2=A0 arch/arm/mach-sunxi/sunxi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 1 +=20
> >=C2=A0 3 files changed, 6 insertions(+)=20
> >=20
> > diff --git a/Documentation/arm/sunxi/README b/Documentation/arm/sunxi/R=
EADME=20
> > index cd02433..1fe4d99c 100644=20
> > --- a/Documentation/arm/sunxi/README=20
> > +++ b/Documentation/arm/sunxi/README=20
> > @@ -63,6 +63,10 @@ SunXi family=20
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + User Manual=20
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 http:=
//dl.linux-sunxi.org/A33/A33%20user%20manual%20release%201.1.pdf=20
> >=C2=A0=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Allwinner H2+ (sun8i)=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + No document available now=
, but is known to be working properly with=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 H3 drivers and =
memory map.=20
> > +=20
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Allwinner H3 (sun8i)=20
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + Datasheet=20
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 http:=
//dl.linux-sunxi.org/H3/Allwinner_H3_Datasheet_V1.0.pdf=20
> > diff --git a/Documentation/devicetree/bindings/arm/sunxi.txt b/Document=
ation/devicetree/bindings/arm/sunxi.txt=20
> > index 4d6467c..59b143f 100644=20
> > --- a/Documentation/devicetree/bindings/arm/sunxi.txt=20
> > +++ b/Documentation/devicetree/bindings/arm/sunxi.txt=20
> > @@ -13,6 +13,7 @@ using one of the following compatible strings:=20
> >=C2=A0=C2=A0=C2=A0 allwinner,sun8i-a33=20
> >=C2=A0=C2=A0=C2=A0 allwinner,sun8i-a83t=20
> >=C2=A0=C2=A0=C2=A0 allwinner,sun8i-h3=20
> > +=C2=A0 allwinner,sun8i-h2-plus=20
> >=C2=A0=C2=A0=C2=A0 allwinner,sun9i-a80=20
> >=C2=A0=C2=A0=C2=A0 allwinner,sun50i-a64=20
> >=C2=A0=C2=A0=C2=A0 nextthing,gr8=20
> > diff --git a/arch/arm/mach-sunxi/sunxi.c b/arch/arm/mach-sunxi/sunxi.c=
=20
> > index 2e2bde2..320d2af 100644=20
> > --- a/arch/arm/mach-sunxi/sunxi.c=20
> > +++ b/arch/arm/mach-sunxi/sunxi.c=20
> > @@ -63,6 +63,7 @@ static const char * const sun8i_board_dt_compat[] =3D=
 {=20
> >=C2=A0 "allwinner,sun8i-a23",=20
> >=C2=A0 "allwinner,sun8i-a33",=20
> >=C2=A0 "allwinner,sun8i-a83t",=20
> > + "allwinner,sun8i-h2-plus",=20
> >=C2=A0 "allwinner,sun8i-h3",=20
> >=C2=A0 NULL,=20
> >=C2=A0 };=20
> >=20
>
>
> --=20
> Alexey=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
