From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 06/15] drm/sun4i: tcon: Add support for tcon-top
Date: Fri, 1 Jun 2018 09:19:43 -0700
Message-ID: <CAGb2v667pdjfHXYpBk1ER5sC8vgpcaOFKEbEByWoD1zh9Z0cyg@mail.gmail.com>
References: <20180519183127.2718-1-jernej.skrabec@siol.net>
 <CAGb2v65whE-qW++cg+gu_o2O1dDdCWkumQB41nt3Aqa75Wp3dg@mail.gmail.com>
 <20180531092133.3gqepoabvuruiztz@flea.home> <2293030.uW1p7mJGcj@jernej-laptop>
 <20180601152949.tmw7aitfoo536nxs@flea>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBBN7EYXMAKGQEFBAFODQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180601152949.tmw7aitfoo536nxs@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 1, 2018 at 8:29 AM, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> w=
rote:
> On Thu, May 31, 2018 at 07:54:08PM +0200, Jernej =C5=A0krabec wrote:
>> Dne =C4=8Detrtek, 31. maj 2018 ob 11:21:33 CEST je Maxime Ripard napisal=
(a):
>> > On Thu, May 24, 2018 at 03:01:09PM -0700, Chen-Yu Tsai wrote:
>> > > >> > > + if (tcon->quirks->needs_tcon_top) {
>> > > >> > > +         struct device_node *np;
>> > > >> > > +
>> > > >> > > +         np =3D of_parse_phandle(dev->of_node, "allwinner,tc=
on-top",
>> > > >> > > 0);
>> > > >> > > +         if (np) {
>> > > >> > > +                 struct platform_device *pdev;
>> > > >> > > +
>> > > >> > > +                 pdev =3D of_find_device_by_node(np);
>> > > >> > > +                 if (pdev)
>> > > >> > > +                         tcon->tcon_top =3D
>> > > >> > > platform_get_drvdata(pdev);
>> > > >> > > +                 of_node_put(np);
>> > > >> > > +
>> > > >> > > +                 if (!tcon->tcon_top)
>> > > >> > > +                         return -EPROBE_DEFER;
>> > > >> > > +         }
>> > > >> > > + }
>> > > >> > > +
>> > > >> >
>> > > >> > I might have missed it, but I've not seen the bindings addition=
s for
>> > > >> > that property. This shouldn't really be done that way anyway, i=
nstead
>> > > >> > of using a direct phandle, you should be using the of-graph, wi=
th the
>> > > >> > TCON-top sitting where it belongs in the flow of data.
>> > > >>
>> > > >> Just to answer to the first question, it did describe it in "[PAT=
CH
>> > > >> 07/15] dt- bindings: display: sun4i-drm: Add R40 HDMI pipeline".
>> > > >>
>> > > >> As why I designed it that way - HW representation could be descri=
bed
>> > > >> that way> >>
>> > > >> (ASCII art makes sense when fixed width font is used to view it):
>> > > >>                             / LCD0/LVDS0
>> > > >>
>> > > >>                 / TCON-LCD0
>> > > >>
>> > > >>                 |           \ MIPI DSI
>> > > >>
>> > > >> mixer0          |
>> > > >>
>> > > >>        \        / TCON-LCD1 - LCD1/LVDS1
>> > > >>
>> > > >>         TCON-TOP
>> > > >>
>> > > >>        /        \ TCON-TV0 - TVE0/RGB
>> > > >>
>> > > >> mixer1          |          \
>> > > >>
>> > > >>                 |           TCON-TOP - HDMI
>> > > >>                 |
>> > > >>                 |          /
>> > > >>
>> > > >>                 \ TCON-TV1 - TVE1/RGB
>> > > >>
>> > > >> This is a bit simplified, since there is also TVE-TOP, which is
>> > > >> responsible
>> > > >> for sharing 4 DACs between both TVE encoders. You can have two TV=
 outs
>> > > >> (PAL/ NTSC) or TVE0 as TV out and TVE1 as RGB or vice versa. It e=
ven
>> > > >> seems that you can arbitrarly choose which DAC is responsible for
>> > > >> which signal, so there is a ton of possible end combinations, but=
 I'm
>> > > >> not 100% sure.
>> > > >>
>> > > >> Even though I wrote TCON-TOP twice, this is same unit in HW. R40 =
manual
>> > > >> suggest more possibilities, although some of them seem wrong, lik=
e RGB
>> > > >> feeding from LCD TCON. That is confirmed to be wrong when checkin=
g BSP
>> > > >> code.
>> > > >>
>> > > >> Additionally, TCON-TOP comes in the middle of TVE0 and LCD0, TVE1=
 and
