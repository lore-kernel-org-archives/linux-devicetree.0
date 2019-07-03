From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: net: Add bindings for Realtek PHYs
Date: Wed, 3 Jul 2019 15:11:11 -0600
Message-ID: <CAL_JsqJdBAMPc1sZJfL7V9cxGgCb4GWwRokwJDmac5L2AO2-wg@mail.gmail.com>
References: <20190703193724.246854-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190703193724.246854-1-mka@chromium.org>
Sender: netdev-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: "David S . Miller" <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 3, 2019 at 1:37 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Add the 'realtek,eee-led-mode-disable' property to disable EEE
> LED mode on Realtek PHYs that support it.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> Changes in v2:
> - document 'realtek,eee-led-mode-disable' instead of
>   'realtek,enable-ssc' in the initial version
> ---
>  .../devicetree/bindings/net/realtek.txt       | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/realtek.txt
>
> diff --git a/Documentation/devicetree/bindings/net/realtek.txt b/Documentation/devicetree/bindings/net/realtek.txt
> new file mode 100644
> index 000000000000..63f7002fa704
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/realtek.txt
> @@ -0,0 +1,19 @@
> +Realtek PHY properties.
> +
> +This document describes properties of Realtek PHYs.
> +
> +Optional properties:
> +- realtek,eee-led-mode-disable: Disable EEE LED mode on this port.
> +
> +Example:
> +
> +mdio0 {
> +       compatible = "snps,dwmac-mdio";
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
> +       ethphy: ethernet-phy@1 {
> +               reg = <1>;
> +               realtek,eee-led-mode-disable;

I think if we're going to have custom properties for phys, we should
have a compatible string to at least validate whether the custom
properties are even valid for the node.

Rob
