From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 1/9] dt-bindings: mtd: ingenic: Add compatible
 strings for JZ4740 and JZ4725B
Date: Mon, 4 Mar 2019 10:45:54 +0100
Message-ID: <20190304104554.09be4cd4@xps13>
References: <20190209192305.4434-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190209192305.4434-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Paul,

Paul Cercueil <paul@crapouillou.net> wrote on Sat,  9 Feb 2019 16:22:57
-0300:

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
> diff --git a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
> index 29ea5853ca91..a5b940f18bf6 100644
> --- a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
> @@ -6,7 +6,10 @@ memory-controllers/ingenic,jz4780-nemc.txt), and thus NAND device nodes must
>  be children of the NEMC node.
>  
>  Required NAND controller device properties:
> -- compatible: Should be set to "ingenic,jz4780-nand".
> +- compatible: Should be one of:
> +  * ingenic,jz4740-nand
> +  * ingenic,jz4725b-nand
> +  * ingenic,jz4780-nand

Wouldn't "-nand-controller" suffix be better? Of course in the driver
you should still check for jz4780-nand.

>  - reg: For each bank with a NAND chip attached, should specify a bank number,
>    an offset of 0 and a size of 0x1000000 (i.e. the whole NEMC bank).
>  
> @@ -72,7 +75,10 @@ NAND devices. The following is a description of the device properties for a
>  BCH controller.
>  
>  Required BCH properties:
> -- compatible: Should be set to "ingenic,jz4780-bch".
> +- compatible: Should be one of:
> +  * ingenic,jz4740-ecc
> +  * ingenic,jz4725b-bch
> +  * ingenic,jz4780-bch
>  - reg: Should specify the BCH controller registers location and length.
>  - clocks: Clock for the BCH controller.
>  

Thanks,
Miquèl
