From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: check for size < 0 after rounding in
 early_init_dt_add_memory_arch
Date: Tue, 04 Nov 2014 16:16:37 +0000
Message-ID: <20141104161637.7AFCEC423D0@trevor.secretlab.ca>
References: <1414598972-22761-1-git-send-email-ard.biesheuvel@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414598972-22761-1-git-send-email-ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 29 Oct 2014 17:09:32 +0100
, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
 wrote:
> Memory regions passed to early_init_dt_add_memory_arch() are rounded to
> PAGE_SIZE by subtracting the size of the leading fractional page from
> the 'size' argument. However, size being a u64 type, if its value is
> sufficiently small, the subtraction wraps around and produces a bogus
> value, potentially leading to crashes.
> 
> Fix this by ignoring the memory range in such cases.
> 
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Applied, thanks.

g.

> ---
>  drivers/of/fdt.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index d1ffca8b34ea..3b423f5b99c6 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -930,6 +930,11 @@ void __init __weak early_init_dt_add_memory_arch(u64 base, u64 size)
>  	const u64 phys_offset = __pa(PAGE_OFFSET);
>  
>  	if (!PAGE_ALIGNED(base)) {
> +		if (size < PAGE_SIZE - (base & ~PAGE_MASK)) {
> +			pr_warn("Ignoring memory block 0x%llx - 0x%llx\n",
> +				base, base + size);
> +			return;
> +		}
>  		size -= PAGE_SIZE - (base & ~PAGE_MASK);
>  		base = PAGE_ALIGN(base);
>  	}
> -- 
> 1.8.3.2
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
