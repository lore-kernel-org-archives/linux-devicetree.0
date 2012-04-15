From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 1/4] clk: select CLKDEV_LOOKUP for COMMON_CLK
Date: Sat, 14 Apr 2012 22:18:01 -0500
Message-ID: <4F8A3DE9.8030008@gmail.com>
References: <1334003101-17274-1-git-send-email-robherring2@gmail.com> <1334003101-17274-2-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1334003101-17274-2-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Mike Turquette <mturquette@linaro.org>
Cc: Thierry Reding <thierry.reding@avionic-design.de>, Sascha Hauer <kernel@pengutronix.de>, Grant Likely <grant.likely@secretlab.ca>, shawn.guo@linaro.org
List-Id: devicetree@vger.kernel.org

Mike,

On 04/09/2012 03:24 PM, Rob Herring wrote:
> From: Rob Herring <rob.herring@calxeda.com>
> 
> Using the common clock infrastructure without the common clkdev code makes
> little sense, so select CLKDEV_LOOKUP for COMMON_CLK.
> 
> Signed-off-by: Rob Herring <rob.herring@calxeda.com>
> ---

Can you apply the 1st 2 patches in this series to your clock fixes tree
for 3.4?

Rob

>  drivers/clk/Kconfig |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 165e1fe..f05a60d 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -12,6 +12,7 @@ config HAVE_MACH_CLKDEV
>  config COMMON_CLK
>  	bool
>  	select HAVE_CLK_PREPARE
> +	select CLKDEV_LOOKUP
>  	---help---
>  	  The common clock framework is a single definition of struct
>  	  clk, useful across many platforms, as well as an
