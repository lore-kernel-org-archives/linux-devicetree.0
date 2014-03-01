From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 2/5] clk: sun6i: Reparent AHB clock on PLL6
Date: Sat, 01 Mar 2014 17:32:40 +0100
Message-ID: <53120BA8.3000508@redhat.com>
References: <1393605440-14643-1-git-send-email-maxime.ripard@free-electrons.com> <1393605440-14643-3-git-send-email-maxime.ripard@free-electrons.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDL4X2GMZUKRBOUXZCMAKGQEMZ4U4PY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1393605440-14643-3-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kevin.z.m.zh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sunny-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, zhuzhenhua-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 02/28/2014 05:37 PM, Maxime Ripard wrote:
> In order for the DMA controller to work for SDRAM to devices transfers, the AHB
> clock should be reparented on the PLL6.
> 
> Force that parenting in the clock driver.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/clk/sunxi/clk-sunxi.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
> index f6f61cc..a5c5882 100644
> --- a/drivers/clk/sunxi/clk-sunxi.c
> +++ b/drivers/clk/sunxi/clk-sunxi.c
> @@ -1286,7 +1286,7 @@ static void __init of_sunxi_table_clock_setup(const struct of_device_id *clk_mat
>   */
>  static void __init sunxi_clock_protect(void)
>  {
> -	struct clk *clk;
> +	struct clk *clk, *parent;
>  
>  	/* memory bus clock - sun5i+ */
>  	clk = clk_get(NULL, "mbus");
> @@ -1307,6 +1307,22 @@ static void __init sunxi_clock_protect(void)
>  	if (!IS_ERR(clk))
>  		clk_prepare_enable(clk);
>  
> +	clk = clk_get(NULL, "ahb1_mux");
> +	if (IS_ERR(clk)) {
> +		pr_err("Couldn't get AHB1 Mux\n");
> +		return;
> +	}

I think Emilio already made a similar remark for v1, but since this
is still here in v2, ahb1_mux is only available on sun6i, so
at a minimum the pr_err should be dropped. Preferably I would like
to see this changed to something like:

	clk = clk_get(NULL, "ahb1_mux");
	parent = clk_get(NULL, "pll6");
	if (!IS_ERR(clk) && !IS_ERR(parent))
		clk_set_parent(clk, parent);
	if (!IS_ERR(parent))
		clk_put(parent);
	if (!IS_ERR(clk))
		clk_put(clk);

> +
> +	parent = clk_get(NULL, "pll6");
> +	if (IS_ERR(clk)) {

Copy paste error should be IS_ERR(parent).

> +		pr_err("Couldn't get PLL6\n");

If we keep things this way this error path should do a clk_put(clk);

> +		return;
> +	}
> +
> +	clk_set_parent(clk, parent);
> +
> +	clk_put(clk);
> +	clk_put(parent);
>  }
>  
>  static void __init sunxi_init_clocks(void)
> 

Regards,

Hans

p.s.

Given Russell's remarks it would also be good to have a
patch in this set dropping the clk_put calls of the existing
enables / protections.
