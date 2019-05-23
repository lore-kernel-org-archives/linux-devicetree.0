Return-Path: <SRS0=QmRv=TX=linaro.org=masahisa.kojima@kernel.org>
MIME-Version: 1.0
References: <20190521115958.22504-1-masahisa.kojima@linaro.org>
 <20190521115958.22504-4-masahisa.kojima@linaro.org> <20190521181609.GB16633@sirena.org.uk>
 <CADQ0-X9yKQ2akerpxKfjxOxmRhPiaaxe7ALDO7VQiH+-+SHo3w@mail.gmail.com> <20190522110906.GD8582@sirena.org.uk>
In-Reply-To: <20190522110906.GD8582@sirena.org.uk>
From: Masahisa Kojima <masahisa.kojima@linaro.org>
Date: Thu, 23 May 2019 13:35:21 +0900
Message-ID: <CADQ0-X8xd+edmPWfMSDgHrRCHEHewxsLH3zNs6jnPtfaQBhaLQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] spi: Add spi driver for Socionext Synquacer platform
Content-Type: text/plain; charset="UTF-8"
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, geert@linux-m68k.org, tpiepho@impinj.com, andy.shevchenko@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Satoru Okamoto <okamoto.satoru@socionext.com>, Yoshitoyo Osaki <osaki.yoshitoyo@socionext.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, 22 May 2019 at 20:09, Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, May 22, 2019 at 05:27:23PM +0900, Masahisa Kojima wrote:
> > On Wed, 22 May 2019 at 03:16, Mark Brown <broonie@kernel.org> wrote:
> > > On Tue, May 21, 2019 at 08:59:58PM +0900, Masahisa Kojima wrote:
>
> > > > +     ret = devm_request_irq(&pdev->dev, rx_irq, sq_spi_rx_handler,
> > > > +                             0, "synquacer-spi-rx", sspi);
> > > > +     ret = devm_request_irq(&pdev->dev, tx_irq, sq_spi_tx_handler,
> > > > +                             0, "synquacer-spi-tx", sspi);
>
> > > The code looked awfully like we depend on having interrupts?
>
> > I"m not sure I correctly understand what this comment means,
> > should driver assume the case interrupt is not available?
> > Do I need to support both interrupt and polling handling?
>
> If the driver requires interrupts it should not just ignore errors when
> it requests interrupts.

I'm sorry, I misunderstood.
Yes, interrupt is required. I will handle errors properly.
