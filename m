From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 2/4] dt-bindings: net: phy: mscc: vsc8531: remove
 compatible from required properties
Date: Mon, 30 Jul 2018 15:53:10 +0200
Message-ID: <20180730135310.GG13198@lunn.ch>
References: <20180730130236.3837-1-quentin.schulz@bootlin.com>
 <20180730130236.3837-2-quentin.schulz@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180730130236.3837-2-quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: f.fainelli@gmail.com, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, netdev@vger.kernel.org, alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com
List-Id: devicetree@vger.kernel.org

On Mon, Jul 30, 2018 at 03:02:34PM +0200, Quentin Schulz wrote:
> Compatible isn't a required property for PHYs so let's remove it from
> the binding DT of the VSC8531 PHYs.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