>> > > >> LCD1 for pin muxing, although I'm not sure why is that needed at =
all,
>> > > >> since according to R40 datasheet, TVE0 and TVE1 pins are dedicate=
d and
>> > > >> not on PORT D and PORT H, respectively, as TCON-TOP documentation
>> > > >> suggest. However, HSYNC and PSYNC lines might be shared between T=
VE
>> > > >> (when it works in RGB mode) and LCD. But that is just my guess si=
nce
>> > > >> I'm not really familiar with RGB and LCD interfaces.
>> > > >>
>> > > >> I'm really not sure what would be the best representation in OF-g=
raph.
>> > > >> Can you suggest one?
>> > > >
>> > > > Rob might disagree on this one, but I don't see anything wrong wit=
h
>> > > > having loops in the graph. If the TCON-TOP can be both the input a=
nd
>> > > > output of the TCONs, then so be it, and have it described that way=
 in
>> > > > the graph.
>> > > >
>> > > > The code is already able to filter out nodes that have already bee=
n
>> > > > added to the list of devices we need to wait for in the component
>> > > > framework, so that should work as well.
>> > > >
>> > > > And we'd need to describe TVE-TOP as well, even though we don't ha=
ve a
>> > > > driver for it yet. That will simplify the backward compatibility l=
ater
>> > > > on.
>> > >
>> > > I'm getting the feeling that TCON-TOP / TVE-TOP is the glue layer th=
at
>> > > binds everything together, and provides signal routing, kind of like
>> > > DE-TOP on A64. So the signal mux controls that were originally found
>> > > in TCON0 and TVE0 were moved out.
>> > >
>> > > The driver needs to know about that, but the graph about doesn't mak=
e
>> > > much sense directly. Without looking at the manual, I understand it =
to
>> > > likely be one mux between the mixers and TCONs, and one between the
>> > > TCON-TVs and HDMI. Would it make more sense to just have the graph
>> > > connections between the muxed components, and remove TCON-TOP from
>> > > it, like we had in the past? A phandle could be used to reference
>> > > the TCON-TOP for mux controls, in addition to the clocks and resets.
>> > >
>> > > For TVE, we would need something to represent each of the output pin=
s,
>> > > so the device tree can actually describe what kind of signal, be it
>> > > each component of RGB/YUV or composite video, is wanted on each pin,
>> > > if any. This is also needed on the A20 for the Cubietruck, so we can
>> > > describe which pins are tied to the VGA connector, and which one doe=
s
>> > > R, G, or B.
>> >
>> > I guess we'll see how the DT maintainers feel about this, but my
>> > impression is that the OF graph should model the flow of data between
>> > the devices. If there's a mux somewhere, then the data is definitely
>> > going through it, and as such it should be part of the graph.
>>
>> I concur, but I spent few days thinking how to represent this sanely in =
graph,
>> but I didn't find any good solution. I'll represent here my idea and ple=
ase
>> tell your opinion before I start implementing it.
>>
>> First, let me be clear that mixer0 and mixer1 don't have same capabiliti=
es
>> (different number of planes, mixer0 supports writeback, mixer1 does not,
>> etc.). Thus, it does matter which mixer is connected to which TCON/encod=
er.
>> mixer0 is meant to be connected to main display and mixer1 to auxiliary.=
 That
>> obviously depends on end system.
>>
>> So, TCON TOP has 3 muxes, which have to be represented in graph. Two of =
them
>> are for mixer/TCON relationship (each of them 1 input and 4 possible out=
puts)
>> and one for TV TCON/HDMI pair selection (2 possible inputs, 1 output).
>>
>> According to current practice in sun4i-drm driver, graph has to have por=
t 0,
>> representing input and port 1, representing output. This would mean that=
 graph
