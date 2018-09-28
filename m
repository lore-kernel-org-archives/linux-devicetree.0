MIME-Version: 1.0
Date: Fri, 28 Sep 2018 07:49:13 -0500
References: <20180926055803.19071-1-takahiro.akashi@linaro.org>
In-Reply-To: <20180926055803.19071-1-takahiro.akashi@linaro.org>
Message-ID: <CAL_JsqKVa2Xk-TJQ_U7bUJK6XXu2ZO36Jb8T3Rnr8uv0BQhwpg@mail.gmail.com>
Subject: Re: [PATCH] lib: add missing files from libfdt
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: "AKASHI, Takahiro" <takahiro.akashi@linaro.org>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Sep 26, 2018 at 12:57 AM AKASHI Takahiro
<takahiro.akashi@linaro.org> wrote:
>
> There are two files that are part of dtc/libfdt, but don't appear
> in lib. This patch fixes it.
> Please note that strtoul() used in fdt_overlay.c is now faked using
> kstrtoul() (not simple_strtoul() which is obsolute).
>
> Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> ---
>  lib/Makefile        |  2 +-
>  lib/fdt_addresses.c |  3 +++
>  lib/fdt_overlay.c   | 23 +++++++++++++++++++++++
>  3 files changed, 27 insertions(+), 1 deletion(-)
>  create mode 100644 lib/fdt_addresses.c
>  create mode 100644 lib/fdt_overlay.c
>
> diff --git a/lib/Makefile b/lib/Makefile
> index ca3f7ebb900d..444c82413a3c 100644
> --- a/lib/Makefile
> +++ b/lib/Makefile
> @@ -202,7 +202,7 @@ KASAN_SANITIZE_stackdepot.o := n
>  KCOV_INSTRUMENT_stackdepot.o := n
>
>  libfdt_files = fdt.o fdt_ro.o fdt_wip.o fdt_rw.o fdt_sw.o fdt_strerror.o \
> -              fdt_empty_tree.o
> +              fdt_empty_tree.o fdt_addresses.o fdt_overlay.o

Nothing in the kernel needs fdt_overlay.o, so we shouldn't add it
until we do. It used to bloat the kernel size, but maybe that changed
with using archive files now.

>  $(foreach file, $(libfdt_files), \
>         $(eval CFLAGS_$(file) = -I$(src)/../scripts/dtc/libfdt))
>  lib-$(CONFIG_LIBFDT) += $(libfdt_files)
> diff --git a/lib/fdt_addresses.c b/lib/fdt_addresses.c
> new file mode 100644
> index 000000000000..241780d09882
> --- /dev/null
> +++ b/lib/fdt_addresses.c
> @@ -0,0 +1,3 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <linux/libfdt_env.h>
> +#include "../scripts/dtc/libfdt/fdt_addresses.c"
> diff --git a/lib/fdt_overlay.c b/lib/fdt_overlay.c
> new file mode 100644
> index 000000000000..1def7268d313
> --- /dev/null
> +++ b/lib/fdt_overlay.c
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <linux/kernel.h>
> +#include <linux/libfdt_env.h>
> +
> +static unsigned long strtoul(const char *nptr, char **endptr, int base)
> +{
> +       unsigned long res;
> +       int ret;
> +
> +       /*
> +        * FIXME: no way to return a correct value of endptr.
> +        * The values here would be still good for use in fdt_overlay
> +        */
> +       *endptr = (char *)nptr;

endptr could be NULL.

> +       ret = kstrtoul(nptr, base, &res);

kstrtoul doesn't handle conversions if there are non-convertible
characters after the number while strtoul (including simple_strtoul)
will still do the conversion. We should make sure we don't need that
behavior. That's doubtful if callers pass non-NULL endptr.

> +       if (ret < 0)
> +               return ULONG_MAX;
> +
> +       (*endptr)++;
> +       return res;
> +}
> +
> +#include "../scripts/dtc/libfdt/fdt_overlay.c"
> --
> 2.18.0
>
