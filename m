From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: dmaengine: Add Milbeaut AXI DMA controller bindings
Date: Sun, 31 Mar 2019 01:41:50 -0500
Message-ID: <5ca06130.1c69fb81.75bda.974a@mx.google.com>
References: <1553487314-9185-1-git-send-email-kasai.kazuhiro@socionext.com> <1553487314-9185-2-git-send-email-kasai.kazuhiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553487314-9185-2-git-send-email-kasai.kazuhiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kazuhiro Kasai <kasai.kazuhiro@socionext.com>
Cc: vkoul@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, orito.takao@socionext.com, sugaya.taichi@socionext.com, kanematsu.shinji@socionext.com, jaswinder.singh@linaro.org, masami.hiramatsu@linaro.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 25 Mar 2019 13:15:13 +0900, Kazuhiro Kasai wrote:
> Add Milbeaut AXI DMA controller bindings. This DMA controller has
> only capable of memory to memory transfer.
> 
> Signed-off-by: Kazuhiro Kasai <kasai.kazuhiro@socionext.com>
> ---
>  .../devicetree/bindings/dma/xdmac-milbeaut.txt     | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/xdmac-milbeaut.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
