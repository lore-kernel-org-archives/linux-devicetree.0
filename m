From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 6/8] dt-bindings: net: stmmac: add syscfg clock
 property
Date: Fri, 22 Feb 2019 18:19:01 -0600
Message-ID: <20190223001901.GA4107@bogus>
References: <1550824089-19961-1-git-send-email-christophe.roullier@st.com>
 <1550824089-19961-7-git-send-email-christophe.roullier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1550824089-19961-7-git-send-email-christophe.roullier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: robh@kernel.org, davem@davemloft.net, joabreu@synopsys.com, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, peppe.cavallaro@st.com, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, christophe.roullier@st.com, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org

On Fri, 22 Feb 2019 09:28:07 +0100, Christophe Roullier wrote:
> Need syscfg clock for MCU family in case bootloader does not
> activate it.
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
> ---
>  Documentation/devicetree/bindings/net/stm32-dwmac.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
