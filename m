From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] of: del redundant type conversion
Date: Wed, 10 Apr 2019 11:50:28 -0700
Message-ID: <8835e19b-e63b-41c9-7c87-1d68a130a319@gmail.com>
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

Thanks for catching the redundant cast.

There is a second problem detected by sparse on that line:

  drivers/of/fdt.c:1094:34: warning: expression using sizeof(void)

Can you please fix both issues?

Thanks,

Frank
