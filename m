From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] of: Drop superfluous dependance for OF_OVERLAY
Date: Fri, 13 Mar 2015 10:25:14 -0500
Message-ID: <CAL_JsqKN2e36CPmXsgXngsU7=XcmU+EHLGsui_bZ9TCuj9U4tQ@mail.gmail.com>
References: <1424068044-3457-1-git-send-email-matwey@sai.msu.ru> <1424068044-3457-2-git-send-email-matwey@sai.msu.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424068044-3457-2-git-send-email-matwey-TTlVxmypnbovJsYlp49lxw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Matwey V. Kornilov" <matwey-TTlVxmypnbovJsYlp49lxw@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 16, 2015 at 12:27 AM, Matwey V. Kornilov <matwey-TTlVxmypnbovJsYlp49lxw@public.gmane.org> wrote:
> The whole menu already depends on OF, so there is no need to additionaly specify it.
>
> Suggested-by: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
> Signed-off-by: Matwey V. Kornilov <matwey-TTlVxmypnbovJsYlp49lxw@public.gmane.org>

Applied for 4.0. Thanks.

Rob

> ---
>  drivers/of/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> index fdca685..4831137 100644
> --- a/drivers/of/Kconfig
> +++ b/drivers/of/Kconfig
> @@ -86,7 +86,6 @@ config OF_RESOLVE
>
>  config OF_OVERLAY
>         bool "Device Tree overlays"
> -       depends on OF
>         select OF_DYNAMIC
>         select OF_RESOLVE
>
> --
> 2.1.4
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
