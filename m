From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 03/11] of: address: Report of_dma_get_range() errors meaningfully
Date: Fri, 27 Sep 2019 11:15:58 +0200
Message-ID: <CAMuHMdV5Dw2FZcp6K7Kytzxtp7apEQ0FuE1CiOi+R4QVDrhM3A@mail.gmail.com>
References: <20190927002455.13169-1-robh@kernel.org> <20190927002455.13169-4-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190927002455.13169-4-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Robin Murphy <robin.murphy@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, Frank Rowand <frowand.list@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Marek Vasut <marek.vasut@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Oza Pawandeep <oza.oza@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 27, 2019 at 2:25 AM Rob Herring <robh@kernel.org> wrote:
> From: Robin Murphy <robin.murphy@arm.com>
>
> If we failed to translate a DMA address, at least show the offending
> address rather than the uninitialised contents of the destination
> argument.
>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> ---
>  drivers/of/address.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 8e354d12fb04..53d2656c2269 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -955,8 +955,8 @@ int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr, u64 *siz
>         dmaaddr = of_read_number(ranges, naddr);
>         *paddr = of_translate_dma_address(np, ranges);
>         if (*paddr == OF_BAD_ADDR) {
> -               pr_err("translation of DMA address(%pad) to CPU address failed node(%pOF)\n",

Yeah, the %pad was wrong on 32-bit without CONFIG_PHYS_ADDR_T_64BIT.

> -                      dma_addr, np);
> +               pr_err("translation of DMA address(%llx) to CPU address failed node(%pOF)\n",
> +                      dmaaddr, np);
>                 ret = -EINVAL;
>                 goto out;
>         }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
