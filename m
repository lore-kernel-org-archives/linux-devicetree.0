From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC 6/9] dt-bindings: phy: meson-g12a-usb2-phy: convert to yaml
Date: Thu, 1 Aug 2019 09:07:31 -0600
Message-ID: <CAL_JsqJbt=rzDrD8+Py0EcGx8ZiaqEupv5Rq+tCMk1ZcxKaOcg@mail.gmail.com>
References: <20190801135644.12843-1-narmstrong@baylibre.com>
 <20190801135644.12843-7-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190801135644.12843-7-narmstrong@baylibre.com>
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
>  .../bindings/phy/meson-g12a-usb2-phy.txt      | 22 ------
>  .../bindings/phy/meson-g12a-usb2-phy.yaml     | 67 +++++++++++++++++++
>  2 files changed, 67 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.txt
>  create mode 100644 Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.yaml
>
> diff --git a/Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.txt b/Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.txt
> deleted file mode 100644
> index a6ebc3dea159..000000000000
> --- a/Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.txt
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -* Amlogic G12A USB2 PHY binding
> -
> -Required properties:
> -- compatible:  Should be "amlogic,meson-g12a-usb2-phy"
> -- reg:         The base address and length of the registers
> -- #phys-cells: must be 0 (see phy-bindings.txt in this directory)
> -- clocks:      a phandle to the clock of this PHY
> -- clock-names: must be "xtal"
> -- resets:      a phandle to the reset line of this PHY
> -- reset-names: must be "phy"
> -- phy-supply:  see phy-bindings.txt in this directory
> -
> -Example:
> -       usb2_phy0: phy@36000 {
> -               compatible = "amlogic,g12a-usb2-phy";
> -               reg = <0x0 0x36000 0x0 0x2000>;
> -               clocks = <&xtal>;
> -               clock-names = "xtal";
> -               resets = <&reset RESET_USB_PHY21>;
> -               reset-names = "phy";
> -               #phy-cells = <0>;
> -       };
> diff --git a/Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.yaml
> new file mode 100644
> index 000000000000..4cd5ba97d469
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 BayLibre, SAS
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/phy/meson-g12a-usb2-phy.yaml#"

For this and the filename, use the compatible string (i.e. add 'amlogic,').

> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic G12A USB2 PHY
> +
> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson-g12a-usb2-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      A phandle to the clock of this PHY

As mentioned elsewhere, this description can be dropped.

> +
> +  clock-names:
> +    items:
> +      - const: xtal
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
> +    const: 0
> +
> +  phy-supply:
> +     maxItems: 1
> +     description:
> +       Phandle to a regulator that provides power to the PHY. This
> +       regulator will be managed during the PHY power on/off sequence.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - "#phy-cells"

phy-supply was required in the old doc though the example disagrees.
If dropping required is desired, just mention so in the commit
message.

> +
> +examples:
> +  - |
> +    phy@36000 {
> +          compatible = "amlogic,meson-g12a-usb2-phy";
> +          reg = <0x36000 0x2000>;
> +          clocks = <&xtal>;
> +          clock-names = "xtal";
> +          resets = <&phy_reset>;
> +          reset-names = "phy";
> +          #phy-cells = <0>;
> +    };
> --
> 2.22.0
>
