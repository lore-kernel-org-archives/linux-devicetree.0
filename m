From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/4] dt-bindings: net: phy: mscc: vsc8531: factorize
 vsc8531,led-N-mode
Date: Mon, 13 Aug 2018 16:55:24 -0600
Message-ID: <20180813225524.GA19219@rob-hp-laptop>
References: <20180730130236.3837-1-quentin.schulz@bootlin.com>
 <20180730130236.3837-4-quentin.schulz@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180730130236.3837-4-quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: andrew@lunn.ch, f.fainelli@gmail.com, davem@davemloft.net, mark.rutland@arm.com, devicetree@vger.kernel.org, netdev@vger.kernel.org, alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com
List-Id: devicetree@vger.kernel.org

On Mon, Jul 30, 2018 at 03:02:36PM +0200, Quentin Schulz wrote:
> VSC8584 supports 4 LEDs while VSC8531 only supports 2. Let's factorize
> the documentation for LED mode properties and give the 4 default values
> (the first two being shared between VSC8531 and VSC8584).
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
> ---
>  .../devicetree/bindings/net/mscc-phy-vsc8531.txt | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
