From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: [PATCH 06/15] drm/sun4i: tcon: Add support for tcon-top
Date: Thu, 31 May 2018 19:54:08 +0200
Message-ID: <2293030.uW1p7mJGcj@jernej-laptop>
References: <20180519183127.2718-1-jernej.skrabec@siol.net> <CAGb2v65whE-qW++cg+gu_o2O1dDdCWkumQB41nt3Aqa75Wp3dg@mail.gmail.com> <20180531092133.3gqepoabvuruiztz@flea.home>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDQNBWPU7YERB5XNYDMAKGQEAKOJQJQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180531092133.3gqepoabvuruiztz-YififvaboMKzQB+pC5nmwQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dne =C4=8Detrtek, 31. maj 2018 ob 11:21:33 CEST je Maxime Ripard napisal(a)=
:
> On Thu, May 24, 2018 at 03:01:09PM -0700, Chen-Yu Tsai wrote:
> > >> > > + if (tcon->quirks->needs_tcon_top) {
> > >> > > +         struct device_node *np;
> > >> > > +
> > >> > > +         np =3D of_parse_phandle(dev->of_node, "allwinner,tcon-=
top",
> > >> > > 0);
> > >> > > +         if (np) {
> > >> > > +                 struct platform_device *pdev;
> > >> > > +
> > >> > > +                 pdev =3D of_find_device_by_node(np);
> > >> > > +                 if (pdev)
> > >> > > +                         tcon->tcon_top =3D
> > >> > > platform_get_drvdata(pdev);
> > >> > > +                 of_node_put(np);
> > >> > > +
> > >> > > +                 if (!tcon->tcon_top)
> > >> > > +                         return -EPROBE_DEFER;
> > >> > > +         }
> > >> > > + }
> > >> > > +
> > >> >=20
> > >> > I might have missed it, but I've not seen the bindings additions f=
or
> > >> > that property. This shouldn't really be done that way anyway, inst=
ead
> > >> > of using a direct phandle, you should be using the of-graph, with =
the
> > >> > TCON-top sitting where it belongs in the flow of data.
> > >>=20
> > >> Just to answer to the first question, it did describe it in "[PATCH
> > >> 07/15] dt- bindings: display: sun4i-drm: Add R40 HDMI pipeline".
> > >>=20
> > >> As why I designed it that way - HW representation could be described
> > >> that way> >>=20
> > >> (ASCII art makes sense when fixed width font is used to view it):
> > >>                             / LCD0/LVDS0
> > >>                =20
> > >>                 / TCON-LCD0
> > >>                =20
> > >>                 |           \ MIPI DSI
> > >>=20
> > >> mixer0          |
> > >>=20
> > >>        \        / TCON-LCD1 - LCD1/LVDS1
> > >>       =20
> > >>         TCON-TOP
> > >>       =20
> > >>        /        \ TCON-TV0 - TVE0/RGB
> > >>=20
> > >> mixer1          |          \
> > >>=20
> > >>                 |           TCON-TOP - HDMI
> > >>                 |         =20
> > >>                 |          /
> > >>                =20
> > >>                 \ TCON-TV1 - TVE1/RGB
> > >>=20
> > >> This is a bit simplified, since there is also TVE-TOP, which is
> > >> responsible
> > >> for sharing 4 DACs between both TVE encoders. You can have two TV ou=
ts
> > >> (PAL/ NTSC) or TVE0 as TV out and TVE1 as RGB or vice versa. It even
> > >> seems that you can arbitrarly choose which DAC is responsible for
> > >> which signal, so there is a ton of possible end combinations, but I'=
m
> > >> not 100% sure.
> > >>=20
> > >> Even though I wrote TCON-TOP twice, this is same unit in HW. R40 man=
ual
> > >> suggest more possibilities, although some of them seem wrong, like R=
GB
> > >> feeding from LCD TCON. That is confirmed to be wrong when checking B=
SP
> > >> code.
> > >>=20
> > >> Additionally, TCON-TOP comes in the middle of TVE0 and LCD0, TVE1 an=
d
> > >> LCD1 for pin muxing, although I'm not sure why is that needed at all=
,
> > >> since according to R40 datasheet, TVE0 and TVE1 pins are dedicated a=
nd
> > >> not on PORT D and PORT H, respectively, as TCON-TOP documentation
> > >> suggest. However, HSYNC and PSYNC lines might be shared between TVE
> > >> (when it works in RGB mode) and LCD. But that is just my guess since
> > >> I'm not really familiar with RGB and LCD interfaces.
> > >>=20
> > >> I'm really not sure what would be the best representation in OF-grap=
h.
> > >> Can you suggest one?
> > >=20
> > > Rob might disagree on this one, but I don't see anything wrong with
> > > having loops in the graph. If the TCON-TOP can be both the input and
> > > output of the TCONs, then so be it, and have it described that way in
> > > the graph.
> > >=20
> > > The code is already able to filter out nodes that have already been
> > > added to the list of devices we need to wait for in the component
> > > framework, so that should work as well.
> > >=20
> > > And we'd need to describe TVE-TOP as well, even though we don't have =
a
> > > driver for it yet. That will simplify the backward compatibility late=
r
> > > on.
> >=20
> > I'm getting the feeling that TCON-TOP / TVE-TOP is the glue layer that
> > binds everything together, and provides signal routing, kind of like
> > DE-TOP on A64. So the signal mux controls that were originally found
> > in TCON0 and TVE0 were moved out.
> >=20
> > The driver needs to know about that, but the graph about doesn't make
> > much sense directly. Without looking at the manual, I understand it to
> > likely be one mux between the mixers and TCONs, and one between the
> > TCON-TVs and HDMI. Would it make more sense to just have the graph
> > connections between the muxed components, and remove TCON-TOP from
> > it, like we had in the past? A phandle could be used to reference
> > the TCON-TOP for mux controls, in addition to the clocks and resets.
> >=20
> > For TVE, we would need something to represent each of the output pins,
> > so the device tree can actually describe what kind of signal, be it
> > each component of RGB/YUV or composite video, is wanted on each pin,
> > if any. This is also needed on the A20 for the Cubietruck, so we can
> > describe which pins are tied to the VGA connector, and which one does
> > R, G, or B.
>=20
> I guess we'll see how the DT maintainers feel about this, but my
> impression is that the OF graph should model the flow of data between
> the devices. If there's a mux somewhere, then the data is definitely
> going through it, and as such it should be part of the graph.