>> looks something like that:
>>
>> tcon_top: tcon-top@1c70000 {
>>       compatible =3D "allwinner,sun8i-r40-tcon-top";
>>       ...
>>       ports {
>>               #address-cells =3D <1>;
>>               #size-cells =3D <0>;
>>
>>               tcon_top_in: port@0 {
>>                       #address-cells =3D <1>;
>>                       #size-cells =3D <0>;
>>                       reg =3D <0>;
>>
>>                       tcon_top_in_mixer0: endpoint@0 {
>>                               reg =3D <0>;
>>                               remote-endpoint =3D <&mixer0_out_tcon_top>=
;
>>                       };
>>
>>                       tcon_top_in_mixer1: endpoint@1 {
>>                               reg =3D <1>;
>>                               remote-endpoint =3D <&mixer1_out_tcon_top>=
;
>>                       };
>>
>>                       tcon_top_in_tcon_tv: endpoint@2 {
>>                               reg =3D <2>;
>>                               // here is HDMI input connection, part of =
board DTS
>>                               remote-endpoint =3D <board specific phandl=
e to TV TCON output>;
>>                       };
>>               };
>>
>>               tcon_top_out: port@1 {
>>                       #address-cells =3D <1>;
>>                       #size-cells =3D <0>;
>>                       reg =3D <1>;
>>
>>                       tcon_top_out_tcon0: endpoint@0 {
>>                               reg =3D <0>;
>>                               // here is mixer0 output connection, part =
of board DTS
>>                               remote-endpoint =3D <board specific phandl=
e to TCON>;
>>                       };
>>
>>                       tcon_top_out_tcon1: endpoint@1 {
>>                               reg =3D <1>;
>>                               // here is mixer1 output connection, part =
of board DTS
>>                               remote-endpoint =3D <board specific phandl=
e to TCON>;
>>                       };
>>
>>                       tcon_top_out_hdmi: endpoint@2 {
>>                               reg =3D <2>;
>>                               remote-endpoint =3D <&hdmi_in_tcon_top>;
>>                       };
>>               };
>>       };
>> };
>
> IIRC, each port is supposed to be one route for the data, so we would
> have multiple ports, one for the mixers in input and for the tcon in
> output, and one for the TCON in input and for the HDMI/TV in
> output. Rob might correct me here.
>
>> tcon_tv0: lcd-controller@1c73000 {
>>       compatible =3D "allwinner,sun8i-r40-tcon-tv-0";
>>       ...
>>       ports {
>>               #address-cells =3D <1>;
>>               #size-cells =3D <0>;
>>
>>               tcon_tv0_in: port@0 {
>>                       reg =3D <0>;
>>
>>                       tcon_tv0_in_tcon_top: endpoint {
>>                               // endpoint depends on board, part of boar=
d DTS
>>                               remote-endpoint =3D <phandle to one of tco=
n_top_out_tcon>;
>
> Just curious, what would be there?
>
>>                       };
>>               };
>>
>>               tcon_tv0_out: port@1 {
>>                       #address-cells =3D <1>;
>>                       #size-cells =3D <0>;
>>                       reg =3D <1>;
>>
>>                       // endpoints to TV TOP and TCON TOP HDMI input
>>                       ...
>>               };
>>       };
>> };
>>
>> tcon_tv1: lcd-controller@1c74000 {
>>       compatible =3D "allwinner,sun8i-r40-tcon-tv-1";
>>       ...
>>       ports {
>>               #address-cells =3D <1>;
>>               #size-cells =3D <0>;
>>
>>               tcon_tv1_in: port@0 {
>>                       reg =3D <0>;
>>
>>                       tcon_tv1_in_tcon_top: endpoint {
>>                               // endpoint depends on board, part of boar=
d DTS
>>                               remote-endpoint =3D <phandle to one of tco=
n_top_out_tcon>;
>>                       };
>>               };
>>
>>               tcon_tv1_out: port@1 {
>>                       #address-cells =3D <1>;
>>                       #size-cells =3D <0>;
>>                       reg =3D <1>;
>>
>>                       // endpoints to TV TOP and TCON TOP HDMI input
>>                       ...
>>               };
>>       };
>> };
>>
>> tcon_lcd0 and tcon_lcd1 would have similar connections, except that for
>> outputs would be LCD or LVDS panels or MIPI DSI encoder.
>>
>> Please note that each TCON (there are 4 of them) would need to have uniq=
ue
>> compatible and have HW index stored in quirks data. It would be used by =
TCON
>> TOP driver for configuring muxes.
>
> Can't we use the port/endpoint ID instead? If the mux is the only
> thing that changes, the compatible has no reason to. It's the same IP,
> and the only thing that changes is something that is not part of that
> IP.

I agree. Endpoint IDs should provide that information. I'm still not
sure How to encode multiple in/out mux groups in a device node though.

ChenYu

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
