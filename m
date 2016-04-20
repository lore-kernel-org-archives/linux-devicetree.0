From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH] arm64: spin-table: add missing of_node_put()
Date: Wed, 20 Apr 2016 10:17:55 +0100
Message-ID: <20160420091755.GC30601@arm.com>
References: <1461115411-2843-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1461115411-2843-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Hanjun Guo <hanjun.guo@linaro.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>, Catalin Marinas <catalin.marinas@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 20, 2016 at 10:23:31AM +0900, Masahiro Yamada wrote:
> Since of_get_cpu_node() increments refcount, the node should be put.

Urgh, I really hate the dt refcounting stuff.

> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  arch/arm64/kernel/smp_spin_table.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kernel/smp_spin_table.c b/arch/arm64/kernel/smp_spin_table.c
> index aef3605..18a71bc 100644
> --- a/arch/arm64/kernel/smp_spin_table.c
> +++ b/arch/arm64/kernel/smp_spin_table.c
> @@ -52,6 +52,7 @@ static void write_pen_release(u64 val)
>  static int smp_spin_table_cpu_init(unsigned int cpu)
>  {
>  	struct device_node *dn;
> +	int ret;
>  
>  	dn = of_get_cpu_node(cpu, NULL);
>  	if (!dn)
> @@ -60,15 +61,15 @@ static int smp_spin_table_cpu_init(unsigned int cpu)
>  	/*
>  	 * Determine the address from which the CPU is polling.
>  	 */
> -	if (of_property_read_u64(dn, "cpu-release-addr",
> -				 &cpu_release_addr[cpu])) {
> +	ret = of_property_read_u64(dn, "cpu-release-addr",
> +				   &cpu_release_addr[cpu]);
> +	if (ret)
>  		pr_err("CPU %d: missing or invalid cpu-release-addr property\n",
>  		       cpu);
>  
> -		return -1;
> -	}
> +	of_node_put(dn);
>  
> -	return 0;
> +	return ret;


Looks ok to me. The slight change in return code should be harmless for
->cpu_init.

Acked-by: Will Deacon <will.deacon@arm.com>

Will
