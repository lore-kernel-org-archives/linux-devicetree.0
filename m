From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: [PATCH v3 23/24] ARM: dts: sun8i: r40: Add HDMI pipeline
Date: Thu, 28 Jun 2018 07:15:18 +0200
Message-ID: <21259128.K3MyN3b6Bq@jernej-laptop>
References: <20180625120304.7543-1-jernej.skrabec@siol.net> <20180625120304.7543-24-jernej.skrabec@siol.net> <CAGb2v66d-L4+TAgOMoPfpK2WAc3LKfprLB7tiAFL4YeL3Ogoow@mail.gmail.com>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDQNBWPU7YERBP662HMQKGQES5FBFPY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v66d-L4+TAgOMoPfpK2WAc3LKfprLB7tiAFL4YeL3Ogoow-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Gustavo Padovan <gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dne =C4=8Detrtek, 28. junij 2018 ob 04:50:09 CEST je Chen-Yu Tsai napisal(a=
):
> On Mon, Jun 25, 2018 at 8:03 PM, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>=
=20
wrote:
> > Add all entries needed for HDMI to function properly.
> >=20
> > Since R40 has highly configurable pipeline, both mixers and both TCON
> > TVs are added. Board specific DT should then connect them together
> > trough TCON TOP muxers to best fit the purpose of the board.
> >=20
> > Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> > ---
> >=20
> >  arch/arm/boot/dts/sun8i-r40.dtsi | 269 +++++++++++++++++++++++++++++++
> >  1 file changed, 269 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi
> > b/arch/arm/boot/dts/sun8i-r40.dtsi index 173dcc1652d2..a2a75fb04caf
> > 100644
> > --- a/arch/arm/boot/dts/sun8i-r40.dtsi
> > +++ b/arch/arm/boot/dts/sun8i-r40.dtsi
> > @@ -42,8 +42,11 @@
> >=20
> >   */
> > =20
> >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >=20
> > +#include <dt-bindings/clock/sun8i-de2.h>
> >=20
> >  #include <dt-bindings/clock/sun8i-r40-ccu.h>
> >=20
> > +#include <dt-bindings/clock/sun8i-tcon-top.h>

Maxime, above line breaks compilation for build robot, sorry.

