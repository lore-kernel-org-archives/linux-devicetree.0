From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v9 08/10] OPP: Add a dev_pm_opp_of_get_level() helper
Date: Tue, 8 Jan 2019 10:24:02 +0530
Message-ID: <20190108045402.2jglb5y3bk76dems@vireshk-i7>
References: <20190107100959.14528-1-rnayak@codeaurora.org>
 <20190107100959.14528-9-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190107100959.14528-9-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: andy.gross@linaro.org, robh@kernel.org, sboyd@kernel.org, ulf.hansson@linaro.org, collinsd@codeaurora.org, mka@chromium.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, henryc.chen@mediatek.com
List-Id: devicetree@vger.kernel.org

On 07-01-19, 15:39, Rajendra Nayak wrote:
> Now that we have atleast 2 genpd providers, both using a simple

This kind of reasoning for this patch isn't required anymore. Make
this patch the second one in the series, i.e. just after the bindings.

> routine to read a performance state (opp-level) value from device
> tree, in order to implement the .opp_to_performance_state
> callback, add a dev_pm_opp_of_get_level() helper to do
> it, so it can be resued across all such genpd providers which
> just need to read the value from DT.
> 
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  drivers/opp/of.c       | 23 +++++++++++++++++++++++
>  include/linux/pm_opp.h |  5 +++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/drivers/opp/of.c b/drivers/opp/of.c
> index 06f0f632ec47..6fb383fee601 100644
> --- a/drivers/opp/of.c
> +++ b/drivers/opp/of.c
> @@ -1029,6 +1029,29 @@ int of_get_required_opp_performance_state(struct device_node *np, int index)
>  }
>  EXPORT_SYMBOL_GPL(of_get_required_opp_performance_state);
>  
> +/**
> + * dev_pm_opp_of_get_level() - Reads the opp-level value from Device Tree
> + * @opp: opp for which 'opp-level' should be read and returned
> + *
> + * Returns the opp-level value read from Device Tree, if present, else 0
> + *
> + * Return: Zero or positive opp-level value read from Device tree
> + */
> +unsigned int dev_pm_opp_of_get_level(struct dev_pm_opp *opp)
> +{
> +	struct device_node *np;
> +	unsigned int perf_state = 0;
> +
> +	np = dev_pm_opp_get_of_node(opp);
> +	if (of_property_read_u32(np, "opp-level", &perf_state))
> +		pr_err("%s: missing 'opp-level' property\n", __func__);

Instead of this, add a field "level" in the opp structure in
drivers/opp/opp.h and fill it while parsing the OPPs. And here you can
just read the values then.

-- 
viresh
