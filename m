From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: dmaengine: dma-common: Change
 dma-channel-mask to uint32-array
Date: Wed, 18 Sep 2019 08:28:35 -0500
Message-ID: <20190918132835.GA4527@bogus>
References: <20190910114559.22810-1-peter.ujfalusi@ti.com>
 <20190910114559.22810-2-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190910114559.22810-2-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, dan.j.williams@intel.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 10, 2019 at 02:45:57PM +0300, Peter Ujfalusi wrote:
> Make the dma-channel-mask to be usable for controllers with more than 32
> channels.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
>  Documentation/devicetree/bindings/dma/dma-common.yaml | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/dma-common.yaml b/Documentation/devicetree/bindings/dma/dma-common.yaml
> index ed0a49a6f020..41460946be64 100644
> --- a/Documentation/devicetree/bindings/dma/dma-common.yaml
> +++ b/Documentation/devicetree/bindings/dma/dma-common.yaml
> @@ -25,11 +25,19 @@ properties:
>        Used to provide DMA controller specific information.
>  
>    dma-channel-mask:
> -    $ref: /schemas/types.yaml#definitions/uint32
>      description:
>        Bitmask of available DMA channels in ascending order that are
>        not reserved by firmware and are available to the
>        kernel. i.e. first channel corresponds to LSB.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32-array
> +        items:
> +          minItems = 1

'='? Just making up the syntax?

> +          maxItems = 255 # Should be enough
> +          - description: Mask of channels 0-31
> +          - description: Mask of channels 32-63

You are mixing a schema and list here...

> +          ...

That's end of doc marker in YAML...

> +          - description: Mask of chnanels X-(X+31)

Obviously, this was not validated with 'make dt_binding_check'. What you 
want is:

    allOf:
      - $ref: /schemas/types.yaml#/definitions/uint32-array
      - minItems: 1
        maxItems: 255 # Should be enough

Rob
