From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] fdt: add support for rng-seed
Date: Mon, 13 May 2019 08:14:40 -0500
Message-ID: <CAL_Jsq+Z5+M7fYCrkRKqN1yKTu6uyMKRKh-R4b-cj46y18hXOw@mail.gmail.com>
References: <20190513003819.356-1-hsinyi@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190513003819.356-1-hsinyi@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>, Kees Cook <keescook@chromium.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Architecture Mailman List <boot-architecture@lists.linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>, Michal Hocko <mhocko@suse.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Miles Chen <miles.chen@mediatek.com>, James Morse <james.morse@arm.com>
List-Id: devicetree@vger.kernel.org

On Sun, May 12, 2019 at 7:39 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Introducing a chosen node, rng-seed, which is an entropy that can be
> passed to kernel called very early to increase initial device
> randomness. Bootloader should provide this entropy and the value is
> read from /chosen/rng-seed in DT.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> change log:
> v1->v2:
> * call function in early_init_dt_scan_chosen
> * will add doc to devicetree-org/dt-schema on github if this is accepted
> ---
>  Documentation/devicetree/bindings/chosen.txt | 14 ++++++++++++++
>  drivers/of/fdt.c                             | 11 +++++++++++
>  2 files changed, 25 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
> index 45e79172a646..fef5c82672dc 100644
> --- a/Documentation/devicetree/bindings/chosen.txt
> +++ b/Documentation/devicetree/bindings/chosen.txt
> @@ -28,6 +28,20 @@ mode) when EFI_RNG_PROTOCOL is supported, it will be overwritten by
>  the Linux EFI stub (which will populate the property itself, using
>  EFI_RNG_PROTOCOL).
>
> +rng-seed
> +-----------
> +
> +This property served as an entropy to add device randomness. It is parsed
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
> index de893c9616a1..96ea5eba9dd5 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -24,6 +24,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/serial_core.h>
>  #include <linux/sysfs.h>
> +#include <linux/random.h>
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
> @@ -1113,6 +1115,15 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>
>         pr_debug("Command line is: %s\n", (char*)data);
>
> +       rng_seed = of_get_flat_dt_prop(node, "rng-seed", &l);
> +       if (!rng_seed || l == 0)
> +               return 1;

This only works if this hunk stays at the end of the function. I'd
invert the if and move the next 2 functions under it.

> +
> +       /* try to clear seed so it won't be found. */
> +        fdt_nop_property(initial_boot_params, node, "rng-seed");

I'd just delete the property.

Also, what about kexec? Don't you need to add a new seed?

> +
> +        add_device_randomness(rng_seed, l);
> +
>         /* break now */
>         return 1;
>  }
> --
> 2.20.1
>
