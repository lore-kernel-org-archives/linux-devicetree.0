From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: edac: al-mc-edac: Amazon's Annapurna
 Labs Memory Controller EDAC
Date: Fri, 11 Oct 2019 08:29:04 -0500
Message-ID: <20191011132904.GA15595@bogus>
References: <1570708454-10784-1-git-send-email-talel@amazon.com>
 <1570708454-10784-2-git-send-email-talel@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1570708454-10784-2-git-send-email-talel@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Talel Shenhar <talel@amazon.com>
Cc: maz@kernel.org, mark.rutland@arm.com, arnd@arndb.de, bp@alien8.de, mchehab@kernel.org, james.morse@arm.com, davem@davemloft.net, gregkh@linuxfoundation.org, paulmck@linux.ibm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, dwmw@amazon.co.uk, benh@kernel.crashing.org, hhhawa@amazon.com, ronenk@amazon.com, jonnyc@amazon.com, hanochu@amazon.com, amirkl@amazon.com, barakw@amazon.com
List-Id: devicetree@vger.kernel.org

On Thu, Oct 10, 2019 at 02:54:13PM +0300, Talel Shenhar wrote:
> Document Amazon's Annapurna Labs Memory Controller EDAC SoC binding.
> 
> Signed-off-by: Talel Shenhar <talel@amazon.com>
> ---
>  .../bindings/edac/amazon,al-mc-edac.yaml           | 50 ++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/edac/amazon,al-mc-edac.yaml
> 
> diff --git a/Documentation/devicetree/bindings/edac/amazon,al-mc-edac.yaml b/Documentation/devicetree/bindings/edac/amazon,al-mc-edac.yaml
> new file mode 100644
> index 00000000..f66b094
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/edac/amazon,al-mc-edac.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: GPL-2.0

Forgot to mention, please make new bindings (GPL-2.0-only OR BSD-2-Clause).

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/edac/amazon,al-mc-edac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amazon's Annapurna Labs Memory Controller EDAC
> +
> +maintainers:
> +  - Talel Shenhar <talel@amazon.com>
> +  - Talel Shenhar <talelshenhar@gmail.com>
> +
> +description: |
> +  EDAC node is defined to describe on-chip error detection and correction for
> +  Amazon's Annapurna Labs Memory Controller.
> +
> +properties:
> +
> +  compatible:
> +    const: amazon,al-mc-edac
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 2
> +    items:
> +      - description: uncorrectable error interrupt
> +      - description: correctable error interrupt
> +
> +  interrupt-names:
> +    maxItems: 2
> +    items:
> +      - const: ue
> +      - const: ce

Now the example fails to build:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/edac/amazon,al-mc-edac.example.dt.yaml: 
edac@f0080000: interrupt-names: ['ue'] is too short
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/edac/amazon,al-mc-edac.example.dt.yaml: 
edac@f0080000: interrupts: [[20, 4]] is too short

You either need to always have the CE irq or add 'minItems: 1' to both. 

> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    edac@f0080000 {
> +      compatible = "amazon,al-mc-edac";
> +      reg = <0x0 0xf0080000 0x0 0x00010000>;
> +      interrupt-parent = <&amazon_al_system_fabric>;
> +      interrupt-names = "ue";
> +      interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> -- 
> 2.7.4
> 
