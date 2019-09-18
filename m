From: Evan Green <evgreen@chromium.org>
Subject: Re: [PATCH v3 3/5] memremap: Add support for read-only memory mappings
Date: Wed, 18 Sep 2019 12:37:34 -0700
Message-ID: <CAE=gft6YdNszcJV67CwcY2gOgPHrJ1+SnKMLr63f2bix2aZXXA@mail.gmail.com>
References: <20190910160903.65694-1-swboyd@chromium.org> <20190910160903.65694-4-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190910160903.65694-4-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Dan Williams <dan.j.williams@intel.com>, LKML <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 10, 2019 at 9:09 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Sometimes we have memories that are supposed to be read-only, but when
> we map these regions the best we can do is map them as write-back with
> MEMREMAP_WB. Introduce a read-only memory mapping (MEMREMAP_RO) that
> allows us to map reserved memory regions as read-only. This way, we're
> less likely to see these special memory regions become corrupted by
> stray writes to them.
>
> Cc: Evan Green <evgreen@chromium.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  include/linux/io.h |  1 +
>  kernel/iomem.c     | 20 +++++++++++++++++---
>  2 files changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/include/linux/io.h b/include/linux/io.h
> index accac822336a..15a63efcd153 100644
> --- a/include/linux/io.h
> +++ b/include/linux/io.h
> @@ -148,6 +148,7 @@ enum {
>         MEMREMAP_WC = 1 << 2,
>         MEMREMAP_ENC = 1 << 3,
>         MEMREMAP_DEC = 1 << 4,
> +       MEMREMAP_RO = 1 << 5,
>  };
>
>  void *memremap(resource_size_t offset, size_t size, unsigned long flags);
> diff --git a/kernel/iomem.c b/kernel/iomem.c
> index 62c92e43aa0d..6d76b7398714 100644
> --- a/kernel/iomem.c
> +++ b/kernel/iomem.c
> @@ -19,6 +19,13 @@ static void *arch_memremap_wb(resource_size_t offset, unsigned long size)
>  }
>  #endif
>
> +#ifndef arch_memremap_ro
> +static void *arch_memremap_ro(resource_size_t offset, unsigned long size)
> +{
> +       return NULL;
> +}
> +#endif
> +
>  #ifndef arch_memremap_can_ram_remap
>  static bool arch_memremap_can_ram_remap(resource_size_t offset, size_t size,
>                                         unsigned long flags)
> @@ -45,7 +52,7 @@ static void *try_ram_remap(resource_size_t offset, size_t size,
>   * @offset: iomem resource start address
>   * @size: size of remap
>   * @flags: any of MEMREMAP_WB, MEMREMAP_WT, MEMREMAP_WC,
> - *               MEMREMAP_ENC, MEMREMAP_DEC
> + *               MEMREMAP_ENC, MEMREMAP_DEC, MEMREMAP_RO
>   *
>   * memremap() is "ioremap" for cases where it is known that the resource
>   * being mapped does not have i/o side effects and the __iomem
> @@ -53,6 +60,9 @@ static void *try_ram_remap(resource_size_t offset, size_t size,
>   * mapping types will be attempted in the order listed below until one of
>   * them succeeds.
>   *
> + * MEMREMAP_RO - establish a mapping whereby writes are ignored/rejected.
> + * Attempts to map System RAM with this mapping type will fail.

Why should attempts to map RAM with this flag fail? MEMREMAP_WB will
allow RAM and quietly give you back the direct mapping, so it seems
like at least some values in this function allow RAM.

Oh, I see a comment below about "Enforce that this mapping is not
aliasing System RAM". I guess this is worried about cache coloring?
But is that a problem with RO mappings? I guess the RO mappings could
get partially stale, so if the memory were being updated out from
under you, you might see some updates but not others. Was that the
rationale?

> + *
>   * MEMREMAP_WB - matches the default mapping for System RAM on
>   * the architecture.  This is usually a read-allocate write-back cache.
>   * Moreover, if MEMREMAP_WB is specified and the requested remap region is RAM
> @@ -84,7 +94,10 @@ void *memremap(resource_size_t offset, size_t size, unsigned long flags)
>         }
>
>         /* Try all mapping types requested until one returns non-NULL */
> -       if (flags & MEMREMAP_WB) {
> +       if ((flags & MEMREMAP_RO) && is_ram != REGION_INTERSECTS)
> +               addr = arch_memremap_ro(offset, size);
> +
> +       if (!addr && (flags & MEMREMAP_WB)) {
>                 /*
>                  * MEMREMAP_WB is special in that it can be satisfied
>                  * from the direct map.  Some archs depend on the
> @@ -103,7 +116,8 @@ void *memremap(resource_size_t offset, size_t size, unsigned long flags)
>          * address mapping.  Enforce that this mapping is not aliasing
>          * System RAM.
>          */
> -       if (!addr && is_ram == REGION_INTERSECTS && flags != MEMREMAP_WB) {
> +       if (!addr && is_ram == REGION_INTERSECTS &&
> +           (flags != MEMREMAP_WB || flags != MEMREMAP_RO)) {

Isn't this condition always true? Did you mean flags != MEM_REMAP_WB
&& flags != MEMREMAP_RO?

>                 WARN_ONCE(1, "memremap attempted on ram %pa size: %#lx\n",
>                                 &offset, (unsigned long) size);
>                 return NULL;
> --
> Sent by a computer through tubes
>
