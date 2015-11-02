From: "M'boumba Cedric Madianga" <cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 0/4] Add support for STM32 DMA
Date: Mon, 2 Nov 2015 09:25:35 +0100
Message-ID: <CAOAejn3x4RR_4LNyx3QD1SpYnpbqbpyYLdxHvPg6_TTzodJTmA@mail.gmail.com>
References: <1445003956-9150-1-git-send-email-cedric.madianga@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445003956-9150-1-git-send-email-cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: M'boumba Cedric Madianga <cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

 Hi Vinod,

Do you have any further comments or suggestions on this serie ?

BR,
Cedric

2015-10-16 15:59 GMT+02:00 M'boumba Cedric Madianga <cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> This patchset adds support for the STM32 DMA controller.
> This controller provides 8 channels dedicated to managing memory access
> request from one or more peripherals.
> Each stream can have up to 8 requests in total.
>
> Changes since v3:
>  - Fix regression introduced in v3 during request channel
>  - Fix regression introduced in v3 for cyclic mode dma transfer
>  - update interrupt description in DT
>  - remove half transfer interrupt management as client callback as to be
>    called only for complete transfer
>
> Changes since v2:
>  - remove interrupt configuration management from DT (Mark)
>  - remove FIFO configuration management from DT except threshold as it is very
>    hard to handle it in the driver due to many possible combinations according
>    to burst and bus width (Mark)
>  - update DMA client message in DT documentation file
>  - specify the order to be used to set per-channel DMA interrupts in the DT
>    (Mark)
>  - remove unused enumerations for channel and request ids (Daniel)
>  - keep as soon as possible 80 lines char for more readability (Vinod)
>  - replace unsigned int by u32 (Vinod)
>  - use GFP_NOWAIT instead of GFP_ATOMIC during dma descriptors allocation
>    (Vinod)
>  - return error if burst is not supported in stm32_dma_get_burst() (Vinod)
>  - return error if bus_width is not supported in stm32_dma_get_width() (Vinod)
>  - add FIFO configuration management inside the driver except for threshold
>  - add interrupt configuration management inside the driver (Mark)
>  - rework stm32_dma_chan_irq() to handle error interrupt in one way (Vinod)
>  - rework stm32_dma_set_xfer_param() to be easier to read
>  - update stm32_dma_tx_status() to always return status from dma_cookie_status() (Vinod)
>  - disable clk if we don't manage to stop the DMA channel during channel
>    resources allocation (Daniel)
>  - set driver as built-in as DMA will be required by other built-in driver
>
>  Changes since v1:
>   - remove dmamux boolean as it is not needed
>   - replace dma by DMA in Kconfig (Maxime)
>   - add default return value in stm32_dma_get_width()
>   - add defalut return value in stm32_dma_get_burst()
>   - use lower case for constant hexadecimal values (Maxime)
>
> M'boumba Cedric Madianga (4):
>   dt-bindings: Document the STM32 DMA bindings
>   dmaengine: Add STM32 DMA driver
>   ARM: dts: Add STM32 DMA support for STM32F429 MCU
>   ARM: configs: Add STM32 DMA support in STM32 defconfig
>
>  .../devicetree/bindings/dma/stm32-dma.txt          |   82 ++
>  arch/arm/boot/dts/stm32f429.dtsi                   |   31 +
>  arch/arm/configs/stm32_defconfig                   |    2 +
>  drivers/dma/Kconfig                                |   12 +
>  drivers/dma/Makefile                               |    1 +
>  drivers/dma/stm32-dma.c                            | 1141 ++++++++++++++++++++
>  6 files changed, 1269 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/stm32-dma.txt
>  create mode 100644 drivers/dma/stm32-dma.c
>
> --
> 1.9.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
