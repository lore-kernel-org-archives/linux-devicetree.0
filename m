From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: add stub for for_each_property_of_node()
Date: Wed, 1 Jul 2015 12:39:28 -0500
Message-ID: <CAL_JsqKPz0tDx7i0HUDw33tDozBTsU4dQyo73-t_OafytRGZUw@mail.gmail.com>
References: <1435738208-3740-1-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435738208-3740-1-git-send-email-tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 1, 2015 at 3:10 AM, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org> wrote:
> So code that isn't protected by CONFIG_OF can still build.

Is something in mainline/next broken? If not do you have a user?

>
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> ---
>  include/linux/of.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/include/linux/of.h b/include/linux/of.h
> index edc068d..8922448 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -673,6 +673,9 @@ static inline void of_property_clear_flag(struct property *p, unsigned long flag
>
>  #define of_match_ptr(_ptr)     NULL
>  #define of_match_node(_matches, _node) NULL
> +#define for_each_property_of_node(dn, pp)      \
> +       for (; NULL; )
> +

We normally add empty functions that the iterator calls rather than an
empty for loop.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
