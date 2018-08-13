From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/4] dt-bindings: net: phy: mscc: vsc8531: fix missing
 "/bits/ 8" in example
Date: Mon, 13 Aug 2018 16:54:33 -0600
Message-ID: <20180813225433.GA13768@rob-hp-laptop>
References: <20180730130236.3837-1-quentin.schulz@bootlin.com>
 <20180730130236.3837-3-quentin.schulz@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180730130236.3837-3-quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: andrew@lunn.ch, f.fainelli@gmail.com, davem@davemloft.net, mark.rutland@arm.com, devicetree@vger.kernel.org, netdev@vger.kernel.org, alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com
List-Id: devicetree@vger.kernel.org

On Mon, Jul 30, 2018 at 03:02:35PM +0200, Quentin Schulz wrote:
> The "vsc8531,led-N-mode" property is read as a u8 in the driver and
> there aren't a lot of modes anyway.
> 
> Without the "/bits/ 8" in front of the value of the property, the
> value is stored as an u32 resulting in of_read_property_u8 to always
> return 0.

Humm, I thought this would return an error if the size was wrong, but 
there must have been some reason otherwise.

> Fix the example so that people using the property can actually use it.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
> ---
>  Documentation/devicetree/bindings/net/mscc-phy-vsc8531.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Really, the driver should be changed to use u32 if that's what's already 
in use.

Either way,

Reviewed-by: Rob Herring <robh@kernel.org>

> 
> diff --git a/Documentation/devicetree/bindings/net/mscc-phy-vsc8531.txt b/Documentation/devicetree/bindings/net/mscc-phy-vsc8531.txt
> index 664d9d0543fc..4c7d1d384df0 100644
> --- a/Documentation/devicetree/bindings/net/mscc-phy-vsc8531.txt
> +++ b/Documentation/devicetree/bindings/net/mscc-phy-vsc8531.txt
> @@ -63,6 +63,6 @@ Example:
>                  compatible = "ethernet-phy-id0007.0570";
>                  vsc8531,vddmac		= <3300>;
>                  vsc8531,edge-slowdown	= <7>;
> -                vsc8531,led-0-mode	= <LINK_1000_ACTIVITY>;
> -                vsc8531,led-1-mode	= <LINK_100_ACTIVITY>;
> +                vsc8531,led-0-mode	= /bits/ 8 <LINK_1000_ACTIVITY>;
> +                vsc8531,led-1-mode	= /bits/ 8 <LINK_100_ACTIVITY>;
>          };
> -- 
> 2.17.1
> 
