From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: base: upgrade initcall level of of_init from core to pure
Date: Wed, 13 May 2015 11:34:40 -0500
Message-ID: <CAL_JsqK6cZ+rYiox0=EE5wjwtk6T8edCzDG0=uj2ZdK-QHoX3g@mail.gmail.com>
References: <1431452282-10207-1-git-send-email-sudeep.holla@arm.com>
 <CAL_JsqJ19OfTJjtrZ9vs_9VYRHzOyF=GZdz4ftHT=nonEVWWgw@mail.gmail.com>
 <55532186.5060803@arm.com> <CAL_JsqL_pEZ0qMgk3j7fwuWLTVZEm2UpPR=e4jAMN4shHAtNnA@mail.gmail.com>
 <555364AA.7030703@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <555364AA.7030703-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 13, 2015 at 9:50 AM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
> On 13/05/15 14:46, Rob Herring wrote:
>> On Wed, May 13, 2015 at 5:03 AM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
>> wrote:

[...]

>>> Yes I read and was bit hesitant initially to do this change, but found
>>> no better way. I posted mainly to discuss other possibilities to solve
>>> the issue.
>>
>>
>> Perhaps of_init should not be an initcall at all and it should go into
>> driver_init().
>
>
> That seems ideal place to me as most of kset and kobjects are created
> there. Something like below patch ? However found that PPC had a
> function with same name which can conflict and we need to rename one of
> these two.

It looks like the PPC one is in the boot wrapper. They shouldn't
collide. If they do, then how about of_core_init.

>
> --->8
>
> diff --git a/drivers/base/init.c b/drivers/base/init.c
> index da033d3bab3c..fa149c7678d2 100644
> --- a/drivers/base/init.c
> +++ b/drivers/base/init.c
> @@ -8,6 +8,7 @@
>  #include <linux/device.h>
>  #include <linux/init.h>
>  #include <linux/memory.h>
> +#include <linux/of.h>
>
>  #include "base.h"
>
> @@ -34,4 +35,5 @@ void __init driver_init(void)
>         cpu_dev_init();
>         memory_dev_init();
>         container_dev_init();
> +       of_init();
>  }
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 8c3d6b04c585..927800548b75 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -189,7 +189,7 @@ int __of_attach_node_sysfs(struct device_node *np)
>         return 0;
>  }
>
> -static int __init of_init(void)
> +int __init of_init(void)

You can make this return void.

>  {
>         struct device_node *np;
>
> @@ -210,7 +210,6 @@ static int __init of_init(void)
>
>         return 0;
>  }
> -pure_initcall(of_init);
>
>  static struct property *__of_find_property(const struct device_node *np,
>                                            const char *name, int *lenp)
> diff --git a/include/linux/of.h b/include/linux/of.h
> index ddeaae6d2083..7b68e9248722 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -121,6 +121,8 @@ extern struct device_node *of_stdout;
>  extern raw_spinlock_t devtree_lock;
>
>  #ifdef CONFIG_OF
> +extern int of_init(void);

You don't need extern.

> +
>  static inline bool is_of_node(struct fwnode_handle *fwnode)
>  {
>         return fwnode && fwnode->type == FWNODE_OF;
> @@ -376,6 +378,10 @@ bool of_console_check(struct device_node *dn, char
> *name, int index);
>
>  #else /* CONFIG_OF */
>
> +static int of_init(void)

static inline

> +{
> +       return 0;
> +}
>  static inline bool is_of_node(struct fwnode_handle *fwnode)
>  {
>         return false;
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
