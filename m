From: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v4 2/3] fdt: add support for rng-seed
Date: Mon, 20 May 2019 07:54:47 +0800
Message-ID: <CANMq1KB7sh=UXaM4sMm_THjZ_wV3Thgr6_ona-TJFqA2QQHALA@mail.gmail.com>
References: <20190519160446.320-1-hsinyi@chromium.org> <20190519160446.320-2-hsinyi@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190519160446.320-2-hsinyi@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Miles Chen <miles.chen@mediatek.com>, James Morse <james.morse@arm.com>, Andrew Murray <andrew.murray@arm.com>, Mark Rutland <mark.rutland@arm.com>, Jun Yao <yaojun8558363@gmail.com>, Yu Zhao <yuzhao@google.com>, Robin Murphy <robin.murphy@arm.com>, Laura Abbott <labbott@redhat.com>, Stephen Boyd <swboyd@chromium.org>, Kees Cook <keescook@chromium.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 20, 2019 at 1:09 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Introducing a chosen node, rng-seed, which is an entropy that can be
> passed to kernel called very early to increase initial device
> randomness. Bootloader should provide this entropy and the value is
> read from /chosen/rng-seed in DT.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> change log v2->v4:
> * v3 abandoned
> * fix doc error
> ---
>  Documentation/devicetree/bindings/chosen.txt | 14 ++++++++++++++
>  drivers/of/fdt.c                             | 10 ++++++++++
>  2 files changed, 24 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
> index 45e79172a646..678e81bc4383 100644
> --- a/Documentation/devicetree/bindings/chosen.txt
> +++ b/Documentation/devicetree/bindings/chosen.txt
> @@ -28,6 +28,20 @@ mode) when EFI_RNG_PROTOCOL is supported, it will be overwritten by
>  the Linux EFI stub (which will populate the property itself, using
>  EFI_RNG_PROTOCOL).
>
> +rng-seed
> +-----------
> +
> +This property serves as an entropy to add device randomness. It is parsed
> +as a byte array, e.g.
> +
> +/ {
> +       chosen {
> +               rng-seed = <0x31 0x95 0x1b 0x3c 0xc9 0xfa 0xb3 ...>;
> +       };
> +};
> +
> +This random value should be provided by bootloader.
> +
>  stdout-path
>  -----------
>
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index de893c9616a1..7f3d72921b23 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -24,6 +24,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/serial_core.h>
>  #include <linux/sysfs.h>
> +#include <linux/random.h>

Alphabetical order.

>
>  #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
>  #include <asm/page.h>
> @@ -1079,6 +1080,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>  {
>         int l;
>         const char *p;
> +       const void *rng_seed;
>
>         pr_debug("search \"chosen\", depth: %d, uname: %s\n", depth, uname);
>
> @@ -1113,6 +1115,14 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>
>         pr_debug("Command line is: %s\n", (char*)data);
>
> +       rng_seed = of_get_flat_dt_prop(node, "rng-seed", &l);
> +       if (rng_seed && l > 0) {
> +               add_device_randomness(rng_seed, l);
> +
> +               /* try to clear seed so it won't be found. */
> +               fdt_delprop(initial_boot_params, node, "rng-seed");

I'm a little bit concerned about this, as we really want the rng-seed
value to be wiped, and not kept in memory (even if it's hard to
access).

IIUC, fdt_delprop splices the device tree, so it'll override
"rng-seed" property with whatever device tree entries follow it.
However, if rng-seed is the last property (or if the entries that
follow are smaller than rng-seed), the seed will stay in memory (or
part of it).

fdt_nop_property in v2 would erase it for sure. I don't know if there
is a way to make sure that rng-seed is removed for good while still
deleting the property (maybe modify fdt_splice_ to do a memset(.., 0)
of the moved chunk?).


> +       }
> +
>         /* break now */
>         return 1;
>  }
> --
> 2.20.1
>
