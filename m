From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] of: del redundant type conversion
Date: Wed, 10 Apr 2019 22:09:50 -0700
Message-ID: <dbb188f0-2289-6b76-2120-ce0aedb49eac@gmail.com>
References: <1554884981-20309-1-git-send-email-xiaojiangfeng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554884981-20309-1-git-send-email-xiaojiangfeng@huawei.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: xiaojiangfeng <xiaojiangfeng@huawei.com>, robh+dt@kernel.org, robh@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 4/10/19 1:29 AM, xiaojiangfeng wrote:
> The type of variable l in early_init_dt_scan_chosen is
> int, there is no need to convert to int.
> 
> Signed-off-by: xiaojiangfeng <xiaojiangfeng@huawei.com>
> ---
>  drivers/of/fdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 4734223..de893c9 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -1091,7 +1091,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>  	/* Retrieve command line */
>  	p = of_get_flat_dt_prop(node, "bootargs", &l);
>  	if (p != NULL && l > 0)
> -		strlcpy(data, p, min((int)l, COMMAND_LINE_SIZE));
> +		strlcpy(data, p, min(l, COMMAND_LINE_SIZE));
>  
>  	/*
>  	 * CONFIG_CMDLINE is meant to be a default in case nothing else
> 

My first reply to this patch asked for a sparse warning on this line to
also be fixed.  After xiaojiangfeng followed up with a different patch
to try to resolve the issues with this line of code, I see that the
sparse warning was not caused by my first conjecture and this patch
is the correct one to apply.

I will pursue the cause of the sparse warning myself separately.


Reviewed-by: Frank Rowand <frank.rowand@sony.com>
