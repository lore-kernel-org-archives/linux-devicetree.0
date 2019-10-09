From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: soc: al-pos: Amazon's Annapurna Labs
 POS
Date: Wed, 9 Oct 2019 18:29:27 -0500
Message-ID: <20191009232927.GA23987@bogus>
References: <1570452435-8505-1-git-send-email-talel@amazon.com>
 <1570452435-8505-2-git-send-email-talel@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1570452435-8505-2-git-send-email-talel@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Talel Shenhar <talel@amazon.com>
Cc: maz@kernel.org, mark.rutland@arm.com, arnd@arndb.de, bp@alien8.de, mchehab@kernel.org, james.morse@arm.com, davem@davemloft.net, gregkh@linuxfoundation.org, paulmck@linux.ibm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, dwmw@amazon.co.uk, benh@kernel.crashing.org, hhhawa@amazon.com, ronenk@amazon.com, jonnyc@amazon.com, hanochu@amazon.com, amirkl@amazon.com, barakw@amazon.com
List-Id: devicetree@vger.kernel.org

On Mon, Oct 07, 2019 at 03:47:14PM +0300, Talel Shenhar wrote:
> Document Amazon's Annapurna Labs POS SoC binding.
> 
> Signed-off-by: Talel Shenhar <talel@amazon.com>
> ---
>  .../bindings/edac/amazon,al-pos-edac.yaml          | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/edac/amazon,al-pos-edac.yaml

Please fix errors with 'make dt_binding_check' and resubmit.

Error: Documentation/devicetree/bindings/edac/amazon,al-pos-edac.example.dts:21.28-29 syntax error
FATAL ERROR: Unable to parse input tree

Hint: You need an include.

> 
> diff --git a/Documentation/devicetree/bindings/edac/amazon,al-pos-edac.yaml b/Documentation/devicetree/bindings/edac/amazon,al-pos-edac.yaml
> new file mode 100644
> index 00000000..048c2e9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/edac/amazon,al-pos-edac.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/edac/amazon,al-pos-edac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amazon's Annapurna Labs POS
> +
> +maintainers:
> +  - Talel Shenhar <talel@amazon.com>
> +  - Talel Shenhar <talelshenhar@gmail.com>
> +
> +description: |
> +  POS node is defined to describe the Point Of Serialization (POS) error
> +  detection capability.
> +
> +properties:
> +
> +  compatible:
> +    const: "amazon,al-pos-edac"
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    description: Interrupt for the error event.
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    edac@f0070084 {
> +      compatible = "amazon,al-pos-edac";
> +      reg = <0x0 0xf0070084 0x0 0x00000008>;
> +      interrupt-parent = <&amazon_system_fabric>;
> +      interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> -- 
> 2.7.4
> 
