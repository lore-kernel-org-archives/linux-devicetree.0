From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Revert "pstore/ram: add Device Tree bindings"
Date: Thu, 28 Jul 2016 16:10:59 -0500
Message-ID: <CAL_Jsq+VmaFjWKqKfuqh5a1WkSYuw8w8SKBHK7MF6j-i7Fv_gA@mail.gmail.com>
References: <20160728202537.11961-1-robh@kernel.org> <CAGXu5jJnfCGsqiuVWNrvrZkmKz5nD0hnQSQ+Vr4x-GD5dDa7AA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGXu5jJnfCGsqiuVWNrvrZkmKz5nD0hnQSQ+Vr4x-GD5dDa7AA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Hackmann <ghackmann-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 28, 2016 at 3:50 PM, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> On Thu, Jul 28, 2016 at 1:25 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> This reverts commit 35da60941e44dbf57868e67686dd24cc1a33125a.
>> ---
>> WTF!
>>
>> I don't recall acking this nor have my comments (Arnd's really) been
>> addressed[1]. This should not have been merged yet.
>
> The conversation seemed to me to describe an alternative that could be
> moved to, but that it was going to need more work. In the meantime,
> these are the DT bindings used in real devices already. It seemed
> clear to me that reducing the delta now and improving the
> implementation in the future was the right thing to do in this case. I
> didn't think your comments were a hard NAK, but rather a "we should do
> this in the future", and I added it as a TODO for the pstore tree.
>
> Is a revert really justified here? This doesn't break anything (quite
> the opposite, actually).

Yes. Bindings are an ABI, so they can't evolve other than get
additional properties.

I'm keen to have this in too because I know there are lots of users
(extract a DT from a Calxeda system ;)). It's not really that far off
(drop memory-region and define the location in /reserved-memory) I
think. So send a follow-up for 4.8 and then it doesn't need a revert.

Rob

