From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 12/18] dt-bindings: mips: Add loongson cpus & boards
Date: Fri, 13 Sep 2019 15:36:06 +0100
Message-ID: <5d7ba957.1c69fb81.a8a33.834a@mx.google.com>
References: <20190830043232.20191-1-jiaxun.yang@flygoat.com>
 <20190830043232.20191-7-jiaxun.yang@flygoat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190830043232.20191-7-jiaxun.yang@flygoat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org, chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.co, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 30, 2019 at 12:32:26PM +0800, Jiaxun Yang wrote:
> Prepare for later dts.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  .../bindings/mips/loongson/cpus.yaml          | 38 +++++++++++
>  .../bindings/mips/loongson/devices.yaml       | 64 +++++++++++++++++++
>  2 files changed, 102 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/loongson/cpus.yaml
>  create mode 100644 Documentation/devicetree/bindings/mips/loongson/devices.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mips/loongson/cpus.yaml b/Documentation/devicetree/bindings/mips/loongson/cpus.yaml
> new file mode 100644
> index 000000000000..dc6dd5114d5e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/loongson/cpus.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mips/loongson/cpus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson CPUs bindings
> +
> +maintainers:
> +  - Jiaxun Yang <jiaxun.yang@flygoat.com>
> +
> +description: |+
> +  The device tree allows to describe the layout of CPUs in a system through
> +  the "cpus" node, which in turn contains a number of subnodes (ie "cpu")
> +  defining properties for every cpu.
> +
> +  Bindings for CPU nodes follow the Devicetree Specification, available from:
> +
> +  https://www.devicetree.org/specifications/
> +
> +properties:
> +  reg:
> +    maxItems: 1
> +    description: |
> +      Physical ID of a CPU, Can be read from CP0 EBase.CPUNum.
> +
> +  compatible:
> +    enum:
> +      - loongson,gs464
> +      - loongson,gs464e
> +      - loongson,gs264
> +      - loongson,gs464v
> +
> +required:
> +  - device_type
> +  - reg
> +  - compatible
> +...
> diff --git a/Documentation/devicetree/bindings/mips/loongson/devices.yaml b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
> new file mode 100644
> index 000000000000..aa6c42013d2c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
> @@ -0,0 +1,64 @@
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

Add a blank line here.

> +description: |
> +  Devices with a Loongson CPU shall have the following properties.
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +
> +      - description: Loongson 3A1000 + RS780E 1Way
> +        items:
> +          - const: loongson,ls3a1000-780e-1way

This is a board or a chip? Normally we have a board compatible followed 
by a SoC compatible.

What's the difference between 1-way, 2-way, 4-way? Maybe there's another 
way to describe that. 

> +
> +      - description: Loongson 3A1000 + RS780E 2Way
> +        items:
> +          - const: loongson,ls3a1000-780e-2way
> +
> +      - description: Loongson 3A1000 + RS780E 4Way
> +        items:
> +          - const: loongson,ls3a1000-780e-4way
> +
> +      - description: Loongson 3B1000/1500 + RS780E 1Way
> +        items:
> +          - const: loongson,ls3b-780e-1way
> +
> +      - description: Loongson 3B1000/1500 + RS780E 2Way
> +        items:
> +          - const: loongson,ls3b-780e-2way
> +
> +      - description: Loongson 3A2000 + RS780E 1Way
> +        items:
> +          - const: loongson,ls3a2000-780e-1way
> +
> +      - description: Loongson 3A2000 + RS780E 2Way
> +        items:
> +          - const: loongson,ls3a2000-780e-2way
> +
> +      - description: Loongson 3A2000 + RS780E 4Way
> +        items:
> +          - const: loongson,ls3a2000-780e-4way
> +
> +      - description: Loongson 3A3000 + RS780E 1Way
> +        items:
> +          - const: loongson,ls3a3000-780e-1way
> +
> +      - description: Loongson 3A3000 + RS780E 2Way
> +        items:
> +          - const: loongson,ls3a3000-780e-2way
> +
> +      - description: Loongson 3A3000 + RS780E 4Way
> +        items:
> +          - const: loongson,ls3a3000-780e-4way
> +
> +...
> -- 
> 2.22.0
> 
