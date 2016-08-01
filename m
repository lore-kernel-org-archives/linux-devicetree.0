From: Kees Cook <keescook@chromium.org>
Subject: Re: [RFC][PATCH] pstore: use DT reserved-memory bindings
Date: Mon, 1 Aug 2016 12:02:03 -0700
Message-ID: <CAGXu5jJC20vg2PuU2B-spzcLtuc=KhuYQ1YffvtyxsgfP7H=uw@mail.gmail.com>
References: <20160730011623.GA25495@www.outflux.net> <CAL_JsqKgQGzqpj+McSVap_8F1NHZxyBnx+wqX1FohcG2XTCFDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKgQGzqpj+McSVap_8F1NHZxyBnx+wqX1FohcG2XTCFDg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Greg Hackmann <ghackmann@google.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 1, 2016 at 8:54 AM, Rob Herring <robh+dt@kernel.org> wrote:
> On Fri, Jul 29, 2016 at 8:16 PM, Kees Cook <keescook@chromium.org> wrote:
>> Instead of a ramoops-specific node, use a child node of /reserved-memory.
>> This requires that of_platform_populate() be called for the node, though,
>> since it does not have its own "compatible" property.
>>
>> Suggested-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Kees Cook <keescook@chromium.org>
>> ---
>> Here's what I've got for moving ramoops under /reserved-memory... still
>> feels like a bit of a hack.
>> ---
>>  Documentation/devicetree/bindings/misc/ramoops.txt | 48 ----------------------
>>  .../bindings/reserved-memory/ramoops.txt           | 48 ++++++++++++++++++++++
>
> Use -M option or so you don't forget you can set in your git config:
>
> [diff]
>         renames = true

Added, thanks.

>
>>  Documentation/ramoops.txt                          |  2 +-
>>  drivers/of/platform.c                              |  5 +++
>>  fs/pstore/ram.c                                    | 12 +-----
>>  5 files changed, 56 insertions(+), 59 deletions(-)
>
> [...]
>
>> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
>> index 16e8daffac06..c07adf72bb8e 100644
>> --- a/drivers/of/platform.c
>> +++ b/drivers/of/platform.c
>> @@ -356,6 +356,11 @@ static int of_platform_bus_create(struct device_node *bus,
>>         void *platform_data = NULL;
>>         int rc = 0;
>>
>> +       /* Always populate reserved-memory nodes. */
>> +       if (strict && strcmp(bus->full_name, "/reserved-memory") == 0) {
>> +               return of_platform_populate(bus, matches, lookup, parent);
>> +       }
>> +
>
> This can be a lot cleaner now with the DT changes in 4.8. We could
> make this more generic and call of_platform_populate with the
> /reserved-memory node as the root, but that would :

Is there a word missing above? "...but that would [need]:" ?

> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 765390e..4c36e06 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -499,8 +499,15 @@ EXPORT_SYMBOL_GPL(of_platform_default_populate);
>
>  static int __init of_platform_default_populate_init(void)
>  {
> -       if (of_have_populated_dt())
> -               of_platform_default_populate(NULL, NULL, NULL);
> +       struct device_node *node;
> +
> +       if (!of_have_populated_dt())
> +               return -ENODEV;
> +
> +       node = of_find_compatible_node(NULL, NULL, "ramoops");
> +       of_platform_device_create(node, NULL, NULL);

Does of_platform_device_create() DTRT if node is NULL here? (Looks
like "yes", but goes through a spin lock first: I think it'd be nicer
to check for a NULL node here.) Should this first look for
/reserved-memory, then ramoops?

Testing this as-is seems to work, though I'll send a version that
looks up /reserved-memory first before ramoops.

> +
> +       of_platform_default_populate(NULL, NULL, NULL);
>
>         return 0;
>  }
>
>
>>         /* Make sure it has a compatible property */
>>         if (strict && (!of_get_property(bus, "compatible", NULL))) {
>>                 pr_debug("%s() - skipping %s, no compatible prop\n",
>> diff --git a/fs/pstore/ram.c b/fs/pstore/ram.c
>> index 47516a794011..af5cee0c2156 100644
>> --- a/fs/pstore/ram.c
>> +++ b/fs/pstore/ram.c
>> @@ -486,24 +486,16 @@ static int ramoops_parse_dt(struct platform_device *pdev,
>>                             struct ramoops_platform_data *pdata)
>>  {
>>         struct device_node *of_node = pdev->dev.of_node;
>> -       struct device_node *mem_region;
>>         struct resource res;
>>         u32 value;
>>         int ret;
>>
>>         dev_dbg(&pdev->dev, "using Device Tree\n");
>>
>> -       mem_region = of_parse_phandle(of_node, "memory-region", 0);
>> -       if (!mem_region) {
>> -               dev_err(&pdev->dev, "no memory-region phandle\n");
>> -               return -ENODEV;
>> -       }
>> -
>> -       ret = of_address_to_resource(mem_region, 0, &res);
>> -       of_node_put(mem_region);
>> +       ret = of_address_to_resource(of_node, 0, &res);
>
> You can use the standard platform device resource functions now.

Okay, sounds good. I still have to parse the ramoops-specific stuff
off the of_node, so it doesn't really change things too much here, but
does look a little cleaner.

Thanks!

-Kees

>
>>         if (ret) {
>>                 dev_err(&pdev->dev,
>> -                       "failed to translate memory-region to resource: %d\n",
>> +                       "failed to translate reserved-memory to resource: %d\n",
>>                         ret);
>>                 return ret;
>>         }
>> --
>> 2.7.4
>>
>>
>> --
>> Kees Cook
>> Brillo & Chrome OS Security



-- 
Kees Cook
Chrome OS & Brillo Security
