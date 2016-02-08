From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] mtd: denali: fix property name for Denali DT binding
Date: Mon, 08 Feb 2016 09:29:49 +0100
Message-ID: <5298318.0qJ9fLYbSx@wuerfel>
References: <1454916702-20982-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454916702-20982-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Dinh Nguyen <dinguyen@altera.com>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Monday 08 February 2016 16:31:42 Masahiro Yamada wrote:
> diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
> index b04d03a..785b825 100644
> --- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
> @@ -5,7 +5,7 @@ Required properties:
>    - reg : should contain registers location and length for data and reg.
>    - reg-names: Should contain the reg names "nand_data" and "denali_reg"
>    - interrupts : The interrupt number.
> -  - dm-mask : DMA bit mask
> +  - dma-mask : DMA bit mask
>  
>  The device tree may optionally contain sub-nodes describing partitions of the
>  address space. See partition.txt for more detail.
> 

It looks like this binding is wrong in multiple ways, and it doesn't seem to
be used in any .dts files. Is this actually being shipped anywhere or
could we try to fix the binding properly?

	Arnd
