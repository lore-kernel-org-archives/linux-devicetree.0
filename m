From: Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH v5 4/9] coresight: refactor with function
 of_coresight_get_cpu
Date: Fri, 31 Mar 2017 10:05:37 +0100
Message-ID: <8f45279c-5768-9a56-3c6d-3ecfd63f4b18@arm.com>
References: <1490466197-29163-1-git-send-email-leo.yan@linaro.org>
 <1490466197-29163-5-git-send-email-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1490466197-29163-5-git-send-email-leo.yan@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Leo Yan <leo.yan@linaro.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wei Xu <xuwei5@hisilicon.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Guodong Xu <guodong.xu@linaro.org>, John Stultz <john.stultz@linaro.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, mike.leach@linaro.org, sudeep.ho
List-Id: devicetree@vger.kernel.org

On 25/03/17 18:23, Leo Yan wrote:
> This is refactor to add function of_coresight_get_cpu(), so it's used to
> retrieve CPU id for coresight component. Finally can use it as a common
> function for multiple places.
>
> Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> -		if (found)
> -			break;
> -	}
> -	of_node_put(dn);
> -
> -	/* Affinity to CPU0 if no cpu nodes are found */
> -	pdata->cpu = found ? cpu : 0;
> +	pdata->cpu = of_coresight_get_cpu(node);
>
>  	return pdata;
>  }
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 2a5982c..bf96678 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -263,9 +263,11 @@ static inline int coresight_timeout(void __iomem *addr, u32 offset,
>  #endif
>
>  #ifdef CONFIG_OF
> +extern int of_coresight_get_cpu(struct device_node *node);
>  extern struct coresight_platform_data *of_get_coresight_platform_data(
>  				struct device *dev, struct device_node *node);
>  #else
> +static inline int of_coresight_get_cpu(struct device_node *node) { return 0; }
>  static inline struct coresight_platform_data *of_get_coresight_platform_data(
>  	struct device *dev, struct device_node *node) { return NULL; }
>  #endif
>
