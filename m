From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC 7/9] dt-bindings: phy: meson-g12a-usb3-pcie-phy: convert to
 yaml
Date: Thu, 1 Aug 2019 09:08:54 -0600
Message-ID: <CAL_Jsq+Ytb2eJ4g_BMaCwyjM=taB6Yc8qM=U-==vFJ3LqDqV6Q@mail.gmail.com>
References: <20190801135644.12843-1-narmstrong@baylibre.com>
 <20190801135644.12843-8-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190801135644.12843-8-narmstrong@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 1, 2019 at 7:56 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/phy/meson-g12a-usb3-pcie-phy.txt | 22 -------
>  .../phy/meson-g12a-usb3-pcie-phy.yaml         | 61 +++++++++++++++++++
>  2 files changed, 61 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt
>  create mode 100644 Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.yaml
>
> diff --git a/Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt b/Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt
> deleted file mode 100644
> index 7cfc17e2df31..000000000000
> --- a/Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -* Amlogic G12A USB3 + PCIE Combo PHY binding
> -
> -Required properties:
> -- compatible:  Should be "amlogic,meson-g12a-usb3-pcie-phy"
> -- #phys-cells: must be 1. The cell number is used to select the phy mode
> -  as defined in <dt-bindings/phy/phy.h> between PHY_TYPE_USB3 and PHY_TYPE_PCIE
> -- reg:         The base address and length of the registers
> -- clocks:      a phandle to the 100MHz reference clock of this PHY
> -- clock-names: must be "ref_clk"
> -- resets:      phandle to the reset lines for the PHY control
> -- reset-names: must be "phy"
> -
> -Example:
> -       usb3_pcie_phy: phy@46000 {
> -               compatible = "amlogic,g12a-usb3-pcie-phy";
> -               reg = <0x0 0x46000 0x0 0x2000>;
> -               clocks = <&clkc CLKID_PCIE_PLL>;
> -               clock-names = "ref_clk";
> -               resets = <&reset RESET_PCIE_PHY>;
> -               reset-names = "phy";
> -               #phy-cells = <1>;
> -       };
> diff --git a/Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.yaml
> new file mode 100644
> index 000000000000..fe4df6bd51b2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 BayLibre, SAS
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/phy/meson-g12a-usb3-pcie-phy.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic G12A USB3 + PCIE Combo PHY
> +
> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,g12a-usb3-pcie-phy

Wrong compatible string.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      A phandle to the clock of this PHY
> +
> +  clock-names:
> +    items:
> +      - const: ref_clk
> +
> +  resets:
> +    maxItems: 1
> +    description:
> +      A phandle to the reset line of this PHY
> +
> +  reset-names:
> +    items:
> +      - const: phy
> +
> +  "#phy-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - "#phy-cells"
> +
> +examples:
> +  - |
> +    phy@46000 {
> +          compatible = "amlogic,meson-g12a-usb3-pcie-phy";
> +          reg = <0x46000 0x2000>;
> +          clocks = <&ref_clk>;
> +          clock-names = "ref_clk";
> +          resets = <&phy_reset>;
> +          reset-names = "phy";
> +          #phy-cells = <1>;
> +    };
> --
> 2.22.0
>
