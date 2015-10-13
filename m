From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2] of: Check for overlap in reserved memory regions
Date: Tue, 13 Oct 2015 15:13:04 -0500
Message-ID: <CAL_JsqLFb+qF20q77KzLzPL30QZutXUY1wvOY284Xt9U0k-csQ@mail.gmail.com>
References: <1442367036-15205-1-git-send-email-mitchelh@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1442367036-15205-1-git-send-email-mitchelh@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mitchel Humpherys <mitchelh@codeaurora.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 15, 2015 at 8:30 PM, Mitchel Humpherys
<mitchelh@codeaurora.org> wrote:
> Any overlap in the reserved memory regions (those specified in the
> reserved-memory DT node) is a bug.  These bugs might go undetected as
> long as the contested region isn't used simultaneously by multiple
> software agents, which makes such bugs hard to debug.  Fix this by
> printing a scary warning during boot if overlap is detected.
>
> Signed-off-by: Mitchel Humpherys <mitchelh@codeaurora.org>

Applied this a while ago, but didn't reply here.

Rob

> ---
> v1..v2:
>   - Suggestions from Rob Herring (remove superfluous array and
>     print statement)
> ---
>  drivers/of/of_reserved_mem.c | 43 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 42 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 726ebe792813..62f467b8ccae 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -1,7 +1,7 @@
>  /*
>   * Device tree based initialization code for reserved memory.
>   *
> - * Copyright (c) 2013, The Linux Foundation. All Rights Reserved.
> + * Copyright (c) 2013, 2015 The Linux Foundation. All Rights Reserved.
>   * Copyright (c) 2013,2014 Samsung Electronics Co., Ltd.
>   *             http://www.samsung.com
>   * Author: Marek Szyprowski <m.szyprowski@samsung.com>
> @@ -20,6 +20,7 @@
>  #include <linux/mm.h>
>  #include <linux/sizes.h>
>  #include <linux/of_reserved_mem.h>
> +#include <linux/sort.h>
>
>  #define MAX_RESERVED_REGIONS   16
>  static struct reserved_mem reserved_mem[MAX_RESERVED_REGIONS];
> @@ -197,12 +198,52 @@ static int __init __reserved_mem_init_node(struct reserved_mem *rmem)
>         return -ENOENT;
>  }
>
> +static int __init __rmem_cmp(const void *a, const void *b)
> +{
> +       const struct reserved_mem *ra = a, *rb = b;
> +
> +       return ra->base - rb->base;
> +}
> +
> +static void __init __rmem_check_for_overlap(void)
> +{
> +       int i;
> +
> +       if (reserved_mem_count < 2)
> +               return;
> +
> +       sort(reserved_mem, reserved_mem_count, sizeof(reserved_mem[0]),
> +            __rmem_cmp, NULL);
> +       for (i = 0; i < reserved_mem_count - 1; i++) {
> +               struct reserved_mem *this, *next;
> +
> +               this = &reserved_mem[i];
> +               next = &reserved_mem[i + 1];
> +               if (!(this->base && next->base))
> +                       continue;
> +               if (this->base + this->size > next->base) {
> +                       phys_addr_t this_end, next_end;
> +
> +                       this_end = this->base + this->size;
> +                       next_end = next->base + next->size;
> +                       WARN(1,
> +                            "Reserved memory: OVERLAP DETECTED!\n%s (%pa--%pa) overlaps with %s (%pa--%pa)\n",
> +                            this->name, &this->base, &this_end,
> +                            next->name, &next->base, &next_end);
> +               }
> +       }
> +}
> +
>  /**
>   * fdt_init_reserved_mem - allocate and init all saved reserved memory regions
>   */
>  void __init fdt_init_reserved_mem(void)
>  {
>         int i;
> +
> +       /* check for overlapping reserved regions */
> +       __rmem_check_for_overlap();
> +
>         for (i = 0; i < reserved_mem_count; i++) {
>                 struct reserved_mem *rmem = &reserved_mem[i];
>                 unsigned long node = rmem->fdt_node;
> --
> Qualcomm Innovation Center, Inc.
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
