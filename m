From: Rameshwar Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>
Subject: Re: [PATCH v5 0/3] dmaengine: APM X-Gene SoC DMA engine driver support
Date: Wed, 4 Feb 2015 15:08:31 +0530
Message-ID: <CAFd313zotqiG7rVDVthwRp=XiCOcgsRwQSmwpXyb8coSKnZYFg@mail.gmail.com>
References: <1422968107-23125-1-git-send-email-rsahu@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422968107-23125-1-git-send-email-rsahu-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ddutile-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Vinod,

Can you please review this patch set.


Thanks,
with regards,
Ram


On Tue, Feb 3, 2015 at 6:25 PM, Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org> wrote:
> This patch set implements the APM X-Gene SoC DMA driver
> support to offload the DMA operations such as memory copy(memcpy),
> scatter gathering.
>
> v5 changes:
>         1. Minor changes in coding style.
>         2. Added DMA_CTRL_ACK flag initialization
> v4 changes:
>         1. Fixed dma-ranges property on DTS.
>
> Signed-off-by: Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>
> Signed-off-by: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
> ---
>
> Rameshwar Prasad Sahu (3):
>   dmaengine: Add support for APM X-Gene SoC DMA engine driver
>   arm64: dts: Add APM X-Gene DMA device and DMA clock DTS nodes
>   Documentation: dma: Add APM X-Gene SoC DMA engine driver documentation
>
>  .../devicetree/bindings/dma/apm-xgene-dma.txt      |   49 +
>  arch/arm64/boot/dts/apm/apm-storm.dtsi             |   26 +
>  drivers/dma/Kconfig                                |    8 +
>  drivers/dma/Makefile                               |    1 +
>  drivers/dma/xgene-dma.c                            | 1597 ++++++++++++++++++++
>  5 files changed, 1681 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/apm-xgene-dma.txt
>  create mode 100755 drivers/dma/xgene-dma.c
>
> --
> 1.8.2.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
