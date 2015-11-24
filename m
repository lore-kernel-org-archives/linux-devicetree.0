From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq: qoriq: Register cooling device based on device
 tree
Date: Tue, 24 Nov 2015 12:41:21 +0530
Message-ID: <20151124071121.GM5258@ubuntu>
References: <1448348129-46675-1-git-send-email-hongtao.jia@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1448348129-46675-1-git-send-email-hongtao.jia@freescale.com>
Sender: linux-pm-owner@vger.kernel.org
To: Jia Hongtao <hongtao.jia@freescale.com>
Cc: edubezval@gmail.com, linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, scottwood@freescale.com
List-Id: devicetree@vger.kernel.org

On 24-11-15, 14:55, Jia Hongtao wrote:
> +	/* Register CPU cooling device for QorIQ platform */
> +	for_each_node_with_property(cpu_np, "#cooling-cells") {
> +		of_property_read_u32(cpu_np, "reg", &cpu_id);
> +		cpufreq_get_policy(&cpu_policy, cpu_id);

That's not the right way to do it. You already have DT node for the
CPU, look at how it is done from ->ready() callback for cpufreq-dt.

-- 
viresh
