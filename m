From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH v4 2/3] OPP: Add support for bandwidth OPP tables
Date: Wed, 7 Aug 2019 15:53:53 +0300
Message-ID: <fc8e4a77-5544-0dd7-f103-147f87e44a28@linaro.org>
References: <20190726231558.175130-1-saravanak@google.com>
 <20190726231558.175130-3-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190726231558.175130-3-saravanak@google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Saravana Kannan <saravanak@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: vincent.guittot@linaro.org, seansw@qti.qualcomm.com, daidavid1@codeaurora.org, adharmap@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>, sibis@codeaurora.org, bjorn.andersson@linaro.org, evgreen@chromium.org, kernel-team@android.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Saravana,

On 7/27/19 02:15, Saravana Kannan wrote:
> Not all devices quantify their performance points in terms of frequency.
> Devices like interconnects quantify their performance points in terms of
> bandwidth. We need a way to represent these bandwidth levels in OPP. So,
> add support for parsing bandwidth OPPs from DT.
> 
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  drivers/opp/of.c  | 41 ++++++++++++++++++++++++++++++++---------
>  drivers/opp/opp.h |  4 +++-
>  2 files changed, 35 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/opp/of.c b/drivers/opp/of.c
> index b313aca9894f..ac73512f4416 100644
> --- a/drivers/opp/of.c
> +++ b/drivers/opp/of.c
> @@ -523,6 +523,35 @@ void dev_pm_opp_of_remove_table(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(dev_pm_opp_of_remove_table);
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
> +		new_opp->rate = (unsigned long)rate;
> +		return 0;

So we can't have a single OPP table with both frequency and bandwidth?

> +	}
> +
> +	ret = of_property_read_u32(np, "opp-peak-KBps", &bw);
> +	if (ret)
> +		return ret;
> +	new_opp->rate = (unsigned long) bw;
> +
> +	ret = of_property_read_u32(np, "opp-avg-KBps", &bw);
> +	if (!ret)
> +		new_opp->avg_bw = (unsigned long) bw;
> +
> +	return 0;
> +}
> +
>  /**
>   * _opp_add_static_v2() - Allocate static OPPs (As per 'v2' DT bindings)
>   * @opp_table:	OPP table
> @@ -560,22 +589,16 @@ static struct dev_pm_opp *_opp_add_static_v2(struct opp_table *opp_table,
>  	if (!new_opp)
>  		return ERR_PTR(-ENOMEM);
>  
> -	ret = of_property_read_u64(np, "opp-hz", &rate);
> +	ret = _read_opp_key(new_opp, np);
>  	if (ret < 0) {
>  		/* "opp-hz" is optional for devices like power domains. */
>  		if (!opp_table->is_genpd) {
> -			dev_err(dev, "%s: opp-hz not found\n", __func__);
> +			dev_err(dev, "%s: opp-hz or opp-peak-bw not found\n",

s/opp-peak-bw/opp-peak-kBps/

Thanks,
Georgi
