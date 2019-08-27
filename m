From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: milbeaut-m10v-xdmac: Add Socionext
 Milbeaut XDMAC bindings
Date: Tue, 27 Aug 2019 11:31:59 -0500
Message-ID: <20190827163159.GA29528@bogus>
References: <20190818052154.17789-1-jassisinghbrar@gmail.com>
 <20190818052224.17857-1-jassisinghbrar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190818052224.17857-1-jassisinghbrar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jassisinghbrar@gmail.com
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vkoul@kernel.org, robh+dt@kernel.org, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

On Sun, 18 Aug 2019 00:22:24 -0500, jassisinghbrar@gmail.com wrote:
> From: Jassi Brar <jaswinder.singh@linaro.org>
> 
> Document the devicetree bindings for Socionext Milbeaut XDMAC
> controller. Controller only supports Mem->Mem transfers. Number
> of physical channels are determined by the number of irqs registered.
> 
> Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
> ---
>  .../bindings/dma/milbeaut-m10v-xdmac.txt      | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/milbeaut-m10v-xdmac.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
