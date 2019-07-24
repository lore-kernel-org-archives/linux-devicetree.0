From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [RFC] dt-bindings: net: phy: Add subnode for LED configuration
Date: Wed, 24 Jul 2019 20:04:30 +0200
Message-ID: <20190724180430.GB28488@lunn.ch>
References: <20190722223741.113347-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190722223741.113347-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 22, 2019 at 03:37:41PM -0700, Matthias Kaehlcke wrote:
> The LED behavior of some Ethernet PHYs is configurable. Add an
> optional 'leds' subnode with a child node for each LED to be
> configured. The binding aims to be compatible with the common
> LED binding (see devicetree/bindings/leds/common.txt).
> 
> A LED can be configured to be 'on' when a link with a certain speed
> is active, or to blink on RX/TX activity. For the configuration to
> be effective it needs to be supported by the hardware and the
> corresponding PHY driver.
> 
> Suggested-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> This RFC is a follow up of the discussion on "[PATCH v2 6/7]
> dt-bindings: net: realtek: Add property to configure LED mode"
> (https://lore.kernel.org/patchwork/patch/1097185/).
> 
> For now posting as RFC to get a basic agreement on the bindings
> before proceding with the implementation in phylib and a specific
> driver.
> ---
>  Documentation/devicetree/bindings/net/phy.txt | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/phy.txt b/Documentation/devicetree/bindings/net/phy.txt
> index 9b9e5b1765dd..ad495d3abbbb 100644
> --- a/Documentation/devicetree/bindings/net/phy.txt
> +++ b/Documentation/devicetree/bindings/net/phy.txt
> @@ -46,6 +46,25 @@ Optional Properties:
>    Mark the corresponding energy efficient ethernet mode as broken and
>    request the ethernet to stop advertising it.
>  
> +- leds: A sub-node which is a container of only LED nodes. Each child
> +    node represents a PHY LED.
> +
> +  Required properties for LED child nodes:
> +  - reg: The ID number of the LED, typically corresponds to a hardware ID.
> +
> +  Optional properties for child nodes:
> +  - label: The label for this LED. If omitted, the label is taken from the node
> +    name (excluding the unit address). It has to uniquely identify a device,
> +    i.e. no other LED class device can be assigned the same label.

Hi Matthias

I've thought about label a bit more. 

> +			label = "ethphy0:left:green";

We need to be careful with names here. systemd etc renames
interfaces. ethphy0 could in fact be connected to enp3s0, or eth0
might get renamed to eth1, etc. So i think we should avoid things like
ethphy0. Also, i'm not sure we actually need a label, at least not to
start with.Do we have any way to expose it to the user?

If we do ever make it part of the generic LED framework, we can then
use the label. At that point, i would probably combine the label with
the interface name in a dynamic way to avoid issues like this.

    Andrew
