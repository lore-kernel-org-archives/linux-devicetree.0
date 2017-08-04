From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v2 00/25] Add QCOM QPIC NAND support
Date: Fri, 4 Aug 2017 09:53:05 +0200
Message-ID: <20170804095305.6492a2d3@bbrezillon>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org
List-Id: devicetree@vger.kernel.org

Hi Abhishek,

On Wed, 19 Jul 2017 17:17:48 +0530
Abhishek Sahu <absahu@codeaurora.org> wrote:

> v2:
> 
> 1. Addressed the review comments given in v1
> 2. Removed the DMA coherent buffer for register read and used
>    streaming DMA API’s
> 3. Reorganized the NAND read and write functions
> 4. Separated patch for driver and documentation changes
> 5. Changed the compatible string for EBI2
> 
> v1:
> 
> http://www.spinics.net/lists/devicetree/msg183706.html
> 
> Abhishek Sahu (25):
>   mtd: nand: qcom: fix config error for BCH
>   mtd: nand: qcom: program NAND_DEV_CMD_VLD register
>   mtd: nand: qcom: change compatible string for EBI2 NANDC
>   dt-bindings: qcom_nandc: change compatible string for EBI2 NANDC
>   mtd: nand: qcom: remove redundant chip select compatible string
>   dt-bindings: qcom_nandc: remove chip select compatible string
>   mtd: nand: qcom: reorganize nand page read
>   mtd: nand: qcom: reorganize nand page write
>   mtd: nand: qcom: remove memset for clearing read register buffer
>   mtd: nand: qcom: reorganize nand devices probing
>   mtd: nand: qcom: support for NAND controller properties
>   dt-bindings: qcom_nandc: QPIC NAND documentation
>   mtd: nand: qcom: add QPIC NAND compatible string
>   mtd: nand: qcom: add and initialize QPIC DMA resources
>   mtd: nand: qcom: DMA mapping support for register read buffer
>   mtd: nand: qcom: allocate BAM transaction
>   mtd: nand: qcom: add BAM DMA descriptor handling
>   mtd: nand: qcom: support for passing flags in transfer functions
>   mtd: nand: qcom: support for read location registers
>   mtd: nand: qcom: erased codeword detection configuration
>   mtd: nand: qcom: support for QPIC page read/write
>   mtd: nand: qcom: QPIC raw write support
>   mtd: nand: qcom: change register offset defines with enums
>   dt-bindings: qcom_nandc: compatible string for version 1.5.0
>   mtd: nand: qcom: support for QPIC version 1.5.0

Applied patch 1 and 5 to 11 to nand/next [1].

> 
>  .../devicetree/bindings/mtd/qcom_nandc.txt         |   56 +-
>  drivers/mtd/nand/qcom_nandc.c                      | 1157 ++++++++++++++++----
>  2 files changed, 1010 insertions(+), 203 deletions(-)
> 
