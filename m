From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/2] dmaengine: Introduce DW AXI DMAC driver
Date: Tue, 20 Feb 2018 15:39:17 +0200
Message-ID: <CAHp75VdQ_tVG29+JdycoTg-0tBAxKa9dNvesU-b+f8RqhQf4Rw@mail.gmail.com>
References: <20180220123047.24469-1-Eugeniy.Paltsev@synopsys.com>
 <20180220123047.24469-2-Eugeniy.Paltsev@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180220123047.24469-2-Eugeniy.Paltsev@synopsys.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Cc: devicetree <devicetree@vger.kernel.org>, Vinod Koul <vinod.koul@intel.com>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, Rob Herring <robh+dt@kernel.org>, dmaengine <dmaengine@vger.kernel.org>, Dan Williams <dan.j.williams@intel.com>, linux-snps-arc@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 20, 2018 at 2:30 PM, Eugeniy Paltsev
<Eugeniy.Paltsev@synopsys.com> wrote:
> This patch adds support for the DW AXI DMAC controller.
> DW AXI DMAC is a part of HSDK development board from Synopsys.
>
> In this driver implementation only DMA_MEMCPY transfers are
> supported.

Just few comments, code looks fine I hope.

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13344,6 +13344,12 @@ F:     include/linux/dma/dw.h
>  F:     include/linux/platform_data/dma-dw.h
>  F:     drivers/dma/dw/
>
> +SYNOPSYS DESIGNWARE AXI DMAC DRIVER
> +M:     Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> +S:     Maintained
> +F:     drivers/dma/dwi-axi-dmac/
> +F:     Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.txt

AXI is earlier in alphabet than DMAC in previous record.

Linus even submitted a script last year to sort the MAINTAINERS data base.

> +/*
> + * Synopsys DesignWare AXI DMA Controller driver.
> + *
> + * Copyright (C) 2017-2018 Synopsys, Inc. (www.synopsys.com)
> + * Author: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + */

Now we have SPDX identifiers.

> +static u32 axi_chan_get_xfer_width(struct axi_dma_chan *chan, dma_addr_t src,
> +                                  dma_addr_t dst, size_t len)
> +{
> +       u32 max_width = chan->chip->dw->hdata->m_data_width;
> +
> +       return min_t(size_t, __ffs(src | dst | len), max_width);

size_t -> u32 ?

> +}

> +       unsigned int timeout = 20; /* timeout iterations */

> +       do  {
> +               if (axi_chan_irq_read(chan) & DWAXIDMAC_IRQ_SUSPENDED) {
> +                       ret = 0;
> +                       break;
> +               }
> +               udelay(2);
> +       } while (timeout--);

Off-by-one. You will have 21 tries here.

} while (--timeout);

-- 
With Best Regards,
Andy Shevchenko
