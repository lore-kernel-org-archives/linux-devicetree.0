From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: stm32: Document Avenger96
 devicetree binding
Date: Mon, 13 May 2019 13:02:46 -0500
Message-ID: <20190513180246.GA8487@bogus>
References: <20190506100534.24145-1-manivannan.sadhasivam@linaro.org>
 <20190506100534.24145-2-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190506100534.24145-2-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, loic.pallardy@st.com
List-Id: devicetree@vger.kernel.org

On Mon, May 06, 2019 at 03:35:32PM +0530, Manivannan Sadhasivam wrote:
> Document devicetree binding for Avenger96 board.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.txt b/Documentation/devicetree/bindings/arm/stm32/stm32.txt
> index 6808ed9ddfd5..eba363a4b514 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/stm32.txt
> +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.txt
> @@ -8,3 +8,9 @@ using one of the following compatible strings:
>    st,stm32f746
>    st,stm32h743
>    st,stm32mp157
> +
> +Boards:
> +
> +Root node property compatible must contain one of below depending on board:
> +
> + - Avenger96: "arrow,stm32mp157a-avenger96"

With which SoC compatible?

> -- 
> 2.17.1
> 
