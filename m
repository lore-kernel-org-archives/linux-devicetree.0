From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: base: Export symbol of __of_find_all_nodes()
Date: Wed, 2 Nov 2016 22:39:43 -0500
Message-ID: <CAL_JsqJnAzJDeTS1Sr2H66++78zF+8wJfN8iYAQ3sbxJw1Axdw@mail.gmail.com>
References: <1477654092-12406-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477654092-12406-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 28, 2016 at 6:28 AM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> The function __of_find_all_nodes() is used in the public header
> linux/of.h and if any driver developed using this API then
> it reports error as unknown symbol if compiled as module.
>
> Export this APIs using EXPORT_SYMBOL() so that it can be used
> from driver compiled as module.

What driver needs this? This isn't really a function I'd expect drivers to use.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
