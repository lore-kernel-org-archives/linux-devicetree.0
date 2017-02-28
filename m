From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: sun8i: add usb_otg and
 OHCI/EHCI for usbc0 on H3
Date: Wed, 01 Mar 2017 00:07:48 +0800
Message-ID: <59571488298068@web6j.yandex.ru>
References: <20170228152702.42602-1-icenowy@aosc.xyz> <20170228152702.42602-2-icenowy@aosc.xyz> <CAGb2v67fsuhRnGp7X8PDkH_t_gb+gPb6VrY-pVu0B4HhD6d8qA@mail.gmail.com>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBV6A23CQKGQE7BTR3EY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v67fsuhRnGp7X8PDkH_t_gb+gPb6VrY-pVu0B4HhD6d8qA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: "wens-jdAy2FN1RRM@public.gmane.org" <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



28.02.2017, 23:46, "Chen-Yu Tsai" <wens-jdAy2FN1RRM@public.gmane.org>:
> On Tue, Feb 28, 2017 at 11:27 PM, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org> wrote:
>> =C2=A0Allwinner H3 have a dual-routed USB PHY0 -- routed to either OHCI/=
EHCI
>> =C2=A0or MUSB controller.
>>
>> =C2=A0Add device nodes for these controllers.
>>
>> =C2=A0Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
>> =C2=A0---
>> =C2=A0=C2=A0arch/arm/boot/dts/sun8i-h3.dtsi | 36 +++++++++++++++++++++++=
+++++++++++++
>> =C2=A0=C2=A01 file changed, 36 insertions(+)
>>
>> =C2=A0diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/s=
un8i-h3.dtsi
>> =C2=A0index 27780b97c863..bc9a53edf371 100644
>> =C2=A0--- a/arch/arm/boot/dts/sun8i-h3.dtsi
>> =C2=A0+++ b/arch/arm/boot/dts/sun8i-h3.dtsi
>> =C2=A0@@ -206,6 +206,19 @@
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0#size-cells =3D <0>;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
>>
>> =C2=A0+ usb_otg: usb@01c19000 {
>> =C2=A0+ compatible =3D "allwinner,sun8i-h3-musb";
>> =C2=A0+ reg =3D <0x01c19000 0x0400>;
>> =C2=A0+ clocks =3D <&ccu CLK_BUS_OTG>;
>> =C2=A0+ resets =3D <&ccu RST_BUS_OTG>;
>> =C2=A0+ interrupts =3D <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
>> =C2=A0+ interrupt-names =3D "mc";
>> =C2=A0+ phys =3D <&usbphy 0>;
>> =C2=A0+ phy-names =3D "usb";
>> =C2=A0+ extcon =3D <&usbphy 0>;
>> =C2=A0+ status =3D "disabled";
>> =C2=A0+ };
>> =C2=A0+
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0usbphy: phy@01c19400 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0compatible =3D "allwinner,sun8i-h3-usb-phy";
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0reg =3D <0x01c19400 0x2c>,
>> =C2=A0@@ -238,6 +251,29 @@
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0#phy-cells =3D <1>;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
>>
>> =C2=A0+ ehci0: usb@01c1a000 {
>> =C2=A0+ compatible =3D "allwinner,sun8i-h3-ehci", "generic-ehci";
>> =C2=A0+ reg =3D <0x01c1a000 0x100>;
>> =C2=A0+ interrupts =3D <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
>> =C2=A0+ clocks =3D <&ccu CLK_BUS_EHCI0>, <&ccu CLK_BUS_OHCI0>;
>> =C2=A0+ resets =3D <&ccu RST_BUS_EHCI0>, <&ccu RST_BUS_OHCI0>;
>> =C2=A0+ phys =3D <&usbphy 0>;
>> =C2=A0+ phy-names =3D "usb";
>
> So this bit is slightly concerning. IIRC the xHCI drivers power on the ph=
y when
> probed, which means VBUS is _always_ going to be powered on, even when it=
's
> supposed to be in peripheral mode. You're probably going to need to rewor=
k
> either the phy or the musb driver to cope with this.
>
> Or maybe just dropping the phy handle here and letting the musb driver ha=
ndle
> it would work, but that requires the musb driver be loaded.

Tested this solution.

I may choose it in the next version.

Hans, how do you think of this solution?

>
> ChenYu
>
>> =C2=A0+ status =3D "disabled";
>> =C2=A0+ };
>> =C2=A0+
>> =C2=A0+ ohci0: usb@01c1a400 {
>> =C2=A0+ compatible =3D "allwinner,sun8i-h3-ohci", "generic-ohci";
>> =C2=A0+ reg =3D <0x01c1a400 0x100>;
>> =C2=A0+ interrupts =3D <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
>> =C2=A0+ clocks =3D <&ccu CLK_BUS_EHCI0>, <&ccu CLK_BUS_OHCI0>,
>> =C2=A0+ <&ccu CLK_USB_OHCI0>;
>> =C2=A0+ resets =3D <&ccu RST_BUS_EHCI0>, <&ccu RST_BUS_OHCI0>;
>> =C2=A0+ phys =3D <&usbphy 0>;
>> =C2=A0+ phy-names =3D "usb";
>> =C2=A0+ status =3D "disabled";
>> =C2=A0+ };
>> =C2=A0+
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ehci1: usb@01c1b000 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0compatible =3D "allwinner,sun8i-h3-ehci", "generic-ehci";
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0reg =3D <0x01c1b000 0x100>;
>> =C2=A0--
>> =C2=A02.11.1
>>
>> =C2=A0--
>> =C2=A0You received this message because you are subscribed to the Google=
 Groups "linux-sunxi" group.
>> =C2=A0To unsubscribe from this group and stop receiving emails from it, =
send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
>> =C2=A0For more options, visit https://groups.google.com/d/optout.
>
> --
> You received this message because you are subscribed to the Google Groups=
 "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
