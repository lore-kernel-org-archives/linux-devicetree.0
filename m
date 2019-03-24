From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [RFC PATCH v2 1/5] mtd: cfi_cmdset_0002: Add support for polling
 status register
Date: Sun, 24 Mar 2019 19:23:23 +0300
Message-ID: <597bbe8e-65d3-40c6-5d15-544e962be7c3@cogentembedded.com>
References: <20190321174548.9288-1-vigneshr@ti.com>
 <20190321174548.9288-2-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190321174548.9288-2-vigneshr@ti.com>
Content-Language: en-MW
Sender: linux-kernel-owner@vger.kernel.org
To: Vignesh Raghavendra <vigneshr@ti.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tudor.ambarus@microchip.com, nsekhar@ti.com, Mason Yang <masonccyang@mxic.com.tw>
List-Id: devicetree@vger.kernel.org

Hello!

On 03/21/2019 08:45 PM, Vignesh Raghavendra wrote:

> HyperFlash devices are compliant with CFI AMD/Fujitsu Extended Command
> Set(0x0002) for flash operations, therefore drivers/mtd/chips/cfi_cmdset_0002.c
> can be use as is. But these devices do not support DQ polling method of
> determining chip ready/good status. These flashes provide Status
> Register whose bits can be polled to know status of flash operation.
> 
> Cypress HyperFlash datasheet here[1], talks about CFI Amd/Fujitsu
> Extended Query version 1.5. Bit 0 of "Software Features supported" field
> of CFI Primary Vendor-Specific Extended Query table indicates
> presence/absence of status register and Bit 1 indicates whether or not
> DQ polling is supported. Using these bits, its possible to determine
> whether flash supports DQ polling or need to use Status Register.

   We need?

> Add support for polling status register to know device ready/status of
> erase/write operations when DQ polling is not supported.
> 
> [1] https://www.cypress.com/file/213346/download
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c | 50 +++++++++++++++++++++++++++++
>  include/linux/mtd/cfi.h             |  5 +++
>  2 files changed, 55 insertions(+)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index 72428b6bfc47..29987d8e6c6e 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
[...]
> diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
> index cbf77168658c..92ac82ac2329 100644
> --- a/include/linux/mtd/cfi.h
> +++ b/include/linux/mtd/cfi.h
> @@ -233,6 +233,11 @@ struct cfi_pri_amdstd {
>  	uint8_t  VppMin;
>  	uint8_t  VppMax;
>  	uint8_t  TopBottom;
> +	/* Below field are added from version 1.5 */

   The below fields are.

> +	uint8_t  ProgramSuspend;
> +	uint8_t  UnlockBypass;
> +	uint8_t  SecureSiliconSector;
> +	uint8_t  SoftwareFeatures;
>  } __packed;
>  
>  /* Vendor-Specific PRI for Atmel chips (command set 0x0002) */
> 

MBR, Sergei
