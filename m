From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v3 03/12] media: rc: sunxi: Add A31 compatible
Date: Tue, 4 Jun 2019 17:07:02 +0200
Message-ID: <CAJiuCceqATLiDjpNLTq+gOhUHun40udJdpXYirn=Z=GVQLQzaw@mail.gmail.com>
References: <20190528161440.27172-1-peron.clem@gmail.com> <20190528161440.27172-4-peron.clem@gmail.com>
 <20190604145430.xqufpyosetgb4bo7@core.my.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190604145430.xqufpyosetgb4bo7@core.my.home>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, 4 Jun 2019 at 16:54, Ond=C5=99ej Jirman <megous@megous.com> wrote:
>
> On Tue, May 28, 2019 at 06:14:31PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > Allwiner A31 has a different memory mapping so add the compatible
> > we will need it later.
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  drivers/media/rc/sunxi-cir.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.=
c
> > index d02dcb6fd0a5..0504ebfc831f 100644
> > --- a/drivers/media/rc/sunxi-cir.c
> > +++ b/drivers/media/rc/sunxi-cir.c
> > @@ -343,6 +343,11 @@ static const struct sunxi_ir_quirks sun5i_a13_ir_q=
uirks =3D {
> >       .fifo_size =3D 64,
> >  };
> >
> > +static const struct sunxi_ir_quirks sun6i_a31_ir_quirks =3D {
> > +     .has_reset =3D true,
> > +     .fifo_size =3D 64,
> > +};
> > +
>
> BTW, H6 BSP uses FIFO size 40:
>
> https://github.com/orangepi-xunlong/OrangePiH6_Linux4_9/blob/master/drive=
rs/media/rc/sunxi-ir-dev.c#L290
>
> Have you tried filling the fifo with over 40 words on H6, to see if it wo=
rks?
No I didn't try this, but I trust more the user manual than the driver.
And I don't see why they would have reduce the fifo size in the new generat=
ion.
Anyway, I will be able to test that at the end of the week.

Regards,
Cl=C3=A9ment

> I know it's docummented as having 64 words in the manual, so maybe Allwin=
er
> just didn't care enough to make the driver configurable, and the H6
> FIFO really has that depth.
>
> regards,
>         o.
>
> >  static const struct of_device_id sunxi_ir_match[] =3D {
> >       {
> >               .compatible =3D "allwinner,sun4i-a10-ir",
> > @@ -352,6 +357,10 @@ static const struct of_device_id sunxi_ir_match[] =
=3D {
> >               .compatible =3D "allwinner,sun5i-a13-ir",
> >               .data =3D &sun5i_a13_ir_quirks,
> >       },
> > +     {
> > +             .compatible =3D "allwinner,sun6i-a31-ir",
> > +             .data =3D &sun6i_a31_ir_quirks,
> > +     },
> >       {}
> >  };
> >  MODULE_DEVICE_TABLE(of, sunxi_ir_match);
> > --
> > 2.20.1
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
