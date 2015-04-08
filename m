From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] of/flattree: print memory scan node results in CPU endian
Date: Wed, 08 Apr 2015 14:19:09 -0700
Message-ID: <55259B4D.2020304@gmail.com>
References: <1428475450-12072-1-git-send-email-f.fainelli@gmail.com>
Reply-To: frowand.list@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1428475450-12072-1-git-send-email-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, grant.likely@linaro.org
List-Id: devicetree@vger.kernel.org

On 4/7/2015 11:44 PM, Florian Fainelli wrote:
> Commit 51975db0b7333 ("of/flattree: merge early_init_dt_scan_memory()
> common code") consolidated some code from PowerPC (typically
> big-endian), and ended-up adding a pr_debug() printing reg properties in
> big-endian (DT native) format, not CPU endian. Unsurprisingly, when
> these messages are turned on a little-endian systems, this is confusing,
> so do the conversion while printing the values.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  drivers/of/fdt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 3a896c9aeb74..0d8f0e4bd107 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -880,7 +880,8 @@ int __init early_init_dt_scan_memory(unsigned long node, const char *uname,
>  	endp = reg + (l / sizeof(__be32));
>  
>  	pr_debug("memory scan node %s, reg size %d, data: %x %x %x %x,\n",
> -	    uname, l, reg[0], reg[1], reg[2], reg[3]);
> +	    uname, l, be32_to_cpu(reg[0]), be32_to_cpu(reg[1]),
> +	    be32_to_cpu(reg[2]), be32_to_cpu(reg[3]));

The pr_debug() assumes that the length of reg[] is >= 4 elements, which might not be true.
Since the following while loop checks the length of reg[] and then uses pr_debug() to
print each (base, size) tuple with the correct endian, maybe it would be better to
just remove reg[0] through reg[3] from the above pr_debug() instead of fixing the
endian issue.

>  
>  	while ((endp - reg) >= (dt_root_addr_cells + dt_root_size_cells)) {
>  		u64 base, size;
> 

-Frank
