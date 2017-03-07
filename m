From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH v3 0/5] Add dual-role OTG support for
 Allwinner H3
Date: Tue, 07 Mar 2017 16:41:34 +0800
Message-ID: <20170307114159.fs2WcruU@smtp1m.mail.yandex.net>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBYXE7HCQKGQEGCDT45A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "
	linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "	devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


2017=E5=B9=B43=E6=9C=887=E6=97=A5 10:47=E4=BA=8E Chen-Yu Tsai <wens-/F2/8XmEos0@public.gmane.org=
g>=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Mar 7, 2017 at 8:24 AM, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org> wrote:=
=20
> >=20
> >=20
> > 07.03.2017, 07:48, "Ond=C5=99ej Jirman" <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>:=20
> >> Hi Icenowy,=20
> >>=20
> >> when I was trying to add OTG support I found an issue with powercyclin=
g.=20
> >> When I have USB cable connecting PC and the OTG port on the SBC, when=
=20
> >> the board enables the vbus, it would become impossible to power cycle=
=20
> >> the board after poweroff. The reason being that when vbus is enabled,=
=20
> >> the board is powered from the OTG port even if you disconnect the barr=
el=20
> >> plug.=20
> >>=20
> >> Should kernel turn off the vbus before shutting down/restarting? What =
do=20
> >> you think?=20
> >=20
> > It's a good problem.=20
> >=20
> > I think this problem can be abstracted into:=20
> > Some regulators are needed to be shut down before system=20
> > shutdown.=20
>
> Sounds like the board is getting back-powered from VBUS through the enabl=
ed=20
> current regulator. Given that you have it connected to the PC, which I as=
sume=20
> means peripheral mode, the bigger issue is why is VBUS enabled in periphe=
ral=20
> mode? It should never ever be so.=20

Oh thanks Chen-Yu, you reminded me.

This problem have already been solved by unbind *HCI with <&usbphy 0>, as p=
ower is now controller by MUSB. (Yes, when developing v1, I wonder why the =
board gets powered via vbus... and in v2 this situation disappared)

Ondrej seems to binded phy to both MUSB and *HCI...

>
>
> Regards=20
> ChenYu=20
>
> > Is there any framework for it?=20
> >=20
> > Mark,=20
> > I add you to recipients for the question above.=20
> >=20
> > Thanks,=20
> > Icenowy=20
> >=20
> >>=20
> >> regards,=20
> >>=C2=A0=C2=A0 o.=20
> >>=20
> >> Dne 6.3.2017 v 23:34 Icenowy Zheng napsal(a):=20
> >>>=C2=A0 Allwinner H3 have a its USB PHY0 routed to two USB controllers:=
 one is=20
> >>>=C2=A0 a MUSB controller, which can work in peripheral mode, but works=
 badly in=20
> >>>=C2=A0 host mode (several hardware will fail on the MUSB controller, e=
ven connect=20
> >>>=C2=A0 one MUSB controller in peripheral mode to another one in host m=
ode cannot=20
> >>>=C2=A0 work); the other is a pair of EHCI/OHCI controller, which can w=
ork only=20
> >>>=C2=A0 in host mode, but have better compatibillity. The route is cont=
rolled in=20
> >>>=C2=A0 a register, which we have set it to HCI only when we do not kno=
w about=20
> >>>=C2=A0 it well.=20
> >>>=20
> >>>=C2=A0 Add support to route to the best controller according to curren=
t USB mode=20
> >>>=C2=A0 (host/peripheral).=20
> >>>=20
> >>>=C2=A0 Note: Currently even if hardware only support hostmode, we shou=
ld still=20
> >>>=C2=A0 enable the MUSB controller, as it controls the USB mode. (Some =
this kind=20
> >>>=C2=A0 of hardware can also work in peripheral mode by settings in the=
 sysfs=20
> >>>=C2=A0 node of MUSB, then connect it to another host via a USB Type-A =
to Type-A=20
> >>>=C2=A0 cable.)=20
> >>>=20
> >>>=C2=A0 Patch 1 changes the device tree binding to include the "pmu0" f=
or HCI pair.=20
> >>>=20
> >>>=C2=A0 Patch 2 adds support for auto routing of PHY0. It's currently o=
nly enabled=20
> >>>=C2=A0 on H3, but it's easy to extend it to other SoCs which feature t=
his=20
> >>>=C2=A0 route control.=20
> >>>=20
> >>>=C2=A0 Patch 3 adds necessary device tree nodes to the H3 DTSI file. N=
ote: The=20
> >>>=C2=A0 phy is not bind for OHCI/EHCI0, as OHCI/EHCI drivers will keep =
the VBUS=20
> >>>=C2=A0 on. Only MUSB driver can properly handle a dual-role PHY.=20
> >>>=20
> >>>=C2=A0 Patch 4 enables USB OTG functionality on Orange Pi One board, w=
hich is=20
> >>>=C2=A0 the only H3 board I have that have proper OTG function. It's ea=
sy to=20
> >>>=C2=A0 enable OTG on other boards with their schematics.=20
> >>>=20
> >>>=C2=A0 Patch 5 enables USB OTG functionality on Orange Pi Zero board, =
as the=20
> >>>=C2=A0 board cannot output power on Vbus, I only enabled peripheral mo=
de by=20
> >>>=C2=A0 default.=20
> >>>=20
> >>>=C2=A0 The USB PHY on V3s/A64 SoCs also feature this capability, and i=
t will=20
> >>>=C2=A0 be soon enabled on these SoCs after this patchset is merged.=20
> >>>=20
> >>>=C2=A0 Icenowy Zheng (5):=20
> >>>=C2=A0=C2=A0=C2=A0 dt: bindings: add pmu0 regs for USB PHYs on Allwinn=
er H3/V3s/A64=20
> >>>=C2=A0=C2=A0=C2=A0 phy: sun4i-usb: support automatically switch PHY0 r=
oute to MUSB/HCI=20
> >>>=C2=A0=C2=A0=C2=A0 ARM: dts: sun8i: h3: add usb_otg and OHCI/EHCI for =
usbc0 on H3=20
> >>>=C2=A0=C2=A0=C2=A0 ARM: dts: sun8i: h3: enable USB OTG on Orange Pi On=
e=20
> >>>=C2=A0=C2=A0=C2=A0 ARM: dts: sun8i: h2+: enable USB OTG for Orange Pi =
Zero board=20
> >>>=20
> >>>=C2=A0=C2=A0 .../devicetree/bindings/phy/sun4i-usb-phy.txt | 1 +=20
> >>>=C2=A0=C2=A0 arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts | 14 ++=
++++=20
> >>>=C2=A0=C2=A0 arch/arm/boot/dts/sun8i-h3-orangepi-one.dts | 22 ++++++++=
+-=20
> >>>=C2=A0=C2=A0 arch/arm/boot/dts/sun8i-h3.dtsi | 32 ++++++++++++++=20
> >>>=C2=A0=C2=A0 drivers/phy/phy-sun4i-usb.c | 50 ++++++++++++++--------=
=20
> >>>=C2=A0=C2=A0 5 files changed, 101 insertions(+), 18 deletions(-)=20
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
