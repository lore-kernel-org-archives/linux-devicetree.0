From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: phy: intel-sdxc-phy: Add YAML schema
 for LGM SDXC PHY
Date: Tue, 27 Aug 2019 07:39:32 -0500
Message-ID: <CAL_JsqJsTDNR7FsdFouLetzhsRhmr3fVT_xzzhKbR7KuTwepuQ@mail.gmail.com>
References: <20190827082652.43840-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20190827082652.43840-2-vadivel.muruganx.ramuthevar@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190827082652.43840-2-vadivel.muruganx.ramuthevar@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Ramuthevar,Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>, cheol.yong.kim@intel.com, qi-ming.wu@intel.com, peter.harliman.liem@intel.com
List-Id: devicetree@vger.kernel.org

On Tue, Aug 27, 2019 at 3:27 AM Ramuthevar,Vadivel MuruganX
<vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
>
> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>
> Add a YAML schema to use the host controller driver with the
> SDXC PHY on Intel's Lightning Mountain SoC.
>
> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> ---
>  .../bindings/phy/intel,lgm-sdxc-phy.yaml           | 50 ++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/intel,lgm-sdxc-phy.yaml
>
> diff --git a/Documentation/devicetree/bindings/phy/intel,lgm-sdxc-phy.yaml b/Documentation/devicetree/bindings/phy/intel,lgm-sdxc-phy.yaml
> new file mode 100644
> index 000000000000..be05020880bf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/intel,lgm-sdxc-phy.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/intel,lgm-sdxc-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Intel Lightning Mountain(LGM) SDXC PHY Device Tree Bindings
> +
> +maintainers:
> +  - Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> +
> +description: Binding for SDXC PHY
> +
> +properties:
> +  compatible:
> +    const: intel,lgm-sdxc-phy
> +
> +  intel,syscon:
> +    description: phandle to the sdxc through syscon
> +    $ref: '/schemas/types.yaml#/definitions/phandle'
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 0
> +
> +required:
> +  - "#phy-cells"
> +  - compatible
> +  - intel,syscon
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    sdxc_phy: sdxc_phy {
> +        compatible = "intel,lgm-sdxc-phy";
> +        intel,syscon = <&sysconf>;

Rather than a phandle, can this be a child node of sysconf? You need a
binding for sysconf first anyways.

> +        clocks = <&sdxc>;
> +        clock-names = "sdxcclk";
> +        #phy-cells = <0>;
> +    };
> +
> +...
> --
> 2.11.0
>
