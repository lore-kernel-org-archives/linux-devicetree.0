From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] clk: keystone: sci-clk: add support from parsing
 clock info from DT
Date: Mon, 21 Jan 2019 14:53:23 -0600
Message-ID: <20190121205323.GA7851@bogus>
References: <1546954223-9738-1-git-send-email-t-kristo@ti.com>
 <1546954223-9738-3-git-send-email-t-kristo@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1546954223-9738-3-git-send-email-t-kristo@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tero Kristo <t-kristo@ti.com>
Cc: devicetree@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com, ssantosh@kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 08, 2019 at 03:30:22PM +0200, Tero Kristo wrote:
> Currently the sci-clk driver queries clock data from the firmware, which
> can be pretty slow operation in certain cases. Add an option for the
> driver to probe the available clocks from DT also, in this case the
> number of clocks probed from firmware gets cut down drastically. To
> enable the feature, a new flag ti,scan-clocks-from-dt can be added
> under the clock provider node.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> Tested-by: Andreas Dannenberg <dannenberg@ti.com>
> ---
>  drivers/clk/keystone/sci-clk.c | 188 ++++++++++++++++++++++++++++++++++-------
>  1 file changed, 159 insertions(+), 29 deletions(-)


> +static int ti_sci_scan_clocks_from_dt(struct sci_clk_provider *provider)
> +{
> +	struct device *dev = provider->dev;
> +	struct device_node *np = NULL;
> +	int ret;
> +	int index;
> +	struct of_phandle_args args;
> +	struct list_head clks;
> +	struct sci_clk *sci_clk, *prev;
> +	int num_clks = 0;
> +	int num_parents;
> +	int clk_id;
> +
> +	INIT_LIST_HEAD(&clks);
> +
> +	while (1) {
> +		np = of_find_node_with_property(np, "clocks");
> +		if (!np)
> +			break;

for_each_node_with_property

> +
> +		index = 0;
> +
> +		do {
> +			ret = of_parse_phandle_with_args(np, "clocks",
> +							 "#clock-cells", index,
> +							 &args);
> +			if (ret)
> +				break;

of_for_each_phandle can be used here. And then of_phandle_iterator_args 
will get the args.

> +
> +			if (args.args_count == 2 && args.np == dev->of_node) {

dtc will warn if the # of cells are wrong, so that's probably redundant.

Invert the if and save a level of indentation.

> +				sci_clk = devm_kzalloc(dev, sizeof(*sci_clk),
> +						       GFP_KERNEL);
> +				if (!sci_clk)
> +					return -ENOMEM;
> +
> +				sci_clk->dev_id = args.args[0];
> +				sci_clk->clk_id = args.args[1];
> +				sci_clk->provider = provider;
> +				provider->ops->
> +					get_num_parents(provider->sci,
> +							sci_clk->dev_id,
> +							sci_clk->clk_id,
> +							&sci_clk->num_parents);
> +				list_add_tail(&sci_clk->node, &clks);
> +
> +				num_clks++;
> +
> +				num_parents = sci_clk->num_parents;
> +				if (num_parents == 1)
> +					num_parents = 0;
> +
> +				clk_id = args.args[1] + 1;
> +
> +				while (num_parents--) {
> +					sci_clk = devm_kzalloc(dev,
> +							       sizeof(*sci_clk),
> +							       GFP_KERNEL);
> +					if (!sci_clk)
> +						return -ENOMEM;
> +					sci_clk->dev_id = args.args[0];
> +					sci_clk->clk_id = clk_id++;
> +					sci_clk->provider = provider;
> +					list_add_tail(&sci_clk->node, &clks);
> +
> +					num_clks++;
> +				}
> +			}
> +
> +			index++;
> +		} while (args.np);
> +	}
> +
> +	list_sort(NULL, &clks, _cmp_sci_clk_list);
> +
> +	provider->clocks = devm_kmalloc_array(dev, num_clks, sizeof(sci_clk),
> +					      GFP_KERNEL);
> +	if (!provider->clocks)
> +		return -ENOMEM;
> +
> +	num_clks = 0;
> +	prev = NULL;
> +
> +	list_for_each_entry(sci_clk, &clks, node) {
> +		if (prev && prev->dev_id == sci_clk->dev_id &&
> +		    prev->clk_id == sci_clk->clk_id)
> +			continue;
> +
> +		provider->clocks[num_clks++] = sci_clk;
> +		prev = sci_clk;
> +	}
> +
> +	provider->num_clocks = num_clks;
> +
> +	return 0;
> +}
