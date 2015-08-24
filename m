From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of/platform: add function to populate default bus
Date: Mon, 24 Aug 2015 10:16:56 -0500
Message-ID: <CAL_JsqLkFmZxBxndEUogBCJj1ffFrJMyaY838z0K7VqnfWtNxg@mail.gmail.com>
References: <1438537483-26414-1-git-send-email-hauke@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438537483-26414-1-git-send-email-hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Aug 2, 2015 at 12:44 PM, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org> wrote:
> When a default bus like the simple-bus should be used someone had to
> call of_platform_populate() with the default match table. This match
> table was not exported, so it is impossible for code build as a module
> to use this. Instead of exporting of_default_bus_match_table, add a new
> function which uses this default match table and populates the bus.
>
> Signed-off-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>

Applied. Thanks.

Rob

> ---
>  drivers/of/platform.c       | 9 +++++++++
>  include/linux/of_platform.h | 9 +++++++++
>  2 files changed, 18 insertions(+)
>
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index ddf8e42..918f01f 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -456,6 +456,15 @@ int of_platform_populate(struct device_node *root,
>  }
>  EXPORT_SYMBOL_GPL(of_platform_populate);
>
> +int of_platform_default_populate(struct device_node *root,
> +                                const struct of_dev_auxdata *lookup,
> +                                struct device *parent)
> +{
> +       return of_platform_populate(root, of_default_bus_match_table, lookup,
> +                                   parent);
> +}
> +EXPORT_SYMBOL_GPL(of_platform_default_populate);
> +
>  static int of_platform_device_destroy(struct device *dev, void *data)
>  {
>         /* Do not touch devices not populated from the device tree */
> diff --git a/include/linux/of_platform.h b/include/linux/of_platform.h
> index 611a691..956a100 100644
> --- a/include/linux/of_platform.h
> +++ b/include/linux/of_platform.h
> @@ -72,6 +72,9 @@ extern int of_platform_populate(struct device_node *root,
>                                 const struct of_device_id *matches,
>                                 const struct of_dev_auxdata *lookup,
>                                 struct device *parent);
> +extern int of_platform_default_populate(struct device_node *root,
> +                                       const struct of_dev_auxdata *lookup,
> +                                       struct device *parent);
>  extern void of_platform_depopulate(struct device *parent);
>  #else
>  static inline int of_platform_populate(struct device_node *root,
> @@ -81,6 +84,12 @@ static inline int of_platform_populate(struct device_node *root,
>  {
>         return -ENODEV;
>  }
> +static inline int of_platform_default_populate(struct device_node *root,
> +                                              const struct of_dev_auxdata *lookup,
> +                                              struct device *parent)
> +{
> +       return -ENODEV;
> +}
>  static inline void of_platform_depopulate(struct device *parent) { }
>  #endif
>
> --
> 2.1.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
