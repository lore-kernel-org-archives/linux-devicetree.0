From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Fixing OF Selftest build error
Date: Sun, 27 Jul 2014 08:35:15 -0600
Message-ID: <20140727143515.1D2D3C40603@trevor.secretlab.ca>
References: <1406343458-24746-1-git-send-email-gaurav.minocha.os@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406343458-24746-1-git-send-email-gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 25 Jul 2014 19:57:38 -0700, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> This patch is to fix following error while compiling OF selftests.
> "drivers/of/selftest.c:617:2: error: implicit declaration of function
> 'of_fdt_unflatten_tree'"
> 
> Now, it selects OF_FLATTREE config symbol if OF_SELFTEST is
> enabled.
> 
> Signed-off-by: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Applied, thanks.

g.

> ---
>  drivers/of/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> index 4e4f6f3..d559752 100644
> --- a/drivers/of/Kconfig
> +++ b/drivers/of/Kconfig
> @@ -11,6 +11,7 @@ config OF_SELFTEST
>  	tristate "Device Tree Runtime self tests"
>  	depends on OF_IRQ
>  	select OF_DYNAMIC
> +	select OF_FLATTREE
>  	help
>  	  This option builds in test cases for the device tree infrastructure
>  	  that are executed once at boot time, and the results dumped to the
> -- 
> 1.7.9.5
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
