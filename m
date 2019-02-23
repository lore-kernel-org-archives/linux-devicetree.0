From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 3/8] dt-bindings: net: stmmac: add phys config
 properties
Date: Fri, 22 Feb 2019 18:16:51 -0600
Message-ID: <20190223001651.GA22381@bogus>
References: <1550824089-19961-1-git-send-email-christophe.roullier@st.com>
 <1550824089-19961-4-git-send-email-christophe.roullier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1550824089-19961-4-git-send-email-christophe.roullier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christophe Roullier <christophe.roullier@st.com>
Cc: davem@davemloft.net, joabreu@synopsys.com, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, peppe.cavallaro@st.com, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org

On Fri, Feb 22, 2019 at 09:28:04AM +0100, Christophe Roullier wrote:
> Add properties to support all Phy config
>  PHY_MODE	(MII,GMII, RMII, RGMII) and in normal, PHY wo crystal (25Mhz),
>  PHY wo crystal (50Mhz), No 125Mhz from PHY config.
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
> ---
>  Documentation/devicetree/bindings/net/stm32-dwmac.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.txt b/Documentation/devicetree/bindings/net/stm32-dwmac.txt
> index 1341012..f42dc68 100644
> --- a/Documentation/devicetree/bindings/net/stm32-dwmac.txt
> +++ b/Documentation/devicetree/bindings/net/stm32-dwmac.txt
> @@ -24,9 +24,9 @@ Required properties:
>  	       encompases the glue register, and the offset of the control register.
>  
>  Optional properties:
> -- clock-names:     For MPU family "mac-clk-ck" for PHY without quartz
> -- st,int-phyclk (boolean) :  valid only where PHY do not have quartz and need to be clock
> -	           by RCC

You can't just remove properties.

> +- clock-names:     For MPU family "eth-ck" for PHY without quartz
> +- st,eth_clk_sel (boolean) : set this property in RGMII PHY when you do not want use 125Mhz
> +- st,eth_ref_clk_sel (boolean) :  set this property in RMII mode when you have PHY without crystal 50MHz

s/_/-/

'sel' I assume is short for select, but the naming here and description 
don't really tell me what I'm getting.

Rob
