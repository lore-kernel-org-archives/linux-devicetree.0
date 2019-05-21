From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: brcmnand: Make
 nand-ecc-strength and nand-ecc-step-size optional
Date: Tue, 21 May 2019 10:53:30 +0200
Message-ID: <20190521105330.6d9444c0@xps13>
References: <1558379144-28283-1-git-send-email-kdasu.kdev@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558379144-28283-1-git-send-email-kdasu.kdev@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kamal Dasu <kdasu.kdev@gmail.com>
Cc: linux-mtd@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Kamal,

Kamal Dasu <kdasu.kdev@gmail.com> wrote on Mon, 20 May 2019 15:05:11
-0400:

> nand-ecc-strength and nand-ecc-step-size can be made optional as
> brcmnand driver can support using raw NAND layer detected values.
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> ---
>  Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> index bcda1df..29feaba 100644
> --- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> +++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> @@ -101,10 +101,10 @@ Required properties:
>                                number (e.g., 0, 1, 2, etc.)
>  - #address-cells            : see partition.txt
>  - #size-cells               : see partition.txt
> -- nand-ecc-strength         : see nand.txt
> -- nand-ecc-step-size        : must be 512 or 1024. See nand.txt
>  
>  Optional properties:
> +- nand-ecc-strength         : see nand.txt
> +- nand-ecc-step-size        : must be 512 or 1024. See nand.txt
>  - nand-on-flash-bbt         : boolean, to enable the on-flash BBT for this
>                                chip-select. See nand.txt
>  - brcm,nand-oob-sector-size : integer, to denote the spare area sector size


Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>


Thanks,
Miquèl
