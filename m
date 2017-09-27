From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESEND PATCH v5 0/4] Add STM32 DMAMUX support
Date: Wed, 27 Sep 2017 16:06:31 +0530
Message-ID: <20170927103631.GL30097@localhost>
References: <1506065492-31478-1-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1506065492-31478-1-git-send-email-pierre-yves.mordret-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pierre-Yves MORDRET <pierre-yves.mordret-qxv4g6HH51o@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, M'boumba Cedric Madianga <cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Fabrice GASNIER <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>, Fabien DESSENNE <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, Amelie Delaunay <amelie.delaunay-qxv4g6HH51o@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 22, 2017 at 09:31:28AM +0200, Pierre-Yves MORDRET wrote:
> This patchset adds support for the STM32 DMA multiplexer.
> It allows to map any peripheral DMA request to any channel of the product
> DMAs.
> This IP has been introduced with STM32H7 SoC.

Applied first three patches, thanks

> ---
>  Version history:
>     v5:
>         * Set selected channel ID within a lock to avoid race condition.
>           Release if any error occurs
>     v4:
>         * Add multi-master ability for STM32 DMAMUX
>         * Get rid of st,dmamux property and custom API between STM32
>           DMAMUX and DMA. Bindings has changed.
>           DMAMUX will read DMA masters from Device Tree from now on.
>           Merely one DMAMUX node is needed now.
>         * Only STM32 DMA are allowed to be connected onto DMAMUX
>         * channelID is computed locally within the driver and crafted in
>           dma_psec to be passed toward DMA master.
>           DMAMUX router sorts out which DMA master will serve the
>           request automatically.
>         * This version forbids the use of DMA in standalone and DMAMUX at
>           the same time : all clients need to be connected either on DMA
>           or DMAMUX ; no mix up
>     v3:
>         * change compatible to st,stm32h7-dmamux to be mode Soc specific
>         * add verbosity in dma-cells
> ---
> 
> Pierre-Yves MORDRET (4):
>   dt-bindings: Document the STM32 DMAMUX bindings
>   dmaengine: Add STM32 DMAMUX driver
>   dt-bindings: stm32-dma: add a property to handle STM32 DMAMUX
>   ARM: configs: stm32: Add DMAMUX support in STM32 defconfig
> 
>  .../devicetree/bindings/dma/stm32-dma.txt          |   4 +-
>  .../devicetree/bindings/dma/stm32-dmamux.txt       |  84 ++++++
>  arch/arm/configs/stm32_defconfig                   |   1 +
>  drivers/dma/Kconfig                                |   9 +
>  drivers/dma/Makefile                               |   1 +
>  drivers/dma/stm32-dmamux.c                         | 327 +++++++++++++++++++++
>  6 files changed, 425 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/dma/stm32-dmamux.txt
>  create mode 100644 drivers/dma/stm32-dmamux.c
> 
> -- 
> 2.7.4
> 

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
