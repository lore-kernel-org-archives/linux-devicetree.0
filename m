From: Rameshwar Sahu <rsahu@apm.com>
Subject: Re: [PATCH v4 0/3] dmaengine: APM X-Gene SoC DMA engine driver support
Date: Fri, 30 Jan 2015 17:36:41 +0530
Message-ID: <CAFd313xzYj00+2_5_xquRrza2tBPAn16HP5R7DfCuFWFq+LchA@mail.gmail.com>
References: <1421838071-7347-1-git-send-email-rsahu@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1421838071-7347-1-git-send-email-rsahu@apm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vinod.koul@intel.com, dan.j.williams@intel.com
Cc: dmaengine@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ddutile@redhat.com, jcm@redhat.com, patches@apm.com, Rameshwar Prasad Sahu <rsahu@apm.com>, Loc Ho <lho@apm.com>
List-Id: devicetree@vger.kernel.org

Hi All,

Any comments on this patch set.


Thanks,
with regards,
Ram


On Wed, Jan 21, 2015 at 4:31 PM, Rameshwar Prasad Sahu <rsahu@apm.com> wrote:
> This patch set implements the APM X-Gene SoC DMA driver
> support to offload the DMA operations such as memory copy(memcpy),
> scatter gathering.
>
> v4 changes:
>         1. Fixed dma-ranges property on DTS.
>
> Signed-off-by: Rameshwar Prasad Sahu <rsahu@apm.com>
> Signed-off-by: Loc Ho <lho@apm.com>
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
>  drivers/dma/xgene-dma.c                            | 1566 ++++++++++++++++++++
>  5 files changed, 1650 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/apm-xgene-dma.txt
>  create mode 100644 drivers/dma/xgene-dma.c
>
> --
> 1.8.2.1
>
