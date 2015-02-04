From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] of: EXPORT_SYMBOL_GPL of_property_read_u64_array
Date: Tue, 3 Feb 2015 20:34:28 -0600
Message-ID: <CAL_JsqLSfL9HXbd=6rqB0WwSbWXmFbzgQHtx8EzSxs5o11=kSg@mail.gmail.com>
References: <1422354395-29473-1-git-send-email-sakari.ailus@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422354395-29473-1-git-send-email-sakari.ailus-X3B1VOXEql0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 27, 2015 at 4:26 AM, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org> wrote:
> Make of_property_read_u64_array() available for modules as well. This was
> missing from the patch which originally added the function.
>
> Signed-off-by: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>

Applied. Thanks.

> ---
>  drivers/of/base.c |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 36536b6..0a8aeb8 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -1303,6 +1303,7 @@ int of_property_read_u64_array(const struct device_node *np,
>         }
>         return 0;
>  }
> +EXPORT_SYMBOL_GPL(of_property_read_u64_array);
>
>  /**
>   * of_property_read_string - Find and read a string from a property
> --
> 1.7.10.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
