From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] dt: disable self-tests for !OF_IRQ
Date: Fri, 08 Nov 2013 14:09:23 +0000
Message-ID: <20131108140923.544A6C421A8@trevor.secretlab.ca>
References: <1383848149-15488-1-git-send-email-robherring2@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383848149-15488-1-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu,  7 Nov 2013 12:15:48 -0600, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> 
> Fix OF selftest compile on sparc which does not enable OF_IRQ.
> 
> drivers/of/selftest.c:177: undefined reference to `of_irq_parse_one'
> drivers/of/selftest.c:197: undefined reference to `of_irq_parse_one'
> drivers/of/selftest.c:248: undefined reference to `of_irq_parse_one'
> 
> Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

Acked-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

g.


> ---
>  drivers/of/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> index 9d2009a..9b28f8b 100644
> --- a/drivers/of/Kconfig
> +++ b/drivers/of/Kconfig
> @@ -17,6 +17,7 @@ config PROC_DEVICETREE
>  
>  config OF_SELFTEST
>  	bool "Device Tree Runtime self tests"
> +	depends on OF_IRQ
>  	help
>  	  This option builds in test cases for the device tree infrastructure
>  	  that are executed one at boot time, and the results dumped to the
> -- 
> 1.8.1.2
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
