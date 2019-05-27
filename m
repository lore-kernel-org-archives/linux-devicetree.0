From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v2 02/10] media: rc: sunxi: Add A31 compatible
Date: Mon, 27 May 2019 10:20:05 +0200
Message-ID: <CAJiuCcfknVV5V4sMrfizz_K92BeTQsRYekmQQpWFP_-jhPPaQA@mail.gmail.com>
References: <20190526222536.10917-1-peron.clem@gmail.com> <20190526222536.10917-3-peron.clem@gmail.com>
 <20190527074700.rvhqua44ixudt52z@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190527074700.rvhqua44ixudt52z@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

Hi Maxime,

On Mon, 27 May 2019 at 09:47, Maxime Ripard <maxime.ripard@bootlin.com> wro=
te:
>
> Hi,
>
> On Mon, May 27, 2019 at 12:25:28AM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > Allwiner A31 has a different memory mapping so add the compatible
> > we will need it later.
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  drivers/media/rc/sunxi-cir.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.=
c
> > index 307e44714ea0..29ac33b68596 100644
> > --- a/drivers/media/rc/sunxi-cir.c
> > +++ b/drivers/media/rc/sunxi-cir.c
> > @@ -319,6 +319,7 @@ static int sunxi_ir_remove(struct platform_device *=
pdev)
> >  static const struct of_device_id sunxi_ir_match[] =3D {
> >       { .compatible =3D "allwinner,sun4i-a10-ir", },
> >       { .compatible =3D "allwinner,sun5i-a13-ir", },
> > +     { .compatible =3D "allwinner,sun6i-a31-ir", },
>
> We should also move from reset_get_optional to the non optional
> variant for the A31, and ignore it otherwise.

Should this be done in this series ?
Thanks,
Cl=C3=A9ment

>
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
