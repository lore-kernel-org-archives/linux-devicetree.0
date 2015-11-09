From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3 4/4] dma: add Qualcomm Technologies HIDMA channel
 driver
Date: Mon, 9 Nov 2015 12:19:24 -0600
Message-ID: <20151109181924.GA5205@rob-hp-laptop>
References: <1446958380-23298-1-git-send-email-okaya@codeaurora.org>
 <1446958380-23298-5-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1446958380-23298-5-git-send-email-okaya@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sinan Kaya <okaya@codeaurora.org>
Cc: dmaengine@vger.kernel.org, timur@codeaurora.org, cov@codeaurora.org, jcm@redhat.com, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Nov 07, 2015 at 11:53:00PM -0500, Sinan Kaya wrote:
> This patch adds support for hidma engine. The driver
> consists of two logical blocks. The DMA engine interface
> and the low-level interface. The hardware only supports
> memcpy/memset and this driver only support memcpy
> interface. HW and driver doesn't support slave interface.
> 
> Signed-off-by: Sinan Kaya <okaya@codeaurora.org>
> ---
>  .../devicetree/bindings/dma/qcom_hidma.txt         |  18 +
>  drivers/dma/qcom/Kconfig                           |   9 +
>  drivers/dma/qcom/Makefile                          |   2 +
>  drivers/dma/qcom/hidma.c                           | 743 ++++++++++++++++
>  drivers/dma/qcom/hidma.h                           | 157 ++++
>  drivers/dma/qcom/hidma_dbg.c                       | 225 +++++
>  drivers/dma/qcom/hidma_ll.c                        | 944 +++++++++++++++++++++
>  7 files changed, 2098 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/qcom_hidma.txt
>  create mode 100644 drivers/dma/qcom/hidma.c
>  create mode 100644 drivers/dma/qcom/hidma.h
>  create mode 100644 drivers/dma/qcom/hidma_dbg.c
>  create mode 100644 drivers/dma/qcom/hidma_ll.c
> 
> diff --git a/Documentation/devicetree/bindings/dma/qcom_hidma.txt b/Documentation/devicetree/bindings/dma/qcom_hidma.txt
> new file mode 100644
> index 0000000..c9fb2d44
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/qcom_hidma.txt
> @@ -0,0 +1,18 @@
> +Qualcomm Technologies HIDMA Channel driver
> +
> +Required properties:
> +- compatible: must contain "qcom,hidma"

This should be "qcom,hidma-1.0" to match the example and driver. I 
would drop "qcom,hidma" altogether.

Rob
