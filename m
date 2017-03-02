From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] devicetree: Document of_property_read_string_array()
 better
Date: Wed, 1 Mar 2017 22:52:44 -0800
Message-ID: <58B7C13C.70304@gmail.com>
References: <1488267006-29945-1-git-send-email-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1488267006-29945-1-git-send-email-sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/27/17 23:30, Sakari Ailus wrote:
> of_property_read_string_array() is documented to return the number of
> strings present in a string array property if its target string buffer is
> NULL. What is not documented, however, is that is returned if the buffer
> is non-NULL. It returns the number of strings read. Document this, as well
> as the error codes.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> ---
>  include/linux/of.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/of.h b/include/linux/of.h
> index d72f010..5856765 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -952,7 +952,11 @@ static inline int of_property_count_u64_elems(const struct device_node *np,
>   * Search for a property in a device tree node and retrieve a list of
>   * terminated string values (pointer to data, not a copy) in that property.
>   *
> - * If @out_strs is NULL, the number of strings in the property is returned.
> + * If @out_strs is NULL, the number of strings in the property is returned. If
> + * $out_strs is non-NULL, returns the number of strings read. On error, the
> + * function returns -EINVAL if the property does not exist, -ENODATA if
> + * property does not have a value, and -EILSEQ if the string is not
> + * null-terminated within the length of the property data.
>   */
>  static inline int of_property_read_string_array(const struct device_node *np,
>  						const char *propname, const char **out_strs,
> 

Thanks.

Reviewed-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
