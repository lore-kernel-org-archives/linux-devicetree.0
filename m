From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [PATCH 1/3] dt-bindings: net: Add DT bindings for Socionext Netsec
Date: Fri, 1 Dec 2017 09:12:57 +0000
Message-ID: <CAKv+Gu-A4yWTPRcXk8VAbnXYQpw+p4ExmwiVGs4cL7Ye2hwWOw@mail.gmail.com>
References: <1512058351-15851-1-git-send-email-jassisinghbrar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1512058351-15851-1-git-send-email-jassisinghbrar@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: "<netdev@vger.kernel.org>" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Arnd Bergmann <arnd.bergmann@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Jassi,

On 30 November 2017 at 16:12,  <jassisinghbrar@gmail.com> wrote:
> From: Jassi Brar <jassisinghbrar@gmail.com>
>
> This patch adds documentation for Device-Tree bindings for the
> Socionext NetSec Controller driver.
>
> Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

No need to keep my signoff here: if you are posting the patch, your
signoff should come last. (Authorship is no factor here, only the path
taken by the patch from the author/copyright holder to the sender of
the email)

> ---
>  .../devicetree/bindings/net/socionext-netsec.txt   | 43 ++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/socionext-netsec.txt
>
> diff --git a/Documentation/devicetree/bindings/net/socionext-netsec.txt b/Documentation/devicetree/bindings/net/socionext-netsec.txt
> new file mode 100644
> index 0000000..4695969
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/socionext-netsec.txt
> @@ -0,0 +1,43 @@
> +* Socionext NetSec Ethernet Controller IP
> +
> +Required properties:
> +- compatible: Should be "socionext,synquacer-netsec"
> +- reg: Address and length of the control register area, followed by the
> +       address and length of the EEPROM holding the MAC address and
> +       microengine firmware
> +- interrupts: Should contain ethernet controller interrupt
> +- clocks: phandle to the PHY reference clock, and any other clocks to be
> +          switched by runtime_pm
> +- clock-names: Required only if more than a single clock is listed in 'clocks'.
> +               The PHY reference clock must be named 'phy_refclk'
> +- phy-mode: See ethernet.txt file in the same directory
> +- phy-handle: phandle to select child phy
> +

We should add the following property here:

- dma-coherent: Boolean property, must only be present if memory
accesses performed by the device are cache coherent

(I only added support for this in our platform earlier this week)

> +Optional properties: (See ethernet.txt file in the same directory)
> +- local-mac-address
> +- mac-address
> +- max-speed
> +- max-frame-size
> +
> +Required properties for the child phy:
> +- reg: phy address
> +
> +Example:
> +       eth0: netsec@522D0000 {
> +               compatible = "socionext,synquacer-netsec";
> +               reg = <0 0x522D0000 0x0 0x10000>, <0 0x10000000 0x0 0x10000>;
> +               interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
> +               clocks = <&clk_netsec>;
> +               phy-mode = "rgmii";
> +               max-speed = <1000>;
> +               max-frame-size = <9000>;
> +               phy-handle = <&ethphy0>;
> +
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               ethphy0: ethernet-phy@1 {
> +                       compatible = "ethernet-phy-ieee802.3-c22";
> +                       reg = <1>;
> +               };
> +       };
> --
> 2.7.4
>
