From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v3] pstore-ram: add Device Tree bindings
Date: Thu, 7 Jan 2016 16:23:10 -0800
Message-ID: <CAGXu5j+DGf8_C+=bP1mJ69+XCnLaAjZJrSneOAkFjyMnWHJ-zQ@mail.gmail.com>
References: <1452210056-14436-1-git-send-email-ghackmann@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452210056-14436-1-git-send-email-ghackmann@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Hackmann <ghackmann@google.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, John Stultz <john.stultz@linaro.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 7, 2016 at 3:40 PM, Greg Hackmann <ghackmann@google.com> wrote:
> ramoops is one of the remaining places where ARM vendors still rely on
> board-specific shims.  Device Tree lets us replace those shims with
> generic code.
>
> These bindings mirror the ramoops module parameters, with two small
> differences:
>
> (1) dump_oops becomes an optional "no-dump-oops" property, since ramoops
>     sets dump_oops=1 by default.
>
> (2) mem_type=1 becomes the more self-explanatory "unbuffered" property.
>
> Signed-off-by: Greg Hackmann <ghackmann@google.com>

Acked-by: Kees Cook <keescook@chromium.org>

Thanks!

-Kees

> ---
> Changes in V3:
> - documentation fixes
> - look for "no-ram-oops" property as documented
>
> Changes in V2:
> - make DT binding documentation more generic
>
>  Documentation/devicetree/bindings/misc/ramoops.txt |  43 ++++++++
>  Documentation/ramoops.txt                          |   6 +-
>  fs/pstore/ram.c                                    | 110 ++++++++++++++++++++-
>  3 files changed, 155 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/misc/ramoops.txt
>
> diff --git a/Documentation/devicetree/bindings/misc/ramoops.txt b/Documentation/devicetree/bindings/misc/ramoops.txt
> new file mode 100644
> index 0000000..5a475fa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/ramoops.txt
> @@ -0,0 +1,43 @@
> +Ramoops oops/panic logger
> +=========================
> +
> +ramoops provides persistent RAM storage for oops and panics, so they can be
> +recovered after a reboot.
> +
> +Parts of this storage may be set aside for other persistent log buffers, such
> +as kernel log messages, or for optional ECC error-correction data.  The total
> +size of these optional buffers must fit in the reserved region.
> +
> +Any remaining space will be used for a circular buffer of oops and panic
> +records.  These records have a configurable size, with a size of 0 indicating
> +that they should be disabled.
> +
> +
> +Required properties:
> +
> +- compatible: must be "ramoops"
> +
> +- memory-region: phandle to a region of memory that is preserved between reboots
> +
> +
> +Optional properties:
> +
> +- ecc-size: enables ECC support and specifies ECC buffer size in bytes
> +  (defaults to no ECC)
> +
> +- record-size: maximum size in bytes of each dump done on oops/panic
> +  (defaults to 0)
> +
> +- console-size: size in bytes of log buffer reserved for kernel messages
> +  (defaults to 0)
> +
> +- ftrace-size: size in bytes of log buffer reserved for function tracing and
> +  profiling (defaults to 0)
> +
> +- pmsg-size: size in bytes of log buffer reserved for userspace messages
> +  (defaults to 0)
> +
> +- unbuffered: if present, use unbuffered mappings to map the reserved region
> +  (defaults to buffered mappings)
> +
> +- no-dump-oops: if present, only dump panics (defaults to panics and oops)
> diff --git a/Documentation/ramoops.txt b/Documentation/ramoops.txt
> index 5d86756..9264bca 100644
> --- a/Documentation/ramoops.txt
> +++ b/Documentation/ramoops.txt
> @@ -45,7 +45,7 @@ corrupt, but usually it is restorable.
>
>  2. Setting the parameters
>
> -Setting the ramoops parameters can be done in 2 different manners:
> +Setting the ramoops parameters can be done in 3 different manners:
>   1. Use the module parameters (which have the names of the variables described
>   as before).
>   For quick debugging, you can also reserve parts of memory during boot
> @@ -54,7 +54,9 @@ Setting the ramoops parameters can be done in 2 different manners:
>   kernel to use only the first 128 MB of memory, and place ECC-protected ramoops
>   region at 128 MB boundary:
>   "mem=128M ramoops.mem_address=0x8000000 ramoops.ecc=1"
> - 2. Use a platform device and set the platform data. The parameters can then
> + 2. Use Device Tree bindings, as described in
> + Documentation/device-tree/bindings/misc/ramoops.txt.
> + 3. Use a platform device and set the platform data. The parameters can then
>   be set through that platform data. An example of doing that is:
>
>  #include <linux/pstore_ram.h>
> diff --git a/fs/pstore/ram.c b/fs/pstore/ram.c
> index 319c3a6..0f2912c 100644
> --- a/fs/pstore/ram.c
> +++ b/fs/pstore/ram.c
> @@ -34,6 +34,8 @@
>  #include <linux/slab.h>
>  #include <linux/compiler.h>
>  #include <linux/pstore_ram.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
>
>  #define RAMOOPS_KERNMSG_HDR "===="
>  #define MIN_MEM_SIZE 4096UL
> @@ -458,15 +460,112 @@ static int ramoops_init_prz(struct device *dev, struct ramoops_context *cxt,
>         return 0;
>  }
>
> +static int ramoops_parse_dt_size(struct platform_device *pdev,
> +               const char *propname, unsigned long *val)
> +{
> +       u64 val64;
> +       int ret;
> +
> +       ret = of_property_read_u64(pdev->dev.of_node, propname, &val64);
> +       if (ret == -EINVAL) {
> +               *val = 0;
> +               return 0;
> +       } else if (ret != 0) {
> +               dev_err(&pdev->dev, "failed to parse property %s: %d\n",
> +                               propname, ret);
> +               return ret;
> +       }
> +
> +       if (val64 > ULONG_MAX) {
> +               dev_err(&pdev->dev, "invalid %s %llu\n", propname, val64);
> +               return -EOVERFLOW;
> +       }
> +
> +       *val = val64;
> +       return 0;
> +}
> +
> +static int ramoops_parse_dt(struct platform_device *pdev,
> +               struct ramoops_platform_data *pdata)
> +{
> +       struct device_node *of_node = pdev->dev.of_node;
> +       struct device_node *mem_region;
> +       struct resource res;
> +       u32 ecc_size;
> +       int ret;
> +
> +       dev_dbg(&pdev->dev, "using Device Tree\n");
> +
> +       mem_region = of_parse_phandle(of_node, "memory-region", 0);
> +       if (!mem_region) {
> +               dev_err(&pdev->dev, "no memory-region phandle\n");
> +               return -ENODEV;
> +       }
> +
> +       ret = of_address_to_resource(mem_region, 0, &res);
> +       of_node_put(mem_region);
> +       if (ret) {
> +               dev_err(&pdev->dev, "failed to translate memory-region to resource: %d\n",
> +                               ret);
> +               return ret;
> +       }
> +
> +       pdata->mem_size = resource_size(&res);
> +       pdata->mem_address = res.start;
> +       pdata->mem_type = of_property_read_bool(of_node, "unbuffered");
> +       pdata->dump_oops = !of_property_read_bool(of_node, "no-dump-oops");
> +
> +       ret = ramoops_parse_dt_size(pdev, "record-size", &pdata->record_size);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret = ramoops_parse_dt_size(pdev, "console-size", &pdata->console_size);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret = ramoops_parse_dt_size(pdev, "ftrace-size", &pdata->ftrace_size);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret = ramoops_parse_dt_size(pdev, "pmsg-size", &pdata->pmsg_size);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret = of_property_read_u32(of_node, "ecc-size", &ecc_size);
> +       if (ret == 0) {
> +               if (ecc_size > INT_MAX) {
> +                       dev_err(&pdev->dev, "invalid ecc-size %u\n", ecc_size);
> +                       return -EOVERFLOW;
> +               }
> +               pdata->ecc_info.ecc_size = ecc_size;
> +       } else if (ret != -EINVAL) {
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
>  static int ramoops_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
> -       struct ramoops_platform_data *pdata = pdev->dev.platform_data;
> +       struct ramoops_platform_data *pdata = platform_get_drvdata(pdev);
>         struct ramoops_context *cxt = &oops_cxt;
>         size_t dump_mem_sz;
>         phys_addr_t paddr;
>         int err = -EINVAL;
>
> +       if (dev->of_node && !pdata) {
> +               pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
> +               if (!pdata) {
> +                       err = -ENOMEM;
> +                       goto fail_out;
> +               }
> +
> +               err = ramoops_parse_dt(pdev, pdata);
> +               if (err < 0)
> +                       goto fail_out;
> +       }
> +
>         /* Only a single ramoops area allowed at a time, so fail extra
>          * probes.
>          */
> @@ -561,6 +660,7 @@ static int ramoops_probe(struct platform_device *pdev)
>                 cxt->size, (unsigned long long)cxt->phys_addr,
>                 cxt->ecc_info.ecc_size, cxt->ecc_info.block_size);
>
> +       platform_set_drvdata(pdev, pdata);
>         return 0;
>
>  fail_buf:
> @@ -596,11 +696,17 @@ static int ramoops_remove(struct platform_device *pdev)
>         return 0;
>  }
>
> +static const struct of_device_id dt_match[] = {
> +       { .compatible = "ramoops" },
> +       {}
> +};
> +
>  static struct platform_driver ramoops_driver = {
>         .probe          = ramoops_probe,
>         .remove         = ramoops_remove,
>         .driver         = {
> -               .name   = "ramoops",
> +               .name           = "ramoops",
> +               .of_match_table = dt_match,
>         },
>  };
>
> --
> 2.6.0.rc2.230.g3dd15c0
>



-- 
Kees Cook
Chrome OS & Brillo Security
