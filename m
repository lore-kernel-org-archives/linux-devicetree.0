From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: fix of_property_read_string
Date: Tue, 7 Apr 2015 10:31:24 -0500
Message-ID: <CAL_JsqLpD8UXoHZ-KF74LaN5HEvu3bpu6aeO9_SOHYrut0nV_Q@mail.gmail.com>
References: <1428401462-5907-1-git-send-email-Shengzhou.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428401462-5907-1-git-send-email-Shengzhou.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shengzhou Liu <Shengzhou.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 7, 2015 at 5:11 AM, Shengzhou Liu
<Shengzhou.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> In of_property_read_string function, strnlen(prop->value, prop->length)
> is always less or equal to prop->length, and we should allow the '=='
> condition, so let's remove the original unreasonable condition.

I believe we don't want to allow equal because prop->length should
include the \0 termination while strnlen will not.

Rob

> Signed-off-by: Shengzhou Liu <Shengzhou.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  drivers/of/base.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index adb8764..742ff97 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -1335,8 +1335,6 @@ int of_property_read_string(struct device_node *np, const char *propname,
>                 return -EINVAL;
>         if (!prop->value)
>                 return -ENODATA;
> -       if (strnlen(prop->value, prop->length) >= prop->length)
> -               return -EILSEQ;
>         *out_string = prop->value;
>         return 0;
>  }
> --
> 2.1.0.27.g96db324
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
