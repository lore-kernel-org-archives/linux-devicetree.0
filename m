From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: [PATCH v3 10/24] drm/sun4i: tcon: Generalize engine
 search algorithm
Date: Thu, 28 Jun 2018 06:48:50 +0200
Message-ID: <1812731.FQOhD8MfmX@jernej-laptop>
References: <20180625120304.7543-1-jernej.skrabec@siol.net> <20180625120304.7543-11-jernej.skrabec@siol.net> <CAGb2v66ndyhVFKsOt=g45MJ-cBun8WvRrDsb9XO2hteSX2oe5A@mail.gmail.com>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDQNBWPU7YERBCOS2HMQKGQEFMQSM2A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v66ndyhVFKsOt=g45MJ-cBun8WvRrDsb9XO2hteSX2oe5A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Gustavo Padovan <gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dne =C4=8Detrtek, 28. junij 2018 ob 04:06:52 CEST je Chen-Yu Tsai napisal(a=
):
> On Mon, Jun 25, 2018 at 8:02 PM, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>=
=20
wrote:
> > Current "old" method to find engine worked pretty well for DE2. However=
,
> > it doesn't work when TCON TOP is between  mixer (engine) and TCON. TCON
> > TOP has multiple input ports, but current engine search algorithm
> > expects only one.
> >=20
> > This can be fixed by first looking for output port id and selecting
> > matching input by subtracting 1 for the next round. This work even if
> > there is only one input and output.
> >=20
> > Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> > ---
> >=20
> >  drivers/gpu/drm/sun4i/sun4i_tcon.c | 22 ++++++++++++++++++----
> >  1 file changed, 18 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > b/drivers/gpu/drm/sun4i/sun4i_tcon.c index 08747fc3ee71..264bcc43da11
> > 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > @@ -791,12 +791,14 @@ static int sun4i_tcon_init_regmap(struct device
> > *dev,
> >=20
> >   */
> > =20
> >  static struct sunxi_engine *
> >  sun4i_tcon_find_engine_traverse(struct sun4i_drv *drv,
> >=20
> > -                               struct device_node *node)
> > +                               struct device_node *node,
> > +                               u32 port_id)
> >=20
> >  {
> > =20
> >         struct device_node *port, *ep, *remote;
> >         struct sunxi_engine *engine =3D ERR_PTR(-EINVAL);
> >=20
> > +       u32 reg =3D 0;
> >=20
> > -       port =3D of_graph_get_port_by_id(node, 0);
> > +       port =3D of_graph_get_port_by_id(node, port_id);
> >=20
> >         if (!port)
> >        =20
> >                 return ERR_PTR(-EINVAL);
> >=20
> > @@ -826,8 +828,20 @@ sun4i_tcon_find_engine_traverse(struct sun4i_drv
> > *drv,
> >=20
> >                 if (remote =3D=3D engine->node)
> >                =20
> >                         goto out_put_remote;
> >=20
> > +       /*
> > +        * According to device tree binding input ports have even id
> > +        * number and output ports have odd id. Since component with
> > +        * more than one input and one output (TCON TOP) exits, correct
> > +        * remote input id has to be calculated by subtracting 1 from
> > +        * remote output id. If this for some reason can't be done, 0
> > +        * is used as input port id.
> > +        */
>=20
> You need to call
>=20
>     of_node_put(port);
>=20
> to drop the reference to the original port.

Thanks for noticing it. I guess I should send fix patch, since patches from=
=20
drm-misc-next can't be dropped.

Best regards,
Jernej

> Otherwise,
>=20
> Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>=20
> > +       port =3D of_graph_get_remote_port(ep);
> > +       if (!of_property_read_u32(port, "reg", &reg) && reg > 0)
> > +               reg -=3D 1;
> > +
> >=20
> >         /* keep looking through upstream ports */
> >=20
> > -       engine =3D sun4i_tcon_find_engine_traverse(drv, remote);
> > +       engine =3D sun4i_tcon_find_engine_traverse(drv, remote, reg);
> >=20
> >  out_put_remote:
> >         of_node_put(remote);
> >=20
> > @@ -950,7 +964,7 @@ static struct sunxi_engine
> > *sun4i_tcon_find_engine(struct sun4i_drv *drv,>=20
> >         /* Fallback to old method by traversing input endpoints */
> >         of_node_put(port);
> >=20
> > -       return sun4i_tcon_find_engine_traverse(drv, node);
> > +       return sun4i_tcon_find_engine_traverse(drv, node, 0);
> >=20
> >  }
> > =20
> >  static int sun4i_tcon_bind(struct device *dev, struct device *master,
> >=20
> > --
> > 2.18.0




--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
