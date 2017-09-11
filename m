From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/4] dt-bindings: Document the STM32 DMAMUX bindings
Date: Mon, 11 Sep 2017 15:24:03 -0500
Message-ID: <20170911202403.hlrir7bbdi7abw5n@rob-hp-laptop>
References: <1504785168-26572-1-git-send-email-pierre-yves.mordret@st.com>
 <1504785168-26572-2-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1504785168-26572-2-git-send-email-pierre-yves.mordret@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Cc: Vinod Koul <vinod.koul@intel.com>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Russell King <linux@armlinux.org.uk>, Dan Williams <dan.j.williams@intel.com>, M'boumba Cedric Madianga <cedric.madianga@gmail.com>, Fabrice GASNIER <fabrice.gasnier@st.com>, Herbert Xu <herbert@gondor.apana.org.au>, Fabien DESSENNE <fabien.dessenne@st.com>, Amelie Delaunay <amelie.delaunay@st.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 07, 2017 at 01:52:45PM +0200, Pierre-Yves MORDRET wrote:
> This patch adds the documentation of device tree bindings for the STM32
> DMAMUX.
> 
> Signed-off-by: M'boumba Cedric Madianga <cedric.madianga@gmail.com>
> Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
> ---
>  Version history:
>     v4:
>         * Add multi-master ability for STM32 DMAMUX
>         * Get rid of st,dmamux properties
>     v3:
>         * Change compatible to st,stm32h7-dmamux to be mode Soc specific
>         * Add verbosity in dma-cells
>     v2:
>         * Move clock bindings from optional to mandatory one
>         * Drop channelID bindings as managed dynamically from now on by
>           DMAMUX driver.
> ---
> ---
>  .../devicetree/bindings/dma/stm32-dmamux.txt       | 84 ++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/stm32-dmamux.txt

Acked-by: Rob Herring <robh@kernel.org>
