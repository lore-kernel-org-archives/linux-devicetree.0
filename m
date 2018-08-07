From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 01/18] doc: dt-bindings: jz4780-dma: Update bindings
 to reflect driver changes
Date: Tue, 7 Aug 2018 09:01:29 -0600
Message-ID: <20180807150129.GA9404@rob-hp-laptop>
References: <20180807114218.20091-1-paul@crapouillou.net>
 <20180807114218.20091-2-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180807114218.20091-2-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Vinod Koul <vkoul@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 07, 2018 at 01:42:01PM +0200, Paul Cercueil wrote:
> The driver now expects the devicetree to supply a second memory
> resource. This resource is mandatory on the newly supported SoCs.
> For the JZ4780, new devicetree code must also provide it, although the
> driver is still compatible with older devicetree binaries.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Mathieu Malaterre <malat@debian.org>
> ---
>  Documentation/devicetree/bindings/dma/jz4780-dma.txt | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)

Drop the 'doc: ' from the subject if you respin. Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>
