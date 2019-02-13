From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/9] dt-bindings: mtd: ingenic: Add compatible strings
 for JZ4740 and JZ4725B
Date: Wed, 13 Feb 2019 15:45:42 -0600
Message-ID: <20190213214542.GA2102@bogus>
References: <20190209192305.4434-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190209192305.4434-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Mark Rutland <mark.rutland@arm.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

On Sat,  9 Feb 2019 16:22:57 -0300, Paul Cercueil wrote:
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
> v3: - Removed 'ingenic,oob-layout' property
>     - Update compatible strings to what the driver supports
> 
> v4: No change
> 
>  Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
