From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v3 0/2] dmaengine: add UniPhier MIO DMAC driver
Date: Mon, 1 Oct 2018 21:23:39 +0900
Message-ID: <CAK7LNAQsGKSnBmrfEAwgoieizho8WCif_M3NuxtSe3+6Qo6vxg@mail.gmail.com>
References: <1536799869-10643-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1536799869-10643-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>, "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dan Williams <dan.j.williams@intel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Vinod,


2018=E5=B9=B49=E6=9C=8813=E6=97=A5(=E6=9C=A8) 9:52 Masahiro Yamada <yamada.=
masahiro@socionext.com>:
>
> 1/2: DT-binding
> 2/2: driver


If there is no more comment,
is this series applicable for v4.20-rc1 ?


>
> Masahiro Yamada (2):
>   dt-bindings: dmaengine: add DT binding for UniPhier MIO DMAC
>   dmaengine: uniphier-mdmac: add UniPhier MIO DMAC driver
>
>  .../devicetree/bindings/dma/uniphier-mio-dmac.txt  |  25 ++
>  MAINTAINERS                                        |   1 +
>  drivers/dma/Kconfig                                |  11 +
>  drivers/dma/Makefile                               |   1 +
>  drivers/dma/uniphier-mdmac.c                       | 495 +++++++++++++++=
++++++
>  5 files changed, 533 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/uniphier-mio-dm=
ac.txt
>  create mode 100644 drivers/dma/uniphier-mdmac.c
>
> --
> 2.7.4
>


--=20
Best Regards
Masahiro Yamada
