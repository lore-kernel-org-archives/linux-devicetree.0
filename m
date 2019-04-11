From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] of: fix expression using sizeof(void)
Date: Wed, 10 Apr 2019 22:06:59 -0700
Message-ID: <d15a80a2-4a32-4475-3044-33b8e8696405@gmail.com>
References: <1554947255-80031-1-git-send-email-xiaojiangfeng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554947255-80031-1-git-send-email-xiaojiangfeng@huawei.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: xiaojiangfeng <xiaojiangfeng@huawei.com>, robh+dt@kernel.org, robh@kernel.org, grant.likely@secretlab.ca
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 4/10/19 6:47 PM, xiaojiangfeng wrote:
> problem detected by sparse:
> drivers/of/fdt.c:1094:34: warning: expression using sizeof(void)
> 
> Signed-off-by: xiaojiangfeng <xiaojiangfeng@huawei.com>
> ---
>  drivers/of/fdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 4734223..75c6c55 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -1091,7 +1091,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>  	/* Retrieve command line */
>  	p = of_get_flat_dt_prop(node, "bootargs", &l);
>  	if (p != NULL && l > 0)
> -		strlcpy(data, p, min((int)l, COMMAND_LINE_SIZE));
> +		strlcpy(data, p, COMMAND_LINE_SIZE);
>  
>  	/*
>  	 * CONFIG_CMDLINE is meant to be a default in case nothing else
> 

The fuller discussion is in the thread where you first attempted to fix an
issue with the line of code and I reported a sparse error against this line.

After digging deeper, your first patch is valid, removing min() here is not
the correct approach.  I will add my Reviewed-by to the first patch and I
will pursue the sparse warning separately.

Thanks,

Frank
