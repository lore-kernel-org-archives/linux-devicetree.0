From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: simplify arch_find_n_match_cpu_physical_id() function
Date: Fri, 30 Oct 2015 13:31:06 -0500
Message-ID: <CAL_JsqLUcJx9bDYf5wuixY=XDhn7UR+QZKdy9GjDy+fW60cK3w@mail.gmail.com>
References: <1446001527-6700-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446001527-6700-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 27, 2015 at 10:05 PM, Masahiro Yamada
<yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:
> This commit does not change the function behavior.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>

Applied. Thanks.

Rob

> ---
>
>  drivers/of/base.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 8b5a187..017dd94 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -375,10 +375,7 @@ bool __weak arch_find_n_match_cpu_physical_id(struct device_node *cpun,
>                                            cpu, thread))
>                 return true;
>
> -       if (__of_find_n_match_cpu_property(cpun, "reg", cpu, thread))
> -               return true;
> -
> -       return false;
> +       return __of_find_n_match_cpu_property(cpun, "reg", cpu, thread);
>  }
>
>  /**
> --
> 1.9.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
