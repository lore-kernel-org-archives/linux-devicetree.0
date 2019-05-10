From: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH] arm64: add support for rng-seed
Date: Fri, 10 May 2019 15:37:31 +0800
Message-ID: <CAJMQK-hpA7rkaznW2REYbO=6rOvEMfJOvo6xxPkNb9o1VNUqTA@mail.gmail.com>
References: <20190507045433.542-1-hsinyi@chromium.org> <CAL_Jsq+rGeFKAPVmPvv_Z+G=BppKUK-tEUphBajZVxFtbRBJvQ@mail.gmail.com>
 <CAJMQK-iVhScf0ybZ85kqP0B5_QPoYZ9PZt35jHRUh8FNHKvu7w@mail.gmail.com>
 <CAL_JsqJZ+mOnrLWt0Cpo_Ybr_ohxwWom1qiyV8_EFocULde7=Q@mail.gmail.com>
 <CAJMQK-jjzYwX3NZAKJ-8ypjcN75o-ZX4iOVD=84JecEd4qV1bA@mail.gmail.com>
 <CAL_JsqLnmedF5cJYH+91U2Q_WX755O8TQs6Ue9mqtEiFKcjGWQ@mail.gmail.com>
 <CAJMQK-hJUG855+TqX=droOjUfb-MKnU0n0FYtr_SW2KByKAW1w@mail.gmail.com> <36fab640-b98e-9781-f96f-0ed988a71077@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <36fab640-b98e-9781-f96f-0ed988a71077@rasmusvillemoes.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Frank Rowand <frowand.list@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>, Michal Hocko <mhocko@suse.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, James Morse <james.morse@arm.com>, Andrew Murray <andrew.murray@arm.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>, Architecture Mailman List <boot-architecture@lists.linaro.org>, Kees Cook <keescook@chromium.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 10, 2019 at 2:14 PM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:

> So, why not just have the bootloader add whatever entropy it has via the
> commandline, which already gets mixed in? That requires no kernel
> changes, and works for all architectures.
>
> If anything, perhaps instead of just adding gobbledygook=abc123, make an
> official command line parameter (there was talk about this at some
> point), and have the kernel overwrite the value with xxx so it's not
> visible in /proc/cmdline.
>
> Rasmus

For some arch, besides commandline, we also need to overwrite bootargs
in fdt, otherwise it's still visible by
/sys/firmware/devicetree/base/chosen/bootargs for example.

Originally planned to land v2 as

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index de893c9616a1..96ea5eba9dd5 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -24,6 +24,7 @@
 #include <linux/debugfs.h>
 #include <linux/serial_core.h>
 #include <linux/sysfs.h>
+#include <linux/random.h>

 #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
 #include <asm/page.h>
@@ -1079,6 +1080,7 @@ int __init early_init_dt_scan_chosen(unsigned
long node, const char *uname,
 {
        int l;
        const char *p;
+       const void *rng_seed;

        pr_debug("search \"chosen\", depth: %d, uname: %s\n", depth, uname);

@@ -1113,6 +1115,15 @@ int __init early_init_dt_scan_chosen(unsigned
long node, const char *uname,

        pr_debug("Command line is: %s\n", (char*)data);

+       rng_seed = of_get_flat_dt_prop(node, "rng-seed", &l);
+       if (!rng_seed || l == 0)
+               return 1;
+
+       /* try to clear seed so it won't be found. */
+        fdt_nop_property(initial_boot_params, node, "rng-seed");
+
+        add_device_randomness(rng_seed, l);
+
        /* break now */
        return 1;
 }

(For arm64 RW/RO issue, it will be done in other patch.)

If we add parameter into commandline, I think we probably also need to
do similar changes here since there are fdt related overwrite.
