From: Jiancheng Xue <xuejiancheng@hisilicon.com>
Subject: Re: [PATCH v12] mtd: spi-nor: add hisilicon spi-nor flash controller
 driver
Date: Fri, 15 Jul 2016 09:26:29 +0800
Message-ID: <57883BC5.7060600@hisilicon.com>
References: <1467100099-6172-1-git-send-email-xuejiancheng@hisilicon.com>
 <20160714011331.GE54628@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160714011331.GE54628@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, ezequiel@vanguardiasur.com.ar, jteki@openedev.com, cyrille.pitchen@atmel.com, robh+dt@kernel.org, yanhaifeng@hisilicon.com, yanghongwei@hisilicon.com, linshunquan1@hisilicon.com, Binquan Peng <pengbinquan@hisilicon.com>
List-Id: devicetree@vger.kernel.org

Hi Brian,

On 2016/7/14 9:13, Brian Norris wrote:
> On Tue, Jun 28, 2016 at 03:48:19PM +0800, Jiancheng Xue wrote:
>> Add hisilicon spi-nor flash controller driver
>>
>> Signed-off-by: Binquan Peng <pengbinquan@hisilicon.com>
>> Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
>> Acked-by: Rob Herring <robh@kernel.org>
>> Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>> Reviewed-by: Jagan Teki <jteki@openedev.com>
>> Reviewed-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
>> ---
>> change log
>> v12:
>> 1)Made SPI_HISI_SFC depend on HAS_DMA to fix the kbuild test robot error.
>> 2)Added "Reviewed-by Cyrille Pitchen <cyrille.pitchen@atmel.com>" and 
>> "Reviewed-by: Jagan Teki <jteki@openedev.com>" in the commit message.
>> v11:
>> Fixed issues pointed by Brian Norris and Cyrille Pitchen.
>> 1)Changed hisi_spi_nor_read_reg()/write_reg() to configure registers
>> without sniffing the opcodes.
>> 2)Deleted hisi_spi_nor_erase() and used default implementation instead.
>> 3)Changed hisi_spi_nor_dma_transfer() to return a integer type value
>> instead of nothing.
>> 4)Simplified hisi_spi_nor_read()/write() as Brian suggested.
>>
>> v10:
>> Fixed issues pointed by Marek Vasut.
>> 1)Droped the underscores in the argument names of some macros' definition.
>> 2)Changed some varibles to correct type.
>> 3)Rewrote hisi_spi_nor_read/write for readability.
>> 4)Added new functions hisi_spi_nor_register/unregister_all
>> 5)Changed to dynamically allocation for spi_nor embeded in hifmc_host.
>> Fixed issues pointed by Brian Norris.
>> 1)Replaced some headers with more accurate ones.
>> v9:
>> Fixed issues pointed by Jagan Teki.
>> v8:
>> Fixed issues pointed by Ezequiel Garcia and Brian Norris.
>> Moved dts binding file to mtd directory.
>> Changed the compatible string more specific.
>> v7:
>> Rebased to v4.5-rc3.
>> Fixed issues pointed by Ezequiel Garcia.
>> v6:
>> Based on v4.5-rc2
>> Fixed issues pointed by Ezequiel Garcia.
>> v5:
>> Fixed a compile error.
>> v4:
>> Rebased to v4.5-rc1
>> v3:
>> Added a compatible string "hisilicon,hi3519-sfc".
>> v2:
>> Fixed some compiling warings.
>>  .../bindings/mtd/hisilicon,fmc-spi-nor.txt         |  24 +
>>  drivers/mtd/spi-nor/Kconfig                        |   7 +
>>  drivers/mtd/spi-nor/Makefile                       |   1 +
>>  drivers/mtd/spi-nor/hisi-sfc.c                     | 489 +++++++++++++++++++++
>>  4 files changed, 521 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mtd/hisilicon,fmc-spi-nor.txt
>>  create mode 100644 drivers/mtd/spi-nor/hisi-sfc.c
> 
> Pushed to l2-mtd.git, with the following diff due to API changes. Please
> review to be sure it looks OK to you.
> 

The changes are OK to me. Thanks!

> Also, please base changes on l2-mtd.git or linux-next.git in the future.
> 

The l2-mtd.git can't be accessed through http protocol now. The git protocol
is forbidden in our office.

I will generate patch based on linux-next.git.

Regards,
Jiancheng

> Regards,
> Brian
> 
> diff --git a/drivers/mtd/spi-nor/hisi-sfc.c b/drivers/mtd/spi-nor/hisi-sfc.c
> index 44664c3fc5ff..20378b0d55e9 100644
> --- a/drivers/mtd/spi-nor/hisi-sfc.c
> +++ b/drivers/mtd/spi-nor/hisi-sfc.c
> @@ -269,8 +269,8 @@ static int hisi_spi_nor_dma_transfer(struct spi_nor *nor, loff_t start_off,
>  	return wait_op_finish(host);
>  }
>  
> -static int hisi_spi_nor_read(struct spi_nor *nor, loff_t from, size_t len,
> -		size_t *retlen, u_char *read_buf)
> +static ssize_t hisi_spi_nor_read(struct spi_nor *nor, loff_t from, size_t len,
> +		u_char *read_buf)
>  {
>  	struct hifmc_priv *priv = nor->priv;
>  	struct hifmc_host *host = priv->host;
> @@ -287,14 +287,13 @@ static int hisi_spi_nor_read(struct spi_nor *nor, loff_t from, size_t len,
>  			return ret;
>  		}
>  		memcpy(read_buf + offset, host->buffer, trans);
> -		*retlen += trans;
>  	}
>  
> -	return 0;
> +	return len;
>  }
>  
> -static void hisi_spi_nor_write(struct spi_nor *nor, loff_t to,
> -			size_t len, size_t *retlen, const u_char *write_buf)
> +static ssize_t hisi_spi_nor_write(struct spi_nor *nor, loff_t to,
> +			size_t len, const u_char *write_buf)
>  {
>  	struct hifmc_priv *priv = nor->priv;
>  	struct hifmc_host *host = priv->host;
> @@ -309,10 +308,11 @@ static void hisi_spi_nor_write(struct spi_nor *nor, loff_t to,
>  			to + offset, host->dma_buffer, trans, FMC_OP_WRITE);
>  		if (ret) {
>  			dev_warn(nor->dev, "DMA write timeout\n");
> -			return;
> +			return ret;
>  		}
> -		*retlen += len;
>  	}
> +
> +	return len;
>  }
>  
>  /**
> 
> .
> 
