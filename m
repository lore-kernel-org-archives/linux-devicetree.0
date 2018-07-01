From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: Re: [PATCH v3 23/24] ARM: dts: sun8i: r40: Add HDMI pipeline
Date: Sun, 1 Jul 2018 21:52:55 +0800
Message-ID: <CAGb2v66y2NZexb94gZ9qa9rP7akdEFWSy43CU5G-UrGR2ad2BQ@mail.gmail.com>
References: <20180625120304.7543-1-jernej.skrabec@siol.net>
 <21259128.K3MyN3b6Bq@jernej-laptop> <CAGb2v66q3a9nNjkSP1rgh9voMToutDxHtY1x1Wpkf8eEmLWLAA@mail.gmail.com>
 <3055462.VmN8MJVs7V@jernej-laptop>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBBTVZ4PMQKGQEPXQ33NA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <3055462.VmN8MJVs7V@jernej-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Gustavo Padovan <gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jul 1, 2018 at 6:41 PM, Jernej =C5=A0krabec <jernej.skrabec-ix9DCk4F938@public.gmane.org=
t> wrote:
> Dne =C4=8Detrtek, 28. junij 2018 ob 08:51:07 CEST je Chen-Yu Tsai napisal=
(a):
>> On Thu, Jun 28, 2018 at 1:15 PM, Jernej =C5=A0krabec <jernej.skrabec@sio=
l.net>
> wrote:
>> > Dne =C4=8Detrtek, 28. junij 2018 ob 04:50:09 CEST je Chen-Yu Tsai napi=
sal(a):
>> >> On Mon, Jun 25, 2018 at 8:03 PM, Jernej Skrabec <jernej.skrabec@siol.=
net>
>> >
>> > wrote:
>> >> > Add all entries needed for HDMI to function properly.
>> >> >
>> >> > Since R40 has highly configurable pipeline, both mixers and both TC=
ON
>> >> > TVs are added. Board specific DT should then connect them together
>> >> > trough TCON TOP muxers to best fit the purpose of the board.
>> >> >
>> >> > Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
>> >> > ---
>> >> >
>> >> >  arch/arm/boot/dts/sun8i-r40.dtsi | 269 +++++++++++++++++++++++++++=
++++
>> >> >  1 file changed, 269 insertions(+)
>> >> >
>> >> > diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi
>> >> > b/arch/arm/boot/dts/sun8i-r40.dtsi index 173dcc1652d2..a2a75fb04caf
>> >> > 100644
>> >> > --- a/arch/arm/boot/dts/sun8i-r40.dtsi
>> >> > +++ b/arch/arm/boot/dts/sun8i-r40.dtsi
>> >> > @@ -42,8 +42,11 @@
>> >> >
>> >> >   */
>> >> >
>> >> >  #include <dt-bindings/interrupt-controller/arm-gic.h>
>> >> >
>> >> > +#include <dt-bindings/clock/sun8i-de2.h>
>> >> >
>> >> >  #include <dt-bindings/clock/sun8i-r40-ccu.h>
>> >> >
>> >> > +#include <dt-bindings/clock/sun8i-tcon-top.h>
>> >
>> > Maxime, above line breaks compilation for build robot, sorry.
>> >
>> >> >  #include <dt-bindings/reset/sun8i-r40-ccu.h>
>> >> >
>> >> > +#include <dt-bindings/reset/sun8i-de2.h>
>> >> >
>> >> >  / {
>> >> >
>> >> >         #address-cells =3D <1>;
>> >> >
>> >> > @@ -99,12 +102,76 @@
>> >> >
>> >> >                 };
>> >> >
>> >> >         };
>> >> >
>> >> > +       de: display-engine {
>> >> > +               compatible =3D "allwinner,sun8i-r40-display-engine"=
,
>> >> > +                            "allwinner,sun8i-h3-display-engine";
>> >>
>> >> Given that the display pipeline looks different, they should not be
>> >> compatible.
>> >
>> > Ok.
>> >
>> >> > +               allwinner,pipelines =3D <&mixer0>, <&mixer1>;
>> >> > +               status =3D "disabled";
>> >> > +       };
>> >> > +
>> >> >
>> >> >         soc {
>> >> >
>> >> >                 compatible =3D "simple-bus";
>> >> >                 #address-cells =3D <1>;
>> >> >                 #size-cells =3D <1>;
>> >> >                 ranges;
>> >> >
>> >> > +               display_clocks: clock@1000000 {
>> >> > +                       compatible =3D "allwinner,sun8i-r40-de2-clk=
",
>> >> > +                                    "allwinner,sun8i-h3-de2-clk";
>> >> > +                       reg =3D <0x01000000 0x100000>;
>> >> > +                       clocks =3D <&ccu CLK_DE>,
>> >> > +                                <&ccu CLK_BUS_DE>;
>> >> > +                       clock-names =3D "mod",
>> >> > +                                     "bus";
>> >> > +                       resets =3D <&ccu RST_BUS_DE>;
>> >> > +                       #clock-cells =3D <1>;
>> >> > +                       #reset-cells =3D <1>;
>> >> > +               };
>> >> > +
>> >> > +               mixer0: mixer@1100000 {
>> >> > +                       compatible =3D "allwinner,sun8i-r40-de2-mix=
er-0";
>> >> > +                       reg =3D <0x01100000 0x100000>;
>> >> > +                       clocks =3D <&display_clocks CLK_BUS_MIXER0>=
,
>> >> > +                                <&display_clocks CLK_MIXER0>;
>> >> > +                       clock-names =3D "bus",
>> >> > +                                     "mod";
>> >> > +                       resets =3D <&display_clocks RST_MIXER0>;
>> >> > +
>> >> > +                       ports {
>> >> > +                               #address-cells =3D <1>;
>> >> > +                               #size-cells =3D <0>;
>> >> > +
>> >> > +                               mixer0_out: port@1 {
>> >> > +                                       reg =3D <1>;
>> >> > +                                       mixer0_out_tcon_top: endpoi=
nt {
>> >> > +                                               remote-endpoint =3D
>> >> > <&tcon_top_mixer0_in_mixer0>; +
>> >> > };
>> >> > +                               };
>> >> > +                       };
>> >> > +               };
>> >> > +
>> >> > +               mixer1: mixer@1200000 {
>> >> > +                       compatible =3D "allwinner,sun8i-r40-de2-mix=
er-1";
>> >> > +                       reg =3D <0x01200000 0x100000>;
>> >> > +                       clocks =3D <&display_clocks CLK_BUS_MIXER1>=
,
>> >> > +                                <&display_clocks CLK_MIXER1>;
>> >> > +                       clock-names =3D "bus",
>> >> > +                                     "mod";
>> >> > +                       resets =3D <&display_clocks RST_WB>;
>> >> > +
>> >> > +                       ports {
>> >> > +                               #address-cells =3D <1>;
>> >> > +                               #size-cells =3D <0>;
>> >> > +
>> >> > +                               mixer1_out: port@1 {
>> >> > +                                       reg =3D <1>;
>> >> > +                                       mixer1_out_tcon_top: endpoi=
nt {
>> >> > +                                               remote-endpoint =3D
>> >> > <&tcon_top_mixer1_in_mixer1>; +
>> >> > };
>> >> > +                               };
>> >> > +                       };
>> >> > +               };
>> >> > +
>> >> >
>> >> >                 nmi_intc: interrupt-controller@1c00030 {
>> >> >
>> >> >                         compatible =3D "allwinner,sun7i-a20-sc-nmi"=
;
>> >> >                         interrupt-controller;
>> >> >
>> >> > @@ -451,6 +518,163 @@
>> >> >
>> >> >                         #size-cells =3D <0>;
>> >> >
>> >> >                 };
>> >> >
>> >> > +               tcon_top: tcon-top@1c70000 {
>> >> > +                       compatible =3D "allwinner,sun8i-r40-tcon-to=
p";
>> >> > +                       reg =3D <0x01c70000 0x1000>;
>> >> > +                       clocks =3D <&ccu CLK_BUS_TCON_TOP>,
>> >> > +                                <&ccu CLK_TCON_TV0>,
>> >> > +                                <&ccu CLK_TVE0>,
>> >> > +                                <&ccu CLK_TCON_TV1>,
>> >> > +                                <&ccu CLK_TVE1>,
>> >> > +                                <&ccu CLK_DSI_DPHY>;
>> >> > +                       clock-names =3D "bus",
>> >> > +                                     "tcon-tv0",
>> >> > +                                     "tve0",
>> >> > +                                     "tcon-tv1",
>> >> > +                                     "tve1",
>> >> > +                                     "dsi";
>> >> > +                       clock-output-names =3D "tcon-top-tv0",
>> >> > +                                            "tcon-top-tv1",
>> >> > +                                            "tcon-top-dsi";
>> >> > +                       resets =3D <&ccu RST_BUS_TCON_TOP>;
>> >> > +                       #clock-cells =3D <1>;
>> >> > +
>> >> > +                       ports {
>> >> > +                               #address-cells =3D <1>;
>> >> > +                               #size-cells =3D <0>;
>> >> > +
>> >> > +                               tcon_top_mixer0_in: port@0 {
>> >> > +                                       reg =3D <0>;
>> >> > +
>> >> > +                                       tcon_top_mixer0_in_mixer0:
>> >> > endpoint { +
>> >> > remote-endpoint =3D <&mixer0_out_tcon_top>; +
>> >> >
>> >> >         };
>> >> >
>> >> > +                               };
>> >> > +
>> >> > +                               tcon_top_mixer0_out: port@1 {
>> >> > +                                       #address-cells =3D <1>;
>> >> > +                                       #size-cells =3D <0>;
>> >> > +                                       reg =3D <1>;
>> >> > +
>> >> > +                                       tcon_top_mixer0_out_tcon_lc=
d0:
>> >> > endpoint@0 { +                                               reg =
=3D <0>;
>> >> > +                                       };
>> >> > +
>> >> > +                                       tcon_top_mixer0_out_tcon_lc=
d1:
>> >> > endpoint@1 { +                                               reg =
=3D <1>;
>> >> > +                                       };
>> >> > +
>> >> > +                                       tcon_top_mixer0_out_tcon_tv=
0:
>> >> > endpoint@2 { +                                               reg =
=3D <2>;
>> >> > +                                       };
>> >> > +
>> >> > +                                       tcon_top_mixer0_out_tcon_tv=
1:
>> >> > endpoint@3 { +                                               reg =
=3D <3>;
>> >> > +                                       };
>> >> > +                               };
>> >> > +
>> >> > +                               tcon_top_mixer1_in: port@2 {
>> >> > +                                       reg =3D <2>;
>> >> > +
>> >> > +                                       tcon_top_mixer1_in_mixer1:
>> >> > endpoint { +
>> >> > remote-endpoint =3D <&mixer1_out_tcon_top>; +
>> >> >
>> >> >         };
>> >> >
>> >> > +                               };
>> >> > +
>> >> > +                               tcon_top_mixer1_out: port@3 {
>> >> > +                                       #address-cells =3D <1>;
>> >> > +                                       #size-cells =3D <0>;
>> >> > +                                       reg =3D <3>;
>> >> > +
>> >> > +                                       tcon_top_mixer1_out_tcon_lc=
d0:
>> >> > endpoint@0 { +                                               reg =
=3D <0>;
>> >> > +                                       };
>> >> > +
>> >> > +                                       tcon_top_mixer1_out_tcon_lc=
d1:
>> >> > endpoint@1 { +                                               reg =
=3D <1>;
>> >> > +                                       };
>> >> > +
>> >> > +                                       tcon_top_mixer1_out_tcon_tv=
0:
>> >> > endpoint@2 { +                                               reg =
=3D <2>;
>> >> > +                                       };
>> >> > +
>> >> > +                                       tcon_top_mixer1_out_tcon_tv=
1:
>> >> > endpoint@3 { +                                               reg =
=3D <3>;
>> >> > +                                       };
>> >> > +                               };
>> >> > +
>> >> > +                               tcon_top_hdmi_in: port@4 {
>> >> > +                                       #address-cells =3D <1>;
>> >> > +                                       #size-cells =3D <0>;
>> >> > +                                       reg =3D <4>;
>> >> > +
>> >> > +                                       tcon_top_hdmi_in_tcon_tv0:
>> >> > endpoint@0 { +                                               reg =
=3D <0>;
>> >> > +                                       };
>> >> > +
>> >> > +                                       tcon_top_hdmi_in_tcon_tv1:
>> >> > endpoint@1 { +                                               reg =
=3D <1>;
>> >> > +                                       };
>> >> > +                               };
>> >> > +
>> >> > +                               tcon_top_hdmi_out: port@5 {
>> >> > +                                       reg =3D <5>;
>> >> > +
>> >> > +                                       tcon_top_hdmi_out_hdmi:
>> >> > endpoint {
>> >> > +                                               remote-endpoint =3D
>> >> > <&hdmi_in_tcon_top>; +                                       };
>> >> > +                               };
>> >> > +                       };
>> >> > +               };
>> >> > +
>> >> > +               tcon_tv0: lcd-controller@1c73000 {
>> >> > +                       compatible =3D "allwinner,sun8i-r40-tcon-tv=
",
>> >> > +                                    "allwinner,sun8i-a83t-tcon-tv"=
;
>> >> > +                       reg =3D <0x01c73000 0x1000>;
>> >> > +                       interrupts =3D <GIC_SPI 51 IRQ_TYPE_LEVEL_H=
IGH>;
>> >> > +                       clocks =3D <&ccu CLK_BUS_TCON_TV0>, <&tcon_=
top
>> >> > 0>;
>> >> > +                       clock-names =3D "ahb", "tcon-ch1";
>> >> > +                       resets =3D <&ccu RST_BUS_TCON_TV0>;
>> >> > +                       reset-names =3D "lcd";
>> >> > +
>> >> > +                       ports {
>> >> > +                               #address-cells =3D <1>;
>> >> > +                               #size-cells =3D <0>;
>> >> > +
>> >> > +                               tcon_tv0_in: port@0 {
>> >> > +                                       reg =3D <0>;
>> >> > +                               };
>> >> > +
>> >> > +                               tcon_tv0_out: port@1 {
>> >> > +                                       reg =3D <1>;
>> >> > +                               };
>> >> > +                       };
>> >> > +               };
>> >> > +
>> >> > +               tcon_tv1: lcd-controller@1c74000 {
>> >> > +                       compatible =3D "allwinner,sun8i-r40-tcon-tv=
",
>> >> > +                                    "allwinner,sun8i-a83t-tcon-tv"=
;
>> >> > +                       reg =3D <0x01c74000 0x1000>;
>> >> > +                       interrupts =3D <GIC_SPI 52 IRQ_TYPE_LEVEL_H=
IGH>;
>> >> > +                       clocks =3D <&ccu CLK_BUS_TCON_TV1>, <&tcon_=
top
>> >> > 1>;
>> >> > +                       clock-names =3D "ahb", "tcon-ch1";
>> >> > +                       resets =3D <&ccu RST_BUS_TCON_TV1>;
>> >> > +                       reset-names =3D "lcd";
>> >> > +
>> >> > +                       ports {
>> >> > +                               #address-cells =3D <1>;
>> >> > +                               #size-cells =3D <0>;
>> >> > +
>> >> > +                               tcon_tv1_in: port@0 {
>> >> > +                                       reg =3D <0>;
>> >> > +                               };
>> >> > +
>> >> > +                               tcon_tv1_out: port@1 {
>> >> > +                                       reg =3D <1>;
>> >>
>> >> You are missing the remote-endpoints for all the TCON-TOP <-> TCON
>> >> connections. Also, on the driver side, there's no code to handle
>> >> dynamically mapping mixers to the TCONs that are being used. In the p=
ast
>> >> we
>> >> had simple 1:1 mappings. This is no longer the case, and it needs to =
be
>> >> dealt with.
>> >
>> > How would TCON TOP driver know how to set muxes? There are no appropri=
ate
>> > bingings for muxes, except for V4L2 subsystem, which doesn't really wo=
rk
>> > here.
>> This will end up being a bunch of custom functions exported from the TCO=
N
>> TOP driver to the TCON driver. As for bindings, the stuff you already ha=
ve
>> is mostly enough. You do have to specify the endpoint ID vs component
>> mapping, so you can find the correct one.
>>
>> For example, you would specify that the IDs for TCON LCDs be 0 and 1, an=
d
>> TCON TVs be 2 and 3. Matching the actual register values is a nice
>> convenience. These would be used by the driver as the TCON ID.
>
> So something that's already done (minus full connections).
>
>>
>> Also, we might want to consider them as two pairs of two TCONs (LCD + TV=
).
>> The CRTC in DRM land is actually the mixer + TCON on our platform. This
>> means we only have two CRTCs. So we could have CRTC 0 =3D mixer 0 + TCON=
 LCD
>> 0 + TCON TV 0. The "TCON_TVx_OUTSEL" and "DE_PORTx PERH Select" muxes wo=
uld
>> be set at run time in the mode set function, selecting either LCD or TV
>> based on what encoder is attached.
>
> That proposal would still limit some combinations. For example, that woul=
d put
> DSI always on mixer1, since it can be connected to only LCD TCON 1. It ca=
n
> also cause undesired combination in laptop solutions. Consider that PCB
> designer connected LCD1 pins to panel for some reason. Panel is definetly=
 main
> screen and should definetly be connected to mixer0, but in that case, it =
would
> be to mixer1.

There's no reason we can't have dynamically assigned mixer+tcon pairs, but
that would mean implementing additional scheduling code that we don't have
yet. The current sunxi-drm and CRTC code assume static mappings.

We could do this as a second step if you're up to it.

> Additionaly, since HDMI would became floating between TV TCON 0 and 1, wh=
oever
> would write board DT would need to know this and enable only TV TCON1 if =
LCD
> is desired to be connected to mixer0 (or vice versa).

There's no reason not to have all TCONs enabled by default. We would consid=
er
the display-engine node controlling whether everything actually gets used.

> If we really want universal solution with full connections, addtional pro=
perty
> has to be defined and used for that.
>
>>
>> This limitation is a software one, and should not bleed over into the
>> hardware representation.
>>
>> > Additionaly, how would HDMI know which TCON belongs to it to appropria=
tely
>> > set possible_crtcs?
>>
>> HDMI is connected to the two TCON TVs through the TCON TOP mux. We handl=
e
>> TCON output muxing in the TCON driver, using the set_mux callback in the
>> quirks. For R40, this callback would probably call into the TCON TOP dri=
ver
>> asking it to set the mux to some value.
>>
>> > Currently, my idea is that board DT creates wanted connections. Since
>> > there is only one valid connection for each mux, driver knows eactly w=
hat
>> > to write into mux register. HDMI driver can simply check which TCON
>> > connection is valid in HDMI input mux and select it in possible_crtcs.
>>
>> But that is not how the actual hardware looks like. The device tree shou=
ld
>> model the hardware, not a subset of it just because one thinks the
>> implementation is difficult or won't be used at all.
>>
>> Furthermore, I think you have it backwards. possible_crtcs is generated
>> based on (in our case) the connections between TCON and HDMI based on th=
e
>> device tree graph. So if you have both hooked up, both will show up in
>> possible_crtcs, but only one crtc will actually be selected to feed the
>> HDMI encoder. If you really need to access the current crtc, the
>> drm_encoder struct contains a pointer to it.
>>
>> In DE 1.0 driver, we leave all the muxing to the TCON driver. See
>>
>>
>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/sun4i/sun=
4i_
>> tcon.c#L537
>>
>> So in a sense, the HDMI encoder should be and is hooked up to both TCONs=
,
>> but only one is active at any given time.
>
> So something like that I had in v1 series. I'll implement something simil=
ar.
> That would also mean we need R40 specific TV TCON compatible. I'll restor=
e
> that.
>
> Just a question on future situation when TVE driver will be implemented.
> Suppose that R40 board has TVE0 and HDMI as outputs. This would mean that=
 TVE0
> has possible crtcs set as 0b01 and HDMI 0b11. Will be DRM framework smart
> enough that it will put HDMI on second crtc because TVE0 can be connected=
 to
> only to first crtc?

Yes. If the possible_clones setting for the encoder is not set, the DRM
framework will not do mirroring, and will keep each active encoder on a
separate crtc.

>
>>
>> > Please also note that mixer0 and mixer1 don't have same capabilities a=
nd
>> > you generally want mixer0 to be connected to main output. This is in
>> > contrast to DE1 SoCs, where both backends and both frontends have same
>> > capability.
>> Yes. But who's to say the two display outputs can't be reversed or swapp=
ed
>> around? With fixed singular connections, you also rule out mirrored outp=
ut.
>
> I don't think there is standard way to swap around mixers at runtime,
> expecially if crtcs are represented as mixer + TCON pair.

As I mentioned above, we will have to do this on our own.

> I'm not sure what do you mean with mirrored output or at least why singul=
ar
> connections would prevent mirroring. HW mirroring needs DRM writeback sup=
port
> which is currently in RFC phase if I'm not mistaken. Once implemented in =
DRM
> framework and in sun4i-drm, it would be possible only to mirror mixer0 ->
> mixer1, because mixer1 doesn't support writeback (at least on existing So=
Cs).

What I meant was it might be possible to drive two TCONs with one mixer, or
two encoders with one TCON. I guess the latter is not possible since each
TCON only has one channel. Not sure about the former.

Regards
ChenYu

> Best regards,
> Jernej
>
>>
>> ChenYu
>>
>> >> ChenYu
>> >>
>> >> > +                               };
>> >> > +                       };
>> >> > +               };
>> >> > +
>> >> >
>> >> >                 gic: interrupt-controller@1c81000 {
>> >> >
>> >> >                         compatible =3D "arm,gic-400";
>> >> >                         reg =3D <0x01c81000 0x1000>,
>> >> >
>> >> > @@ -461,6 +685,51 @@
>> >> >
>> >> >                         #interrupt-cells =3D <3>;
>> >> >                         interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIM=
PLE(4)
>> >> >                         |
>> >> >                         IRQ_TYPE_LEVEL_HIGH)>;
>> >> >
>> >> >                 };
>> >> >
>> >> > +
>> >> > +               hdmi: hdmi@1ee0000 {
>> >> > +                       compatible =3D "allwinner,sun8i-r40-dw-hdmi=
",
>> >> > +                                    "allwinner,sun8i-a83t-dw-hdmi"=
;
>> >> > +                       reg =3D <0x01ee0000 0x10000>;
>> >> > +                       reg-io-width =3D <1>;
>> >> > +                       interrupts =3D <GIC_SPI 58 IRQ_TYPE_LEVEL_H=
IGH>;
>> >> > +                       clocks =3D <&ccu CLK_BUS_HDMI0>, <&ccu
>> >> > CLK_HDMI_SLOW>, +                                <&ccu CLK_HDMI>;
>> >> > +                       clock-names =3D "iahb", "isfr", "tmds";
>> >> > +                       resets =3D <&ccu RST_BUS_HDMI1>;
>> >> > +                       reset-names =3D "ctrl";
>> >> > +                       phys =3D <&hdmi_phy>;
>> >> > +                       phy-names =3D "hdmi-phy";
>> >> > +                       status =3D "disabled";
>> >> > +
>> >> > +                       ports {
>> >> > +                               #address-cells =3D <1>;
>> >> > +                               #size-cells =3D <0>;
>> >> > +
>> >> > +                               hdmi_in: port@0 {
>> >> > +                                       reg =3D <0>;
>> >> > +
>> >> > +                                       hdmi_in_tcon_top: endpoint =
{
>> >> > +                                               remote-endpoint =3D
>> >> > <&tcon_top_hdmi_out_hdmi>; +                                       =
};
>> >> > +                               };
>> >> > +
>> >> > +                               hdmi_out: port@1 {
>> >> > +                                       reg =3D <1>;
>> >> > +                               };
>> >> > +                       };
>> >> > +               };
>> >> > +
>> >> > +               hdmi_phy: hdmi-phy@1ef0000 {
>> >> > +                       compatible =3D "allwinner,sun8i-r40-hdmi-ph=
y",
>> >> > +                                    "allwinner,sun50i-a64-hdmi-phy=
";
>> >> > +                       reg =3D <0x01ef0000 0x10000>;
>> >> > +                       clocks =3D <&ccu CLK_BUS_HDMI1>, <&ccu
>> >> > CLK_HDMI_SLOW>, +                                <&ccu 7>, <&ccu 16=
>;
>> >> > +                       clock-names =3D "bus", "mod", "pll-0", "pll=
-1";
>> >> > +                       resets =3D <&ccu RST_BUS_HDMI0>;
>> >> > +                       reset-names =3D "phy";
>> >> > +                       #phy-cells =3D <0>;
>> >> > +               };
>> >> >
>> >> >         };
>> >> >
>> >> >         timer {
>> >> >
>> >> > --
>> >> > 2.18.0
>> >
>> > --
>> > You received this message because you are subscribed to the Google Gro=
ups
>> > "linux-sunxi" group. To unsubscribe from this group and stop receiving
>> > emails from it, send an email to
>> > linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org For more options, visit
>> > https://groups.google.com/d/optout.
>
>
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
