From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH  8/8] dt-bindings: stm32: add compatible for syscon
Date: Tue, 1 May 2018 09:01:24 -0500
Message-ID: <20180501140124.GA17771@rob-hp-laptop>
References: <1524582120-4451-1-git-send-email-christophe.roullier@st.com>
 <1524582120-4451-9-git-send-email-christophe.roullier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1524582120-4451-9-git-send-email-christophe.roullier@st.com>
Sender: netdev-owner@vger.kernel.org
To: Christophe Roullier <christophe.roullier@st.com>
Cc: mark.rutland@arm.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, peppe.cavallaro@st.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 24, 2018 at 05:02:00PM +0200, Christophe Roullier wrote:
> This patch describes syscon DT bindings.
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
> ---
>  Documentation/devicetree/bindings/arm/stm32.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32.txt b/Documentation/devicetree/bindings/arm/stm32.txt
> index 6808ed9..a871a78 100644
> --- a/Documentation/devicetree/bindings/arm/stm32.txt
> +++ b/Documentation/devicetree/bindings/arm/stm32.txt
> @@ -8,3 +8,10 @@ using one of the following compatible strings:
>    st,stm32f746
>    st,stm32h743
>    st,stm32mp157
> +
> +Required nodes:
> +
> +- syscon: some subnode of the STM32 SoC node must be a
> +  system controller node pointing to the control registers,
> +  with the compatible string set to one of these tuples:
> +  "st,stm32-syscfg", "syscon"

This should be a separate file.

I'd guess the syscfg registers differ from SoC to SoC, so you need more 
specific compatible strings.

Rob
