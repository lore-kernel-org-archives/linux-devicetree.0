From: "Turquette, Mike" <mturquette@ti.com>
Subject: Re: [PATCH 1/4] clk: select CLKDEV_LOOKUP for COMMON_CLK
Date: Tue, 17 Apr 2012 15:13:49 -0700
Message-ID: <CAJOA=zMPqiH2fQJ5JWJ=COnju7Cmur6J2ATYUTcx41C4WMjFQQ@mail.gmail.com>
References: <1334003101-17274-1-git-send-email-robherring2@gmail.com> <1334003101-17274-2-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1334003101-17274-2-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Thierry Reding <thierry.reding@avionic-design.de>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Sascha Hauer <kernel@pengutronix.de>, shawn.guo@linaro.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 9, 2012 at 1:24 PM, Rob Herring <robherring2@gmail.com> wro=
te:
> From: Rob Herring <rob.herring@calxeda.com>
>
> Using the common clock infrastructure without the common clkdev code =
makes
> little sense, so select CLKDEV_LOOKUP for COMMON_CLK.
>
> Signed-off-by: Rob Herring <rob.herring@calxeda.com>
> ---
> =A0drivers/clk/Kconfig | =A0 =A01 +
> =A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 165e1fe..f05a60d 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -12,6 +12,7 @@ config HAVE_MACH_CLKDEV
> =A0config COMMON_CLK
> =A0 =A0 =A0 =A0bool
> =A0 =A0 =A0 =A0select HAVE_CLK_PREPARE
> + =A0 =A0 =A0 select CLKDEV_LOOKUP
> =A0 =A0 =A0 =A0---help---
> =A0 =A0 =A0 =A0 =A0The common clock framework is a single definition =
of struct
> =A0 =A0 =A0 =A0 =A0clk, useful across many platforms, as well as an

Hi Rob,

I agree that the common clk framework is not particularly useful
without clkdev.  However the core code has no dependency on clkdev.
Why not just select it from an arch Kconfig, or even make it a
dependency based on your own platform clock data/code?

Regards,
Mike

> --
> 1.7.5.4
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
