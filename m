From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] pstore: use DT reserved-memory bindings
Date: Mon, 1 Aug 2016 14:58:08 -0500
Message-ID: <CAL_JsqKUHRphxAh_48zKnL3K5jT5fT-5ozStdiuxdLRB+i_WTg@mail.gmail.com>
References: <20160801190527.GA16445@www.outflux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160801190527.GA16445-0X9Bc/hWBUTk6RaD4rd5nQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Hackmann <ghackmann-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 1, 2016 at 2:05 PM, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> Instead of a ramoops-specific node, use a child node of /reserved-memory.
> This requires that of_platform_device_create() be explicitly called
> for the node, though, since "/reserved-memory" does not have its own
> "compatible" property.

As I mentioned in my other reply, not strictly needed to find
/reserved-memory node first, but it's fine either way.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>
> Suggested-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> v2:
> - rebase to 4.8, use of_platform_default_populate_init(), robh
> - use platform device resources instead of node directly, robh
> ---
>  .../bindings/{misc => reserved-memory}/ramoops.txt |  8 ++---
>  Documentation/ramoops.txt                          | 38 +++++++++++++++-------
>  drivers/of/platform.c                              | 20 ++++++++++--
>  fs/pstore/ram.c                                    | 23 ++++---------
>  4 files changed, 56 insertions(+), 33 deletions(-)
>  rename Documentation/devicetree/bindings/{misc => reserved-memory}/ramoops.txt (86%)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
