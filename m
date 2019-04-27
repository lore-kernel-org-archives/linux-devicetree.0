From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v4 1/5] mtd: cfi_cmdset_0002: Add support for polling
 status register
Date: Sat, 27 Apr 2019 22:02:05 +0300
Message-ID: <093ef590-ae3d-2db2-09af-573a138a9416@cogentembedded.com>
References: <20190423104814.5762-1-vigneshr@ti.com>
 <20190423104814.5762-2-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190423104814.5762-2-vigneshr@ti.com>
Content-Language: en-MW
Sender: linux-kernel-owner@vger.kernel.org
To: Vignesh Raghavendra <vigneshr@ti.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Joakim Tjernlund <Joakim.Tjernlund@infinera.com>, devicetree@vger.kernel.org, Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org, nsekhar@ti.com, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hello!

On 04/23/2019 01:48 PM, Vignesh Raghavendra wrote:

> HyperFlash devices are compliant with CFI AMD/Fujitsu Extended Command
> Set(0x0002) for flash operations, therefore drivers/mtd/chips/cfi_cmdset_0002.c
> can be used as is. But these devices do not support DQ polling method of
> determining chip ready/good status. These flashes provide Status
> Register whose bits can be polled to know status of flash operation.
> 
> Cypress HyperFlash datasheet here[1], talks about CFI Amd/Fujitsu
> Extended Query version 1.5. Bit 0 of "Software Features supported" field
> of CFI Primary Vendor-Specific Extended Query table indicates
> presence/absence of status register and Bit 1 indicates whether or not
> DQ polling is supported. Using these bits, its possible to determine
> whether flash supports DQ polling or need to use Status Register.
> 
> Add support for polling Status Register to know device ready/status of
> erase/write operations when DQ polling is not supported.
> Print error messages on erase/program failure by looking at related
> Status Register bits.
> 
> [1] https://www.cypress.com/file/213346/download
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>

   Sorry, only superficial review, I'm not an MTD expert. :-)

> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c | 90 +++++++++++++++++++++++++++++
>  include/linux/mtd/cfi.h             |  5 ++
>  2 files changed, 95 insertions(+)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index 7b7286b4d81e..55c4d81098d5 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -49,6 +49,16 @@
>  #define SST49LF008A		0x005a
>  #define AT49BV6416		0x00d6
>  
> +/*
> + * Status Register bit description. Used by flash devices that don't
> + * support DQ polling (Eg.: HyperFlash)

   It's "e.g. " :-)

[...]
> @@ -97,6 +107,48 @@ static struct mtd_chip_driver cfi_amdstd_chipdrv = {
>  	.module		= THIS_MODULE
>  };
>  
> +/*
> + * Use status register to poll for Erase/write completion when DQ is not
> + * supported. This is indicated by Bit[1:0] of SoftwareFeatures field in
> + * CFI Primary Vendor-Specific Extended Query table 1.5
> + */
> +static int cfi_use_status_reg(struct cfi_private *cfi)
> +{
> +	struct cfi_pri_amdstd *extp = cfi->cmdset_priv;
> +
> +	return (extp->MinorVersion >= '5') &&

   Parens not needed here, especially as the next operator isn't enclosed.

> +		(extp->SoftwareFeatures & 0x3) == 0x1;
> +}
[...]

MBR, Sergei
