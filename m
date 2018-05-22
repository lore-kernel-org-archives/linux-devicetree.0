From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3 8/8] dt-bindings: stm32: add compatible for syscon
Date: Tue, 22 May 2018 12:22:38 -0500
Message-ID: <20180522172238.GA26145@rob-hp-laptop>
References: <1526890046-10565-1-git-send-email-christophe.roullier@st.com>
 <1526890046-10565-9-git-send-email-christophe.roullier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1526890046-10565-9-git-send-email-christophe.roullier@st.com>
Sender: netdev-owner@vger.kernel.org
To: Christophe Roullier <christophe.roullier@st.com>
Cc: mark.rutland@arm.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, peppe.cavallaro@st.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org

On Mon, May 21, 2018 at 10:07:26AM +0200, Christophe Roullier wrote:
> This patch describes syscon DT bindings.
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
> ---
>  Documentation/devicetree/bindings/arm/stm32.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32.txt b/Documentation/devicetree/bindings/arm/stm32.txt
> index 6808ed9..e46ebad 100644
> --- a/Documentation/devicetree/bindings/arm/stm32.txt
> +++ b/Documentation/devicetree/bindings/arm/stm32.txt
> @@ -8,3 +8,8 @@ using one of the following compatible strings:
>    st,stm32f746
>    st,stm32h743
>    st,stm32mp157
> +
> +Required nodes:
> +- syscon: the soc bus node must have a system controller node pointing to the
> +  global control registers, with the compatible string
> +  "st,stm32mp157-syscfg", "syscon";

Please don't mix soc/board bindings with other nodes. So perhaps 
stm32-syscon.txt.

Rob
