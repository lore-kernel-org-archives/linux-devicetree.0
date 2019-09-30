From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 12/19] dt-bindings: mips: Add loongson boards
Date: Mon, 30 Sep 2019 08:23:20 -0500
Message-ID: <20190930132320.GB3354@bogus>
References: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
 <20190905144316.12527-13-jiaxun.yang@flygoat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190905144316.12527-13-jiaxun.yang@flygoat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org, chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.co, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 05, 2019 at 10:43:09PM +0800, Jiaxun Yang wrote:
> Prepare for later dts.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  .../bindings/mips/loongson/devices.yaml       | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/loongson/devices.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mips/loongson/devices.yaml b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
> new file mode 100644
> index 000000000000..0665f0f7ec45
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mips/loongson/devices.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson based Platforms Device Tree Bindings
> +
> +maintainers:
> +  - Jiaxun Yang <jiaxun.yang@flygoat.com>
> +description: |
> +  Devices with a Loongson CPU shall have the following properties.
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +
> +      - description: Loongson 3A1000 + RS780E
> +        items:
> +          - const: loongson,ls3a1000-780e

These should reflect the specific maker and model of board, not just 
what's the cpu and south bridge.

> +
> +      - description: Loongson 3A2000 + RS780E
> +        items:
> +          - const: loongson,ls3a2000-780e
> +
> +      - description: Loongson 3A3000 + RS780E
> +        items:
> +          - const: loongson,ls3a3000-780e
> +
> +      - description: Loongson 3A3000 + 7A
> +        items:
> +          - const: loongson,ls3a3000-7a
> +
> +      - description: Loongson 3B1000/1500 + RS780E 2Way
> +        items:
> +          - const: loongson,ls3b1x00-780e
> +...
> -- 
> 2.22.0
> 
