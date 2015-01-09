From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v3 4/8] clk: Add clock driver for mb86s7x
Date: Fri, 9 Jan 2015 12:39:58 +0000
Message-ID: <20150109123958.GJ12302@n2100.arm.linux.org.uk>
References: <1420802369-3840-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
 <1420802977-4126-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1420802977-4126-1-git-send-email-Vincent.Yang-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vincent Yang <vincent.yang.fujitsu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Vincent Yang <Vincent.Yang-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org>, Tetsuya Nuriya <nuriya.tetsuya-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 09, 2015 at 07:29:37PM +0800, Vincent Yang wrote:
> +static int mb86s7x_clclk_of_init(void)
> +{
> +	int cpu;
> +	struct clk *clk;
> +
> +	for_each_possible_cpu(cpu) {
> +		struct device *cpu_dev = get_cpu_device(cpu);
> +
> +		if (!cpu_dev) {
> +			pr_err("failed to get cpu%d device\n", cpu);
> +			continue;
> +		}
> +
> +		clk = mb86s7x_clclk_register(cpu_dev);
> +		if (IS_ERR(clk)) {
> +			pr_err("failed to register cpu%d clock\n", cpu);
> +			continue;
> +		}
> +		if (clk_register_clkdev(clk, NULL, dev_name(cpu_dev))) {
> +			pr_err("failed to register cpu%d clock lookup\n", cpu);
> +			continue;
> +		}
> +		pr_debug("registered clk for %s\n", dev_name(cpu_dev));
> +	}
> +
> +	platform_device_register_simple("arm-bL-cpufreq-dt", -1, NULL, 0);
> +
> +	return 0;
> +}
> +module_init(mb86s7x_clclk_of_init);

What is the effect of this initialising on platforms which are not
a "mb86s7x" ?

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
