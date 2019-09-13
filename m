From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: net: dwmac: document 'mac-mode' property
Date: Fri, 13 Sep 2019 15:36:13 +0100
Message-ID: <5d7ba95d.1c69fb81.dabe4.8057@mx.google.com>
References: <20190906130256.10321-1-alexandru.ardelean@analog.com>
 <20190906130256.10321-2-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190906130256.10321-2-alexandru.ardelean@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, peppe.cavallaro@st.com, alexandre.torgue@st.com, --cc=andrew@lunn.ch
List-Id: devicetree@vger.kernel.org

On Fri, Sep 06, 2019 at 04:02:56PM +0300, Alexandru Ardelean wrote:
> This change documents the 'mac-mode' property that was introduced in the
> 'stmmac' driver to support passive mode converters that can sit in-between
> the MAC & PHY.
> 
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index c78be15704b9..ebe4537a7cce 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -112,6 +112,14 @@ properties:
>    reset-names:
>      const: stmmaceth
>  
> +  mac-mode:
> +    maxItems: 1

Is this an array because {min,max}Items is for arrays? It should be 
defined as a string with possible values.

As this property is the same as another, you can do this:

$ref: ethernet-controller.yaml#/properties/phy-connection-type

Unless only a small subset of those values are valid here, then you may 
want to list them here.

> +    description:
> +      The property is identical to 'phy-mode', and assumes that there is mode
> +      converter in-between the MAC & PHY (e.g. GMII-to-RGMII). This converter
> +      can be passive (no SW requirement), and requires that the MAC operate
> +      in a different mode than the PHY in order to function.
> +
>    snps,axi-config:
>      $ref: /schemas/types.yaml#definitions/phandle
>      description:
> -- 
> 2.20.1
> 
