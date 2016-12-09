From: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] mtd/spi-nor: Add SPI memory controllers for Aspeed
 SoCs
Date: Fri, 9 Dec 2016 14:37:36 +0100
Message-ID: <08dc9a53-505f-0b79-5bb3-1d9e73166b6c@atmel.com>
References: <1478688149-4554-1-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478688149-4554-1-git-send-email-clg-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Cedric,

Le 09/11/2016 à 11:42, Cédric Le Goater a écrit :
> This driver adds mtd support for spi-nor attached to either or both of
> the Firmware Memory Controller or the SPI Flash Controller (AST2400
> only).
> 
> The SMC controllers on the Aspeed AST2500 SoC are very similar to the
> ones found on the AST2400. The differences are on the number of
> supported flash modules and their default mappings in the SoC address
> space.
> 
> The Aspeed AST2500 has one SPI controller for the BMC firmware and two
> for the host firmware. All controllers have now the same set of
> registers compatible with the AST2400 FMC controller and the legacy
> 'SMC' controller is fully gone.
> 
> Each controller has a memory range on which it maps its flash module
> slaves. Each slave is assigned a memory window for its mapping that
> can be changed at bootime with the Segment Address Register.
> 
> Each SPI flash slave can then be accessed in two modes: Command and
> User. When in User mode, accesses to the memory segment of the slaves
> are translated in SPI transfers. When in Command mode, the HW
> generates the SPI commands automatically and the memory segment is
> accessed as if doing a MMIO.
> 
> Currently, only the User mode is supported. Command mode needs a
> little more work to check that the memory window on the AHB bus fits
> the module size.
> 
> Based on previous work from Milton D. Miller II <miltonm-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
> 
> Signed-off-by: Cédric Le Goater <clg-Bxea+6Xhats@public.gmane.org>
> ---
[...]
> +static int aspeed_smc_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
> +{
> +	struct aspeed_smc_chip *chip = nor->priv;
> +
> +	mutex_lock(&chip->controller->mutex);
> +
> +	aspeed_smc_start_user(nor);
> +	aspeed_smc_write_to_ahb(chip->base, &opcode, 1);
> +	aspeed_smc_read_from_ahb(buf, chip->base, len);
> +	aspeed_smc_stop_user(nor);
> +
> +	mutex_unlock(&chip->controller->mutex);
> +
> +	return 0;
> +}
> +
> +static int aspeed_smc_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf,
> +				int len)
> +{
> +	struct aspeed_smc_chip *chip = nor->priv;
> +
> +	mutex_lock(&chip->controller->mutex);
> +
> +	aspeed_smc_start_user(nor);
> +	aspeed_smc_write_to_ahb(chip->base, &opcode, 1);
> +	aspeed_smc_write_to_ahb(chip->base, buf, len);
> +	aspeed_smc_stop_user(nor);
> +
> +	mutex_unlock(&chip->controller->mutex);
> +
> +	return 0;
> +}
> +
[...]
> +static ssize_t aspeed_smc_read_user(struct spi_nor *nor, loff_t from,
> +				    size_t len, u_char *read_buf)
> +{
> +	struct aspeed_smc_chip *chip = nor->priv;
> +
> +	mutex_lock(&chip->controller->mutex);
> +
> +	aspeed_smc_start_user(nor);
> +	aspeed_smc_send_cmd_addr(nor, nor->read_opcode, from);
> +	aspeed_smc_read_from_ahb(read_buf, chip->base, len);
> +	aspeed_smc_stop_user(nor);
> +
> +	mutex_unlock(&chip->controller->mutex);
> +
> +	return len;
> +}
> +
> +static ssize_t aspeed_smc_write_user(struct spi_nor *nor, loff_t to, size_t len,
> +				     const u_char *write_buf)
> +{
> +	struct aspeed_smc_chip *chip = nor->priv;
> +
> +	mutex_lock(&chip->controller->mutex);
> +
> +	aspeed_smc_start_user(nor);
> +	aspeed_smc_send_cmd_addr(nor, nor->program_opcode, to);
> +	aspeed_smc_write_to_ahb(chip->base, write_buf, len);
> +	aspeed_smc_stop_user(nor);
> +
> +	mutex_unlock(&chip->controller->mutex);
> +
> +	return len;
> +}

As I've explained in review of the series v1, the chip->controller->mutex
seems to be used only by aspeed_smc_read_reg(), aspeed_smc_write_reg(),
aspeed_smc_read_user() and aspeed_smc_write_user(), the driver
implementations of nor->read_reg(), nor->write_reg(), nor->read() and
nor->write().

This driver locks the mutex at the very beginning of each of those
functions and unlocks the mutex before returning.

So my understanding is that you use this mutex to prevent
aspeed_smc_[read|write]_[reg|user]() from being called concurrently.

If so, the spi-nor framework already takes care of this issue with the
couple of functions: spi_nor_lock_and_prep() / spi_nor_unlock_and_unprep().

Indeed, spi_nor_lock_and_prep() is called on entering and
spi_nor_unlock_and_unprep() on exiting each of the following functions:
- mtd->_read = spi_nor_read
- mtd->_write = spi_nor_write / sst_write
- mtd->_erase = spi_nor_erase
- mtd->_lock = spi_nor_lock
- mtd->_unlock = spi_nor_unlock
- mtd->_is_lock = spi_nor_is_locked

Except for spi_nor_scan(), which is called once for all during the probe
and before registering the mtd_info structure, only the above
mtd->_<handlers> call the nor->read_reg, nor->write_reg, nor->read,
nor->erase and nor->write spi-nor handlers.
So your spi-nor / aspeed_smc_<handlers> are always protected from
concurrent access by the mutex locked in spi_nor_lock_and_prep().

So don't worry about concurrent access issue, the spi-nor framework takes
care of you :)

Best regards,

Cyrille
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
