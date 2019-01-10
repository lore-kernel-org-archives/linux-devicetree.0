From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v11 2/9] OPP: Add support for parsing the 'opp-level'
 property
Date: Thu, 10 Jan 2019 11:59:00 +0530
Message-ID: <20190110062900.2cwqquwdbipxo6hb@vireshk-i7>
References: <20190110040209.6028-1-rnayak@codeaurora.org>
 <20190110040209.6028-3-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190110040209.6028-3-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: andy.gross@linaro.org, robh@kernel.org, sboyd@kernel.org, ulf.hansson@linaro.org, collinsd@codeaurora.org, mka@chromium.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, henryc.chen@mediatek.com
List-Id: devicetree@vger.kernel.org

On 10-01-19, 09:32, Rajendra Nayak wrote:
> Now that the OPP bindings are updated to include an optional
> 'opp-level' property, add support to parse it from device tree
> and store it as part of dev_pm_opp structure.
> Also add and export an helper 'dev_pm_opp_get_level()' that can be
> used to get the level value read from device tree when present.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  drivers/opp/core.c     | 18 ++++++++++++++++++
>  drivers/opp/of.c       |  2 ++
>  drivers/opp/opp.h      |  2 ++
>  include/linux/pm_opp.h |  7 +++++++
>  4 files changed, 29 insertions(+)
> 
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index e5507add8f04..90b78a122be9 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -130,6 +130,24 @@ unsigned long dev_pm_opp_get_freq(struct dev_pm_opp *opp)
>  }
>  EXPORT_SYMBOL_GPL(dev_pm_opp_get_freq);
>  
> +/**
> + * dev_pm_opp_get_level() - Gets the level corresponding to an available opp
> + * @opp:	opp for which level value has to be returned for
> + *
> + * Return: level read from device tree corresponding to the opp, else
> + * return 0.
> + */
> +unsigned int dev_pm_opp_get_level(struct dev_pm_opp *opp)
> +{
> +	if (IS_ERR_OR_NULL(opp) || !opp->available) {
> +		pr_err("%s: Invalid parameters\n", __func__);
> +		return 0;
> +	}
> +
> +	return opp->level;
> +}
> +EXPORT_SYMBOL_GPL(dev_pm_opp_get_level);
> +
>  /**
>   * dev_pm_opp_is_turbo() - Returns if opp is turbo OPP or not
>   * @opp: opp for which turbo mode is being verified
> diff --git a/drivers/opp/of.c b/drivers/opp/of.c
> index 06f0f632ec47..1779f2c93291 100644
> --- a/drivers/opp/of.c
> +++ b/drivers/opp/of.c
> @@ -594,6 +594,8 @@ static struct dev_pm_opp *_opp_add_static_v2(struct opp_table *opp_table,
>  		new_opp->rate = (unsigned long)rate;
>  	}
>  
> +	of_property_read_u32(np, "opp-level", &new_opp->level);
> +
>  	/* Check if the OPP supports hardware's hierarchy of versions or not */
>  	if (!_opp_is_supported(dev, opp_table, np)) {
>  		dev_dbg(dev, "OPP not supported by hardware: %llu\n", rate);
> diff --git a/drivers/opp/opp.h b/drivers/opp/opp.h
> index e24d81497375..4458175aa661 100644
> --- a/drivers/opp/opp.h
> +++ b/drivers/opp/opp.h
> @@ -60,6 +60,7 @@ extern struct list_head opp_tables;
>   * @suspend:	true if suspend OPP
>   * @pstate: Device's power domain's performance state.
>   * @rate:	Frequency in hertz
> + * @level:	Performance level
>   * @supplies:	Power supplies voltage/current values
>   * @clock_latency_ns: Latency (in nanoseconds) of switching to this OPP's
>   *		frequency from any other OPP's frequency.
> @@ -80,6 +81,7 @@ struct dev_pm_opp {
>  	bool suspend;
>  	unsigned int pstate;
>  	unsigned long rate;
> +	unsigned int level;
>  
>  	struct dev_pm_opp_supply *supplies;
>  
> diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
> index 0a2a88e5a383..473d2c7516f0 100644
> --- a/include/linux/pm_opp.h
> +++ b/include/linux/pm_opp.h
> @@ -86,6 +86,8 @@ unsigned long dev_pm_opp_get_voltage(struct dev_pm_opp *opp);
>  
>  unsigned long dev_pm_opp_get_freq(struct dev_pm_opp *opp);
>  
> +unsigned int dev_pm_opp_get_level(struct dev_pm_opp *opp);
> +
>  bool dev_pm_opp_is_turbo(struct dev_pm_opp *opp);
>  
>  int dev_pm_opp_get_opp_count(struct device *dev);
> @@ -157,6 +159,11 @@ static inline unsigned long dev_pm_opp_get_freq(struct dev_pm_opp *opp)
>  	return 0;
>  }
>  
> +static inline unsigned int dev_pm_opp_get_level(struct dev_pm_opp *opp)
> +{
> +	return 0;
> +}
> +
>  static inline bool dev_pm_opp_is_turbo(struct dev_pm_opp *opp)
>  {
>  	return false;

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
