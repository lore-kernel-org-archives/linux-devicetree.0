From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [RFC 5/9] dt-bindings: arm: amlogic: amlogic, meson-gx-ao-secure:
 convert to yaml
Date: Fri, 2 Aug 2019 16:37:25 +0200
Message-ID: <90dbcb33-74a2-68de-eb1a-ce84040298b8@baylibre.com>
References: <20190801135644.12843-1-narmstrong@baylibre.com>
 <20190801135644.12843-6-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190801135644.12843-6-narmstrong@baylibre.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

Thanks for reviews.

On 01/08/2019 15:56, Neil Armstrong wrote:
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../amlogic/amlogic,meson-gx-ao-secure.txt    | 28 -------------
>  .../amlogic/amlogic,meson-gx-ao-secure.yaml   | 42 +++++++++++++++++++
>  2 files changed, 42 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt
> deleted file mode 100644
> index c67d9f48fb91..000000000000
> --- a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -Amlogic Meson Firmware registers Interface
> -------------------------------------------
> -
> -The Meson SoCs have a register bank with status and data shared with the
> -secure firmware.
> -
> -Required properties:
> - - compatible: For Meson GX SoCs, must be "amlogic,meson-gx-ao-secure", "syscon"

I have a hard time find how to define "syscon" here, if I put syscon in the compatible
it gets matched on other bindings and I get lot of warnings.

How should I model it ?

Thanks,
Neil

> -
> -Properties should indentify components of this register interface :
> -
> -Meson GX SoC Information
> -------------------------
> -A firmware register encodes the SoC type, package and revision information on
> -the Meson GX SoCs.
> -If present, the following property should be added :
> -
> -Optional properties:
> -  - amlogic,has-chip-id: If present, the interface gives the current SoC version.
> -
> -Example
> --------
> -
> -ao-secure@140 {
> -	compatible = "amlogic,meson-gx-ao-secure", "syscon";
> -	reg = <0x0 0x140 0x0 0x140>;
> -	amlogic,has-chip-id;
> -};
> diff --git a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
> new file mode 100644
> index 000000000000..cf79287498f5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 BayLibre, SAS
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/amlogic/amlogic,meson-gx-ao-secure.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic Meson Firmware registers Interface
> +
> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +
> +description: |
> +  The Meson SoCs have a register bank with status and data shared with the
> +  secure firmware.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson-gx-ao-secure
> +
> +  reg:
> +    maxItems: 1
> +
> +  amlogic,has-chip-id:
> +    description: |
> +      A firmware register encodes the SoC type, package and revision
> +      information on the Meson GX SoCs. If present, the interface gives
> +      the current SoC version.
> +    type: boolean
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    ao-secure@140 {
> +          compatible = "amlogic,meson-gx-ao-secure", "syscon";
> +          reg = <0x140 0x140>;
> +          amlogic,has-chip-id;
> +    };
> 
