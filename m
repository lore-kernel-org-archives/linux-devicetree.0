From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] of: avoid format string parsing in kobject names
Date: Fri, 13 Jun 2014 09:55:04 -0500
Message-ID: <CAL_JsqKJq-u7GGDfNONAT7tjAK-2AKQi64X8Au0N8gzPpEoNug@mail.gmail.com>
References: <20140610165700.GA3453@www.outflux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140610165700.GA3453@www.outflux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@chromium.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 10, 2014 at 11:57 AM, Kees Cook <keescook@chromium.org> wrote:
> This makes sure a format string cannot leak into the kobject name that
> is constructed. (And splits the >80 character line.)
>
> Signed-off-by: Kees Cook <keescook@chromium.org>

Applied.

This seems like a non-obvious thing to do, but I guess most people
aren't dealing directly with kobjects.

Rob

> ---
>  drivers/of/base.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 8368d96ae7b4..f27d922eaece 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -227,7 +227,8 @@ static int __of_node_add(struct device_node *np)
>         np->kobj.kset = of_kset;
>         if (!np->parent) {
>                 /* Nodes without parents are new top level trees */
> -               rc = kobject_add(&np->kobj, NULL, safe_name(&of_kset->kobj, "base"));
> +               rc = kobject_add(&np->kobj, NULL, "%s",
> +                                safe_name(&of_kset->kobj, "base"));
>         } else {
>                 name = safe_name(&np->parent->kobj, kbasename(np->full_name));
>                 if (!name || !name[0])
> --
> 1.7.9.5
>
>
> --
> Kees Cook
> Chrome OS Security
