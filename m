From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3 13/18] dmaengine: dma-jz4780: Set DTCn register
 explicitly
Date: Sat, 21 Jul 2018 08:10:16 -0700
Message-ID: <bd06e477-a253-48f2-2b3e-dc48b2a12841@infradead.org>
References: <20180721110643.19624-1-paul@crapouillou.net>
 <20180721110643.19624-14-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180721110643.19624-14-paul@crapouillou.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On 07/21/2018 04:06 AM, Paul Cercueil wrote:
> From: Daniel Silsby <dansilsby@gmail.com>
> 
> Normally, we wouldn't set the channel transfer count register directly
> when using descriptor-driven transfers. However, there is no harm in
> doing so, and it allows jz4780_dma_desc_residue() to report the correct
> residue of an ongoing transfer, no matter when it is called.
> 
> Signed-off-by: Daniel Silsby <dansilsby@gmail.com>
> Tested-by: Mathieu Malaterre <malat@debian.org>
> ---
>  drivers/dma/dma-jz4780.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Hi,

Documentation/process/submitting-patches.rst says:

The Signed-off-by: tag indicates that the signer was involved in the
development of the patch, or that he/she was in the patch's delivery path.

That means that patches that are from Daniel but you send (delivery path)
should also be Signed-off-by: you.


-- 
~Randy