I concur, but I spent few days thinking how to represent this sanely in gra=
ph,=20
but I didn't find any good solution. I'll represent here my idea and please=
=20
tell your opinion before I start implementing it.

First, let me be clear that mixer0 and mixer1 don't have same capabilities=
=20
(different number of planes, mixer0 supports writeback, mixer1 does not,=20
etc.). Thus, it does matter which mixer is connected to which TCON/encoder.=
=20
mixer0 is meant to be connected to main display and mixer1 to auxiliary. Th=
at=20
obviously depends on end system.

So, TCON TOP has 3 muxes, which have to be represented in graph. Two of the=
m=20
are for mixer/TCON relationship (each of them 1 input and 4 possible output=
s)=20
and one for TV TCON/HDMI pair selection (2 possible inputs, 1 output).

According to current practice in sun4i-drm driver, graph has to have port 0=
,=20
representing input and port 1, representing output. This would mean that gr=
aph=20
looks something like that:

tcon_top: tcon-top@1c70000 {
	compatible =3D "allwinner,sun8i-r40-tcon-top";
	...
	ports {
		#address-cells =3D <1>;
		#size-cells =3D <0>;

		tcon_top_in: port@0 {
			#address-cells =3D <1>;
			#size-cells =3D <0>;
			reg =3D <0>;

			tcon_top_in_mixer0: endpoint@0 {
				reg =3D <0>;
				remote-endpoint =3D <&mixer0_out_tcon_top>;
			};

			tcon_top_in_mixer1: endpoint@1 {
				reg =3D <1>;
				remote-endpoint =3D <&mixer1_out_tcon_top>;
			};

			tcon_top_in_tcon_tv: endpoint@2 {
				reg =3D <2>;
				// here is HDMI input connection, part of board DTS
				remote-endpoint =3D <board specific phandle to TV TCON output>;
			};
		};

		tcon_top_out: port@1 {
			#address-cells =3D <1>;
			#size-cells =3D <0>;
			reg =3D <1>;

			tcon_top_out_tcon0: endpoint@0 {
				reg =3D <0>;
				// here is mixer0 output connection, part of board DTS
				remote-endpoint =3D <board specific phandle to TCON>;
			};

			tcon_top_out_tcon1: endpoint@1 {
				reg =3D <1>;
				// here is mixer1 output connection, part of board DTS
				remote-endpoint =3D <board specific phandle to TCON>;
			};

			tcon_top_out_hdmi: endpoint@2 {
				reg =3D <2>;
				remote-endpoint =3D <&hdmi_in_tcon_top>;
			};
		};
	};
};

tcon_tv0: lcd-controller@1c73000 {
	compatible =3D "allwinner,sun8i-r40-tcon-tv-0";
	...
	ports {
		#address-cells =3D <1>;
		#size-cells =3D <0>;

		tcon_tv0_in: port@0 {
			reg =3D <0>;

			tcon_tv0_in_tcon_top: endpoint {
				// endpoint depends on board, part of board DTS
				remote-endpoint =3D <phandle to one of tcon_top_out_tcon>;
			};
		};

		tcon_tv0_out: port@1 {
			#address-cells =3D <1>;
			#size-cells =3D <0>;
			reg =3D <1>;

			// endpoints to TV TOP and TCON TOP HDMI input
			...
		};
	};
};

tcon_tv1: lcd-controller@1c74000 {
	compatible =3D "allwinner,sun8i-r40-tcon-tv-1";
	...
	ports {
		#address-cells =3D <1>;
		#size-cells =3D <0>;

		tcon_tv1_in: port@0 {
			reg =3D <0>;

			tcon_tv1_in_tcon_top: endpoint {
				// endpoint depends on board, part of board DTS
				remote-endpoint =3D <phandle to one of tcon_top_out_tcon>;
			};
		};

		tcon_tv1_out: port@1 {
			#address-cells =3D <1>;
			#size-cells =3D <0>;
			reg =3D <1>;

			// endpoints to TV TOP and TCON TOP HDMI input
			...
		};
	};
};

tcon_lcd0 and tcon_lcd1 would have similar connections, except that for=20
outputs would be LCD or LVDS panels or MIPI DSI encoder.

Please note that each TCON (there are 4 of them) would need to have unique=
=20
compatible and have HW index stored in quirks data. It would be used by TCO=
N=20
TOP driver for configuring muxes.

What do you think about above suggestion?

Best regards,
Jernej



--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
