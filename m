From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH RFC 3/3] clk: dt: binding for basic divider clock
Date: Tue, 4 Jun 2013 00:18:32 +0200
Message-ID: <201306040018.33236.heiko@sntech.de>
References: <1370281990-15090-1-git-send-email-mturquette@linaro.org>
 <1370281990-15090-4-git-send-email-mturquette@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1370281990-15090-4-git-send-email-mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Montag, 3. Juni 2013, 19:53:10 schrieb Mike Turquette:
> Devicetree binding for the basic clock divider, plus the setup function
> to register the clock.  Based on the existing fixed-clock binding.
> 
> Signed-off-by: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---

[...]

> +/**
> + * of_div_clk_setup() - Setup function for simple div rate clock
> + */
> +void of_divider_clk_setup(struct device_node *node)
> +{
> +	struct clk *clk;
> +	const char *clk_name = node->name;
> +	void __iomem *reg;
> +	const char *parent_name;
> +	u8 clk_divider_flags = 0;
> +	u8 mask = 0;
> +	u8 shift = 0;

in the mux-clock these 3 are unsigned long and u32 types ... what is correct?


> +	struct clk_div_table *table;
> +
> +	of_property_read_string(node, "clock-output-names", &clk_name);
> +
> +	parent_name = of_clk_get_parent_name(node, 0);
> +
> +	reg = of_iomap(node, 0);
> +
> +	if (of_property_read_u8(node, "mask", &mask)) {
> +		pr_err("%s: missing mask property for %s\n", __func__, node->name);
> +		return;
> +	}
> +
> +	if (of_property_read_u8(node, "shift", &shift))
> +		pr_debug("%s: missing shift property defaults to zero for %s\n",
> +				__func__, node->name);

same here ... mux reads u32

> +	if (of_property_read_bool(node, "index_one"))
> +		clk_divider_flags |= CLK_DIVIDER_ONE_BASED;
> +
> +	if (of_property_read_bool(node, "index_power_of_two"))
> +		clk_divider_flags |= CLK_DIVIDER_POWER_OF_TWO;
> +
> +	if (of_property_read_bool(node, "index_allow_zero"))
> +		clk_divider_flags |= CLK_DIVIDER_ALLOW_ZERO;
> +
> +	table = of_clk_get_div_table(node);
> +	if (IS_ERR(table))
> +		return;
> +
> +	clk = clk_register_divider_table(NULL, clk_name,
> +			parent_name, 0,
> +			reg, shift, mask,
> +			clk_divider_flags, table,
> +			NULL);

this causes trouble, as the divider clock code above still requires a width 
instead of a mask. I remember talk about this going to change separately, but 
couldn't find anything of the sort in linux-next.



> +
> +	if (!IS_ERR(clk))
> +		of_clk_add_provider(node, of_clk_src_simple_get, clk);
> +}
> +EXPORT_SYMBOL_GPL(of_divider_clk_setup);
> +CLK_OF_DECLARE(divider_clk, "divider-clock", of_divider_clk_setup);
> +#endif
