From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH v3 2/7] dt-bindings: stm32-dmamux: Add one cell to
 support DMA/MDMA chain
Date: Sun, 7 Oct 2018 20:28:05 +0530
Message-ID: <20181007145805.GZ2372@vkoul-mobl>
References: <1538139715-24406-1-git-send-email-pierre-yves.mordret@st.com>
 <1538139715-24406-3-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1538139715-24406-3-git-send-email-pierre-yves.mordret@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Dan Williams <dan.j.williams@intel.com>, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 28-09-18, 15:01, Pierre-Yves MORDRET wrote:
> From: M'boumba Cedric Madianga <cedric.madianga@gmail.com>
> 
> Add one cell to support DMA/MDMA chaining.
> 
> Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
> ---
>   Version history:
>     v3:
>     v2:
>        * rework content
>     v1:
>        * Initial
> ---
> ---
>  Documentation/devicetree/bindings/dma/stm32-dmamux.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/stm32-dmamux.txt b/Documentation/devicetree/bindings/dma/stm32-dmamux.txt
> index 1b893b2..5e92b59 100644
> --- a/Documentation/devicetree/bindings/dma/stm32-dmamux.txt
> +++ b/Documentation/devicetree/bindings/dma/stm32-dmamux.txt
> @@ -4,9 +4,9 @@ Required properties:
>  - compatible:	"st,stm32h7-dmamux"
>  - reg:		Memory map for accessing module
>  - #dma-cells:	Should be set to <3>.
> -		First parameter is request line number.
> -		Second is DMA channel configuration
> -		Third is Fifo threshold
> +-		First parameter is request line number.
> +-		Second is DMA channel configuration
> +-		Third is a 32bit bitfield

please separate out formatting changes and actual change proposed..

>  		For more details about the three cells, please see
>  		stm32-dma.txt documentation binding file
>  - dma-masters:	Phandle pointing to the DMA controllers.
> -- 
> 2.7.4

-- 
~Vinod
