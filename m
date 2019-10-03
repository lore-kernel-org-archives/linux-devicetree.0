From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v3 3/5] gpio: syscon: Add support for a custom get operation
Date: Thu, 3 Oct 2019 16:05:22 +0200
Message-ID: <CAMpxmJVfgDTNcwk6qmCwfwQkp_tw+8CVbO1mSeHQkBzJgoWLXg@mail.gmail.com>
References: <20190927100407.1863293-1-paul.kocialkowski@bootlin.com>
 <20190927100407.1863293-4-paul.kocialkowski@bootlin.com> <CAMpxmJUHPuGPPPFSctyhtfj0oAk6oJ+=mvgN4=7jmLxAfHs45Q@mail.gmail.com>
 <20191003112610.GA28856@aptenodytes>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191003112610.GA28856@aptenodytes>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, linux-devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee.jones@linaro.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org

czw., 3 pa=C5=BA 2019 o 13:26 Paul Kocialkowski
<paul.kocialkowski@bootlin.com> napisa=C5=82(a):
>
> Hi,
>
> On Thu 03 Oct 19, 10:24, Bartosz Golaszewski wrote:
> > pt., 27 wrz 2019 o 12:04 Paul Kocialkowski
> > <paul.kocialkowski@bootlin.com> napisa=C5=82(a):
> > >
> > > Some drivers might need a custom get operation to match custom
> > > behavior implemented in the set operation.
> > >
> > > Add plumbing for supporting that.
> > >
> > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > ---
> > >  drivers/gpio/gpio-syscon.c | 7 ++++---
> > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
> > > index 31f332074d7d..05c537ed73f1 100644
> > > --- a/drivers/gpio/gpio-syscon.c
> > > +++ b/drivers/gpio/gpio-syscon.c
> > > @@ -43,8 +43,9 @@ struct syscon_gpio_data {
> > >         unsigned int    bit_count;
> > >         unsigned int    dat_bit_offset;
> > >         unsigned int    dir_bit_offset;
> > > -       void            (*set)(struct gpio_chip *chip,
> > > -                              unsigned offset, int value);
> > > +       int             (*get)(struct gpio_chip *chip, unsigned offse=
t);
> > > +       void            (*set)(struct gpio_chip *chip, unsigned offse=
t,
> > > +                              int value);
> >
> > Why did you change this line? Doesn't seem necessary and pollutes the h=
istory.
>
> This is for consistency since both the "chip" and "offset" arguments can =
fit
> in a single line. Since I want the "get" addition to fit in a single line=
,
> bringing back "offset" on the previous line of "set" makes things consist=
ent.
> There's probably no particular reason for the split in the first place.
>
> Do you think it needs a separate cosmetic commit only for that?
> I'd rather add a note in the commit message and keep the change as-is.
>

The line is still broken - just in a different place. I'd prefer to
leave it as it is frankly, there's nothing wrong with it.

Bart

> Cheers,
>
> Paul
>
> > Bart
> >
> > >  };
> > >
> > >  struct syscon_gpio_priv {
> > > @@ -252,7 +253,7 @@ static int syscon_gpio_probe(struct platform_devi=
ce *pdev)
> > >         priv->chip.label =3D dev_name(dev);
> > >         priv->chip.base =3D -1;
> > >         priv->chip.ngpio =3D priv->data->bit_count;
> > > -       priv->chip.get =3D syscon_gpio_get;
> > > +       priv->chip.get =3D priv->data->get ? : syscon_gpio_get;
> > >         if (priv->data->flags & GPIO_SYSCON_FEAT_IN)
> > >                 priv->chip.direction_input =3D syscon_gpio_dir_in;
> > >         if (priv->data->flags & GPIO_SYSCON_FEAT_OUT) {
> > > --
> > > 2.23.0
> > >
>
> --
> Paul Kocialkowski, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com
