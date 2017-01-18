From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH 1/4] phy: sun4i-usb: support PHY0 on H3 in
 MUSB mode
Date: Wed, 18 Jan 2017 11:13:04 +0800
Message-ID: <20170122132413.O7v07hXn@smtp2o.mail.yandex.net>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBWMQSLCAKGQE76QSIII-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "	linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, "	linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, "	linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "
	devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


2017=E5=B9=B41=E6=9C=8818=E6=97=A5 04:09=E4=BA=8E Chen-Yu Tsai <wens@csie.o=
rg>=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,=20
>
> On Wed, Jan 18, 2017 at 4:06 AM, Maxime Ripard=20
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:=20
> > On Wed, Jan 18, 2017 at 12:57:08AM +0800, Icenowy Zheng wrote:=20
> >>=20
> >>=20
> >> 17.01.2017, 16:06, "Maxime Ripard" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:=
=20
> >> > On Tue, Jan 17, 2017 at 03:14:46AM +0800, Icenowy Zheng wrote:=20
> >> >>=C2=A0 The PHY0 on H3 can be wired either to MUSB controller or OHCI=
/EHCI=20
> >> >>=C2=A0 controller.=20
> >> >>=20
> >> >>=C2=A0 The original driver wired it to OHCI/EHCI controller; however=
, as the=20
> >> >>=C2=A0 code to use PHY0 as OHCI/EHCI is missing, it makes the PHY fu=
lly=20
> >> >>=C2=A0 unusable.=20
> >> >>=20
> >> >>=C2=A0 Rename the register (according to its function and the name i=
n BSP=20
> >> >>=C2=A0 driver), and remove the code which wires the PHY0 to OHCI/EHC=
I, as MUSB=20
> >> >>=C2=A0 can support both peripheral and host mode (although the host =
mode of=20
> >> >>=C2=A0 MUSB is buggy).=20
> >> >=20
> >> > Can you elaborate on that? What's wrong with it?=20
> >>=20
> >> The configuration is at bit 0 of register 0x20 in PHY.=20
> >>=20
> >> When the PHY is reseted, it defaults as MUSB mode.=20
> >>=20
> >> However, the original author of the H3 PHY code seems to be lack of=20
> >> this knowledge (He named it PHY_UNK_H3), and changed the PHY to HCI=20
> >> mode.=20
> >>=20
> >> I just removed the code that wires it to HCI mode, thus it will work=
=20
> >> in MUSB mode, with my sun8i-h3-musb patch.=20
> >=20
> > I have no idea what you mean by MUSB mode.=20
> >=20
> > Do you mean that the previous code was only working in host mode, and=
=20
> > now it only works in peripheral?=20
>
> From what I understand, with the H3, Allwinner has put a mux=20
> in front of the MUSB controller. The mux can send the USB data=20
> to/from the MUSB controller, or a standard EHCI/OHCI pair.=20
> This register controls said mux.=20
>
> This means we can use a proper USB host for host mode,=20
> instead of the limited support in MUSB.=20
>

Yes you got it.

The MUSB controller can also be used in host mode, but weaker then EHCI/OHC=
I.

> ChenYu=20
>
> >=20
> > Maxime=20
> >=20
> > --=20
> > Maxime Ripard, Free Electrons=20
> > Embedded Linux and Kernel engineering=20
> > http://free-electrons.com=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
