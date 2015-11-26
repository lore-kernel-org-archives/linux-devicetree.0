From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V2] cpufreq: qoriq: Register cooling device based on
 device tree
Date: Thu, 26 Nov 2015 14:38:05 +0530
Message-ID: <20151126090805.GJ3869@ubuntu>
References: <1448519249-11449-1-git-send-email-hongtao.jia@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1448519249-11449-1-git-send-email-hongtao.jia@freescale.com>
Sender: linux-pm-owner@vger.kernel.org
To: Jia Hongtao <hongtao.jia@freescale.com>
Cc: edubezval@gmail.com, linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, scottwood@freescale.com
List-Id: devicetree@vger.kernel.org

On 26-11-15, 14:27, Jia Hongtao wrote:
> +static void qoriq_cpufreq_ready(struct cpufreq_policy *policy)
> +{
> +	struct cpu_data *cpud = policy->driver_data;
> +	struct device_node *np = of_get_cpu_node(policy->cpu, NULL);
> +
> +	if (WARN_ON(!np))
> +		return;

Drop this and add my:

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
