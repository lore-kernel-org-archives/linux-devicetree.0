From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH] dma: of: Move the functions under CONFIG_OF_DMA instead
 of CONFIG_OF
Date: Fri, 28 Feb 2014 10:03:10 -0500
Message-ID: <5310A52E.90908@ti.com>
References: <1393546850-13907-1-git-send-email-santosh.shilimkar@ti.com>
 <6287295.Q1WPJPjeZV@wuerfel> <53109C1B.2030606@ti.com>
 <5615884.O4eVkOuQqe@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5615884.O4eVkOuQqe@wuerfel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Friday 28 February 2014 09:47 AM, Arnd Bergmann wrote:
> On Friday 28 February 2014 09:24:27 Santosh Shilimkar wrote:
>> So for ARM 'allnoconfig' build we have CONFIG_OF enabled but
>> CONFIG_DMA_OF disabled. With that the of-dma.c gets compiled
>> out leaving the functions from of-dma.h undefined. I noticed
>> this while adding couple of exports in of_dma.h
> 
> Looking at current linux-next, I find
> 
> Kconfig:
> 
> menuconfig DMADEVICES
>         bool "DMA Engine support"
> ...
> if DMADEVICES
> 
> config DMA_OF
>         def_bool y
>         depends on OF
> 
> endif
> 
> This means that DMA_OF is disabled in 'allnoconfig' since DMADEVICES
> is also disabled, as you say. The Makefile looks like
> 
> obj-$(CONFIG_DMA_OF) += of-dma.o
> 
> As of 5fa422c922c25 "dmaengine: move drivers/of/dma.c -> drivers/dma/of-dma.c"
> 
> which seems to solve the problem already.
> 
>> I am not sure but we added couple of functions for dma-ranges
>> and dma-coherent which gets called from generic code.
> 
> These functions have nothing to do with the dmaengine code though,
> they should be in a different file.
> 
Any suggestion on different file ?
