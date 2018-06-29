From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: [PATCH v3 10/24] drm/sun4i: tcon: Generalize engine
 search algorithm
Date: Fri, 29 Jun 2018 21:06:09 +0200
Message-ID: <3257762.ZQzN8rrT6c@jernej-laptop>
References: <20180625120304.7543-1-jernej.skrabec@siol.net> <1812731.FQOhD8MfmX@jernej-laptop> <20180628182543.yyja6hiry7rx7fu2@flea>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDQNBWPU7YERB6UG3LMQKGQESGX2HBQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180628182543.yyja6hiry7rx7fu2@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Gustavo Padovan <gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dne =C4=8Detrtek, 28. junij 2018 ob 20:25:43 CEST je Maxime Ripard napisal(=
a):
> On Thu, Jun 28, 2018 at 06:48:50AM +0200, Jernej =C5=A0krabec wrote:
> > Dne =C4=8Detrtek, 28. junij 2018 ob 04:06:52 CEST je Chen-Yu Tsai napis=
al(a):
> > > On Mon, Jun 25, 2018 at 8:02 PM, Jernej Skrabec
> > > <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> >=20
> > wrote:
> > > > Current "old" method to find engine worked pretty well for DE2.
> > > > However,
> > > > it doesn't work when TCON TOP is between  mixer (engine) and TCON.
> > > > TCON
> > > > TOP has multiple input ports, but current engine search algorithm
> > > > expects only one.
> > > >=20
> > > > This can be fixed by first looking for output port id and selecting
> > > > matching input by subtracting 1 for the next round. This work even =
if
> > > > there is only one input and output.
> > > >=20
> > > > Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> > > > ---
> > > >=20
> > > >  drivers/gpu/drm/sun4i/sun4i_tcon.c | 22 ++++++++++++++++++----
> > > >  1 file changed, 18 insertions(+), 4 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > > b/drivers/gpu/drm/sun4i/sun4i_tcon.c index 08747fc3ee71..264bcc43da=
11
> > > > 100644
> > > > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > > @@ -791,12 +791,14 @@ static int sun4i_tcon_init_regmap(struct devi=
ce
> > > > *dev,
> > > >=20
> > > >   */
> > > > =20
> > > >  static struct sunxi_engine *
> > > >  sun4i_tcon_find_engine_traverse(struct sun4i_drv *drv,
> > > >=20
> > > > -                               struct device_node *node)
> > > > +                               struct device_node *node,
> > > > +                               u32 port_id)
> > > >=20
> > > >  {
> > > > =20
> > > >         struct device_node *port, *ep, *remote;
> > > >         struct sunxi_engine *engine =3D ERR_PTR(-EINVAL);
> > > >=20
> > > > +       u32 reg =3D 0;
> > > >=20
> > > > -       port =3D of_graph_get_port_by_id(node, 0);
> > > > +       port =3D of_graph_get_port_by_id(node, port_id);
> > > >=20
> > > >         if (!port)
> > > >        =20
> > > >                 return ERR_PTR(-EINVAL);
> > > >=20
> > > > @@ -826,8 +828,20 @@ sun4i_tcon_find_engine_traverse(struct sun4i_d=
rv
> > > > *drv,
> > > >=20
> > > >                 if (remote =3D=3D engine->node)
> > > >                =20
> > > >                         goto out_put_remote;
> > > >=20
> > > > +       /*
> > > > +        * According to device tree binding input ports have even i=
d
> > > > +        * number and output ports have odd id. Since component wit=
h
> > > > +        * more than one input and one output (TCON TOP) exits,
> > > > correct
> > > > +        * remote input id has to be calculated by subtracting 1 fr=
om
> > > > +        * remote output id. If this for some reason can't be done,=
 0
> > > > +        * is used as input port id.
> > > > +        */
> > >=20
> > > You need to call
> > >=20
> > >     of_node_put(port);
> > >=20
> > > to drop the reference to the original port.
> >=20
> > Thanks for noticing it. I guess I should send fix patch, since patches
> > from
> > drm-misc-next can't be dropped.
>=20
> Yeah, please send additional patches for all the issues pointed out by
> Chen-Yu.

Of course. I hope this can be resolved till the end of the next week. After=
=20
that, I will be away from PC for 2 weeks. Feel free to drop DT patches if y=
ou=20
think that it will come too close to merge window.

Best regards,
Jernej



--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