>
> -Kees
>
>>
>> Rob
>>
>> [1] https://lkml.org/lkml/2016/6/21/969
>>
>>  Documentation/devicetree/bindings/misc/ramoops.txt | 48 -----------
>>  Documentation/ramoops.txt                          |  6 +-
>>  fs/pstore/ram.c                                    | 95 +---------------------
>>  3 files changed, 4 insertions(+), 145 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/misc/ramoops.txt
>>
>> diff --git a/Documentation/devicetree/bindings/misc/ramoops.txt b/Documentation/devicetree/bindings/misc/ramoops.txt
>> deleted file mode 100644
>> index cd02cec..0000000
>> --- a/Documentation/devicetree/bindings/misc/ramoops.txt
>> +++ /dev/null
>> @@ -1,48 +0,0 @@
>> -Ramoops oops/panic logger
>> -=========================
>> -
>> -ramoops provides persistent RAM storage for oops and panics, so they can be
>> -recovered after a reboot. It is a backend to pstore, so this node is named
>> -"ramoops" after the backend, rather than "pstore" which is the subsystem.
>> -
>> -Parts of this storage may be set aside for other persistent log buffers, such
>> -as kernel log messages, or for optional ECC error-correction data.  The total
>> -size of these optional buffers must fit in the reserved region.
>> -
>> -Any remaining space will be used for a circular buffer of oops and panic
>> -records.  These records have a configurable size, with a size of 0 indicating
>> -that they should be disabled.
>> -
>> -At least one of "record-size", "console-size", "ftrace-size", or "pmsg-size"
>> -must be set non-zero, but are otherwise optional as listed below.
>> -
>> -
>> -Required properties:
>> -
>> -- compatible: must be "ramoops"
>> -
>> -- memory-region: phandle to a region of memory that is preserved between
>> -  reboots
>> -
>> -
>> -Optional properties:
>> -
>> -- ecc-size: enables ECC support and specifies ECC buffer size in bytes
>> -  (defaults to 0: no ECC)
>> -
>> -- record-size: maximum size in bytes of each dump done on oops/panic
>> -  (defaults to 0: disabled)
>> -
>> -- console-size: size in bytes of log buffer reserved for kernel messages
>> -  (defaults to 0: disabled)
>> -
>> -- ftrace-size: size in bytes of log buffer reserved for function tracing and
>> -  profiling (defaults to 0: disabled)
>> -
>> -- pmsg-size: size in bytes of log buffer reserved for userspace messages
>> -  (defaults to 0: disabled)
>> -
>> -- unbuffered: if present, use unbuffered mappings to map the reserved region
>> -  (defaults to buffered mappings)
>> -
>> -- no-dump-oops: if present, only dump panics (defaults to panics and oops)
>> diff --git a/Documentation/ramoops.txt b/Documentation/ramoops.txt
>> index 9264bca..5d86756 100644
>> --- a/Documentation/ramoops.txt
>> +++ b/Documentation/ramoops.txt
>> @@ -45,7 +45,7 @@ corrupt, but usually it is restorable.
>>
>>  2. Setting the parameters
>>
>> -Setting the ramoops parameters can be done in 3 different manners:
>> +Setting the ramoops parameters can be done in 2 different manners:
>>   1. Use the module parameters (which have the names of the variables described
>>   as before).
>>   For quick debugging, you can also reserve parts of memory during boot
>> @@ -54,9 +54,7 @@ Setting the ramoops parameters can be done in 3 different manners:
>>   kernel to use only the first 128 MB of memory, and place ECC-protected ramoops
>>   region at 128 MB boundary:
>>   "mem=128M ramoops.mem_address=0x8000000 ramoops.ecc=1"
>> - 2. Use Device Tree bindings, as described in
>> - Documentation/device-tree/bindings/misc/ramoops.txt.
>> - 3. Use a platform device and set the platform data. The parameters can then
>> + 2. Use a platform device and set the platform data. The parameters can then
>>   be set through that platform data. An example of doing that is:
>>
>>  #include <linux/pstore_ram.h>
>> diff --git a/fs/pstore/ram.c b/fs/pstore/ram.c
>> index 47516a7..d9668c2 100644
>> --- a/fs/pstore/ram.c
>> +++ b/fs/pstore/ram.c
>> @@ -34,8 +34,6 @@
>>  #include <linux/slab.h>
>>  #include <linux/compiler.h>
>>  #include <linux/pstore_ram.h>
>> -#include <linux/of.h>
>> -#include <linux/of_address.h>
>>
>>  #define RAMOOPS_KERNMSG_HDR "===="
>>  #define MIN_MEM_SIZE 4096UL
>> @@ -460,98 +458,15 @@ static int ramoops_init_prz(struct device *dev, struct ramoops_context *cxt,
>>         return 0;
>>  }
>>
>> -static int ramoops_parse_dt_size(struct platform_device *pdev,
>> -                                const char *propname, u32 *value)
>> -{
>> -       u32 val32 = 0;
>> -       int ret;
>> -
>> -       ret = of_property_read_u32(pdev->dev.of_node, propname, &val32);
>> -       if (ret < 0 && ret != -EINVAL) {
>> -               dev_err(&pdev->dev, "failed to parse property %s: %d\n",
>> -                       propname, ret);
>> -               return ret;
>> -       }
>> -
>> -       if (val32 > INT_MAX) {
>> -               dev_err(&pdev->dev, "%s %u > INT_MAX\n", propname, val32);
>> -               return -EOVERFLOW;
>> -       }
>> -
>> -       *value = val32;
>> -       return 0;
>> -}
>> -
>> -static int ramoops_parse_dt(struct platform_device *pdev,
>> -                           struct ramoops_platform_data *pdata)
>> -{
>> -       struct device_node *of_node = pdev->dev.of_node;
>> -       struct device_node *mem_region;
>> -       struct resource res;
>> -       u32 value;
>> -       int ret;
>> -
>> -       dev_dbg(&pdev->dev, "using Device Tree\n");
>> -
>> -       mem_region = of_parse_phandle(of_node, "memory-region", 0);
>> -       if (!mem_region) {
>> -               dev_err(&pdev->dev, "no memory-region phandle\n");
>> -               return -ENODEV;
>> -       }
>> -
>> -       ret = of_address_to_resource(mem_region, 0, &res);
>> -       of_node_put(mem_region);
>> -       if (ret) {
>> -               dev_err(&pdev->dev,
>> -                       "failed to translate memory-region to resource: %d\n",
>> -                       ret);
>> -               return ret;
>> -       }
>> -
>> -       pdata->mem_size = resource_size(&res);
>> -       pdata->mem_address = res.start;
>> -       pdata->mem_type = of_property_read_bool(of_node, "unbuffered");
>> -       pdata->dump_oops = !of_property_read_bool(of_node, "no-dump-oops");
>> -
>> -#define parse_size(name, field) {                                      \
>> -               ret = ramoops_parse_dt_size(pdev, name, &value);        \
>> -               if (ret < 0)                                            \
>> -                       return ret;                                     \
>> -               field = value;                                          \
>> -       }
>> -
>> -       parse_size("record-size", pdata->record_size);
>> -       parse_size("console-size", pdata->console_size);
>> -       parse_size("ftrace-size", pdata->ftrace_size);
>> -       parse_size("pmsg-size", pdata->pmsg_size);
>> -       parse_size("ecc-size", pdata->ecc_info.ecc_size);
>> -
>> -#undef parse_size
>> -
>> -       return 0;
>> -}
>> -
>>  static int ramoops_probe(struct platform_device *pdev)
>>  {
>>         struct device *dev = &pdev->dev;
>> -       struct ramoops_platform_data *pdata = dev->platform_data;
>> +       struct ramoops_platform_data *pdata = pdev->dev.platform_data;
>>         struct ramoops_context *cxt = &oops_cxt;
>>         size_t dump_mem_sz;
>>         phys_addr_t paddr;
>>         int err = -EINVAL;
>>
>> -       if (dev_of_node(dev) && !pdata) {
>> -               pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
>> -               if (!pdata) {
>> -                       err = -ENOMEM;
>> -                       goto fail_out;
>> -               }
>> -
>> -               err = ramoops_parse_dt(pdev, pdata);
>> -               if (err < 0)
>> -                       goto fail_out;
>> -       }
>> -
>>         /* Only a single ramoops area allowed at a time, so fail extra
>>          * probes.
>>          */
>> @@ -681,17 +596,11 @@ static int ramoops_remove(struct platform_device *pdev)
>>         return 0;
>>  }
>>
>> -static const struct of_device_id dt_match[] = {
>> -       { .compatible = "ramoops" },
>> -       {}
>> -};
>> -
>>  static struct platform_driver ramoops_driver = {
>>         .probe          = ramoops_probe,
>>         .remove         = ramoops_remove,
>>         .driver         = {
>> -               .name           = "ramoops",
>> -               .of_match_table = dt_match,
>> +               .name   = "ramoops",
>>         },
>>  };
>>
>> --
>> 2.9.2
>>
>
>
>
> --
> Kees Cook
> Chrome OS & Brillo Security
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
