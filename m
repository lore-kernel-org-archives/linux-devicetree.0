From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 8/8] dt-bindings: stm32: add compatible for syscon
Date: Mon, 7 May 2018 11:35:37 -0500
Message-ID: <20180507163537.GA15212@rob-hp-laptop>
References: <1525270723-18241-1-git-send-email-christophe.roullier@st.com>
 <1525270723-18241-9-git-send-email-christophe.roullier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1525270723-18241-9-git-send-email-christophe.roullier@st.com>
Sender: netdev-owner@vger.kernel.org
To: Christophe Roullier <christophe.roullier@st.com>
Cc: mark.rutland@arm.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, peppe.cavallaro@st.com, devicetree@vger.kernel.org, andrew@lunn.ch, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, May 02, 2018 at 04:18:43PM +0200, Christophe Roullier wrote:
> This patch describes syscon DT bindings.
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
> ---
>  Documentation/devicetree/bindings/arm/stm32.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32.txt b/Documentation/devicetree/bindings/arm/stm32.txt
> index 6808ed9..06e3834 100644
> --- a/Documentation/devicetree/bindings/arm/stm32.txt
> +++ b/Documentation/devicetree/bindings/arm/stm32.txt
> @@ -8,3 +8,7 @@ using one of the following compatible strings:
>    st,stm32f746
>    st,stm32h743
>    st,stm32mp157
> +
> +Required nodes:
> +- syscon: the soc bus node must have a system controller node pointing to the
> +  global control registers, with the compatible string "syscon";

You misunderstood my prior comment. 'syscon' alone is not valid. You 
need SoC specific compatible string for it and 'stm32' is not SoC 
specific. IOW, the compatible property for a syscon should imply every 
single register field in the block.

Rob
