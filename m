From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 11/13] dt-bindings: mips: Add loongson cpus & boards
Date: Tue, 27 Aug 2019 07:45:48 -0500
Message-ID: <CAL_JsqL6htVye-LSBWw1WwRy9xH=zwuH6gurscwoCWj9Te_hAg@mail.gmail.com>
References: <20190827085302.5197-1-jiaxun.yang@flygoat.com> <20190827085302.5197-12-jiaxun.yang@flygoat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190827085302.5197-12-jiaxun.yang@flygoat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: "open list:MIPS" <linux-mips@vger.kernel.org>, Huacai Chen <chenhc@lemote.com>, Paul Burton <paul.burton@mips.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.co>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 27, 2019 at 3:55 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
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
> index 000000000000..410d896a0078
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/loongson/cpus.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license for new bindings please:

(GPL-2.0-only OR BSD-2-Clause)

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

Is this definition specific to Loongson CPUs or all MIPS?

I would expect to see a common MIPS CPU schema with these compatibles
listed there.

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
> index 000000000000..181881a9f4a9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mips/loongson/devices.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek SoC based Platforms Device Tree Bindings

MediaTek SoC?

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
> +      - description: Loongson 3A1000 + RS780E 1Way
> +        items:
> +          - const: loongson,ls3a1000-780e-1way
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
