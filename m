From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 28/30 v2] soc: ixp4xx: qmgr: Add DT bindings for IXP4xx
 qmgr
Date: Thu, 21 Feb 2019 16:00:18 -0600
Message-ID: <CAL_JsqKJF0xdktw7BFRj8MWqty+Rkg6i9gDkWu_eHCq0TXyYMA@mail.gmail.com>
References: <20190221154458.23763-1-linus.walleij@linaro.org>
 <20190221154458.23763-29-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190221154458.23763-29-linus.walleij@linaro.org>
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
Cc: devicetree@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 21, 2019 at 9:46 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This adds device tree bindings for the Intel IXP4xx AHB
> Queue Manager.
>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../misc/intel,ixp4xx-queue-manager.yaml      | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/intel,ixp4xx-queue-manager.yaml
>
> diff --git a/Documentation/devicetree/bindings/misc/intel,ixp4xx-queue-manager.yaml b/Documentation/devicetree/bindings/misc/intel,ixp4xx-queue-manager.yaml
> new file mode 100644
> index 000000000000..c324860bede5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/intel,ixp4xx-queue-manager.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 Linaro Ltd.
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/misc/intel-ixp4xx-ahb-queue-manager.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Intel IXP4xx AHB Queue Manager
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +description: |
> +  The IXP4xx AHB Queue Manager maintains queues as circular buffers in
> +  an 8KB embedded SRAM along with hardware pointers. It is used by both
> +  the XScale processor and the NPEs (Network Processing Units) in the
> +  IXP4xx for accelerating queues, especially for networking. Clients pick
> +  queues from the queue manager with foo-queue = <&qmgr N> where the
> +  &qmgr is a phandle to the queue manager and N is the queue resource
> +  number. The queue resources available and their specific purpose
> +  on a certain IXP4xx system will vary.
> +
> +properties:
> +  compatible:
> +    oneOf:

oneOf can be dropped.

> +      - items:
> +          - const: intel,ixp4xx-ahb-queue-manager
> +
> +  reg:
> +    items:
> +      - description: Queue Manager MMIO range

Just do 'maxItems: 1'.

Then again, maybe consistency is better. If there's only 1 register
range, there's not much point in describing it and I don't want a
bunch of free-form copy-n-paste of descriptions. It's only if there's
more than one that we need to define what each one is. In any case, I
should get a meta-schema in place to enforce something. And this could
easily be scripted to change the format how we end up wanting it to
look like.

> +
> +  interrupts:
> +    minItems: 2
> +    maxItems: 2

Can drop these 2.

> +    items:
> +      - description: Interrupt for queues 0-31
> +      - description: Interrupt for queues 32-63
> +
> +  '#queue-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts

#queue-cells not required?

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    qmgr: queue-manager@60000000 {
> +         compatible = "intel,ixp4xx-ahb-queue-manager";
> +         reg = <0x60000000 0x4000>;
> +         interrupts = <3 IRQ_TYPE_LEVEL_HIGH>, <4 IRQ_TYPE_LEVEL_HIGH>;
> +         #queue-cells = <1>;
> +    };
> --
> 2.20.1
>
