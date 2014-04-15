From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] of: Clean up of_update_property
Date: Tue, 15 Apr 2014 15:23:47 -0500
Message-ID: <CAL_JsqKUwgWyv+AjyfyVdiArsLzrZo=OwDkbfLC+93e6BTxg3Q@mail.gmail.com>
References: <1397576297-4785-1-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1397576297-4785-1-git-send-email-linux@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 15, 2014 at 10:38 AM, Guenter Roeck <linux@roeck-us.net> wrote:
> After searching for the old property, bail out with -ENODEV
> if it was not found.
>
> It is unnecessary to check if oldprop is NULL before removing
> its binary file; the check was already done before.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Applied. Thanks.

Rob

> ---
>  drivers/of/base.c |   10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index f72d19b..6d4ee22 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -1828,17 +1828,13 @@ int of_update_property(struct device_node *np, struct property *newprop)
>                 next = &(*next)->next;
>         }
>         raw_spin_unlock_irqrestore(&devtree_lock, flags);
> -       if (rc)
> -               return rc;
> +       if (!found)
> +               return -ENODEV;
>
>         /* Update the sysfs attribute */
> -       if (oldprop)
> -               sysfs_remove_bin_file(&np->kobj, &oldprop->attr);
> +       sysfs_remove_bin_file(&np->kobj, &oldprop->attr);
>         __of_add_property_sysfs(np, newprop);
>
> -       if (!found)
> -               return -ENODEV;
> -
>         return 0;
>  }
>
> --
> 1.7.9.7
>
