From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: soc: al-pos: Amazon's Annapurna Labs POS
Date: Fri, 4 Oct 2019 10:05:53 -0500
Message-ID: <CAL_JsqJDJF7h=nSw3dkNF=H3ghJeLR=MUgrEh+qxw0jhDnfxFw@mail.gmail.com>
References: <1570102361-11696-1-git-send-email-talel@amazon.com> <1570102361-11696-2-git-send-email-talel@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1570102361-11696-2-git-send-email-talel@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Talel Shenhar <talel@amazon.com>
Cc: Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, James Morse <james.morse@arm.com>, David Miller <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Paul E. McKenney" <paulmck@linux.ibm.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-edac <linux-edac@vger.kernel.org>, "Woodhouse, David" <dwmw@amazon.co.uk>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, "Hawa, Hanna" <hhhawa@amazon.com>, "Krupnik, Ronen" <ronenk@amazon.com>, Jonathan Chocron <jonnyc@amazon.com>, "Hanoch, Uri" <hanochu@amazon.com>, amirkl@amazon.com, "Wasserstrom, Barak" <barakw@amazon.com>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 3, 2019 at 6:33 AM Talel Shenhar <talel@amazon.com> wrote:
>
> Document Amazon's Annapurna Labs POS SoC binding.
>
> Signed-off-by: Talel Shenhar <talel@amazon.com>
> ---
>  .../bindings/edac/amazon,al-pos-edac.yaml          | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/edac/amazon,al-pos-edac.yaml
>
> diff --git a/Documentation/devicetree/bindings/edac/amazon,al-pos-edac.yaml b/Documentation/devicetree/bindings/edac/amazon,al-pos-edac.yaml
> new file mode 100644
> index 00000000..7936da0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/edac/amazon,al-pos-edac.yaml
> @@ -0,0 +1,39 @@
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
> +    - const: "amazon,al-pos-edac"

Fails 'make dt_binding_check' (drop the '-'):

warning: no schema found in file:
Documentation/devicetree/bindings/edac/amazon,al-pos-edac.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/edac/amazon,al-pos-edac.yaml:
ignoring, error in schema 'compatible'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/edac/amazon,al-pos-edac.yaml:
properties:compatible: [{'const': 'amazon,al-pos-edac'}] is not of
type 'object', 'boolean'
Documentation/devicetree/bindings/Makefile:12: recipe for target
'Documentation/devicetree/bindings/edac/amazon,al-pos-edac.example.dts'
failed
make[1]: *** [Documentation/devicetree/bindings/edac/amazon,al-pos-edac.example.dts]
Error 1
Makefile:1282: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    al_pos_edac@f0070084 {

edac@...

> +      compatible = "amazon,al-pos-edac";
> +      reg = <0x0 0xf0070084 0x0 0x00000008>;
> +      interrupt-parent = <&amazon_system_fabric>;
> +      interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;

Not documented.

> +    };
> --
> 2.7.4
>
