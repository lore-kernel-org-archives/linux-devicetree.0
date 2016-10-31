From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v3 2/3] clocksource: update "fn" at CLOCKSOURCE_OF_DECLARE()
 of nps400 timer
Date: Mon, 31 Oct 2016 11:39:32 -0600 (MDT)
Message-ID: <alpine.DEB.2.20.1610311137290.8160@nanos>
References: <1477899468-5494-1-git-send-email-noamca@mellanox.com> <1477899468-5494-3-git-send-email-noamca@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477899468-5494-3-git-send-email-noamca@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Noam Camus <noamca@mellanox.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, daniel.lezcano@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 31 Oct 2016, Noam Camus wrote:
>  
>  static unsigned long nps_timer_rate;
> +static int nps_get_timer_clk(struct device_node *node,

Please don't glue variables and functions together w/o a new line. That's
horrible to read.

> +static int __init nps_setup_clocksource(struct device_node *node)
>  {
>  	int ret, cluster;
> +	struct clk *clk;
>  
>  	for (cluster = 0; cluster < NPS_CLUSTER_NUM; cluster++)
>  		nps_msu_reg_low_addr[cluster] =
>  			nps_host_reg((cluster << NPS_CLUSTER_OFFSET),
>  				 NPS_MSU_BLKID, NPS_MSU_TICK_LOW);
>  
> -	ret = clk_prepare_enable(clk);
> -	if (ret) {
> -		pr_err("Couldn't enable parent clock\n");
> -		return ret;
> -	}
> -
> -	nps_timer_rate = clk_get_rate(clk);
> +	nps_get_timer_clk(node, &nps_timer_rate, clk);

Why are you ignoring the return code? It was handled before your change ...

Thanks,

	tglx
