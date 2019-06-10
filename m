From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 01/11] dt-bindings: net: Add YAML schemas for the
 generic Ethernet options
Date: Mon, 10 Jun 2019 13:02:49 -0600
Message-ID: <CAL_Jsq+8_+OPVO14xu1yZU8q1Nux70TjP42j6SiBo9KdHL-4qQ@mail.gmail.com>
References: <91618c7e9a5497462afa74c6d8a947f709f54331.1560158667.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <91618c7e9a5497462afa74c6d8a947f709f54331.1560158667.git-series.maxime.ripard@bootlin.com>
Sender: netdev-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, netdev <netdev@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Maxime Chevallier <maxime.chevallier@bootlin.com>, =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 10, 2019 at 3:26 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> The Ethernet controllers have a good number of generic options that can be
> needed in a device tree. Add a YAML schemas for those.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> ---
>
> Changes from v1:
>   - Use an enum for phy-connection-types
>   - Validate the items for the fixed-link array
>   - Set the number of valid items for link-gpios to 1
>   - Removed deprecated properties (phy-mode, phy, phy-device)
> ---
>  Documentation/devicetree/bindings/net/ethernet-controller.yaml | 194 +++++++-
>  Documentation/devicetree/bindings/net/ethernet.txt             |  69 +--
>  Documentation/devicetree/bindings/net/fixed-link.txt           |  55 +--
>  3 files changed, 196 insertions(+), 122 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/ethernet-controller.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
