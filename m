From: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH v2 12/34] dt-bindings: arm: Convert Altera board/soc
 bindings to json-schema
Date: Wed, 5 Dec 2018 09:13:51 -0600
Message-ID: <0dd69104-4370-61c3-d7ca-e09121a16366@kernel.org>
References: <20181203213223.16986-1-robh@kernel.org>
 <20181203213223.16986-13-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203213223.16986-13-robh@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Grant Likely <grant.likely@arm.com>, Kumar Gala <kumar.gala@linaro.org>, arm@kernel.org, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org



On 12/3/18 3:32 PM, Rob Herring wrote:
> Convert Altera SoC bindings to DT schema format using json-schema.
> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Dinh Nguyen <dinguyen@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/arm/altera.txt        | 14 -------------
>  .../devicetree/bindings/arm/altera.yaml       | 20 +++++++++++++++++++
>  2 files changed, 20 insertions(+), 14 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/altera.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/altera.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/altera.txt b/Documentation/devicetree/bindings/arm/altera.txt
> deleted file mode 100644
> index 558735aacca8..000000000000
> --- a/Documentation/devicetree/bindings/arm/altera.txt
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -Altera's SoCFPGA platform device tree bindings
> ----------------------------------------------
> -
> -Boards with Cyclone 5 SoC:
> -Required root node properties:
> -compatible = "altr,socfpga-cyclone5", "altr,socfpga";
> -
> -Boards with Arria 5 SoC:
> -Required root node properties:
> -compatible = "altr,socfpga-arria5", "altr,socfpga";
> -
> -Boards with Arria 10 SoC:
> -Required root node properties:
> -compatible = "altr,socfpga-arria10", "altr,socfpga";
> diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
> new file mode 100644
> index 000000000000..49e0362ddc11
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/altera.yaml
> @@ -0,0 +1,20 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/altera.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Altera's SoCFPGA platform device tree bindings
> +
> +maintainers:
> +  - Dinh Nguyen <dinguyen@kernel.org>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - altr,socfpga-cyclone5
> +        - altr,socfpga-arria5
> +        - altr,socfpga-arria10
> +      - const: altr,socfpga
> +...
> 

Acked-by: Dinh Nguyen <dinguyen@kernel.org>
