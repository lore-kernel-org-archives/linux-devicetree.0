From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [RFC PATCH v2 1/9] arm: avoid using on_each_cpu hard coded ret
	value
Date: Sun, 8 Jan 2012 16:12:12 +0000
Message-ID: <20120108161212.GD21765@n2100.arm.linux.org.uk>
References: <1326029549-2794-1-git-send-email-gilad@benyossef.com> <1326029549-2794-2-git-send-email-gilad@benyossef.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1326029549-2794-2-git-send-email-gilad@benyossef.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gilad Ben-Yossef <gilad@benyossef.com>
Cc: linux-kernel@vger.kernel.org, Will Deacon <will.deacon@arm.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@elte.hu>, Arnaldo Carvalho de Melo <acme@ghostprotocols.net>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Sun, Jan 08, 2012 at 03:32:21PM +0200, Gilad Ben-Yossef wrote:
> on_each_cpu always returns a hard coded return code of zero.
> 
> Removing all tests based on this return value saves run time
> cycles for compares and code bloat for branches.
> 
> Signed-off-by: Gilad Ben-Yossef <gilad@benyossef.com>
> Acked-by: Peter Zijlstra <a.p.zijlstra@chello.nl>
> Reviewed-by: Michal Nazarewicz <mina86@mina86.com>
> CC: Will Deacon <will.deacon@arm.com>
> CC: Peter Zijlstra <a.p.zijlstra@chello.nl>
> CC: Paul Mackerras <paulus@samba.org>
> CC: Ingo Molnar <mingo@elte.hu>
> CC: Arnaldo Carvalho de Melo <acme@ghostprotocols.net>
> CC: Russell King <linux@arm.linux.org.uk>

Reviewed-by: Russell King <rmk+kernel@arm.linux.org.uk>

> CC: Grant Likely <grant.likely@secretlab.ca>
> CC: Rob Herring <rob.herring@calxeda.com>
> CC: linux-arm-kernel@lists.infradead.org
> CC: devicetree-discuss@lists.ozlabs.org
> ---
>  arch/arm/kernel/perf_event.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/kernel/perf_event.c b/arch/arm/kernel/perf_event.c
> index 5bb91bf..6e9acb7 100644
> --- a/arch/arm/kernel/perf_event.c
> +++ b/arch/arm/kernel/perf_event.c
> @@ -616,7 +616,7 @@ static int __init
>  cpu_pmu_reset(void)
>  {
>  	if (cpu_pmu && cpu_pmu->reset)
> -		return on_each_cpu(cpu_pmu->reset, NULL, 1);
> +		on_each_cpu(cpu_pmu->reset, NULL, 1);

There's not much to review here...

Thanks.

>  	return 0;
>  }
>  arch_initcall(cpu_pmu_reset);
> -- 
> 1.7.0.4
> 
