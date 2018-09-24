From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: Re: [PATCH 13/27] drm/sun4i: Add support for H6 DE3
 mixer 0
Date: Mon, 24 Sep 2018 09:59:22 +0800
Message-ID: <CAGb2v64m-mNOe+GFUZ6msisdkADRKK3m7zpwPqQ-=auV5sxXNw@mail.gmail.com>
References: <20180902072643.4917-1-jernej.skrabec@siol.net>
 <CAGb2v66kp4B5VZfmTc8L6qt=OPHjbYBtXRbC=L6jGTzvEKvb=w@mail.gmail.com>
 <CAGb2v65LzGgXORTx7PR+udZsrgGgmnXeaOW-jb=KMjHjTg7bRg@mail.gmail.com> <6201242.bzTTWRITmP@jernej-laptop>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBBCMKUHOQKGQEMJURJTA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <6201242.bzTTWRITmP@jernej-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 24, 2018 at 3:40 AM Jernej =C5=A0krabec <jernej.skrabec-ix9DCk4F938@public.gmane.org=
t> wrote:
>
> Dne sobota, 22. september 2018 ob 15:47:03 CEST je Chen-Yu Tsai napisal(a=
):
> > On Sat, Sep 22, 2018 at 9:23 PM Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> > > On Sun, Sep 2, 2018 at 3:27 PM Jernej Skrabec <jernej.skrabec-ix9DCk4F938@public.gmane.org=
t>
> wrote:
> > > > Mixer 0 has 1 VI and 3 UI planes, scaler on all planes and can outp=
ut
> > > > 4K image @60Hz. It also support 10 bit colors.
> > >
> > > AFAICT 10 bit color support is not implemented? Please mention this.
>
> ok.
>
> > >
> > > > Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> > > > ---
> > > >
> > > >  drivers/gpu/drm/sun4i/sun8i_mixer.c | 13 +++++++++++++
> > > >  1 file changed, 13 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > > > b/drivers/gpu/drm/sun4i/sun8i_mixer.c index a9218abf0935..54eca2dd4=
b33
> > > > 100644
> > > > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > > > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > > > @@ -540,6 +540,15 @@ static int sun8i_mixer_remove(struct
> > > > platform_device *pdev)> >
> > > >         return 0;
> > > >
> > > >  }
> > > >
> > > > +static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg =3D {
> > >
> > > Please sort the per-compatible structures according to "version sort"
> > > rules.>
> > > > +       .ccsc           =3D 0,
> > > > +       .is_de3         =3D true,
> > > > +       .mod_rate       =3D 600000000,
> > > > +       .scaler_mask    =3D 0xf,
> > > > +       .ui_num         =3D 3,
> > > > +       .vi_num         =3D 1,
> > > > +};
> > > > +
> > > >
> > > >  static const struct sun8i_mixer_cfg sun8i_a83t_mixer0_cfg =3D {
> > > >
> > > >         .ccsc           =3D 0,
> > > >         .scaler_mask    =3D 0xf,
> > > >
> > > > @@ -587,6 +596,10 @@ static const struct sun8i_mixer_cfg
> > > > sun8i_v3s_mixer_cfg =3D {> >
> > > >  };
> > > >
> > > >  static const struct of_device_id sun8i_mixer_of_table[] =3D {
> > > >
> > > > +       {
> > > > +               .compatible =3D "allwinner,sun50i-h6-de3-mixer-0",
> > > > +               .data =3D &sun50i_h6_mixer0_cfg,
> > > > +       },
> > >
> > > Same here.
> > >
> > > ChenYu
> >
> > BTW, DE 3.0 includes a register in DE TOP called "DE IP configure regis=
ter",
> > which gives the number of IP blocks per class, per mixer. If we retriev=
e
> > the configuration from this register, then we shouldn't need to
> > differentiate between mixer-0 and mixer-1 with compatible strings.
> >
> > What do you think?
>
> IIRC, not all setting were correct when read from registers, but I would =
need
> to check again. I'm also not sure if register holds all possible settings=
, so
> it is safer to have separate list. We would also have to devise mechanism=
 to
> get this data from DE2/3 CCU driver (it occupies the same memory space).
>
> Perhaps the strongest argument is that some SoCs with DE3 have HW bug in
> mixer1 block, including that in H6. In order to work, mod clock has to be
> enabled for mixer0 and mixer1 at the same time. I would associate that qu=
irk
> with mixer1 compatible.

OK. That makes sense. So apart from the mentioning 10 bit support status
in the commit log,

Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
