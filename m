From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: add function to count number of u32 elements in a property
Date: Fri, 17 Jan 2014 08:29:07 -0600
Message-ID: <CAL_JsqJmQOCAGmb1cYZwRA74Zb1OJ8F6UaEc03i7OUgxW0kaNg@mail.gmail.com>
References: <27256277.YJ687suYy5@phil>
	<1669323.jqjZBfkRx4@phil>
	<20140116124527.GD19578@e106331-lin.cambridge.arm.com>
	<3781679.27UF2dWtKL@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3781679.27UF2dWtKL@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 16, 2014 at 12:04 PM, Heiko St=FCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wro=
te:
> The need to know the number of array elements in a property is
> a common pattern. To prevent duplication of open-coded implementation=
s
> add a helper function that also centralises strict sanity checking
> and DTB format details.
>
> Suggested-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> ---
> Hi Mark,
> did you mean it like this? I've tested it with the sram-reserve chang=
e and
> it made the part of the determining the number elements a lot nicer :=
-)
>
>  drivers/of/base.c  |   32 ++++++++++++++++++++++++++++++++
>  include/linux/of.h |    8 ++++++++
>  2 files changed, 40 insertions(+)
>
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index f807d0e..0f40ea5 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -920,6 +920,38 @@ int of_property_read_u32_index(const struct devi=
ce_node *np,
>  EXPORT_SYMBOL_GPL(of_property_read_u32_index);
>
>  /**
> + * of_property_count_u32_elems - Count the number of u32 values in a=
 property
> + *
> + * @np:                device node from which the property value is =
to be read.
> + * @propname:  name of the property to be searched.
> + *
> + * Search for a property in a device node and count the number of u3=
2 elements
> + * in it. Returns number of elements on sucess, -EINVAL if the prope=
rty does
> + * not exist or its length does not match a multiple of u32 and -ENO=
DATA if the
> + * property does not have a value.
> + */
> +int of_property_count_u32_elems(const struct device_node *np,
> +                               const char *propname)
> +{
> +       int elem_size =3D sizeof(u32);

This should be a parameter, so functions for different sized
properties can be a simple wrapper function.

> +       int len;
> +       struct property *prop =3D of_find_property(np, propname, &len=
);
> +
> +       if (!prop)
> +               return -EINVAL;
> +       if (!prop->value)
> +               return -ENODATA;
> +
> +       if (prop->length % elem_size !=3D 0) {
> +               pr_err("size of %s is not a multiple of u32\n", propn=
ame);

The node name would be useful here too.

> +               return -EINVAL;
> +       }
> +
> +       return len / elem_size;
> +}
> +EXPORT_SYMBOL_GPL(of_property_count_u32_elems);
> +
> +/**
>   * of_property_read_u8_array - Find and read an array of u8 from a p=
roperty.
>   *
>   * @np:                device node from which the property value is =
to be read.
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 276c546..5794942 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -253,6 +253,8 @@ extern struct property *of_find_property(const st=
ruct device_node *np,
>  extern int of_property_read_u32_index(const struct device_node *np,
>                                        const char *propname,
>                                        u32 index, u32 *out_value);
> +extern int of_property_count_u32_elems(const struct device_node *np,
> +                                      const char *propname);
>  extern int of_property_read_u8_array(const struct device_node *np,
>                         const char *propname, u8 *out_values, size_t =
sz);
>  extern int of_property_read_u16_array(const struct device_node *np,
> @@ -432,6 +434,12 @@ static inline int of_property_read_u32_index(con=
st struct device_node *np,
>         return -ENOSYS;
>  }
>
> +static inline int of_property_count_u32_elems(const struct device_no=
de *np,
> +                       const char *propname)
> +{
> +       return -ENOSYS;
> +}
> +
>  static inline int of_property_read_u8_array(const struct device_node=
 *np,
>                         const char *propname, u8 *out_values, size_t =
sz)
>  {
> --
> 1.7.10.4
>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
