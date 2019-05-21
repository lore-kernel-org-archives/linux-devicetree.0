Return-Path: <SRS0=jvsB=TV=gmail.com=andy.shevchenko@kernel.org>
MIME-Version: 1.0
References: <20190521115958.22504-1-masahisa.kojima@linaro.org>
 <20190521115958.22504-4-masahisa.kojima@linaro.org> <CAKv+Gu8zhymKrbuNo+KU58svKyBO2cyLw-wKcKwgON2sDYBK7A@mail.gmail.com>
In-Reply-To: <CAKv+Gu8zhymKrbuNo+KU58svKyBO2cyLw-wKcKwgON2sDYBK7A@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 21 May 2019 19:27:17 +0300
Message-ID: <CAHp75Vdo3io9eDuuSJnt1VcEDSi7+pnQW8V+ter37GwH1be2JQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] spi: Add spi driver for Socionext Synquacer platform
Content-Type: text/plain; charset="UTF-8"
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Masahisa Kojima <masahisa.kojima@linaro.org>, linux-spi <linux-spi@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Trent Piepho <tpiepho@impinj.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jaswinder Singh <jaswinder.singh@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Satoru Okamoto <okamoto.satoru@socionext.com>, Yoshitoyo Osaki <osaki.yoshitoyo@socionext.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, May 21, 2019 at 4:55 PM Ard Biesheuvel
<ard.biesheuvel@linaro.org> wrote:
> On Tue, 21 May 2019 at 13:00, Masahisa Kojima
> <masahisa.kojima@linaro.org> wrote:

> > +       ret = clk_prepare_enable(sspi->clk);
> > +       if (ret)
> > +               goto put_spi;
> > +
>
> Make this depend on DT probing

We may use devm_clk_get_optional() and drop dependencies.

-- 
With Best Regards,
Andy Shevchenko
