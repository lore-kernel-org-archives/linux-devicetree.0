From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH v4 11/18] dmaengine: dma-jz4780: Add missing residue DTC
 mask
Date: Mon, 27 Aug 2018 10:30:57 +0530
Message-ID: <20180827050057.GR2388@vkoul-mobl>
References: <20180807114218.20091-1-paul@crapouillou.net>
 <20180807114218.20091-12-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180807114218.20091-12-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Daniel Silsby <dansilsby@gmail.com>
List-Id: devicetree@vger.kernel.org

On 07-08-18, 13:42, Paul Cercueil wrote:
> From: Daniel Silsby <dansilsby@gmail.com>
> 
> The 'dtc' word in jz DMA descriptors contains two fields: The
> lowest 24 bits are the transfer count, and upper 8 bits are the DOA
> offset to next descriptor. The upper 8 bits are now correctly masked
> off when computing residue in jz4780_dma_desc_residue(). Note that
> reads of the DTCn hardware reg are automatically masked this way.
> 
> Signed-off-by: Daniel Silsby <dansilsby@gmail.com>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Mathieu Malaterre <malat@debian.org>
> ---
>  drivers/dma/dma-jz4780.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
>  v2: No change
> 
>  v3: No change
> 
>  v4: Add my Signed-off-by
> 
> diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
> index 3a4d0a4b550d..a4292ac4c686 100644
> --- a/drivers/dma/dma-jz4780.c
> +++ b/drivers/dma/dma-jz4780.c
> @@ -616,7 +616,8 @@ static size_t jz4780_dma_desc_residue(struct jz4780_dma_chan *jzchan,
>  	residue = 0;
>  
>  	for (i = next_sg; i < desc->count; i++)
> -		residue += desc->desc[i].dtc << jzchan->transfer_shift;
> +		residue += (desc->desc[i].dtc & 0xffffff) <<

GENMASK(23, 0) please.

-- 
~Vinod
