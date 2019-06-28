From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH RFC 1/4] OPP: Add and export helper to update voltage
Date: Fri, 28 Jun 2019 13:50:45 +0530
Message-ID: <a4e6bc37-9b45-16a6-f2d1-05df498f18b8@codeaurora.org>
References: <20190627133424.4980-1-sibis@codeaurora.org>
 <20190627133424.4980-2-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190627133424.4980-2-sibis@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sibi Sankar <sibis@codeaurora.org>, viresh.kumar@linaro.org, nm@ti.com, sboyd@kernel.org, georgi.djakov@linaro.org
Cc: agross@kernel.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, rjw@rjwysocki.net, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, saravanak@google.com
List-Id: devicetree@vger.kernel.org



On 6/27/2019 7:04 PM, Sibi Sankar wrote:
> Add and export 'dev_pm_opp_update_voltage' to find and update voltage
> of an opp for a given frequency. This will be useful to update the opps
> with voltages read back from firmware.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>   drivers/opp/core.c     | 52 ++++++++++++++++++++++++++++++++++++++++++
>   include/linux/pm_opp.h | 10 ++++++++
>   2 files changed, 62 insertions(+)
> 
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index 68551d6366e6b..c85c04dc2c7de 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -2197,6 +2197,58 @@ int dev_pm_opp_disable(struct device *dev, unsigned long freq)
>   }
>   EXPORT_SYMBOL_GPL(dev_pm_opp_disable);
>   
> +/**
> + * dev_pm_opp_update_voltage() - Find and update voltage
> + * @dev:	device for which we do this operation
> + * @freq:	OPP frequency to update voltage
> + * @u_volt:	voltage requested for this opp
> + *
> + * Find and update voltage of a disabled opp corresponding to the given
> + * frequency. This is useful only for devices with single power supply.
> + *
> + * Return: 0 if no modification was done OR modification was
> + * successful or a negative error value.
> + */
> +int dev_pm_opp_update_voltage(struct device *dev, unsigned long freq,
> +			      unsigned long u_volt)
> +{
> +	struct dev_pm_opp *opp = ERR_PTR(-ENODEV);
> +	struct opp_table *opp_table;
> +	unsigned long tol;
> +	int ret = 0;
> +
> +	opp = dev_pm_opp_find_freq_exact(dev, freq, false);
> +	if (IS_ERR(opp))
> +		return PTR_ERR(opp);
> +
> +	/* Find the opp_table */
> +	opp_table = _find_opp_table(dev);

maybe you should look for the opp_table first and then the
opp? otherwise this check seems pretty redundant given the
above call would have failed if the opp table did not exist.

> +	if (IS_ERR(opp_table)) {
> +		ret = PTR_ERR(opp_table);
> +		dev_err(dev, "%s: OPP table not found (%d)\n", __func__, ret);
> +		goto put_opp;
> +	}
> +
> +	mutex_lock(&opp_table->lock);
> +
> +	/* update only if the opp is disabled */
> +	if (opp->available)
> +		goto unlock;

should this throw a warning/error to indicate someone tried to
update this at a wrong time? and perhaps return an error instead of
success.

> +
> +	tol = u_volt * opp_table->voltage_tolerance_v1 / 100;
> +	opp->supplies[0].u_volt_min = u_volt - tol;
> +	opp->supplies[0].u_volt = u_volt;
> +	opp->supplies[0].u_volt_min = u_volt + tol;
> +
> +unlock:
> +	mutex_unlock(&opp_table->lock);
> +	dev_pm_opp_put_opp_table(opp_table);
> +put_opp:
> +	dev_pm_opp_put(opp);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(dev_pm_opp_update_voltage);
> +
>   /**
>    * dev_pm_opp_register_notifier() - Register OPP notifier for the device
>    * @dev:	Device for which notifier needs to be registered
> diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
> index 87fa09d93d8c2..a17c462974851 100644
> --- a/include/linux/pm_opp.h
> +++ b/include/linux/pm_opp.h
> @@ -130,6 +130,9 @@ int dev_pm_opp_enable(struct device *dev, unsigned long freq);
>   
>   int dev_pm_opp_disable(struct device *dev, unsigned long freq);
>   
> +int dev_pm_opp_update_voltage(struct device *dev, unsigned long freq,
> +			      unsigned long u_volt);
> +
>   int dev_pm_opp_register_notifier(struct device *dev, struct notifier_block *nb);
>   int dev_pm_opp_unregister_notifier(struct device *dev, struct notifier_block *nb);
>   
> @@ -261,6 +264,13 @@ static inline int dev_pm_opp_disable(struct device *dev, unsigned long freq)
>   	return 0;
>   }
>   
> +static inline int dev_pm_opp_update_voltage(struct device *dev,
> +					    unsigned long freq,
> +					    unsigned long u_volt)
> +{
> +	return 0;
> +}
> +
>   static inline int dev_pm_opp_register_notifier(struct device *dev, struct notifier_block *nb)
>   {
>   	return -ENOTSUPP;
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
