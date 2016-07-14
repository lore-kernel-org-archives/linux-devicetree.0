From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v12] mtd: spi-nor: add hisilicon spi-nor flash controller
 driver
Date: Wed, 13 Jul 2016 18:13:31 -0700
Message-ID: <20160714011331.GE54628@google.com>
References: <1467100099-6172-1-git-send-email-xuejiancheng@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1467100099-6172-1-git-send-email-xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org, jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org, cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yanghongwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, linshunquan1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Binquan Peng <pengbinquan-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 28, 2016 at 03:48:19PM +0800, Jiancheng Xue wrote:
> Add hisilicon spi-nor flash controller driver
> 
> Signed-off-by: Binquan Peng <pengbinquan-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
> Signed-off-by: Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Reviewed-by: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
> Reviewed-by: Jagan Teki <jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> ---
> change log
> v12:
> 1)Made SPI_HISI_SFC depend on HAS_DMA to fix the kbuild test robot error.
> 2)Added "Reviewed-by Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>" and 
> "Reviewed-by: Jagan Teki <jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>" in the commit message.
> v11:
> Fixed issues pointed by Brian Norris and Cyrille Pitchen.
> 1)Changed hisi_spi_nor_read_reg()/write_reg() to configure registers
> without sniffing the opcodes.
> 2)Deleted hisi_spi_nor_erase() and used default implementation instead.
> 3)Changed hisi_spi_nor_dma_transfer() to return a integer type value
> instead of nothing.
> 4)Simplified hisi_spi_nor_read()/write() as Brian suggested.
> 
> v10:
> Fixed issues pointed by Marek Vasut.
> 1)Droped the underscores in the argument names of some macros' definition.
> 2)Changed some varibles to correct type.
> 3)Rewrote hisi_spi_nor_read/write for readability.
> 4)Added new functions hisi_spi_nor_register/unregister_all
> 5)Changed to dynamically allocation for spi_nor embeded in hifmc_host.
> Fixed issues pointed by Brian Norris.
> 1)Replaced some headers with more accurate ones.
> v9:
> Fixed issues pointed by Jagan Teki.
> v8:
> Fixed issues pointed by Ezequiel Garcia and Brian Norris.
> Moved dts binding file to mtd directory.
> Changed the compatible string more specific.
> v7:
> Rebased to v4.5-rc3.
> Fixed issues pointed by Ezequiel Garcia.
> v6:
> Based on v4.5-rc2
> Fixed issues pointed by Ezequiel Garcia.
> v5:
> Fixed a compile error.
> v4:
> Rebased to v4.5-rc1
> v3:
> Added a compatible string "hisilicon,hi3519-sfc".
> v2:
> Fixed some compiling warings.
>  .../bindings/mtd/hisilicon,fmc-spi-nor.txt         |  24 +
>  drivers/mtd/spi-nor/Kconfig                        |   7 +
>  drivers/mtd/spi-nor/Makefile                       |   1 +
>  drivers/mtd/spi-nor/hisi-sfc.c                     | 489 +++++++++++++++++++++
>  4 files changed, 521 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/hisilicon,fmc-spi-nor.txt
>  create mode 100644 drivers/mtd/spi-nor/hisi-sfc.c

Pushed to l2-mtd.git, with the following diff due to API changes. Please
review to be sure it looks OK to you.

Also, please base changes on l2-mtd.git or linux-next.git in the future.

Regards,
Brian

diff --git a/drivers/mtd/spi-nor/hisi-sfc.c b/drivers/mtd/spi-nor/hisi-sfc.c
index 44664c3fc5ff..20378b0d55e9 100644
--- a/drivers/mtd/spi-nor/hisi-sfc.c
+++ b/drivers/mtd/spi-nor/hisi-sfc.c
@@ -269,8 +269,8 @@ static int hisi_spi_nor_dma_transfer(struct spi_nor *nor, loff_t start_off,
 	return wait_op_finish(host);
 }
 
-static int hisi_spi_nor_read(struct spi_nor *nor, loff_t from, size_t len,
-		size_t *retlen, u_char *read_buf)
+static ssize_t hisi_spi_nor_read(struct spi_nor *nor, loff_t from, size_t len,
+		u_char *read_buf)
 {
 	struct hifmc_priv *priv = nor->priv;
 	struct hifmc_host *host = priv->host;
@@ -287,14 +287,13 @@ static int hisi_spi_nor_read(struct spi_nor *nor, loff_t from, size_t len,
 			return ret;
 		}
 		memcpy(read_buf + offset, host->buffer, trans);
-		*retlen += trans;
 	}
 
-	return 0;
+	return len;
 }
 
-static void hisi_spi_nor_write(struct spi_nor *nor, loff_t to,
-			size_t len, size_t *retlen, const u_char *write_buf)
+static ssize_t hisi_spi_nor_write(struct spi_nor *nor, loff_t to,
+			size_t len, const u_char *write_buf)
 {
 	struct hifmc_priv *priv = nor->priv;
 	struct hifmc_host *host = priv->host;
@@ -309,10 +308,11 @@ static void hisi_spi_nor_write(struct spi_nor *nor, loff_t to,
 			to + offset, host->dma_buffer, trans, FMC_OP_WRITE);
 		if (ret) {
 			dev_warn(nor->dev, "DMA write timeout\n");
-			return;
+			return ret;
 		}
-		*retlen += len;
 	}
+
+	return len;
 }
 
 /**
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
