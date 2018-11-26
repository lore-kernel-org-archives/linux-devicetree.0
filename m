From: Quentin Perret <quentin.perret@arm.com>
Subject: Re: [PATCH V4 2/2] base/drivers/arch_topology: Default dmips-mhz if
 they are not set in DT
Date: Mon, 26 Nov 2018 12:48:23 +0000
Message-ID: <20181126124821.hcagb4ai7z6qldr3@queper01-lin>
References: <1543234847-21611-1-git-send-email-daniel.lezcano@linaro.org>
 <1543234847-21611-2-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1543234847-21611-2-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: rjw@rjwysocki.net, linux-kernel@vger.kernel.org, viresh.kumar@linaro.org, Chris Redpath <chris.redpath@linaro.org>, Quentin Perret <quentin.perret@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, Nicolas Dechesne <nicolas.dechesne@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Li Yang <leoyang.li@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Monday 26 Nov 2018 at 13:20:43 (+0100), Daniel Lezcano wrote:
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index fd5325b..e0c5b60 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -243,9 +243,20 @@ static int __init register_cpufreq_notifier(void)
>  	 * until we have the necessary code to parse the cpu capacity, so
>  	 * skip registering cpufreq notifier.
>  	 */
> -	if (!acpi_disabled || !raw_capacity)
> +	if (!acpi_disabled)
>  		return -EINVAL;
>  
> +	if (!raw_capacity) {
> +
> +		pr_info("cpu_capacity: No capacity defined in DT, set default "
> +		       "values to %ld\n", SCHED_CAPACITY_SCALE);
> +
> +		raw_capacity = kmalloc_array(num_possible_cpus(),
> +					     sizeof(*raw_capacity), GFP_KERNEL);
> +		if (!raw_capacity)
> +			return -ENOMEM;
> +	}
> +
>  	if (!alloc_cpumask_var(&cpus_to_visit, GFP_KERNEL)) {
>  		pr_err("cpu_capacity: failed to allocate memory for cpus_to_visit\n");
>  		return -ENOMEM;

I just tried on my Juno by removing the capacity-dmips-mhz values from
the DT and got the following:

  $ cat /sys/devices/system/cpu/cpufreq/policy*/scaling_available_frequencies
  450000 575000 700000 775000 850000
  450000 625000 800000 950000 1100000
  $ cat /sys/devices/system/cpu/cpu*/cpu_capacity
  791
  1024
  1024
  791
  791
  791

Same thing with a partially-filled DT (which is the expected behaviour
now). So feel free to add:

Tested-by: Quentin Perret <quentin.perret@arm.com>

Thanks,
Quentin
