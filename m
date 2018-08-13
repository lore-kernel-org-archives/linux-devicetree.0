From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: net: phy: mscc: vsc8531: remove
 compatible from required properties
Date: Mon, 13 Aug 2018 16:50:32 -0600
Message-ID: <20180813225032.GA29518@rob-hp-laptop>
References: <20180730130236.3837-1-quentin.schulz@bootlin.com>
 <20180730130236.3837-2-quentin.schulz@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180730130236.3837-2-quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: andrew@lunn.ch, f.fainelli@gmail.com, davem@davemloft.net, mark.rutland@arm.com, devicetree@vger.kernel.org, netdev@vger.kernel.org, alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com
List-Id: devicetree@vger.kernel.org

On Mon, Jul 30, 2018 at 03:02:34PM +0200, Quentin Schulz wrote:
> Compatible isn't a required property for PHYs so let's remove it from
> the binding DT of the VSC8531 PHYs.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
> ---
>  Documentation/devicetree/bindings/net/mscc-phy-vsc8531.txt | 5 -----
>  1 file changed, 5 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
