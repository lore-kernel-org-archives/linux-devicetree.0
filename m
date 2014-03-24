From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 1/7] clk: sunxi: Remove calls to clk_put
Date: Mon, 24 Mar 2014 14:51:20 -0700
Message-ID: <20140324215120.32624.63543@quantum>
References: <1394723659-4995-1-git-send-email-maxime.ripard@free-electrons.com>
 <1394723659-4995-2-git-send-email-maxime.ripard@free-electrons.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDO333VC4INBBYORYKMQKGQEORAINWI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1394723659-4995-2-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, kevin.z.m.zh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sunny-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, zhuzhenhua-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Quoting Maxime Ripard (2014-03-13 08:14:13)
> Callers of clk_put must disable the clock first. This also means that as long
> as the clock is enabled the driver should hold a reference to that clock.
> Hence, the call to clk_put here are bogus and should be removed.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Looks good to me. There is a balanced clk_put in the module remove
function?

Regards,
Mike

> ---
>  drivers/clk/sunxi/clk-sunxi.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
> index 23baad9d934a..7119c02c9fa8 100644
> --- a/drivers/clk/sunxi/clk-sunxi.c
> +++ b/drivers/clk/sunxi/clk-sunxi.c
> @@ -1290,17 +1290,13 @@ static void __init sunxi_clock_protect(void)
>  
>         /* memory bus clock - sun5i+ */
>         clk = clk_get(NULL, "mbus");
> -       if (!IS_ERR(clk)) {
> +       if (!IS_ERR(clk))
>                 clk_prepare_enable(clk);
> -               clk_put(clk);
> -       }
>  
>         /* DDR clock - sun4i+ */
>         clk = clk_get(NULL, "pll5_ddr");
> -       if (!IS_ERR(clk)) {
> +       if (!IS_ERR(clk))
>                 clk_prepare_enable(clk);
> -               clk_put(clk);
> -       }
>  }
>  
>  static void __init sunxi_init_clocks(void)
> -- 
> 1.9.0
> 
