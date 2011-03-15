From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 3/5] arm/dt: mx51: dynamically add clocks per dt nodes
Date: Tue, 15 Mar 2011 01:48:08 -0600
Message-ID: <20110315074808.GI23050@angua.secretlab.ca>
References: <1300108722-3254-1-git-send-email-shawn.guo@linaro.org>
	<1300108722-3254-4-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1300108722-3254-4-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 14, 2011 at 09:18:40PM +0800, Shawn Guo wrote:
> This patch is to change the static clock creating and registering to
> the dynamic way, which scans dt clock nodes, associate clk with
> device_node, and then add them to clkdev accordingly.
> 
> It's a pretty straight translation from non-dt clock code to dt one,
> and it does not really change any actual clock code.
> 
> Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/mach-mx5/clock-mx51-mx53.c | 1401 ++++++++++++++++++++++++++++++++++-
>  1 files changed, 1387 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm/mach-mx5/clock-mx51-mx53.c b/arch/arm/mach-mx5/clock-mx51-mx53.c
> index dedb7f9..c3ec7f6 100644
> --- a/arch/arm/mach-mx5/clock-mx51-mx53.c
> +++ b/arch/arm/mach-mx5/clock-mx51-mx53.c
> @@ -49,6 +49,30 @@ static struct clk emi_fast_clk;
>  static struct clk ipu_clk;
>  static struct clk mipi_hsc1_clk;
>  
> +#ifdef CONFIG_OF
> +/*
> + * The pointers are defined to save the references to the clocks
> + * dynamically created, and then could be used to replace those
> + * static references in non-dt clock code.
> + */
> +static struct clk *osc_clk_dt;
> +static struct clk *pll1_main_clk_dt;
> +static struct clk *pll1_sw_clk_dt;
> +static struct clk *pll2_sw_clk_dt;
> +static struct clk *pll3_sw_clk_dt;
> +static struct clk *lp_apm_clk_dt;
> +static struct clk *periph_apm_clk_dt;
> +static struct clk *main_bus_clk_dt;
> +static struct clk *ipg_clk_dt;
> +static struct clk *ipg_per_clk_dt;
> +static struct clk *cpu_clk_dt;
> +static struct clk *iim_clk_dt;
> +static struct clk *usboh3_clk_dt;
> +static struct clk *usb_phy1_clk_dt;
> +static struct clk *esdhc1_clk_dt;
> +static struct clk *esdhc2_clk_dt;
> +#endif

Heh, yeah this seems sub-optimal.  It would be better to share common
clock initialization between dt and non-dt boards, even if it means
that a lot of the clocks are node described in the device tree (at
least for the on-chip SoC clocks; board-accessible clocks still need
to appear in the device tree though.

> +
>  #define MAX_DPLL_WAIT_TRIES	1000 /* 1000 * udelay(1) = 1ms */
>  
>  /* calculate best pre and post dividers to get the required divider */
> @@ -163,10 +187,18 @@ static inline void __iomem *_mx53_get_pll_base(struct clk *pll)
>  	return NULL;
>  }
>  
> +#ifdef CONFIG_OF
> +static void __iomem *dt_mx51_get_pll_base(struct clk *pll);
> +#endif
> +
>  static inline void __iomem *_get_pll_base(struct clk *pll)
>  {
>  	if (cpu_is_mx51())
> +#ifdef CONFIG_OF
> +		return dt_mx51_get_pll_base(pll);
> +#else
>  		return _mx51_get_pll_base(pll);
> +#endif

If you do it this way, you need to make sure dt_mx51_get_pll_base()
falls back to _mx51_get_pll_base() when a dt is not provided.

g.
