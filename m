From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] of/fdt: Make fdt blob input parameters of unflatten
 functions const
Date: Fri, 29 May 2015 10:00:02 -0500
Message-ID: <CAL_JsqK31qK2aQGGv2Gzh3RiHZ8fzeT=VR2+poxemcXm8wzkXA@mail.gmail.com>
References: <1431527636-14009-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431527636-14009-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 13, 2015 at 9:33 AM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Operations to unflatten fdt blobs never modify the input blobs, hence
> make them const. Now we no longer need to cast arbitrary const data to
> "void *" when calling of_fdt_unflatten_tree().
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thanks.

Rob

> ---
>  drivers/of/fdt.c       | 6 +++---
>  include/linux/of_fdt.h | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index caa6bc447165636f..5e83687c090f7ee2 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -168,7 +168,7 @@ static void *unflatten_dt_alloc(void **mem, unsigned long size,
>   * @dad: Parent struct device_node
>   * @fpsize: Size of the node path up at the current depth.
>   */
> -static void * unflatten_dt_node(void *blob,
> +static void * unflatten_dt_node(const void *blob,
>                                 void *mem,
>                                 int *poffset,
>                                 struct device_node *dad,
> @@ -378,7 +378,7 @@ static void * unflatten_dt_node(void *blob,
>   * @dt_alloc: An allocator that provides a virtual address to memory
>   * for the resulting tree
>   */
> -static void __unflatten_device_tree(void *blob,
> +static void __unflatten_device_tree(const void *blob,
>                              struct device_node **mynodes,
>                              void * (*dt_alloc)(u64 size, u64 align))
>  {
> @@ -441,7 +441,7 @@ static void *kernel_tree_alloc(u64 size, u64 align)
>   * pointers of the nodes so the normal device-tree walking functions
>   * can be used.
>   */
> -void of_fdt_unflatten_tree(unsigned long *blob,
> +void of_fdt_unflatten_tree(const unsigned long *blob,
>                         struct device_node **mynodes)
>  {
>         __unflatten_device_tree(blob, mynodes, &kernel_tree_alloc);
> diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
> index 587ee507965d78a1..0cf217d404ce4660 100644
> --- a/include/linux/of_fdt.h
> +++ b/include/linux/of_fdt.h
> @@ -37,7 +37,7 @@ extern bool of_fdt_is_big_endian(const void *blob,
>                                  unsigned long node);
>  extern int of_fdt_match(const void *blob, unsigned long node,
>                         const char *const *compat);
> -extern void of_fdt_unflatten_tree(unsigned long *blob,
> +extern void of_fdt_unflatten_tree(const unsigned long *blob,
>                                struct device_node **mynodes);
>
>  /* TBD: Temporary export of fdt globals - remove when code fully merged */
> --
> 1.9.1
>
