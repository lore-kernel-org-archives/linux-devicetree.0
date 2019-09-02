From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: intel-sdxc-phy: Add YAML schema
 for LGM SDXC PHY
Date: Mon, 02 Sep 2019 14:38:47 +0100
Message-ID: <20190902033716.GA18092@bogus>
References: <20190828124315.48448-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20190828124315.48448-2-vadivel.muruganx.ramuthevar@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190828124315.48448-2-vadivel.muruganx.ramuthevar@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Ramuthevar,Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
Cc: kishon@ti.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, andriy.shevchenko@intel.com, cheol.yong.kim@intel.com, qi-ming.wu@intel.com, peter.harliman.liem@intel.com
List-Id: devicetree@vger.kernel.org

On Wed, Aug 28, 2019 at 08:43:14PM +0800, Ramuthevar,Vadivel MuruganX wrote:
> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> 
> Add a YAML schema to use the host controller driver with the
> SDXC PHY on Intel's Lightning Mountain SoC.
> 
> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> ---
>  .../bindings/phy/intel,lgm-sdxc-phy.yaml           | 52 ++++++++++++++++++++++
>  .../devicetree/bindings/phy/intel,syscon.yaml      | 33 ++++++++++++++
>  2 files changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/intel,lgm-sdxc-phy.yaml
>  create mode 100644 Documentation/devicetree/bindings/phy/intel,syscon.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/intel,lgm-sdxc-phy.yaml b/Documentation/devicetree/bindings/phy/intel,lgm-sdxc-phy.yaml
> new file mode 100644
> index 000000000000..99647207b414
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/intel,lgm-sdxc-phy.yaml
> @@ -0,0 +1,52 @@
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
> +allOf:
> +  - $ref: "intel,syscon.yaml"

You don't need this. It should be selected and applied by the compatible 
string matching.

> +
> +description: Binding for SDXC PHY
> +
> +properties:
> +  compatible:
> +    const: intel,lgm-sdxc-phy
> +
> +  intel,syscon:
> +    description: phandle to the sdxc through syscon
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

Make this a child of the below node and then you don't need this.

If there's a register address range associated with this, then add a reg 
property.

> +        clocks = <&sdxc>;
> +        clock-names = "sdxcclk";
> +        #phy-cells = <0>;
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/phy/intel,syscon.yaml b/Documentation/devicetree/bindings/phy/intel,syscon.yaml
> new file mode 100644
> index 000000000000..d0b78805e49f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/intel,syscon.yaml
> @@ -0,0 +1,33 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/intel,syscon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Syscon for eMMC/SDXC PHY Device Tree Bindings

Nothing else in this h/w block? If there are other functions, then this 
should not be in bindings/phy/.

> +
> +maintainers:
> +  - Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> +
> +properties:
> +  compatible:
> +    const: intel,syscon

Needs to be more specific and reflect h/w blocks. 'syscon' is a Linux 
thing to some extent.

> +
> +  reg:
> +    maxItems: 1
> +
> +  "#reset-cells":
> +   const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#reset-cells"
> +
> +examples:
> +  - |
> +    sysconf: chiptop@e0020000 {
> +       compatible = "intel,syscon", "syscon";
> +       reg = <0xe0020000 0x100>;
> +       #reset-cells = <1>;
> +    };
> -- 
> 2.11.0
> 
