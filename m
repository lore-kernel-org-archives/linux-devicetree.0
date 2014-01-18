From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4] of: add functions to count number of elements in a property
Date: Sat, 18 Jan 2014 09:07:30 -0600
Message-ID: <CAL_JsqJord1OOjwcKk1jqF5o+XO3uw+Lc4ATtQacgwZWAoQq1g@mail.gmail.com>
References: <27256277.YJ687suYy5@phil>
	<1434798.oSb68sYmYT@phil>
	<CAL_JsqJ_St=OegpexzrTGXwmOYCz4YeWk_1S+R_q6NajmmPqSA@mail.gmail.com>
	<5115255.DrcMbtXc1P@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5115255.DrcMbtXc1P@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jan 18, 2014 at 6:02 AM, Heiko St=FCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wrot=
e:
> The need to know the number of array elements in a property is
> a common pattern. To prevent duplication of open-coded implementation=
s
> add a helper static function that also centralises strict sanity
> checking and DTB format details, as well as a set of wrapper function=
s
> for u8, u16, u32 and u64.
>
> Suggested-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> ---

Looks good. Do you plan to convert some users to use this?

Rob

> changes since v3:
> address more comments from Rob Herring
> - export the base function and inline the type-specific wrappers
> changes since v2:
> address more comments from Mark Rutland
> - switch to of_property_count_elems_of_size
> - use full_name instead of name in error message
> changes since v1:
> address comments from Rob Herring and Mark Rutland:
> - provide a helper and a set of wrappers for u8-u64
> - get rid of extra len variable, prop->length is enough
> - include node name in error message
>
> Mark, does your Reviewed-by holds for this variant too?
>
>  drivers/of/base.c  |   32 ++++++++++++++++++++++
>  include/linux/of.h |   76 ++++++++++++++++++++++++++++++++++++++++++=
++++++++++
>  2 files changed, 108 insertions(+)
>
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index f807d0e..21646c0 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -862,6 +862,38 @@ struct device_node *of_find_node_by_phandle(phan=
dle handle)
>  EXPORT_SYMBOL(of_find_node_by_phandle);
>
>  /**
> + * of_property_count_elems_of_size - Count the number of elements in=
 a property
> + *
> + * @np:                device node from which the property value is =
to be read.
> + * @propname:  name of the property to be searched.
> + * @elem_size: size of the individual element
> + *
> + * Search for a property in a device node and count the number of el=
ements of
> + * size elem_size in it. Returns number of elements on sucess, -EINV=
AL if the
> + * property does not exist or its length does not match a multiple o=
f u16 and
> + * -ENODATA if the property does not have a value.
> + */
> +int of_property_count_elems_of_size(const struct device_node *np,
> +                               const char *propname, int elem_size)
> +{
> +       struct property *prop =3D of_find_property(np, propname, NULL=
);
> +
> +       if (!prop)
> +               return -EINVAL;
> +       if (!prop->value)
> +               return -ENODATA;
> +
> +       if (prop->length % elem_size !=3D 0) {
> +               pr_err("size of %s in node %s is not a multiple of %d=
\n",
> +                      propname, np->full_name, elem_size);
> +               return -EINVAL;
> +       }
> +
> +       return prop->length / elem_size;
> +}
> +EXPORT_SYMBOL_GPL(of_property_count_elems_of_size);
> +
> +/**
>   * of_find_property_value_of_size
>   *
>   * @np:                device node from which the property value is =
to be read.
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 276c546..293920d 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -250,6 +250,8 @@ extern struct device_node *of_find_node_with_prop=
erty(
>  extern struct property *of_find_property(const struct device_node *n=
p,
>                                          const char *name,
>                                          int *lenp);
> +extern int of_property_count_elems_of_size(const struct device_node =
*np,
> +                               const char *propname, int elem_size);
>  extern int of_property_read_u32_index(const struct device_node *np,
>                                        const char *propname,
>                                        u32 index, u32 *out_value);
> @@ -426,6 +428,12 @@ static inline struct device_node *of_find_compat=
ible_node(
>         return NULL;
>  }
>
> +static inline int of_property_count_elems_of_size(const struct devic=
e_node *np,
> +                       const char *propname, int elem_size)
> +{
> +       return -ENOSYS;
> +}
> +
>  static inline int of_property_read_u32_index(const struct device_nod=
e *np,
>                         const char *propname, u32 index, u32 *out_val=
ue)
>  {
> @@ -565,6 +573,74 @@ static inline int of_node_to_nid(struct device_n=
ode *device) { return 0; }
>  #endif
>
>  /**
> + * of_property_count_u8_elems - Count the number of u8 elements in a=
 property
> + *
> + * @np:                device node from which the property value is =
to be read.
> + * @propname:  name of the property to be searched.
> + *
> + * Search for a property in a device node and count the number of u8=
 elements
> + * in it. Returns number of elements on sucess, -EINVAL if the prope=
rty does
> + * not exist or its length does not match a multiple of u8 and -ENOD=
ATA if the
> + * property does not have a value.
> + */
> +static inline int of_property_count_u8_elems(const struct device_nod=
e *np,
> +                               const char *propname)
> +{
> +       return of_property_count_elems_of_size(np, propname, sizeof(u=
8));
> +}
> +
> +/**
> + * of_property_count_u16_elems - Count the number of u16 elements in=
 a property
> + *
> + * @np:                device node from which the property value is =
to be read.
> + * @propname:  name of the property to be searched.
> + *
> + * Search for a property in a device node and count the number of u1=
6 elements
> + * in it. Returns number of elements on sucess, -EINVAL if the prope=
rty does
> + * not exist or its length does not match a multiple of u16 and -ENO=
DATA if the
> + * property does not have a value.
> + */
> +static inline int of_property_count_u16_elems(const struct device_no=
de *np,
> +                               const char *propname)
> +{
> +       return of_property_count_elems_of_size(np, propname, sizeof(u=
16));
> +}
> +
> +/**
> + * of_property_count_u32_elems - Count the number of u32 elements in=
 a property
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
> +static inline int of_property_count_u32_elems(const struct device_no=
de *np,
> +                               const char *propname)
> +{
> +       return of_property_count_elems_of_size(np, propname, sizeof(u=
32));
> +}
> +
> +/**
> + * of_property_count_u64_elems - Count the number of u64 elements in=
 a property
> + *
> + * @np:                device node from which the property value is =
to be read.
> + * @propname:  name of the property to be searched.
> + *
> + * Search for a property in a device node and count the number of u6=
4 elements
> + * in it. Returns number of elements on sucess, -EINVAL if the prope=
rty does
> + * not exist or its length does not match a multiple of u64 and -ENO=
DATA if the
> + * property does not have a value.
> + */
> +static inline int of_property_count_u64_elems(const struct device_no=
de *np,
> +                               const char *propname)
> +{
> +       return of_property_count_elems_of_size(np, propname, sizeof(u=
64));
> +}
> +
> +/**
>   * of_property_read_bool - Findfrom a property
>   * @np:                device node from which the property value is =
to be read.
>   * @propname:  name of the property to be searched.
> --
> 1.7.10.4
>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
