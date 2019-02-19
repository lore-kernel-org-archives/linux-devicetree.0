From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH v2 2/2] gpio: sprd: Change to use SoC compatible string
Date: Tue, 19 Feb 2019 10:02:08 +0800
Message-ID: <CAMz4ku+YUfOzWf4gAvicEq6hONK9m54oRxrYX_L6PtDcoV2-ow@mail.gmail.com>
References: <3818909a5d6f956ef30ff25cfc42f7550d062086.1550201284.git.baolin.wang@linaro.org>
 <ad2fbe222ad715b3f7e6e093a7f822743e465f9a.1550201284.git.baolin.wang@linaro.org>
 <20190218200737.GA7091@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190218200737.GA7091@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Mark Brown <broonie@kernel.org>, DTML <devicetree@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, 19 Feb 2019 at 04:07, Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Feb 15, 2019 at 12:55:19PM +0800, Baolin Wang wrote:
> > Change to use SoC compatible string instead of wildcard string.
> >
> > Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> > ---
> > Changes from v1:
> >  - None.
> > ---
> >  drivers/gpio/gpio-pmic-eic-sprd.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpio/gpio-pmic-eic-sprd.c b/drivers/gpio/gpio-pmic-eic-sprd.c
> > index ac573da..24228cf 100644
> > --- a/drivers/gpio/gpio-pmic-eic-sprd.c
> > +++ b/drivers/gpio/gpio-pmic-eic-sprd.c
> > @@ -364,7 +364,7 @@ static int sprd_pmic_eic_probe(struct platform_device *pdev)
> >  }
> >
> >  static const struct of_device_id sprd_pmic_eic_of_match[] = {
> > -     { .compatible = "sprd,sc27xx-eic", },
> > +     { .compatible = "sprd,sc2731-eic", },
>
> You need to keep the old one if you care about backwards compatibility.
> If you don't then state why in the commit message.
>

As we discussed before, our dts and drivers development are still in
progress, and we always recompile and ship device trees at the same
time as we compile and ship the kernel, so we do not need care about
backwards compatibility.

Yes, I will add the explanation in the commit message. Thanks.

-- 
Baolin Wang
Best Regards
