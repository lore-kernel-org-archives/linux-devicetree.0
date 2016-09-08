From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/2] of: Add array read functions with min/max size limits
Date: Thu, 8 Sep 2016 09:46:45 -0500
Message-ID: <CAL_JsqJpOistyWyKvpVWUNR2d1umNwnZmpO2jFSi574umUNLOA@mail.gmail.com>
References: <1473174121-19742-1-git-send-email-rf@opensource.wolfsonmicro.com> <1473174121-19742-2-git-send-email-rf@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473174121-19742-2-git-send-email-rf@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Cc: Frank Rowand <frowand.list@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Tue, Sep 6, 2016 at 10:02 AM, Richard Fitzgerald
<rf@opensource.wolfsonmicro.com> wrote:
> Add a new set of array reading functions that take a minimum and
> maximum size limit and will fail if the property size is not within
> the size limits. This makes it more convenient for drivers that
> use variable-size DT arrays which must be bounded at both ends -
> data must be at least N entries but must not overflow the array
> it is being copied into. It is also more efficient than making this
> functionality out of existing public functions and avoids duplication.
>
> The existing array functions have been left in the API, since there
> are a very large number of clients of those functions and their
> existing functionality is still useful. This avoids turning a small
> API improvement into a major kernel rework.

Thanks for doing this.

> Signed-off-by: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
> ---
>  drivers/of/base.c  | 206 ++++++++++++++++++++++++++++++++++++++++++-----------
>  include/linux/of.h |  16 +++++
>  2 files changed, 180 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index b853737..cbad5cf 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -1209,6 +1209,47 @@ int of_property_read_u32_index(const struct device_node *np,
>  EXPORT_SYMBOL_GPL(of_property_read_u32_index);
>
>  /**
> + * of_property_read_variable_u8_array - Find and read an array of u8 from a
> + * property, with bounds on the minimum and maximum array size.
> + *
> + * @np:                device node from which the property value is to be read.
> + * @propname:  name of the property to be searched.
> + * @out_values:        pointer to return value, modified only if return value is 0.
> + * @sz_min:    minimum number of array elements to read
> + * @sz_max:    maximum number of array elements to read
> + *
> + * Search for a property in a device node and read 8-bit value(s) from
> + * it. Returns 0 on success, -EINVAL if the property does not exist,
> + * -ENODATA if property does not have a value, and -EOVERFLOW if the
> + * property data is smaller than sz_min or longer than sz_max.
> + *
> + * dts entry of array should be like:
> + *     property = /bits/ 8 <0x50 0x60 0x70>;
> + *
> + * The out_values is modified only if a valid u8 value can be decoded.
> + */
> +int of_property_read_variable_u8_array(const struct device_node *np,
> +                                       const char *propname, u8 *out_values,
> +                                       size_t sz_min, size_t sz_max)
> +{
> +       size_t sz;
> +       const u8 *val = of_find_property_value_of_size(np, propname,
> +                                               (sz_min * sizeof(*out_values)),
> +                                               (sz_max * sizeof(*out_values)),
> +                                               &sz);
> +
> +       if (IS_ERR(val))
> +               return PTR_ERR(val);
> +
> +       sz /= sizeof(*out_values);
> +
> +       while (sz--)
> +               *out_values++ = *val++;
> +       return 0;

I think this needs to return the actual number of elements filled.

> +}
> +EXPORT_SYMBOL_GPL(of_property_read_variable_u8_array);
> +
> +/**
>   * of_property_read_u8_array - Find and read an array of u8 from a property.
>   *
>   * @np:                device node from which the property value is to be read.
> @@ -1229,21 +1270,53 @@ EXPORT_SYMBOL_GPL(of_property_read_u32_index);
>  int of_property_read_u8_array(const struct device_node *np,
>                         const char *propname, u8 *out_values, size_t sz)
>  {
> -       const u8 *val = of_find_property_value_of_size(np, propname,
> -                                               (sz * sizeof(*out_values)),
> -                                               0,
> -                                               NULL);
> -
> -       if (IS_ERR(val))
> -               return PTR_ERR(val);
> -
> -       while (sz--)
> -               *out_values++ = *val++;
> -       return 0;
> +       return of_property_read_variable_u8_array(np, propname, out_values,
> +                                                 sz, 0);

This should be min and max both set to sz.

All these can be made a static inline and then we don't need the
declaration and the dummy empty function. Changing the return value
here will complicate things as this function should maintain the
existing return values (i.e. 0 for success).

Similar comments for the other flavors.

Rob
