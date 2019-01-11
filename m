From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/7] dt-bindings: net: stmmac: Add the bindings
 documentation for delays
Date: Fri, 11 Jan 2019 09:01:04 -0600
Message-ID: <20190111150104.GA1465@bogus>
References: <20190102091729.18582-1-vkoul@kernel.org>
 <20190102091729.18582-4-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190102091729.18582-4-vkoul@kernel.org>
Sender: netdev-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Niklas Cassel <niklas.cassel@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 02, 2019 at 02:47:25PM +0530, Vinod Koul wrote:
> Some controllers require that phy delay should be disabled. So add

If the MAC requires it, then the compatible string should imply this. If 
it depends on the PHY, then okay.

> optional properties rx-disable-delay and tx-disable-delay for it.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  Documentation/devicetree/bindings/net/stmmac.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/stmmac.txt b/Documentation/devicetree/bindings/net/stmmac.txt
> index cb694062afff..ec18897e22c8 100644
> --- a/Documentation/devicetree/bindings/net/stmmac.txt
> +++ b/Documentation/devicetree/bindings/net/stmmac.txt
> @@ -74,6 +74,8 @@ Optional properties:
>  	- snps,mb: mixed-burst
>  	- snps,rb: rebuild INCRx Burst
>  - mdio: with compatible = "snps,dwmac-mdio", create and register mdio bus.
> +- rx-delay-disable: bool, when present disable the rx delay
> +- tx-delay-disable: bool, when present disable the tx delay

Needs a vendor prefix.

>  - Multiple RX Queues parameters: below the list of all the parameters to
>  				 configure the multiple RX queues:
>  	- snps,rx-queues-to-use: number of RX queues to be used in the driver
> -- 
> 2.20.1
> 
