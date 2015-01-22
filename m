From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: Empty node & property flag accessors when !OF
Date: Thu, 22 Jan 2015 17:13:51 -0600
Message-ID: <CAL_JsqKxtJH=JyruyuMLXSFfTLdswOLa=AfGEbROsSSOhLLDkg@mail.gmail.com>
References: <1421859957-24457-1-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421859957-24457-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

+Wolfram

On Wed, Jan 21, 2015 at 11:05 AM, Pantelis Antoniou
<pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> Introduce empty node and property flag accessors when CONFIG_OF is not
> defined.
> This allows us to use them without ifdef'ing them in places where it
> makes sense to do so.
>
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

I've asked Wolfram to apply. While not a fix itself, this is needed
for an I2C related fix for 3.19.

Rob

> ---
>  include/linux/of.h | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/include/linux/of.h b/include/linux/of.h
> index dfde07e..7ede449 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -616,6 +616,38 @@ static inline const char *of_prop_next_string(struct property *prop,
>         return NULL;
>  }
>
> +static inline int of_node_check_flag(struct device_node *n, unsigned long flag)
> +{
> +       return 0;
> +}
> +
> +static inline int of_node_test_and_set_flag(struct device_node *n,
> +                                           unsigned long flag)
> +{
> +       return 0;
> +}
> +
> +static inline void of_node_set_flag(struct device_node *n, unsigned long flag)
> +{
> +}
> +
> +static inline void of_node_clear_flag(struct device_node *n, unsigned long flag)
> +{
> +}
> +
> +static inline int of_property_check_flag(struct property *p, unsigned long flag)
> +{
> +       return 0;
> +}
> +
> +static inline void of_property_set_flag(struct property *p, unsigned long flag)
> +{
> +}
> +
> +static inline void of_property_clear_flag(struct property *p, unsigned long flag)
> +{
> +}
> +
>  #define of_match_ptr(_ptr)     NULL
>  #define of_match_node(_matches, _node) NULL
>  #endif /* CONFIG_OF */
> --
> 1.7.12
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
