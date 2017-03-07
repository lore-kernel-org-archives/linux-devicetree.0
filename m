From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH v3 0/5] Add dual-role OTG support for
 Allwinner H3
Date: Tue, 07 Mar 2017 08:24:53 +0800
Message-ID: <974021488846293@web19o.yandex.ru>
References: <20170306223449.21404-1-icenowy@aosc.xyz> <e110a2c0-ee91-b6eb-9e94-e32034aae4d7@megous.com>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBWP367CQKGQEROYJAHQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <e110a2c0-ee91-b6eb-9e94-e32034aae4d7-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?utf-8?B?T25kxZllaiBKaXJtYW4=?= <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



07.03.2017, 07:48, "Ond=C5=99ej Jirman" <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>:
> Hi Icenowy,
>
> when I was trying to add OTG support I found an issue with powercycling.
> When I have USB cable connecting PC and the OTG port on the SBC, when
> the board enables the vbus, it would become impossible to power cycle
> the board after poweroff. The reason being that when vbus is enabled,
> the board is powered from the OTG port even if you disconnect the barrel
> plug.
>
> Should kernel turn off the vbus before shutting down/restarting? What do
> you think?

It's a good problem.

I think this problem can be abstracted into:
Some regulators are needed to be shut down before system=20
shutdown.

Is there any framework for it?

Mark,
I add you to recipients for the question above.

Thanks,
Icenowy

>
> regards,
> =C2=A0=C2=A0o.
>
> Dne 6.3.2017 v 23:34 Icenowy Zheng napsal(a):
>> =C2=A0Allwinner H3 have a its USB PHY0 routed to two USB controllers: on=
e is
>> =C2=A0a MUSB controller, which can work in peripheral mode, but works ba=
dly in
>> =C2=A0host mode (several hardware will fail on the MUSB controller, even=
 connect
>> =C2=A0one MUSB controller in peripheral mode to another one in host mode=
 cannot
>> =C2=A0work); the other is a pair of EHCI/OHCI controller, which can work=
 only
>> =C2=A0in host mode, but have better compatibillity. The route is control=
led in
>> =C2=A0a register, which we have set it to HCI only when we do not know a=
bout
>> =C2=A0it well.
>>
>> =C2=A0Add support to route to the best controller according to current U=
SB mode
>> =C2=A0(host/peripheral).
>>
>> =C2=A0Note: Currently even if hardware only support hostmode, we should =
still
>> =C2=A0enable the MUSB controller, as it controls the USB mode. (Some thi=
s kind
>> =C2=A0of hardware can also work in peripheral mode by settings in the sy=
sfs
>> =C2=A0node of MUSB, then connect it to another host via a USB Type-A to =
Type-A
>> =C2=A0cable.)
>>
>> =C2=A0Patch 1 changes the device tree binding to include the "pmu0" for =
HCI pair.
>>
>> =C2=A0Patch 2 adds support for auto routing of PHY0. It's currently only=
 enabled
>> =C2=A0on H3, but it's easy to extend it to other SoCs which feature this
>> =C2=A0route control.
>>
>> =C2=A0Patch 3 adds necessary device tree nodes to the H3 DTSI file. Note=
: The
>> =C2=A0phy is not bind for OHCI/EHCI0, as OHCI/EHCI drivers will keep the=
 VBUS
>> =C2=A0on. Only MUSB driver can properly handle a dual-role PHY.
>>
>> =C2=A0Patch 4 enables USB OTG functionality on Orange Pi One board, whic=
h is
>> =C2=A0the only H3 board I have that have proper OTG function. It's easy =
to
>> =C2=A0enable OTG on other boards with their schematics.
>>
>> =C2=A0Patch 5 enables USB OTG functionality on Orange Pi Zero board, as =
the
>> =C2=A0board cannot output power on Vbus, I only enabled peripheral mode =
by
>> =C2=A0default.
>>
>> =C2=A0The USB PHY on V3s/A64 SoCs also feature this capability, and it w=
ill
>> =C2=A0be soon enabled on these SoCs after this patchset is merged.
>>
>> =C2=A0Icenowy Zheng (5):
>> =C2=A0=C2=A0=C2=A0dt: bindings: add pmu0 regs for USB PHYs on Allwinner =
H3/V3s/A64
>> =C2=A0=C2=A0=C2=A0phy: sun4i-usb: support automatically switch PHY0 rout=
e to MUSB/HCI
>> =C2=A0=C2=A0=C2=A0ARM: dts: sun8i: h3: add usb_otg and OHCI/EHCI for usb=
c0 on H3
>> =C2=A0=C2=A0=C2=A0ARM: dts: sun8i: h3: enable USB OTG on Orange Pi One
>> =C2=A0=C2=A0=C2=A0ARM: dts: sun8i: h2+: enable USB OTG for Orange Pi Zer=
o board
>>
>> =C2=A0=C2=A0.../devicetree/bindings/phy/sun4i-usb-phy.txt | 1 +
>> =C2=A0=C2=A0arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts | 14 +++++=
+
>> =C2=A0=C2=A0arch/arm/boot/dts/sun8i-h3-orangepi-one.dts | 22 +++++++++-
>> =C2=A0=C2=A0arch/arm/boot/dts/sun8i-h3.dtsi | 32 ++++++++++++++
>> =C2=A0=C2=A0drivers/phy/phy-sun4i-usb.c | 50 ++++++++++++++--------
>> =C2=A0=C2=A05 files changed, 101 insertions(+), 18 deletions(-)

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
