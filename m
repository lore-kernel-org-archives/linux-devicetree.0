From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] dma-mapping: fix debug print to display correct dma_pfn_offset
Date: Tue, 13 Jan 2015 14:02:54 -0600
Message-ID: <CAL_JsqJb2ufqwgHNUepiNs8NRa57caxacoEfVa6-RYT8HUfS5g@mail.gmail.com>
References: <1419262509-9811-1-git-send-email-m-karicheri2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1419262509-9811-1-git-send-email-m-karicheri2@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Murali Karicheri <m-karicheri2@ti.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 22, 2014 at 9:35 AM, Murali Karicheri <m-karicheri2@ti.com> wrote:
> fix the dev_dbg to display the offset which is the calculated
> dma_pfn_offset value and set later in the code.
>
> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>

Applied for 3.20. Thanks.

> ---
>  drivers/of/platform.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 5b33c6a..a54ec10 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -188,7 +188,7 @@ static void of_dma_configure(struct device *dev)
>                 size = dev->coherent_dma_mask;
>         } else {
>                 offset = PFN_DOWN(paddr - dma_addr);
> -               dev_dbg(dev, "dma_pfn_offset(%#08lx)\n", dev->dma_pfn_offset);
> +               dev_dbg(dev, "dma_pfn_offset(%#08lx)\n", offset);
>         }
>         dev->dma_pfn_offset = offset;
>
> --
> 1.7.9.5
>
