Return-Path: <SRS0=Aooz=JS=linaro.org=ulf.hansson@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180630181405.17630-1-daniel@zonque.org>
References: <20180630181405.17630-1-daniel@zonque.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 2 Jul 2018 16:38:04 +0200
Message-ID: <CAPDyKFo3CPZaLrfcAX=PLYGEdRzdUKQ0Undw6oOSm4+Hd826Fw@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] mmc: pxamci: cleanups and minor DT tweaks
Content-Type: text/plain; charset="UTF-8"
To: Daniel Mack <daniel@zonque.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Robert Jarzmik <robert.jarzmik@free.fr>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 30 June 2018 at 20:13, Daniel Mack <daniel@zonque.org> wrote:
> Here is a series of small patches for pxamci that do some cleanups.
>
> The pxa tree has a patch for 4.19 [1] that this series builds upon,
> so if possible, we'd like to let this series go through Robert's tree
> after it has been reviewed. If that's not okay for the mmc folks,
> teh series has to wait until 4.20-rc1.
>
> [1] https://github.com/rjarzmik/linux/commit/6b3348f9e6e
>
>
> Thanks,
> Daniel
>
> Daniel Mack (7):
>   mmc: pxamci: remove irq from private context
>   mmc: pxamci: remove dma resources from private context
>   mmc: pxamci: remove dead code from pxamci_remove()
>   mmc: pxamci: fix indenting
>   mmc: pxamci: call mmc_of_parse()
>   mmc: pxamci: remove pxa-mmc,gpio-power from devicetree bindings
>   mmc: pxamci: let mmc core handle regulators
>
>  .../devicetree/bindings/mmc/pxa-mmc.txt       |   6 +-
>  drivers/mmc/host/pxamci.c                     | 116 +++++++-----------
>  2 files changed, 50 insertions(+), 72 deletions(-)
>
> --
> 2.17.1
>

Thanks, applied for next!

Kind regards
Uffe
