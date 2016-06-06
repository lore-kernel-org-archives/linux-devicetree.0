From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 00/18]  Add support for FDMA DMA controller and xp70
 rproc found on STi chipsets
Date: Mon, 6 Jun 2016 10:31:48 +0530
Message-ID: <20160606050148.GX16910@localhost>
References: <1464192412-16386-1-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1464192412-16386-1-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, May 25, 2016 at 05:06:33PM +0100, Peter Griffin wrote:
> 
> Peter Griffin (18):
>   dmaengine: st_fdma: Add STMicroelectronics FDMA DT binding
>     documentation
>   dmaengine: st_fdma:  Add STMicroelectronics FDMA driver header file
>   dmaengine: st_fdma: Add STMicroelectronics FDMA engine driver support
>   dmaengine: st_fdma: Add xp70 firmware loading mechanism.
>   dmaengine: st_fdma: Add fdma suspend and resume callbacks.

I do not see the latter two patches in this series. Something is missed here
from cover to actual patches which is bit bizarre as one tends to generate
patches and cover together

>   ARM: STi: DT: STiH407: Add FDMA driver dt nodes.
>   MAINTAINERS: Add FDMA driver files to STi section.
>   ARM: multi_v7_defconfig: Enable STi FDMA driver
>   ASoC: sti: Update DT example to match the driver code
>   ASoC: sti: Update example to include assigned-clocks and mclk-fs
>   ARM: multi_v7_defconfig: Enable STi and simple-card drivers.
>   ARM: DT: STiH407: Add i2s_out pinctrl configuration
>   ARM: DT: STiH407: Add i2s_in pinctrl configuration
>   ARM: DT: STiH407: Add spdif_out pinctrl config
>   ARM: STi: DT: STiH407: Add sti-sasg-codec dt node
>   ARM: STi: DT: STiH407: Add uniperif player dt nodes
>   ARM: STi: DT: STiH407: Add uniperif reader dt nodes
>   ARM: DT: STi: stihxxx-b2120: Add DT nodes for STi audio card
> 
>  Documentation/devicetree/bindings/dma/st_fdma.txt  |   87 ++
>  .../devicetree/bindings/sound/st,sti-asoc-card.txt |   22 +-
>  MAINTAINERS                                        |    1 +
>  arch/arm/boot/dts/stih407-family.dtsi              |  164 +++
>  arch/arm/boot/dts/stih407-pinctrl.dtsi             |   55 +
>  arch/arm/boot/dts/stihxxx-b2120.dtsi               |   40 +
>  arch/arm/configs/multi_v7_defconfig                |    4 +
>  drivers/dma/Kconfig                                |   12 +
>  drivers/dma/Makefile                               |    1 +
>  drivers/dma/st_fdma.c                              | 1203 ++++++++++++++++++++
>  drivers/dma/st_fdma.h                              |  281 +++++
>  11 files changed, 1863 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/dma/st_fdma.txt
>  create mode 100644 drivers/dma/st_fdma.c
>  create mode 100644 drivers/dma/st_fdma.h

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
