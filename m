From: Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/3 v8] ARC: Set IO-coherency aperture base to
 LINUX_LINK_BASE
Date: Tue, 22 Aug 2017 14:44:20 -0700
Message-ID: <5184d3eb-31bc-c456-3e65-6137a3ba72f7@synopsys.com>
References: <20170712094023.23226-1-Eugeniy.Paltsev@synopsys.com>
 <20170712094023.23226-2-Eugeniy.Paltsev@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170712094023.23226-2-Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/12/2017 02:40 AM, Eugeniy Paltsev wrote:
> Most of the time we indeed use the one and only LINUX_LINK_BASE
> set to 0x8000_0000. But there might be good reasons to move
> the kernel to another location like 0x9z etc.
> And we want IOC aperture to cover entire area used by the kernel,
> so let's make its base matching link base

How about something below....

Currently IOC aperture base is hardcoded to 0x8000_0000 which may not be true for 
non default values of CONFIG_LINUX_LINK_BASE, so use the config value

> and add required asserts:
> checking IOC aperture base address and size to be supported by IOC.

.... And while at it, also add the required asserts expected by the IOC 
programming model.

> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> ---
>   arch/arc/mm/cache.c | 33 ++++++++++++++++++++++++---------
>   1 file changed, 24 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
> index a867575..383ff77 100644
> --- a/arch/arc/mm/cache.c
> +++ b/arch/arc/mm/cache.c
> @@ -1083,7 +1083,8 @@ SYSCALL_DEFINE3(cacheflush, uint32_t, start, uint32_t, sz, uint32_t, flags)
>    */
>   noinline void __init arc_ioc_setup(void)
>   {
> -	unsigned int ap_sz;
> +	unsigned int ap_base;
> +	long ap_size;

Is there a reason they are different types ?
Also the way you use it below, best to call it mem_size !

>   
>   	/* Flush + invalidate + disable L1 dcache */
>   	__dc_disable();
> @@ -1092,18 +1093,32 @@ noinline void __init arc_ioc_setup(void)
>   	if (read_aux_reg(ARC_REG_SLC_BCR))
>   		slc_entire_op(OP_FLUSH_N_INV);
>   
> -	/* IOC Aperture start: TDB: handle non default CONFIG_LINUX_LINK_BASE */
> -	write_aux_reg(ARC_REG_IO_COH_AP0_BASE, 0x80000);
> -
>   	/*
> -	 * IOC Aperture size:
> -	 *   decoded as 2 ^ (SIZE + 2) KB: so setting 0x11 implies 512M
> -	 * TBD: fix for PGU + 1GB of low mem
> +	 * IOC Aperture size is equal to memory size.
> +	 * TBD: fix for PGU + 1GiB of low mem

Not really averse to this per-se, but conventionally we've not used KiB or GiB 
etc, so I'd prefer KB, GB... just for consistency and ability to grep correctly.

>   	 * TBD: fix for PAE
>   	 */
> -	ap_sz = order_base_2(arc_get_mem_sz()/1024) - 2;
> -	write_aux_reg(ARC_REG_IO_COH_AP0_SIZE, ap_sz);

> +	ap_size = arc_get_mem_sz();
> +
> +	if (!is_power_of_2(ap_size) || ap_size < 4096)
> +		panic("IOC Aperture size must be power of 2 larger than 4KiB");
> +
> +	/*
> +	 * IOC Aperture size decoded as 2 ^ (SIZE + 2) KiB,
> +	 * so setting 0x11 implies 512MiB, 0x12 implies 1G...
> +	 */
> +	write_aux_reg(ARC_REG_IO_COH_AP0_SIZE, order_base_2(ap_size / 1024) - 2);

for (ap_size / 1024) can you use (ap_size >> 10)

> +
> +	/*
> +	 * For now we assume IOC aperture to cover all the memory used by the
> +	 * kernel.
> +	 */
> +	ap_base = CONFIG_LINUX_LINK_BASE;
> +
> +	if (ap_base % ap_size != 0)
> +		panic("IOC Aperture start must be aligned to the size of the aperture");

This is good.

>   
> +	write_aux_reg(ARC_REG_IO_COH_AP0_BASE, ap_base >> 12);
>   	write_aux_reg(ARC_REG_IO_COH_PARTIAL, 1);
>   	write_aux_reg(ARC_REG_IO_COH_ENABLE, 1);
>   
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
