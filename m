From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 09/30 v2] irqchip: ixp4xx: Add DT bindings
Date: Thu, 21 Feb 2019 15:39:36 -0600
Message-ID: <CAL_JsqLFqxQ2NtZvsqmowMBcSaRgha=pb39_+rqg95LpAj0u0g@mail.gmail.com>
References: <20190221154458.23763-1-linus.walleij@linaro.org>
 <20190221154458.23763-10-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190221154458.23763-10-linus.walleij@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Krzysztof Halasa <khalasa@piap.pl>, Thomas Gleixner <tglx@linutronix.de>, Imre Kaloz <kaloz@openwrt.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 21, 2019 at 9:45 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This adds device tree bindings for the IXP4xx interrupt
> controller. It's a standard 2-cell controller.
>
> Cc: Marc Zyngier <marc.zyngier@arm.com>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Converted to use JSON yaml schema, why not.
> - Not keeping Rob's ACK because I think he wants to take
>   a second look.
> ---
>  .../intel,ixp4xx-interrupt.yaml               | 57 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml b/Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml
> new file mode 100644
> index 000000000000..f32c08f270d6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2018 Linaro Ltd.
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/interrupt/intel-ixp4xx-interrupt.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Intel IXP4xx XScale Networking Processors Interrupt Controller
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +description: |
> +  This interrupt controller is found in the Intel IXP4xx processors.
> +  Some processors have 32 interrupts, some have up to 64 interrupts.
> +  The exact number of interrupts is determined from the compatible
> +  string.
> +
> +  The distinct IXP4xx families with different interrupt controller
> +  variations are IXP42x, IXP43x, IXP45x and IXP46x. Those four
> +  families were the only ones to reach the developer and consumer
> +  market.
> +
> +properties:
> +  compatible:
> +    oneOf:

You can drop oneOf since there is only 1.

> +      - items:
> +        - enum:
> +          - intel,ixp42x-interrupt
> +          - intel,ixp43x-interrupt
> +          - intel,ixp45x-interrupt
> +          - intel,ixp46x-interrupt
> +
> +  reg:
> +    description: The register bank for the interrupt controller.

No need to define what reg is here. Just 'maxItems: 1' is sufficient.

> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +    description: The number of cells to define the interrupts.
> +      with two cells specified in interrupt-controller/interrupts.txt

I'd drop description here, but I prefer things terse. I guess this
does define the format of the cells.

With the other changes,

Reviewed-by: Rob Herring <robh@kernel.org>
