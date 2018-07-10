From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Re: [PATCH 16/17] drm/sun4i: tcon-top: Remove mux
 configuration at probe time
Date: Tue, 10 Jul 2018 21:41:58 +0200
Message-ID: <1819290.nadSthU6Yv@jernej-laptop>
References: <20180706175113.26698-1-jernej.skrabec@siol.net> <CAGb2v64rjUnwnXbWxTSYJyhMyCV5QmV9YSr+Jryx3nEeMP8GJg@mail.gmail.com> <1843348.gnui32CGBV@jernej-laptop>
Reply-To: jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDP4JJM5QYGRBCUYSTNAKGQEVURBHQA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1843348.gnui32CGBV@jernej-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dne torek, 10. julij 2018 ob 18:18:43 CEST je Jernej =C5=A0krabec napisal(a=
):
> Dne torek, 10. julij 2018 ob 18:09:26 CEST je Chen-Yu Tsai napisal(a):
> > On Sat, Jul 7, 2018 at 1:51 AM, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org=
>
>=20
> wrote:
> > > Now that R40 TCON migrated to runtime mux configuration, old code can=
 be
> > > removed.
> > >=20
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> > > ---
> > >=20
> > >  drivers/gpu/drm/sun4i/sun8i_tcon_top.c | 81 +++---------------------=
--
> > >  1 file changed, 7 insertions(+), 74 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> > > b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c index
> > > c09b15b64192..78795d6cb174
> > > 100644
> > > --- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> > > +++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> > > @@ -87,34 +87,6 @@ int sun8i_tcon_top_de_config(struct device *dev, i=
nt
> > > mixer, int tcon)>
> > >=20
> > >  }
> > >  EXPORT_SYMBOL(sun8i_tcon_top_de_config);
> > >=20
> > > -static int sun8i_tcon_top_get_connected_ep_id(struct device_node *no=
de,
> > > -                                             int port_id)
> > > -{
> > > -       struct device_node *ep, *remote, *port;
> > > -       struct of_endpoint endpoint;
> > > -
> > > -       port =3D of_graph_get_port_by_id(node, port_id);
> > > -       if (!port)
> > > -               return -ENOENT;
> > > -
> > > -       for_each_available_child_of_node(port, ep) {
> > > -               remote =3D of_graph_get_remote_port_parent(ep);
> > > -               if (!remote)
> > > -                       continue;
> > > -
> > > -               if (of_device_is_available(remote)) {
> > > -                       of_graph_parse_endpoint(ep, &endpoint);
> > > -
> > > -                       of_node_put(remote);
> > > -
> > > -                       return endpoint.id;
> > > -               }
> > > -
> > > -               of_node_put(remote);
> > > -       }
> > > -
> > > -       return -ENOENT;
> > > -}
> > >=20
> > >  static struct clk_hw *sun8i_tcon_top_register_gate(struct device *de=
v,
> > > =20
> > >                                                    const char *parent=
,
> > >=20
> > > @@ -149,11 +121,9 @@ static int sun8i_tcon_top_bind(struct device *de=
v,
> > > struct device *master,>
> > >=20
> > >         struct platform_device *pdev =3D to_platform_device(dev);
> > >         struct clk_hw_onecell_data *clk_data;
> > >         struct sun8i_tcon_top *tcon_top;
> > >=20
> > > -       bool mixer0_unused =3D false;
> > >=20
> > >         struct resource *res;
> > >         void __iomem *regs;
> > >=20
> > > -       int ret, i, id;
> > > -       u32 val;
> > > +       int ret, i;
> > >=20
> > >         tcon_top =3D devm_kzalloc(dev, sizeof(*tcon_top), GFP_KERNEL)=
;
> > >         if (!tcon_top)
> > >=20
> > > @@ -198,49 +168,12 @@ static int sun8i_tcon_top_bind(struct device *d=
ev,
> > > struct device *master,>
> > >=20
> > >                 goto err_assert_reset;
> > >        =20
> > >         }
> > >=20
> > > -       val =3D 0;
> > > -
> > > -       /* check if HDMI mux output is connected */
> > > -       if (sun8i_tcon_top_get_connected_ep_id(dev->of_node, 5) >=3D =
0) {
> > > -               /* find HDMI input endpoint id, if it is connected at
> > > all*/
> > > -               id =3D sun8i_tcon_top_get_connected_ep_id(dev->of_nod=
e,
> > > 4);
> > > -               if (id >=3D 0)
> > > -                       val =3D FIELD_PREP(TCON_TOP_HDMI_SRC_MSK, id =
+ 1);
> > > -               else
> > > -                       DRM_DEBUG_DRIVER("TCON TOP HDMI input is not
> > > connected\n"); -       } else {
> > > -               DRM_DEBUG_DRIVER("TCON TOP HDMI output is not
> > > connected\n"); -       }
> > > -
> > > -       writel(val, regs + TCON_TOP_GATE_SRC_REG);
> > > -
> > > -       val =3D 0;
> > > -
> > > -       /* process mixer0 mux output */
> > > -       id =3D sun8i_tcon_top_get_connected_ep_id(dev->of_node, 1);
> > > -       if (id >=3D 0) {
> > > -               val =3D FIELD_PREP(TCON_TOP_PORT_DE0_MSK, id);
> > > -       } else {
> > > -               DRM_DEBUG_DRIVER("TCON TOP mixer0 output is not
> > > connected\n"); -               mixer0_unused =3D true;
> > > -       }
> > > -
> > > -       /* process mixer1 mux output */
> > > -       id =3D sun8i_tcon_top_get_connected_ep_id(dev->of_node, 3);
> > > -       if (id >=3D 0) {
> > > -               val |=3D FIELD_PREP(TCON_TOP_PORT_DE1_MSK, id);
> > > -
> > > -               /*
> > > -                * mixer0 mux has priority over mixer1 mux. We have t=
o
> > > -                * make sure mixer0 doesn't overtake TCON from mixer1=
.
> > > -                */
> > > -               if (mixer0_unused && id =3D=3D 0)
> > > -                       val |=3D FIELD_PREP(TCON_TOP_PORT_DE0_MSK, 1)=
;
> > > -       } else {
> > > -               DRM_DEBUG_DRIVER("TCON TOP mixer1 output is not
> > > connected\n"); -       }
> > > -
> > > -       writel(val, regs + TCON_TOP_PORT_SEL_REG);
> > > +       /*
> > > +        * Default register values might have some reserved bits set,
> > > which
> > > +        * prevents TCON TOP from working properly. Set them to 0 her=
e.
> > > +        */
> > > +       writel(0, regs + TCON_TOP_GATE_SRC_REG);
> > > +       writel(0, regs + TCON_TOP_PORT_SEL_REG);
> >=20
> > Would it make sense to just force a reset using the reset control?
>=20
> I wrote TCON TOP driver for H6 at first. For some reason, some registers =
had
> reserved bits set after reset line was released. TCON TOP was not used in
> U- Boot, so I guess this counts as full reset.
>=20
> I never tried to find out how it behaves on R40 because setting those
> registers to 0 seems like simple, good enough solution, which works
> everywhere.

It seems those bits are not needed for R40. I'll leave them out for now. TC=
ON=20
TOP will need some adjustments for H6 anyway and I'll take a look at that=
=20
then.
=20
Best regards,
Jernej




--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
