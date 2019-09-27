From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: dmaengine: dma-common: Change
 dma-channel-mask to uint32-array
Date: Fri, 27 Sep 2019 15:25:39 -0500
Message-ID: <20190927202539.GA20669@bogus>
References: <20190926111954.9184-1-peter.ujfalusi@ti.com>
 <20190926111954.9184-2-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190926111954.9184-2-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, dan.j.williams@intel.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 26, 2019 at 02:19:52PM +0300, Peter Ujfalusi wrote:
> Make the dma-channel-mask to be usable for controllers with more than 32
> channels.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
>  Documentation/devicetree/bindings/dma/dma-common.yaml | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/dma-common.yaml b/Documentation/devicetree/bindings/dma/dma-common.yaml
> index ed0a49a6f020..4527f20301ff 100644
> --- a/Documentation/devicetree/bindings/dma/dma-common.yaml
> +++ b/Documentation/devicetree/bindings/dma/dma-common.yaml
> @@ -25,11 +25,18 @@ properties:
>        Used to provide DMA controller specific information.
>  
>    dma-channel-mask:
> -    $ref: /schemas/types.yaml#definitions/uint32
>      description:
>        Bitmask of available DMA channels in ascending order that are
>        not reserved by firmware and are available to the
>        kernel. i.e. first channel corresponds to LSB.
> +      The first item in the array is for channels 0-31, the second is for
> +      channels 32-63, etc.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32-array
> +        items:
> +          minItems: 1
> +          # Should be enough
> +          maxItems: 255

'items' has to be a separate sub-schema from $ref to have any effect:

    allOf:
      - $ref: /schemas/types.yaml#/definitions/uint32-array                                                        
    items:
      minItems: 1
      # Should be enough
      maxItems: 255

Or (note the added '-'):

    allOf:                                                                                                            
      - $ref: /schemas/types.yaml#/definitions/uint32-array                                                           
      - items:                                                                                                            
          minItems: 1                                                                                                     
          # Should be enough                                                                                              
          maxItems: 255                                                                                                   

The first way is my preference.

Rob