> >=20
> >  #include <dt-bindings/reset/sun8i-r40-ccu.h>
> >=20
> > +#include <dt-bindings/reset/sun8i-de2.h>
> >=20
> >  / {
> > =20
> >         #address-cells =3D <1>;
> >=20
> > @@ -99,12 +102,76 @@
> >=20
> >                 };
> >        =20
> >         };
> >=20
> > +       de: display-engine {
> > +               compatible =3D "allwinner,sun8i-r40-display-engine",
> > +                            "allwinner,sun8i-h3-display-engine";
>=20
> Given that the display pipeline looks different, they should not be
> compatible.

Ok.

>=20
> > +               allwinner,pipelines =3D <&mixer0>, <&mixer1>;
> > +               status =3D "disabled";
> > +       };
> > +
> >=20
> >         soc {
> >        =20
> >                 compatible =3D "simple-bus";
> >                 #address-cells =3D <1>;
> >                 #size-cells =3D <1>;
> >                 ranges;
> >=20
> > +               display_clocks: clock@1000000 {
> > +                       compatible =3D "allwinner,sun8i-r40-de2-clk",
> > +                                    "allwinner,sun8i-h3-de2-clk";
> > +                       reg =3D <0x01000000 0x100000>;
> > +                       clocks =3D <&ccu CLK_DE>,
> > +                                <&ccu CLK_BUS_DE>;
> > +                       clock-names =3D "mod",
> > +                                     "bus";
> > +                       resets =3D <&ccu RST_BUS_DE>;
> > +                       #clock-cells =3D <1>;
> > +                       #reset-cells =3D <1>;
> > +               };
> > +
> > +               mixer0: mixer@1100000 {
> > +                       compatible =3D "allwinner,sun8i-r40-de2-mixer-0=
";
> > +                       reg =3D <0x01100000 0x100000>;
> > +                       clocks =3D <&display_clocks CLK_BUS_MIXER0>,
> > +                                <&display_clocks CLK_MIXER0>;
> > +                       clock-names =3D "bus",
> > +                                     "mod";
> > +                       resets =3D <&display_clocks RST_MIXER0>;
> > +
> > +                       ports {
> > +                               #address-cells =3D <1>;
> > +                               #size-cells =3D <0>;
> > +
> > +                               mixer0_out: port@1 {
> > +                                       reg =3D <1>;
> > +                                       mixer0_out_tcon_top: endpoint {
> > +                                               remote-endpoint =3D
> > <&tcon_top_mixer0_in_mixer0>; +                                       }=
;
> > +                               };
> > +                       };
> > +               };
> > +
> > +               mixer1: mixer@1200000 {
> > +                       compatible =3D "allwinner,sun8i-r40-de2-mixer-1=
";
> > +                       reg =3D <0x01200000 0x100000>;
> > +                       clocks =3D <&display_clocks CLK_BUS_MIXER1>,
> > +                                <&display_clocks CLK_MIXER1>;
> > +                       clock-names =3D "bus",
> > +                                     "mod";
> > +                       resets =3D <&display_clocks RST_WB>;
> > +
> > +                       ports {
> > +                               #address-cells =3D <1>;
> > +                               #size-cells =3D <0>;
> > +
> > +                               mixer1_out: port@1 {
> > +                                       reg =3D <1>;
> > +                                       mixer1_out_tcon_top: endpoint {
> > +                                               remote-endpoint =3D
> > <&tcon_top_mixer1_in_mixer1>; +                                       }=
;
> > +                               };
> > +                       };
> > +               };
> > +
> >=20
> >                 nmi_intc: interrupt-controller@1c00030 {
> >                =20
> >                         compatible =3D "allwinner,sun7i-a20-sc-nmi";
> >                         interrupt-controller;
> >=20
> > @@ -451,6 +518,163 @@
> >=20
> >                         #size-cells =3D <0>;
> >                =20
> >                 };
> >=20
> > +               tcon_top: tcon-top@1c70000 {
> > +                       compatible =3D "allwinner,sun8i-r40-tcon-top";
> > +                       reg =3D <0x01c70000 0x1000>;
> > +                       clocks =3D <&ccu CLK_BUS_TCON_TOP>,
> > +                                <&ccu CLK_TCON_TV0>,
> > +                                <&ccu CLK_TVE0>,
> > +                                <&ccu CLK_TCON_TV1>,
> > +                                <&ccu CLK_TVE1>,
> > +                                <&ccu CLK_DSI_DPHY>;
> > +                       clock-names =3D "bus",
> > +                                     "tcon-tv0",
> > +                                     "tve0",
> > +                                     "tcon-tv1",
> > +                                     "tve1",
> > +                                     "dsi";
> > +                       clock-output-names =3D "tcon-top-tv0",
> > +                                            "tcon-top-tv1",
> > +                                            "tcon-top-dsi";
> > +                       resets =3D <&ccu RST_BUS_TCON_TOP>;
> > +                       #clock-cells =3D <1>;
> > +
> > +                       ports {
> > +                               #address-cells =3D <1>;
> > +                               #size-cells =3D <0>;
> > +
> > +                               tcon_top_mixer0_in: port@0 {
> > +                                       reg =3D <0>;
> > +
> > +                                       tcon_top_mixer0_in_mixer0:
> > endpoint { +                                             =20
> > remote-endpoint =3D <&mixer0_out_tcon_top>; +                          =
   =20
> >         };
> > +                               };
> > +
> > +                               tcon_top_mixer0_out: port@1 {
> > +                                       #address-cells =3D <1>;
> > +                                       #size-cells =3D <0>;
> > +                                       reg =3D <1>;
> > +
> > +                                       tcon_top_mixer0_out_tcon_lcd0:
> > endpoint@0 { +                                               reg =3D <0=
>;
> > +                                       };
> > +
> > +                                       tcon_top_mixer0_out_tcon_lcd1:
> > endpoint@1 { +                                               reg =3D <1=
>;
> > +                                       };
> > +
> > +                                       tcon_top_mixer0_out_tcon_tv0:
> > endpoint@2 { +                                               reg =3D <2=
>;
> > +                                       };
> > +
> > +                                       tcon_top_mixer0_out_tcon_tv1:
> > endpoint@3 { +                                               reg =3D <3=
>;
> > +                                       };
> > +                               };
> > +
> > +                               tcon_top_mixer1_in: port@2 {
> > +                                       reg =3D <2>;
> > +
> > +                                       tcon_top_mixer1_in_mixer1:
> > endpoint { +                                             =20
> > remote-endpoint =3D <&mixer1_out_tcon_top>; +                          =
   =20
> >         };
> > +                               };
> > +
> > +                               tcon_top_mixer1_out: port@3 {
> > +                                       #address-cells =3D <1>;
> > +                                       #size-cells =3D <0>;
> > +                                       reg =3D <3>;
> > +
> > +                                       tcon_top_mixer1_out_tcon_lcd0:
> > endpoint@0 { +                                               reg =3D <0=
>;
> > +                                       };
> > +
> > +                                       tcon_top_mixer1_out_tcon_lcd1:
> > endpoint@1 { +                                               reg =3D <1=
>;
> > +                                       };
> > +
> > +                                       tcon_top_mixer1_out_tcon_tv0:
> > endpoint@2 { +                                               reg =3D <2=
>;
> > +                                       };
> > +
> > +                                       tcon_top_mixer1_out_tcon_tv1:
> > endpoint@3 { +                                               reg =3D <3=
>;
> > +                                       };
> > +                               };
> > +
> > +                               tcon_top_hdmi_in: port@4 {
> > +                                       #address-cells =3D <1>;
> > +                                       #size-cells =3D <0>;
> > +                                       reg =3D <4>;
> > +
> > +                                       tcon_top_hdmi_in_tcon_tv0:
> > endpoint@0 { +                                               reg =3D <0=
>;
> > +                                       };
> > +
> > +                                       tcon_top_hdmi_in_tcon_tv1:
> > endpoint@1 { +                                               reg =3D <1=
>;
> > +                                       };
> > +                               };
> > +
> > +                               tcon_top_hdmi_out: port@5 {
> > +                                       reg =3D <5>;
> > +
> > +                                       tcon_top_hdmi_out_hdmi: endpoin=
t {
> > +                                               remote-endpoint =3D
> > <&hdmi_in_tcon_top>; +                                       };
> > +                               };
> > +                       };
> > +               };
> > +
> > +               tcon_tv0: lcd-controller@1c73000 {
> > +                       compatible =3D "allwinner,sun8i-r40-tcon-tv",
> > +                                    "allwinner,sun8i-a83t-tcon-tv";
> > +                       reg =3D <0x01c73000 0x1000>;
> > +                       interrupts =3D <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>=
;
> > +                       clocks =3D <&ccu CLK_BUS_TCON_TV0>, <&tcon_top =
0>;
> > +                       clock-names =3D "ahb", "tcon-ch1";
> > +                       resets =3D <&ccu RST_BUS_TCON_TV0>;
> > +                       reset-names =3D "lcd";
> > +
> > +                       ports {
> > +                               #address-cells =3D <1>;
> > +                               #size-cells =3D <0>;
> > +
> > +                               tcon_tv0_in: port@0 {
> > +                                       reg =3D <0>;
> > +                               };
> > +
> > +                               tcon_tv0_out: port@1 {
> > +                                       reg =3D <1>;
> > +                               };
> > +                       };
> > +               };
> > +
> > +               tcon_tv1: lcd-controller@1c74000 {
> > +                       compatible =3D "allwinner,sun8i-r40-tcon-tv",
> > +                                    "allwinner,sun8i-a83t-tcon-tv";
> > +                       reg =3D <0x01c74000 0x1000>;
> > +                       interrupts =3D <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>=
;
> > +                       clocks =3D <&ccu CLK_BUS_TCON_TV1>, <&tcon_top =
1>;
> > +                       clock-names =3D "ahb", "tcon-ch1";
> > +                       resets =3D <&ccu RST_BUS_TCON_TV1>;
> > +                       reset-names =3D "lcd";
> > +
> > +                       ports {
> > +                               #address-cells =3D <1>;
> > +                               #size-cells =3D <0>;
> > +
> > +                               tcon_tv1_in: port@0 {
> > +                                       reg =3D <0>;
> > +                               };
> > +
> > +                               tcon_tv1_out: port@1 {
> > +                                       reg =3D <1>;
>=20
> You are missing the remote-endpoints for all the TCON-TOP <-> TCON
> connections. Also, on the driver side, there's no code to handle
> dynamically mapping mixers to the TCONs that are being used. In the past =
we
> had simple 1:1 mappings. This is no longer the case, and it needs to be
> dealt with.

How would TCON TOP driver know how to set muxes? There are no appropriate=
=20
bingings for muxes, except for V4L2 subsystem, which doesn't really work he=
re.

Additionaly, how would HDMI know which TCON belongs to it to appropriately =
set=20
possible_crtcs?

Currently, my idea is that board DT creates wanted connections. Since there=
 is=20
only one valid connection for each mux, driver knows eactly what to write i=
nto=20
mux register. HDMI driver can simply check which TCON connection is valid i=
n=20
HDMI input mux and select it in possible_crtcs.

Please also note that mixer0 and mixer1 don't have same capabilities and yo=
u=20
generally want mixer0 to be connected to main output. This is in contrast t=
o=20
DE1 SoCs, where both backends and both frontends have same capability.

Best regards,
Jernej

>=20
> ChenYu
>=20
> > +                               };
> > +                       };
> > +               };
> > +
> >=20
> >                 gic: interrupt-controller@1c81000 {
> >                =20
> >                         compatible =3D "arm,gic-400";
> >                         reg =3D <0x01c81000 0x1000>,
> >=20
> > @@ -461,6 +685,51 @@
> >=20
> >                         #interrupt-cells =3D <3>;
> >                         interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(=
4) |
> >                         IRQ_TYPE_LEVEL_HIGH)>;
> >                =20
> >                 };
> >=20
> > +
> > +               hdmi: hdmi@1ee0000 {
> > +                       compatible =3D "allwinner,sun8i-r40-dw-hdmi",
> > +                                    "allwinner,sun8i-a83t-dw-hdmi";
> > +                       reg =3D <0x01ee0000 0x10000>;
> > +                       reg-io-width =3D <1>;
> > +                       interrupts =3D <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>=
;
> > +                       clocks =3D <&ccu CLK_BUS_HDMI0>, <&ccu
> > CLK_HDMI_SLOW>, +                                <&ccu CLK_HDMI>;
> > +                       clock-names =3D "iahb", "isfr", "tmds";
> > +                       resets =3D <&ccu RST_BUS_HDMI1>;
> > +                       reset-names =3D "ctrl";
> > +                       phys =3D <&hdmi_phy>;
> > +                       phy-names =3D "hdmi-phy";
> > +                       status =3D "disabled";
> > +
> > +                       ports {
> > +                               #address-cells =3D <1>;
> > +                               #size-cells =3D <0>;
> > +
> > +                               hdmi_in: port@0 {
> > +                                       reg =3D <0>;
> > +
> > +                                       hdmi_in_tcon_top: endpoint {
> > +                                               remote-endpoint =3D
> > <&tcon_top_hdmi_out_hdmi>; +                                       };
> > +                               };
> > +
> > +                               hdmi_out: port@1 {
> > +                                       reg =3D <1>;
> > +                               };
> > +                       };
> > +               };
> > +
> > +               hdmi_phy: hdmi-phy@1ef0000 {
> > +                       compatible =3D "allwinner,sun8i-r40-hdmi-phy",
> > +                                    "allwinner,sun50i-a64-hdmi-phy";
> > +                       reg =3D <0x01ef0000 0x10000>;
> > +                       clocks =3D <&ccu CLK_BUS_HDMI1>, <&ccu
> > CLK_HDMI_SLOW>, +                                <&ccu 7>, <&ccu 16>;
> > +                       clock-names =3D "bus", "mod", "pll-0", "pll-1";
> > +                       resets =3D <&ccu RST_BUS_HDMI0>;
> > +                       reset-names =3D "phy";
> > +                       #phy-cells =3D <0>;
> > +               };
> >=20
> >         };
> >        =20
> >         timer {
> >=20
> > --
> > 2.18.0




--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
