From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH v3 11/18] dmaengine: dma-jz4780: Add missing residue DTC
 mask
Date: Tue, 24 Jul 2018 19:08:53 +0530
Message-ID: <20180724133853.GH3661@vkoul-mobl>
References: <20180721110643.19624-1-paul@crapouillou.net>
 <20180721110643.19624-12-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180721110643.19624-12-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On 21-07-18, 13:06, Paul Cercueil wrote:
> From: Daniel Silsby <dansilsby@gmail.com>
> 
> The 'dtc' word in jz DMA descriptors contains two fields: The
> lowest 24 bits are the transfer count, and upper 8 bits are the DOA
> offset to next descriptor. The upper 8 bits are now correctly masked
> off when computing residue in jz4780_dma_desc_residue(). Note that
> reads of the DTCn hardware reg are automatically masked this way.
> 
> Signed-off-by: Daniel Silsby <dansilsby@gmail.com>
> Tested-by: Mathieu Malaterre <malat@debian.org>

This needs your s-o-b. Please see Documentation/process/submitting-patches.rst

I think Randy did flag this one some other patch as well. All the
patches need to be signed off by sender as well

-- 
~Vinod
