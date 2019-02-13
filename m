From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 2/2] gpio: sprd: Change to use SoC compatible string
Date: Wed, 13 Feb 2019 17:10:11 +0100
Message-ID: <CAMpxmJXbuOuMvxe+bXqjaCrVU5WXxQ=fZTU9iA8Opnqrx25eMQ@mail.gmail.com>
References: <b8101fd6d303c1993ee294eeee8bce4d24b9547f.1550061925.git.baolin.wang@linaro.org>
 <0438b78c7f9f9bc3f0e7bcbcef3873fd2dd7e259.1550061925.git.baolin.wang@linaro.org>
 <CAMpxmJWuMWBSPjoJWkfagAAopYjohA0rhxUacNPXhhiTFZJorA@mail.gmail.com> <CAMz4kuJRvYo699J5SiG9mhjy5pt1hke8yXwoj9KfmZBTKkkKzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMz4kuJRvYo699J5SiG9mhjy5pt1hke8yXwoj9KfmZBTKkkKzw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Orson Zhai <orsonzhai@gmail.com>, Lyra Zhang <zhang.lyra@gmail.com>, Mark Brown <broonie@kernel.org>, linux-devicetree <devicetree@vger.kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

=C5=9Br., 13 lut 2019 o 14:15 Baolin Wang <baolin.wang@linaro.org> napisa=
=C5=82(a):
>
> On Wed, 13 Feb 2019 at 20:59, Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> >
> > =C5=9Br., 13 lut 2019 o 13:49 Baolin Wang <baolin.wang@linaro.org> napi=
sa=C5=82(a):
> > >
> > > Change to use SoC compatible string instead of wildcard string.
> > >
> > > Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> > > ---
> > >  drivers/gpio/gpio-pmic-eic-sprd.c |    2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpio/gpio-pmic-eic-sprd.c b/drivers/gpio/gpio-pm=
ic-eic-sprd.c
> > > index ac573da..24228cf 100644
> > > --- a/drivers/gpio/gpio-pmic-eic-sprd.c
> > > +++ b/drivers/gpio/gpio-pmic-eic-sprd.c
> > > @@ -364,7 +364,7 @@ static int sprd_pmic_eic_probe(struct platform_de=
vice *pdev)
> > >  }
> > >
> > >  static const struct of_device_id sprd_pmic_eic_of_match[] =3D {
> > > -       { .compatible =3D "sprd,sc27xx-eic", },
> > > +       { .compatible =3D "sprd,sc2731-eic", },
> > >         { /* end of list */ }
> > >  };
> > >  MODULE_DEVICE_TABLE(of, sprd_pmic_eic_of_match);
> > > --
> > > 1.7.9.5
> > >
> >
> > We guarantee to make older device-trees to work with new kernel so you
> > can add the new compatible, but you can't remove the old one.
>
> But the old one is incorrect, and we still keep it?
>

Well in theory the device-tree is supposed to be a stable ABI so once
it's released, it should work with any following kernel version.

In practice changes are sometimes allowed and there are also bugs in DT fil=
es.

Linus: what do you think?

Bart
