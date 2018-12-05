From: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH v2 04/34] dt-bindings: altera: Convert clkmgr binding to
 json-schema
Date: Wed, 5 Dec 2018 09:13:22 -0600
Message-ID: <b00ee14b-1495-c1b6-ccd0-8c28a04b37d0@kernel.org>
References: <20181203213223.16986-1-robh@kernel.org>
 <20181203213223.16986-5-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203213223.16986-5-robh@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Grant Likely <grant.likely@arm.com>, Kumar Gala <kumar.gala@linaro.org>, arm@kernel.org, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org



On 12/3/18 3:31 PM, Rob Herring wrote:
> Convert Altera clkmgr to DT schema format using json-schema.
> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Dinh Nguyen <dinguyen@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../arm/altera/socfpga-clk-manager.txt        | 11 -------
>  .../arm/altera/socfpga-clk-manager.yaml       | 31 +++++++++++++++++++
>  2 files changed, 31 insertions(+), 11 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.txt b/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.txt
> deleted file mode 100644
> index 2c28f1d12f45..000000000000
> --- a/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.txt
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -Altera SOCFPGA Clock Manager
> -
> -Required properties:
> -- compatible : "altr,clk-mgr"
> -- reg : Should contain base address and length for Clock Manager
> -
> -Example:
> -	 clkmgr@ffd04000 {
> -		compatible = "altr,clk-mgr";
> -		reg = <0xffd04000 0x1000>;
> -	};
> diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.yaml b/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.yaml
> new file mode 100644
> index 000000000000..e4131fa42b26
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.yaml
> @@ -0,0 +1,31 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/altera/socfpga-clk-manager.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Altera SOCFPGA Clock Manager
> +
> +maintainers:
> +  - Dinh Nguyen <dinguyen@kernel.org>
> +
> +description: test
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: altr,clk-mgr
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +
> +examples:
> +  - |
> +    clkmgr@ffd04000 {
> +      compatible = "altr,clk-mgr";
> +      reg = <0xffd04000 0x1000>;
> +    };
> +
> +...
> 

Acked-by: Dinh Nguyen <dinguyen@kernel.org>
