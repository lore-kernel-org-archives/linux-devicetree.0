From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v3 2/6] OPP: Add support for bandwidth OPP tables
Date: Tue, 16 Jul 2019 23:03:12 +0530
Message-ID: <5dd35be3-fd03-c9cc-1eed-ce4bc1433363@codeaurora.org>
References: <20190703011020.151615-1-saravanak@google.com>
 <20190703011020.151615-3-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190703011020.151615-3-saravanak@google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Saravana Kannan <saravanak@google.com>, Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: vincent.guittot@linaro.org, seansw@qti.qualcomm.com, daidavid1@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>, bjorn.andersson@linaro.org, evgreen@chromium.org, kernel-team@android.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, adharmap@codeaurora.org
List-Id: devicetree@vger.kernel.org

Hey Saravana,

On 7/3/19 6:40 AM, Saravana Kannan wrote:
> Not all devices quantify their performance points in terms of frequency.
> Devices like interconnects quantify their performance points in terms of
> bandwidth. We need a way to represent these bandwidth levels in OPP. So,
> add support for parsing bandwidth OPPs from DT.
> 
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>   drivers/opp/of.c  | 34 ++++++++++++++++++++++++++++++++--
>   drivers/opp/opp.h |  4 +++-
>   2 files changed, 35 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/opp/of.c b/drivers/opp/of.c
> index c10c782d15aa..54fa70ed2adc 100644
> --- a/drivers/opp/of.c
> +++ b/drivers/opp/of.c
> @@ -552,6 +552,35 @@ void dev_pm_opp_of_remove_table(struct device *dev)
>   }
>   EXPORT_SYMBOL_GPL(dev_pm_opp_of_remove_table);
>   
> +static int _read_opp_key(struct dev_pm_opp *new_opp, struct device_node *np)
> +{
> +	int ret;
> +	u64 rate;
> +	u32 bw;
> +
> +	ret = of_property_read_u64(np, "opp-hz", &rate);
> +	if (!ret) {
> +		/*
> +		 * Rate is defined as an unsigned long in clk API, and so
> +		 * casting explicitly to its type. Must be fixed once rate is 64
> +		 * bit guaranteed in clk API.
> +		 */
> +		new_opp->rate = (unsigned long)rate
now that the rate gets set here, please remove the rate assignment in
_opp_add_static_v2

> +		return 0;
> +	}
> +
> +	ret = of_property_read_u32(np, "opp-peak-KBps", &bw);
> +	if (ret)
> +		return ret;
> +	new_opp->rate = (unsigned long) &bw;

should be bw instead

> +
> +	ret = of_property_read_u32(np, "opp-avg-KBps", &bw);
> +	if (!ret)
> +		new_opp->avg_bw = (unsigned long) &bw;

ditto

> +
> +	return 0;
> +}
> +
>   /**
>    * _opp_add_static_v2() - Allocate static OPPs (As per 'v2' DT bindings)
>    * @opp_table:	OPP table
> @@ -589,11 +618,12 @@ static struct dev_pm_opp *_opp_add_static_v2(struct opp_table *opp_table,
>   	if (!new_opp)
>   		return ERR_PTR(-ENOMEM);
>   
> -	ret = of_property_read_u64(np, "opp-hz", &rate);
> +	ret = _read_opp_key(new_opp, np);
>   	if (ret < 0) {
>   		/* "opp-hz" is optional for devices like power domains. */
>   		if (!opp_table->is_genpd) {
> -			dev_err(dev, "%s: opp-hz not found\n", __func__);
> +			dev_err(dev, "%s: opp-hz or opp-peak-bw not found\n",
> +				__func__);

please remove the else part where rate value will be reset.

>   			goto free_opp;
>   		}
>   
> diff --git a/drivers/opp/opp.h b/drivers/opp/opp.h
> index 569b3525aa67..ead2cdafe957 100644
> --- a/drivers/opp/opp.h
> +++ b/drivers/opp/opp.h
> @@ -59,7 +59,8 @@ extern struct list_head opp_tables;
>    * @turbo:	true if turbo (boost) OPP
>    * @suspend:	true if suspend OPP
>    * @pstate: Device's power domain's performance state.
> - * @rate:	Frequency in hertz
> + * @rate:	Frequency in hertz OR Peak bandwidth in kilobytes per second
> + * @avg_bw:	Average bandwidth in kilobytes per second
>    * @level:	Performance level
>    * @supplies:	Power supplies voltage/current values
>    * @clock_latency_ns: Latency (in nanoseconds) of switching to this OPP's
> @@ -81,6 +82,7 @@ struct dev_pm_opp {
>   	bool suspend;
>   	unsigned int pstate;
>   	unsigned long rate;
> +	unsigned long avg_bw;
>   	unsigned int level;
>   
>   	struct dev_pm_opp_supply *supplies;
> 

-- 
Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc, is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
