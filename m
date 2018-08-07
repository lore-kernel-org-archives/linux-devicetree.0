From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 net-next 9/9] dt-bindings: net: stmmac: Add the
 bindings documentation for XGMAC2.
Date: Tue, 7 Aug 2018 11:36:09 -0600
Message-ID: <20180807173609.GA12872@rob-hp-laptop>
References: <cover.1533311285.git.joabreu@synopsys.com>
 <782f85bb556f1f1d8b4eb0b803092ecb4a2c98a8.1533311285.git.joabreu@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <782f85bb556f1f1d8b4eb0b803092ecb4a2c98a8.1533311285.git.joabreu@synopsys.com>
Sender: netdev-owner@vger.kernel.org
To: Jose Abreu <Jose.Abreu@synopsys.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Joao Pinto <Joao.Pinto@synopsys.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 03, 2018 at 04:50:27PM +0100, Jose Abreu wrote:
> Adds the documentation for XGMAC2 DT bindings.
> 
> Signed-off-by: Jose Abreu <joabreu@synopsys.com>
> Cc: David S. Miller <davem@davemloft.net>
> Cc: Joao Pinto <jpinto@synopsys.com>
> Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh+dt@kernel.org>
> ---
> Changes from v1:
> 	- Correct header, now we also support 2.5/10G.
> 	- Add missing '>' (Sergei)
> ---
>  Documentation/devicetree/bindings/net/stmmac.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/stmmac.txt b/Documentation/devicetree/bindings/net/stmmac.txt
> index 3a28a5d8857d..a32fd590ce8f 100644
> --- a/Documentation/devicetree/bindings/net/stmmac.txt
> +++ b/Documentation/devicetree/bindings/net/stmmac.txt
> @@ -1,7 +1,8 @@
> -* STMicroelectronics 10/100/1000 Ethernet driver (GMAC)
> +* STMicroelectronics 10/100/1000/2500/10000 Ethernet driver (GMAC/XGMAC)

Bindings don't describe drivers.

>  
>  Required properties:
> -- compatible: Should be "snps,dwmac-<ip_version>", "snps,dwmac"
> +- compatible: Should be "snps,dwmac-<ip_version>", "snps,dwmac" or
> +	"snps,dwxgmac-<ip_version>", "snps,dwxgmac".
>  	For backwards compatibility: "st,spear600-gmac" is also supported.
>  - reg: Address and length of the register set for the device
>  - interrupt-parent: Should be the phandle for the interrupt controller
> -- 
> 2.7.4
> 
> 
