From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v4 0/2] dmaengine: add UniPhier MIO DMAC driver
Date: Tue, 6 Nov 2018 22:19:15 +0900
Message-ID: <CAK7LNASsbpC53aiQGRdQaukFOLX_ZN09ZOPU1CqF_bsR2u01hQ@mail.gmail.com>
References: <1539276063-5103-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1539276063-5103-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>, "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dan Williams <dan.j.williams@intel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 12, 2018 at 1:42 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> 1/2: DT-binding
> 2/2: driver
>


Gentle ping...



> Masahiro Yamada (2):
>   dt-bindings: dmaengine: add DT binding for UniPhier MIO DMAC
>   dmaengine: uniphier-mdmac: add UniPhier MIO DMAC driver
>
>  .../devicetree/bindings/dma/uniphier-mio-dmac.txt  |  25 +
>  MAINTAINERS                                        |   1 +
>  drivers/dma/Kconfig                                |  11 +
>  drivers/dma/Makefile                               |   1 +
>  drivers/dma/uniphier-mdmac.c                       | 506 +++++++++++++++++++++
>  5 files changed, 544 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/uniphier-mio-dmac.txt
>  create mode 100644 drivers/dma/uniphier-mdmac.c
>
> --
> 2.7.4
>


--
Best Regards
Masahiro Yamada
