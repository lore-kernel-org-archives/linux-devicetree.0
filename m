MIME-Version: 1.0
In-Reply-To: <20160812001808.65199-1-s-anna@ti.com>
References: <20160812001808.65199-1-s-anna@ti.com>
Date: Tue, 16 Aug 2016 10:44:37 -0500
Message-ID: <CAL_JsqKxGXvgJbc0jQzWK2dO_RGXVhTqLxS=337s3hWjXb8qvw@mail.gmail.com>
Subject: Re: [PATCH] of: Export of_{add/remove/update}_property() API
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset=UTF-8
To: Suman Anna <s-anna@ti.com>
Cc: Frank Rowand <frowand.list@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On Thu, Aug 11, 2016 at 7:18 PM, Suman Anna <s-anna@ti.com> wrote:
> The of_add_property(), of_remove_property() and of_update_property()
> API are not exported and are limited to only built-in modules at the
> moment. Export these so they can be used within modules. Also added
> the stubs for the !CONFIG_OF case for these functions.
>
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
> Hi Rob,
>
> We came across a need for this during some remoteproc enhancements
> for providing a standard OF API. Please see the discussion in [1].
>
> I am not sure which EXPORT_SYMBOL variant (_GPL or plain) to use as
> I see some mixed usage in this base, I have followed the convention
> used on of_find_property.

This is fine, but it seems a 
>
> [1] https://patchwork.kernel.org/patch/9237767/
>
>  drivers/of/base.c  |  3 +++
>  include/linux/of.h | 17 +++++++++++++++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 7792266db259..e6baf940db1b 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -1826,6 +1826,7 @@ int of_add_property(struct device_node *np, struct property *prop)
>
>         return rc;
>  }
> +EXPORT_SYMBOL(of_add_property);
>
>  int __of_remove_property(struct device_node *np, struct property *prop)
>  {
> @@ -1894,6 +1895,7 @@ int of_remove_property(struct device_node *np, struct property *prop)
>
>         return rc;
>  }
> +EXPORT_SYMBOL(of_remove_property);
>
>  int __of_update_property(struct device_node *np, struct property *newprop,
>                 struct property **oldpropp)
> @@ -1970,6 +1972,7 @@ int of_update_property(struct device_node *np, struct property *newprop)
>
>         return rc;
>  }
> +EXPORT_SYMBOL(of_update_property);
>
>  static void of_alias_add(struct alias_prop *ap, struct device_node *np,
>                          int id, const char *stem, int stem_len)
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 3d9ff8e9d803..b6f17d8f4b13 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -668,6 +668,23 @@ static inline int of_machine_is_compatible(const char *compat)
>         return 0;
>  }
>
> +static inline int of_add_property(struct device_node *np, struct property *prop)
> +{
> +       return -ENOTSUPP;
> +}
> +
> +static inline int of_remove_property(struct device_node *np,
> +                                    struct property *prop)
> +{
> +       return -ENOTSUPP;
> +}
> +
> +static inline int of_update_property(struct device_node *np,
> +                                    struct property *newprop)
> +{
> +       return -ENOTSUPP;
> +}
> +
>  static inline bool of_console_check(const struct device_node *dn, const char *name, int index)
>  {
>         return false;
> --
> 2.9.0
>
