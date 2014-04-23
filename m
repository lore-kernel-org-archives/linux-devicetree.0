From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v6 3/8] ARM: sunxi: Move the clock protection to machine hooks
Date: Wed, 23 Apr 2014 14:39:02 +0200
Message-ID: <201404231439.02913.arnd@arndb.de>
References: <1397724379-15398-1-git-send-email-maxime.ripard@free-electrons.com> <1397724379-15398-4-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1397724379-15398-4-git-send-email-maxime.ripard@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Emilio Lopez <emilio@elopez.com.ar>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vinod.koul@intel.com>, devicetree@vger.kernel.org, Mike Turquette <mturquette@linaro.org>, andriy.shevchenko@intel.com, linux-kernel@vger.kernel.org, zhuzhenhua@allwinnertech.com, shuge@allwinnertech.com, linux-sunxi@googlegroups.com, kevin.z.m.zh@gmail.com, sunny@allwinnertech.com, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thursday 17 April 2014, Maxime Ripard wrote:
> Since we start to have a lot of clocks to protect, some of them in a few boards
> only, it becomes difficult to handle the clock protection without having to add
> per machine exceptions.
> 
> Move these where they belong, in the machine definition code.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

I don't like the fact that these are required to be hardcoded
anywhere in source code.

> +#include <linux/clk.h>
>  #include <linux/init.h>
>  #include <linux/of_platform.h>
>  
> @@ -19,9 +20,17 @@
>  
>  static void __init sun4i_dt_init(void)
>  {
> +       struct clk *clk;
> +
>         sunxi_setup_restart();
>  
>         of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
> +
> +       /* Make sure the clocks we absolutely need are enabled */
> +       /* DDR clock */
> +       clk = clk_get(NULL, "pll5_ddr");
> +       if (!IS_ERR(clk))
> +               clk_prepare_enable(clk);
>  }

Isn't there already DT syntax to do the same? If not, should there be?

	Arnd
