From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/9] dt-bindings: mtd: ingenic: Add compatible strings
 for the JZ4740
Date: Mon, 18 Feb 2019 13:20:46 -0600
Message-ID: <20190218192046.GA27154@bogus>
References: <20190202231926.2444-1-paul@crapouillou.net>
 <20190202231926.2444-3-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190202231926.2444-3-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Mark Rutland <mark.rutland@arm.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, Mathieu Malaterre <malat@debian.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

On Sat,  2 Feb 2019 20:19:19 -0300, Paul Cercueil wrote:
> Add compatible strings to probe the jz4780-nand and jz4780-bch drivers
> from devicetree on the JZ4725B and JZ4740 SoCs from Ingenic.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Changes:
> 
> v2: - Change 'ingenic,jz4725b-nand' compatible string to
>       'ingenic,jz4740-nand' to reflect driver change
>     - Add 'ingenic,jz4740-bch' compatible string
>     - Document 'ingenic,oob-layout' property
> 
>  .../devicetree/bindings/mtd/ingenic,jz4780-nand.txt | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
