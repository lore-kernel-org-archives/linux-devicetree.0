From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: Add empty of_get_next_parent() for !OF
Date: Wed, 29 Apr 2015 18:03:25 -0500
Message-ID: <CAL_JsqJEQmJT9+4t=PSc_K6yRxuTRObewfdghXmBgDTg=Sm+qQ@mail.gmail.com>
References: <1430347479-1715-1-git-send-email-ilkka.koskinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430347479-1715-1-git-send-email-ilkka.koskinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ilkka Koskinen <ilkka.koskinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 29, 2015 at 5:44 PM, Ilkka Koskinen
<ilkka.koskinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
> From: Ilkka Koskinen <ilkka.koskinen-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
>
> Add an empty version of of_get_next_parent() in order to avoid
> build error.

Some details on the build error and what introduced it please.

> Signed-off-by: Ilkka Koskinen <ilkka.koskinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> ---
>  include/linux/of.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/include/linux/of.h b/include/linux/of.h
> index dfde07e..416158f 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -425,6 +425,11 @@ static inline struct device_node *of_get_parent(const struct device_node *node)
>         return NULL;
>  }
>
> +static inline struct device_node *of_get_next_parent(struct device_node *node)
> +{
> +       return NULL;
> +}
> +
>  static inline struct device_node *of_get_next_child(
>         const struct device_node *node, struct device_node *prev)
>  {
> --
> 1.9.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
