From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [PATCHv5 1/3] dt-bindings: net: Add DT bindings for Socionext Netsec
Date: Wed, 3 Jan 2018 21:37:40 +0000
Message-ID: <CAKv+Gu9Pk_WEOrWZdVK5ty9GaDm4ApvGeksu_6W5DcF0-SOUuA@mail.gmail.com>
References: <1514783559-4226-1-git-send-email-jassisinghbrar@gmail.com> <1514783660-4290-1-git-send-email-jassisinghbrar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1514783660-4290-1-git-send-email-jassisinghbrar@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: "<netdev@vger.kernel.org>" <netdev@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Arnd Bergmann <arnd.bergmann@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Jassi,

On 1 January 2018 at 05:14,  <jassisinghbrar@gmail.com> wrote:
> From: Jassi Brar <jassisinghbrar@gmail.com>
>
> This patch adds documentation for Device-Tree bindings for the
> Socionext NetSec Controller driver.
>
> Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> ---
>  .../devicetree/bindings/net/socionext-netsec.txt   | 53 ++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/socionext-netsec.txt
>
> diff --git a/Documentation/devicetree/bindings/net/socionext-netsec.txt b/Documentation/devicetree/bindings/net/socionext-netsec.txt
> new file mode 100644
> index 0000000..b70e35b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/socionext-netsec.txt
> @@ -0,0 +1,53 @@
> +* Socionext NetSec Ethernet Controller IP
> +
> +Required properties:
> +- compatible: Should be "socionext,synquacer-netsec"
> +- reg: Address and length of the control register area, followed by the
> +       address and length of the EEPROM holding the MAC address and
> +       microengine firmware
> +- interrupts: Should contain ethernet controller interrupt
> +- clocks: phandle to the PHY reference clock
> +- clock-names: Should be "phy_ref_clk"

If clock-names is mandatory now even when only a single clock is
specified, you should add it to the example as well. However, please
be aware that hardware has shipped now with DT images that specify a
only a single clock and no clock-names property: those will require a
firmware upgrade before they can use this version of the driver.

> +- phy-mode: See ethernet.txt file in the same directory
> +- phy-handle: See ethernet.txt in the same directory.
> +
> +- mdio device tree subnode: When the Netsec has a phy connected to its local
> +               mdio, there must be device tree subnode with the following
> +               required properties:
> +
> +       - #address-cells: Must be <1>.
> +       - #size-cells: Must be <0>.
> +
> +       For each phy on the mdio bus, there must be a node with the following
> +       fields:
> +       - compatible: Refer to phy.txt
> +       - reg: phy id used to communicate to phy.
> +
> +Optional properties: (See ethernet.txt file in the same directory)
> +- dma-coherent: Boolean property, must only be present if memory
> +       accesses performed by the device are cache coherent.
> +- local-mac-address: See ethernet.txt in the same directory.
> +- mac-address: See ethernet.txt in the same directory.
> +- max-speed: See ethernet.txt in the same directory.
> +- max-frame-size: See ethernet.txt in the same directory.
> +
> +Example:
> +       eth0: ethernet@522d0000 {
> +               compatible = "socionext,synquacer-netsec";
> +               reg = <0 0x522d0000 0x0 0x10000>, <0 0x10000000 0x0 0x10000>;
> +               interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
> +               clocks = <&clk_netsec>;
> +               phy-mode = "rgmii";
> +               max-speed = <1000>;
> +               max-frame-size = <9000>;
> +               phy-handle = <&phy1>;
> +
> +               mdio {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       phy1: ethernet-phy@1 {
> +                               compatible = "ethernet-phy-ieee802.3-c22";
> +                               reg = <1>;
> +                       };
> +               };
> +       };
> --
> 2.7.4
>
