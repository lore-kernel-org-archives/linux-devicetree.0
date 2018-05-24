From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: Re: [PATCH 05/15] drm/sun4i: Add TCON TOP driver
Date: Thu, 24 May 2018 22:33:58 +0200
Message-ID: <2523764.1gMShBa1ZC@jernej-laptop>
References: <20180519183127.2718-1-jernej.skrabec@siol.net> <5965231.6ucpJrPIQ5@jernej-laptop> <20180524084351.x4ugbbsz3mqv6fh7@flea>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDQNBWPU7YERBZODTTMAKGQEMAHFLVI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180524084351.x4ugbbsz3mqv6fh7@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Cc: wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Dne =C4=8Detrtek, 24. maj 2018 ob 10:43:51 CEST je Maxime Ripard napisal(a)=
:
> Hi,
>=20
> On Mon, May 21, 2018 at 05:15:15PM +0200, Jernej =C5=A0krabec wrote:
> > > > +	/*
> > > > +	 * Default register values might have some reserved bits set,=20
which
> > > > +	 * prevents TCON TOP from working properly. Set them to 0 here.
> > > > +	 */
> > > > +	writel(0, tcon_top->regs + TCON_TOP_PORT_SEL_REG);
> > > > +	writel(0, tcon_top->regs + TCON_TOP_GATE_SRC_REG);
> > > > +
> > > > +	for (i =3D 0; i < CLK_NUM; i++) {
> > > > +		const char *parent_name =3D "bus-tcon-top";
> > >=20
> > > I guess retrieving the parent's clock name at runtime would be more
> > > flexible.
> >=20
> > It is, but will it ever be anything else?
>=20
> Probably not, but when the complexity is exactly the same (using
> __clk_get_name), we'd better use the more appropriate solution. If we
> ever need to change that clock name, or to use the driver with an SoC
> that wouldn't have the same clock name for whatever reason, it will
> just work.
>=20
> > > > +		struct clk_init_data init;
> > > > +		struct clk_gate *gate;
> > > > +
> > > > +		gate =3D devm_kzalloc(dev, sizeof(*gate), GFP_KERNEL);
> > > > +		if (!gate) {
> > > > +			ret =3D -ENOMEM;
> > > > +			goto err_disable_clock;
> > > > +		}
> > > > +
> > > > +		init.name =3D gates[i].name;
> > > > +		init.ops =3D &clk_gate_ops;
> > > > +		init.flags =3D CLK_IS_BASIC;
> > > > +		init.parent_names =3D &parent_name;
> > > > +		init.num_parents =3D 1;
> > > > +
> > > > +		gate->reg =3D tcon_top->regs + TCON_TOP_GATE_SRC_REG;
> > > > +		gate->bit_idx =3D gates[i].bit;
> > > > +		gate->lock =3D &tcon_top->reg_lock;
> > > > +		gate->hw.init =3D &init;
> > > > +
> > > > +		ret =3D devm_clk_hw_register(dev, &gate->hw);
> > > > +		if (ret)
> > > > +			goto err_disable_clock;
> > >=20
> > > Isn't it what clk_hw_register_gate is doing?
> >=20
> > Almost, but not exactly. My goal was to use devm_* functions, so there =
is
> > no need to do any special cleanup.
>=20
> Is it the only difference? If so, you can just create a
> devm_clk_hw_register gate.

I checked around and it seems that in clk core there are only non devm_*=20
helpers like clk_hw_register_gate() for some reason. I guess I'll just use=
=20
that and manually unregister all the clocks in cleanup function.

Best regards,
Jernej


--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
