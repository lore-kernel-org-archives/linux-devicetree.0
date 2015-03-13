From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH -next] of/platform: Fix sparc:allmodconfig build
Date: Fri, 13 Mar 2015 10:24:04 -0500
Message-ID: <CAL_JsqJ3=t48rES=BKzHigXTE4LiiuRzVQoC2aonPH6XS4acqg@mail.gmail.com>
References: <1426044664-8174-1-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426044664-8174-1-git-send-email-linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 10, 2015 at 10:31 PM, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
> sparc:allmodconfig fails to build with:
>
> drivers/built-in.o: In function `platform_bus_init':
> (.init.text+0x3684): undefined reference to `of_platform_register_reconfig_notifier'
>
> of_platform_register_reconfig_notifier is only declared if both OF_ADDRESS
> and OF_DYNAMIC are configured. Yet, the include file only declares a dummy
> function if OF_DYNAMIC is not configured. The sparc architecture does not
> configure OF_ADDRESS, but does configure OF_DYNAMIC, causing above error.
>
> Fixes: 801d728c10db ("of/reconfig: Add OF_DYNAMIC notifier for platform_bus_type")
> Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

Applied for 4.0. Thanks.

Rob

> ---
>  include/linux/of_platform.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/of_platform.h b/include/linux/of_platform.h
> index 8a860f0..611a691 100644
> --- a/include/linux/of_platform.h
> +++ b/include/linux/of_platform.h
> @@ -84,7 +84,7 @@ static inline int of_platform_populate(struct device_node *root,
>  static inline void of_platform_depopulate(struct device *parent) { }
>  #endif
>
> -#ifdef CONFIG_OF_DYNAMIC
> +#if defined(CONFIG_OF_DYNAMIC) && defined(CONFIG_OF_ADDRESS)
>  extern void of_platform_register_reconfig_notifier(void);
>  #else
>  static inline void of_platform_register_reconfig_notifier(void) { }
> --
> 2.1.0
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
