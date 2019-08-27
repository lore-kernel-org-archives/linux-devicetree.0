From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 02/20] dt-bindings: arm: Convert Marvell MMP board/soc
 bindings to json-schema
Date: Tue, 27 Aug 2019 06:59:45 -0500
Message-ID: <CAL_JsqJ4_h+M=6L-nzK2N+A9TAy-N8SoiFv1SSTk_kCcKt0eXw@mail.gmail.com>
References: <20190822092643.593488-1-lkundrak@v3.sk> <20190822092643.593488-3-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190822092643.593488-3-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: Olof Johansson <olof@lixom.net>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-clk <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 22, 2019 at 4:27 AM Lubomir Rintel <lkundrak@v3.sk> wrote:
>
> Convert Marvell MMP SoC bindings to DT schema format using json-schema.
>
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
>
> ---
> Changes since v1:
> - Added this patch
>
>  .../devicetree/bindings/arm/mrvl/mrvl.txt     | 14 ---------
>  .../devicetree/bindings/arm/mrvl/mrvl.yaml    | 31 +++++++++++++++++++
>  2 files changed, 31 insertions(+), 14 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/mrvl/mrvl.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml
>
> diff --git a/Documentation/devicetree/bindings/arm/mrvl/mrvl.txt b/Documentation/devicetree/bindings/arm/mrvl/mrvl.txt
> deleted file mode 100644
> index 951687528efb0..0000000000000
> --- a/Documentation/devicetree/bindings/arm/mrvl/mrvl.txt
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -Marvell Platforms Device Tree Bindings
> -----------------------------------------------------
> -
> -PXA168 Aspenite Board
> -Required root node properties:
> -       - compatible = "mrvl,pxa168-aspenite", "mrvl,pxa168";
> -
> -PXA910 DKB Board
> -Required root node properties:
> -       - compatible = "mrvl,pxa910-dkb";
> -
> -MMP2 Brownstone Board
> -Required root node properties:
> -       - compatible = "mrvl,mmp2-brownstone", "mrvl,mmp2";
> diff --git a/Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml b/Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml
> new file mode 100644
> index 0000000000000..dc9de506ac6e3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml
> @@ -0,0 +1,31 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/mrvl/mrvl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Marvell Platforms Device Tree Bindings
> +
> +maintainers:
> +  - Lubomir Rintel <lkundrak@v3.sk>
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - description: PXA168 Aspenite Board
> +        items:
> +          - enum:
> +              - mrvl,pxa168-aspenite
> +          - const: mrvl,pxa168
> +      - description: PXA910 DKB Board
> +        items:
> +          - enum:
> +              - mrvl,pxa910-dkb

Doesn't match what's in dts file:

arch/arm/boot/dts/pxa910-dkb.dts:       compatible =
"mrvl,pxa910-dkb", "mrvl,pxa910";

> +      - description: MMP2 Brownstone Board

If this entry is only for this board...

> +        items:
> +          - enum:
> +              - mrvl,mmp2-brownstone

...then this can be a 'const' instead. Same for the others.

> +          - const: mrvl,mmp2
> +...
> --
> 2.21.0
>
