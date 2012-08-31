From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/4] clk: add of_clk_src_onecell_get() support
Date: Fri, 31 Aug 2012 14:41:27 +0800
Message-ID: <20120831064125.GA3271@r65073-Latitude-D630>
References: <1345642590-29905-1-git-send-email-shawn.guo@linaro.org>
 <1345642590-29905-2-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1345642590-29905-2-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Ping, Mike.

Regards,
Shawn

On Wed, Aug 22, 2012 at 09:36:27PM +0800, Shawn Guo wrote:
> For those SoCs that have hundreds of clock outputs, their clock
> DT bindings could reasonably define #clock-cells as 1 and require
> the client device specify the index of the clock it consumes in the
> cell of its "clocks" phandle.
> 
> Add a generic of_clk_src_onecell_get() function for this purpose.
> 
> Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/clk/clk.c            |   14 ++++++++++++++
>  include/linux/clk-provider.h |    5 +++++
>  2 files changed, 19 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index efdfd00..308f058 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1582,6 +1582,20 @@ struct clk *of_clk_src_simple_get(struct of_phandle_args *clkspec,
>  }
>  EXPORT_SYMBOL_GPL(of_clk_src_simple_get);
>  
> +struct clk *of_clk_src_onecell_get(struct of_phandle_args *clkspec, void *data)
> +{
> +	struct clk_onecell_data *clk_data = data;
> +	unsigned int idx = clkspec->args[0];
> +
> +	if (idx >= clk_data->clk_num) {
> +		pr_err("%s: invalid clock index %d\n", __func__, idx);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	return clk_data->clks[idx];
> +}
> +EXPORT_SYMBOL_GPL(of_clk_src_onecell_get);
> +
>  /**
>   * of_clk_add_provider() - Register a clock provider for a node
>   * @np: Device node pointer associated with clock provider
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 77335fa..8fe6ec7 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -360,6 +360,11 @@ int of_clk_add_provider(struct device_node *np,
>  void of_clk_del_provider(struct device_node *np);
>  struct clk *of_clk_src_simple_get(struct of_phandle_args *clkspec,
>  				  void *data);
> +struct clk_onecell_data {
> +	struct clk **clks;
> +	unsigned int clk_num;
> +};
> +struct clk *of_clk_src_onecell_get(struct of_phandle_args *clkspec, void *data);
>  const char *of_clk_get_parent_name(struct device_node *np, int index);
>  void of_clk_init(const struct of_device_id *matches);
>  
> -- 
> 1.7.5.4
> 
