MIME-Version: 1.0
In-Reply-To: <1473174121-19742-1-git-send-email-rf@opensource.wolfsonmicro.com>
References: <1473174121-19742-1-git-send-email-rf@opensource.wolfsonmicro.com>
Date: Thu, 8 Sep 2016 09:55:44 -0500
Message-ID: <CAL_JsqK-e_AJR9MVrBQx+i=2dMynaOv_Kh_6nkJuA75kajweMg@mail.gmail.com>
Subject: Re: [PATCH 1/2] of: Make of_find_property_value_of_size take a length range
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset=UTF-8
To: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Cc: Frank Rowand <frowand.list@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@opensource.wolfsonmicro.com
List-ID: <devicetree@vger.kernel.org>

On Tue, Sep 6, 2016 at 10:02 AM, Richard Fitzgerald <rf@opensource.wolfsonmicro.com> wrote:
> In preparation for adding variable-length array reads, change
> of_find_property_value_of_size so that it takes an optional
> maximum length. If the maximum is passed as 0, the behaviour is
> unchanged and it will return a property if it's >= the requested
> minimum length. If maximum is non-zero it will only return a
> property whose length is min <= l <= max.

The old behavior seems broken to me. If the property is longer than the buffer we are filling, then the buffer (which presumably has a length of len) will be overrun. We don't want to maintain that.


>
> Signed-off-by: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
> ---
>  drivers/of/base.c | 39 +++++++++++++++++++++++++++++----------
>  1 file changed, 29 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 3ce6953..b853737 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -1146,16 +1146,18 @@ EXPORT_SYMBOL_GPL(of_property_count_elems_of_size);
>   *
>   * @np:                device node from which the property value is to be read.
>   * @propname:  name of the property to be searched.
> - * @len:       requested length of property value
> + * @min:       minimum allowed length of property value
> + * @max:       maximum allowed length of property value (0 means unlimited)
> + * @len:       if !=NULL, actual length is written to here
>   *
>   * Search for a property in a device node and valid the requested size.
>   * Returns the property value on success, -EINVAL if the property does not
>   *  exist, -ENODATA if property does not have a value, and -EOVERFLOW if the
> - * property data isn't large enough.
> + * property data is too small or too large.
>   *
>   */
>  static void *of_find_property_value_of_size(const struct device_node *np,
> -                       const char *propname, u32 len)
> +                       const char *propname, u32 min, u32 max, size_t *len)
>  {
>         struct property *prop = of_find_property(np, propname, NULL);
>
> @@ -1163,8 +1165,13 @@ static void *of_find_property_value_of_size(const struct device_node *np,
>                 return ERR_PTR(-EINVAL);
>         if (!prop->value)
>                 return ERR_PTR(-ENODATA);
> -       if (len > prop->length)
> +       if (prop->length < min)
>                 return ERR_PTR(-EOVERFLOW);
> +       if (max && prop->length > max)
> +               return ERR_PTR(-EOVERFLOW);
> +
> +       if (len)
> +               *len = prop->length;
>
>         return prop->value;
>  }
> @@ -1189,7 +1196,9 @@ int of_property_read_u32_index(const struct device_node *np,
>                                        u32 index, u32 *out_value)
>  {
>         const u32 *val = of_find_property_value_of_size(np, propname,
> -                                       ((index + 1) * sizeof(*out_value)));
> +                                       ((index + 1) * sizeof(*out_value)),
> +                                       0,
> +                                       NULL);
>
>         if (IS_ERR(val))
>                 return PTR_ERR(val);
> @@ -1221,7 +1230,9 @@ int of_property_read_u8_array(const struct device_node *np,
>                         const char *propname, u8 *out_values, size_t sz)
>  {
>         const u8 *val = of_find_property_value_of_size(np, propname,
> -                                               (sz * sizeof(*out_values)));
> +                                               (sz * sizeof(*out_values)),
> +                                               0,
> +                                               NULL);
>
>         if (IS_ERR(val))
>                 return PTR_ERR(val);
> @@ -1254,7 +1265,9 @@ int of_property_read_u16_array(const struct device_node *np,
>                         const char *propname, u16 *out_values, size_t sz)
>  {
>         const __be16 *val = of_find_property_value_of_size(np, propname,
> -                                               (sz * sizeof(*out_values)));
> +                                               (sz * sizeof(*out_values)),
> +                                               0,
> +                                               NULL);
>
>         if (IS_ERR(val))
>                 return PTR_ERR(val);
> @@ -1286,7 +1299,9 @@ int of_property_read_u32_array(const struct device_node *np,
>                                size_t sz)
>  {
>         const __be32 *val = of_find_property_value_of_size(np, propname,
> -                                               (sz * sizeof(*out_values)));
> +                                               (sz * sizeof(*out_values)),
> +                                               0,
> +                                               NULL);
>
>         if (IS_ERR(val))
>                 return PTR_ERR(val);
> @@ -1314,7 +1329,9 @@ int of_property_read_u64(const struct device_node *np, const char *propname,
>                          u64 *out_value)
>  {
>         const __be32 *val = of_find_property_value_of_size(np, propname,
> -                                               sizeof(*out_value));
> +                                               sizeof(*out_value),
> +                                               0,
> +                                               NULL);
>
>         if (IS_ERR(val))
>                 return PTR_ERR(val);
> @@ -1345,7 +1362,9 @@ int of_property_read_u64_array(const struct device_node *np,
>                                size_t sz)
>  {
>         const __be32 *val = of_find_property_value_of_size(np, propname,
> -                                               (sz * sizeof(*out_values)));
> +                                               (sz * sizeof(*out_values)),
> +                                               0,
> +                                               NULL);
>
>         if (IS_ERR(val))
>                 return PTR_ERR(val);
> --
> 1.9.1
>
