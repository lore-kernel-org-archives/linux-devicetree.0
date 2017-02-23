MIME-Version: 1.0
In-Reply-To: <d801f4ad948b5029ae3d482f2a55d05bcf35f91f.1487314667.git.joe@perches.com>
References: <cover.1487314666.git.joe@perches.com>
	<d801f4ad948b5029ae3d482f2a55d05bcf35f91f.1487314667.git.joe@perches.com>
Date: Thu, 23 Feb 2017 10:00:25 -0600
Message-ID: <CAL_JsqLQKE1Fpt48KvEBsysYw81ctBoQyeA2rqWsbS9Q5AwZag@mail.gmail.com>
Subject: Re: [PATCH 25/35] drivers/of: Convert remaining uses of pr_warning to pr_warn
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset=UTF-8
To: Joe Perches <joe@perches.com>
Cc: Frank Rowand <frowand.list@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Fri, Feb 17, 2017 at 1:11 AM, Joe Perches <joe@perches.com> wrote:
> To enable eventual removal of pr_warning
>
> This makes pr_warn use consistent for drivers/of
>
> Prior to this patch, there were 5 uses of pr_warning and
> 19 uses of pr_warn in drivers/of
>
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>  drivers/of/fdt.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index e5ce4b59e162..b9b1dc75e05d 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -514,8 +514,8 @@ static void *__unflatten_device_tree(const void *blob,
>         /* Second pass, do actual unflattening */
>         unflatten_dt_nodes(blob, mem, dad, mynodes);
>         if (be32_to_cpup(mem + size) != 0xdeadbeef)
> -               pr_warning("End of tree marker overwritten: %08x\n",
> -                          be32_to_cpup(mem + size));
> +               pr_warn("End of tree marker overwritten: %08x\n",
> +                       be32_to_cpup(mem + size));
>
>         if (detached && mynodes) {
>                 of_node_set_flag(*mynodes, OF_DETACHED);
> @@ -1133,25 +1133,25 @@ void __init __weak early_init_dt_add_memory_arch(u64 base, u64 size)
>         size &= PAGE_MASK;
>
>         if (base > MAX_MEMBLOCK_ADDR) {
> -               pr_warning("Ignoring memory block 0x%llx - 0x%llx\n",
> -                               base, base + size);
> +               pr_warn("Ignoring memory block 0x%llx - 0x%llx\n",
> +                       base, base + size);
>                 return;
>         }
>
>         if (base + size - 1 > MAX_MEMBLOCK_ADDR) {
> -               pr_warning("Ignoring memory range 0x%llx - 0x%llx\n",
> -                               ((u64)MAX_MEMBLOCK_ADDR) + 1, base + size);
> +               pr_warn("Ignoring memory range 0x%llx - 0x%llx\n",
> +                       ((u64)MAX_MEMBLOCK_ADDR) + 1, base + size);
>                 size = MAX_MEMBLOCK_ADDR - base + 1;
>         }
>
>         if (base + size < phys_offset) {
> -               pr_warning("Ignoring memory block 0x%llx - 0x%llx\n",
> -                          base, base + size);
> +               pr_warn("Ignoring memory block 0x%llx - 0x%llx\n",
> +                       base, base + size);
>                 return;
>         }
>         if (base < phys_offset) {
> -               pr_warning("Ignoring memory range 0x%llx - 0x%llx\n",
> -                          base, phys_offset);
> +               pr_warn("Ignoring memory range 0x%llx - 0x%llx\n",
> +                       base, phys_offset);
>                 size -= phys_offset - base;
>                 base = phys_offset;
>         }
> --
> 2.10.0.rc2.1.g053435c
>
