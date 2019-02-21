From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 26/30 v2] soc: ixp4xx: Add DT bindings for IXP4xx NPE
Date: Thu, 21 Feb 2019 15:48:16 -0600
Message-ID: <CAL_JsqKxEu6AhqEXhXSMwSFcfd3oZ2pZMmT_wwZZvvX9e=jUDg@mail.gmail.com>
References: <20190221154458.23763-1-linus.walleij@linaro.org>
 <20190221154458.23763-27-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190221154458.23763-27-linus.walleij@linaro.org>
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
> This adds DT bindings for the Intel IXP4xx Network Processing
> Engine (NPE). These are three firmware-executing units found in
> the IXP4xx SoC. These bindings use YAML.
>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  ...ntel,ixp4xx-network-processing-engine.yaml | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/intel,ixp4xx-network-processing-engine.yaml
>
> diff --git a/Documentation/devicetree/bindings/firmware/intel,ixp4xx-network-processing-engine.yaml b/Documentation/devicetree/bindings/firmware/intel,ixp4xx-network-processing-engine.yaml
> new file mode 100644
> index 000000000000..8cb136c376fb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/intel,ixp4xx-network-processing-engine.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 Linaro Ltd.
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/firmware/intel-ixp4xx-network-processing-engine.yaml#"

firmware? firmware/ is for things like psci, optee, etc. I'm not sure
this fits as it has some sort of h/w interface. Wouldn't networking be
a better fit?

> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Intel IXP4xx Network Processing Engine
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +description: |
> +  On the IXP4xx SoCs, the Network Processing Engine (NPE) is a small
> +  processor that can load a firmware to perform offloading of networking
> +  and crypto tasks. It also manages the MDIO bus to the ethernet PHYs
> +  on the IXP4xx platform. All IXP4xx platforms have three NPEs at
> +  consecutive memory locations. They are all included in the same
> +  device node since they are not independent of each other.
> +
> +properties:
> +  compatible:
> +    oneOf:

oneOf can be dropped.

> +      - items:
> +          - const: intel,ixp4xx-network-processing-engine
> +
> +  reg:
> +    minItems: 3
> +    maxItems: 3

These 2 lines can be dropped. If not specified, they are automatically
added based on how many 'items'.

> +    items:
> +      - description: NPE0 register range
> +      - description: NPE1 register range
> +      - description: NPE2 register range
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    npe@c8006000 {
> +         compatible = "intel,ixp4xx-network-processing-engine";
> +         reg = <0xc8006000 0x1000>, <0xc8007000 0x1000>, <0xc8008000 0x1000>;
> +    };
> --
> 2.20.1
>
