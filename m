From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 4/7] of: configure the platform device dma parameters
Date: Tue, 06 May 2014 11:40:38 +0200
Message-ID: <7182186.5Q53eQg77F@wuerfel>
References: <1398353407-2345-1-git-send-email-santosh.shilimkar@ti.com>
 <CAL_Jsq+nh26NZXx-9Y5FTxWZdVrG7aLTOBhC4j9P8mPPvUu2ag@mail.gmail.com>
 <536806F4.1090904@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <536806F4.1090904@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Santosh Shilimkar <santosh.shilimkar@ti.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Russell King <linux@arm.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Monday 05 May 2014 17:47:32 Santosh Shilimkar wrote:

> +       dev->coherent_dma_mask = DMA_BIT_MASK(32);
> +       if (!dev->dma_mask)
> +               dev->dma_mask = &dev->coherent_dma_mask;
> +
> +       /*
> +        * if dma-ranges property doesn't exist - just return else
> +        * setup the dma offset
> +        */
> +       ret = of_dma_get_range(dev->of_node, &dma_addr, &paddr, &size);
> +       if (ret < 0) {
> +               dev_dbg(dev, "no dma range information to setup\n");
> +               return;
> +       }
> +
> +       /* DMA ranges found. Calculate and set dma_pfn_offset */
> +       dev->dma_pfn_offset = PFN_DOWN(paddr - dma_addr);
> +       dev_dbg(dev, "dma_pfn_offset(%#08lx)\n", dev->dma_pfn_offset);
> +}

I think there should at least be a comment about why we are computing
the correct DMA mask here and then ignore that and just use DMA_BIT_MASK(32)
instead. I understand that Russell and Rob prefer it that way and I'm not
going to argue, but I find it counterintuitive and I think it deserves
an explanation in the source code for anybody who is trying to figure
out how things fit together.

	Arnd
