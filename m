From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 1/8] dt-bindings: stm32-dma: introduce DMA features
 bitfield
Date: Sun, 18 Mar 2018 07:49:30 -0500
Message-ID: <20180318124930.tgd4llar3zat7idx@rob-hp-laptop>
References: <1520959327-25760-1-git-send-email-pierre-yves.mordret@st.com>
 <1520959327-25760-2-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1520959327-25760-2-git-send-email-pierre-yves.mordret@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Cc: Vinod Koul <vinod.koul@intel.com>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Dan Williams <dan.j.williams@intel.com>, M'boumba Cedric Madianga <cedric.madianga@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 13, 2018 at 05:42:00PM +0100, Pierre-Yves MORDRET wrote:
> This bitfield intends to address features to be activated within the
> driver. Initially the mask was only meant for FIFO Threshold management.
> Backward compatibility is preserved but the meaning of this field has been
> extended to features instead of only threshold.
> 
> Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
> ---
>   Version history:
>     v1:
>        * Initial
> ---
> ---
>  Documentation/devicetree/bindings/dma/stm32-dma.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
