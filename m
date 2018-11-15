From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v4 04/10] arm64: allwinner: dts: h6: add
 USB2-related device nodes
Date: Thu, 15 Nov 2018 10:16:12 +0800
Message-ID: <CAGb2v66Lndq1GMRDda3+2go1snGVS1fKTJTrHpP-B20FtG6VZA@mail.gmail.com>
References: <20181004122855.22981-1-icenowy@aosc.io> <20181004122855.22981-5-icenowy@aosc.io>
 <CAGb2v668dozjLm9mWUw_Y12AZ6DM2ku9dgQ8B8feABNeFf3QSw@mail.gmail.com> <4B5BD39B-22E2-4DEA-A199-29094DB8C317@aosc.io>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBB65NWPPQKGQEFC2T4NQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <4B5BD39B-22E2-4DEA-A199-29094DB8C317-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 14, 2018 at 6:31 PM Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> =E4=BA=8E 2018=E5=B9=B411=E6=9C=8814=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=
=886:21:33, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> =E5=86=99=E5=88=B0:
> >Hi,
> >
> >On Thu, Oct 4, 2018 at 8:30 PM Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> >>
> >> Allwinner H6 has two USB2 ports, one OTG and one host-only.
> >>
> >> Add device tree nodes related to them.
> >>
> >> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> >> Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> >> ---
> >> No changes in v4.
> >>
> >> Changes in v3:
> >> - Removed the wrongly introduced usb3phy node.
> >> - Added Chen-Yu's Review tag.
> >>
> >>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 81
> >++++++++++++++++++++
> >>  1 file changed, 81 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> >b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> >> index 040828d2e2c0..3d60af6cb3ae 100644
> >> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> >> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> >> @@ -258,6 +258,87 @@
> >>                         status =3D "disabled";
> >>                 };
> >>
> >> +               usb2otg: usb@5100000 {
> >> +                       compatible =3D "allwinner,sun8i-a33-musb";
> >
> >I added an SoC-specific compatible: "allwinner,sun50i-h6-musb".
> >
> >I'm also curious as to whether the MUSB controller was tested or not,
> >since Allwinner now has EHCI/OHCI host pairs for host mode, and the
> >Pine H64
> >only does host mode.
>
> USB plug-in detection relays on MUSB if it's enabled.

That's not what I meant. Have you actually used the MUSB core in either
device or host mode to know that it is compatible with the A33? And
that it works correctly?

IIRC ID detection is done by the PHY driver, using the GPIO lines.
In host mode, since it's already directly routed to the host pair,
it's the host pair that does plug-in detection. The MUSB core is
completely unused. It should be quite clear if you look at the times
each interrupt line fired.

ChenYu

> >
> >> +                       reg =3D <0x05100000 0x0400>;
> >> +                       clocks =3D <&ccu CLK_BUS_OTG>;
> >> +                       resets =3D <&ccu RST_BUS_OTG>;
> >> +                       interrupts =3D <GIC_SPI 23
> >IRQ_TYPE_LEVEL_HIGH>;
> >> +                       interrupt-names =3D "mc";
> >> +                       phys =3D <&usb2phy 0>;
> >> +                       phy-names =3D "usb";
> >> +                       extcon =3D <&usb2phy 0>;
> >> +                       status =3D "disabled";
> >> +               };
> >> +
> >> +               usb2phy: phy@5100400 {
> >> +                       compatible =3D "allwinner,sun50i-h6-usb-phy";
> >> +                       reg =3D <0x05100400 0x14>,
> >> +                             <0x05101800 0x4>,
> >> +                             <0x05311800 0x4>;
> >> +                       reg-names =3D "phy_ctrl",
> >> +                                   "pmu0",
> >> +                                   "pmu3";
> >> +                       clocks =3D <&ccu CLK_USB_PHY0>,
> >> +                                <&ccu CLK_USB_PHY3>;
> >> +                       clock-names =3D "usb0_phy",
> >> +                                     "usb3_phy";
> >> +                       resets =3D <&ccu RST_USB_PHY0>,
> >> +                                <&ccu RST_USB_PHY3>;
> >> +                       reset-names =3D "usb0_reset",
> >> +                                     "usb3_reset";
> >> +                       status =3D "disabled";
> >> +                       #phy-cells =3D <1>;
> >> +               };
> >> +
> >> +               ehci0: usb@5101000 {
> >> +                       compatible =3D "allwinner,sun50i-h6-ehci",
> >"generic-ehci";
> >> +                       reg =3D <0x05101000 0x100>;
> >> +                       interrupts =3D <GIC_SPI 24
> >IRQ_TYPE_LEVEL_HIGH>;
> >> +                       clocks =3D <&ccu CLK_BUS_OHCI0>,
> >> +                                <&ccu CLK_BUS_EHCI0>,
> >> +                                <&ccu CLK_USB_OHCI0>;
> >> +                       resets =3D <&ccu RST_BUS_OHCI0>,
> >> +                                <&ccu RST_BUS_EHCI0>;
> >> +                       status =3D "disabled";
> >> +               };
> >> +
> >> +               ohci0: usb@5101400 {
> >> +                       compatible =3D "allwinner,sun50i-h6-ohci",
> >"generic-ohci";
> >> +                       reg =3D <0x05101400 0x100>;
> >> +                       interrupts =3D <GIC_SPI 25
> >IRQ_TYPE_LEVEL_HIGH>;
> >> +                       clocks =3D <&ccu CLK_BUS_OHCI0>,
> >> +                                <&ccu CLK_USB_OHCI0>;
> >> +                       resets =3D <&ccu RST_BUS_OHCI0>;
> >> +                       status =3D "disabled";
> >> +               };
> >> +
> >> +               ehci3: usb@5311000 {
> >> +                       compatible =3D "allwinner,sun50i-h6-ehci",
> >"generic-ehci";
> >> +                       reg =3D <0x05311000 0x100>;
> >> +                       interrupts =3D <GIC_SPI 28
> >IRQ_TYPE_LEVEL_HIGH>;
> >> +                       clocks =3D <&ccu CLK_BUS_OHCI3>,
> >> +                                <&ccu CLK_BUS_EHCI3>,
> >> +                                <&ccu CLK_USB_OHCI3>;
> >> +                       resets =3D <&ccu RST_BUS_OHCI3>,
> >> +                                <&ccu RST_BUS_EHCI3>;
> >> +                       phys =3D <&usb2phy 3>;
> >> +                       phy-names =3D "usb";
> >> +                       status =3D "disabled";
> >> +               };
> >> +
> >> +               ohci3: usb@5311400 {
> >> +                       compatible =3D "allwinner,sun50i-h6-ohci",
> >"generic-ohci";
> >> +                       reg =3D <0x05311400 0x100>;
> >> +                       interrupts =3D <GIC_SPI 29
> >IRQ_TYPE_LEVEL_HIGH>;
> >> +                       clocks =3D <&ccu CLK_BUS_OHCI3>,
> >> +                                <&ccu CLK_USB_OHCI3>;
> >> +                       resets =3D <&ccu RST_BUS_OHCI3>;
> >> +                       phys =3D <&usb2phy 3>;
> >> +                       phy-names =3D "usb";
> >> +                       status =3D "disabled";
> >> +               };
> >> +
> >
> >This didn't apply cleanly due to the new HDMI nodes. I fixed it up
> >locally.
> >
> >ChenYu
> >
> >>                 r_ccu: clock@7010000 {
> >>                         compatible =3D "allwinner,sun50i-h6-r-ccu";
> >>                         reg =3D <0x07010000 0x400>;
> >> --
> >> 2.18.0
> >>
> >> --
> >> You received this message because you are subscribed to the Google
> >Groups "linux-sunxi" group.
> >> To unsubscribe from this group and stop receiving emails from it,
> >send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> >> For more options, visit https://groups.google.com/d/optout.
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
