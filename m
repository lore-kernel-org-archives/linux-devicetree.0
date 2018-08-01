From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH] mtd: spi-nor: only apply reset hacks to broken hardware
Date: Wed, 1 Aug 2018 09:15:39 +0200
Message-ID: <20180801091539.1a49d8e0@bbrezillon>
References: <20180727183313.137943-1-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20180727183313.137943-1-computersforpeace@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, Zhiqiang Hou <Zhiqiang.Hou@nxp.com>, NeilBrown <neilb@suse.com>, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, 27 Jul 2018 11:33:13 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> Commit 59b356ffd0b0 ("mtd: m25p80: restore the status of SPI flash when
> exiting") is the latest from a long history of attempts to add reboot
> handling to handle stateful addressing modes on SPI flash. Some prior
> mostly-related discussions:
> 
> http://lists.infradead.org/pipermail/linux-mtd/2013-March/046343.html
> [PATCH 1/3] mtd: m25p80: utilize dedicated 4-byte addressing commands
> 
> http://lists.infradead.org/pipermail/barebox/2014-September/020682.html
> [RFC] MTD m25p80 3-byte addressing and boot problem
> 
> http://lists.infradead.org/pipermail/linux-mtd/2015-February/057683.html
> [PATCH 2/2] m25p80: if supported put chip to deep power down if not used
> 
> Previously, attempts to add reboot-time software reset handling were
> rejected, but the latest attempt was not.
> 
> Quick summary of the problem:
> Some systems (e.g., boot ROM or bootloader) assume that they can read
> initial boot code from their SPI flash using 3-byte addressing. If the
> flash is left in 4-byte mode after reset, these systems won't boot. The
> above patch provided a shutdown/remove hook to attempt to reset the
> addressing mode before we reboot. Notably, this patch misses out on
> huge classes of unexpected reboots (e.g., crashes, watchdog resets).
> 
> Unfortunately, it is essentially impossible to solve this problem 100%:
> if your system doesn't know how to reset the SPI flash to power-on
> defaults at initialization time, no amount of software can really rescue
> you -- there will always be a chance of some unexpected reset that
> leaves your flash in an addressing mode that your boot sequence didn't
> expect.
> 
> While it is not directly harmful to perform hacks like the
> aforementioned commit on all 4-byte addressing flash, a
> properly-designed system should not need the hack -- and in fact,
> providing this hack may mask the fact that a given system is indeed
> broken. So this patch attempts to apply this unsound hack more narrowly,
> providing a strong suggestion to developers and system designers that
> this is truly a hack. With luck, system designers can catch their errors
> early on in their development cycle, rather than applying this hack long
> term. But apparently enough systems are out in the wild that we still
> have to provide this hack.
> 
> Document a new device tree property to denote systems that do not have a
> proper hardware (or software) reset mechanism, and apply the hack (with
> a loud warning) only in this case.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Queued to spi-nor/next.

Thanks,

Boris

> ---
> Note that I intentionall didn't split the documentation patch. It seems
> clearer to do these together IMO, but if it's *really* important to
> someone...I can resend
> ---
>  .../devicetree/bindings/mtd/jedec,spi-nor.txt  |  9 +++++++++
>  drivers/mtd/spi-nor/spi-nor.c                  | 18 ++++++++++++++++--
>  include/linux/mtd/spi-nor.h                    |  1 +
>  3 files changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> index 956bb046e599..f03be904d3c2 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> @@ -69,6 +69,15 @@ Optional properties:
>                     all chips and support for it can not be detected at runtime.
>                     Refer to your chips' datasheet to check if this is supported
>                     by your chip.
> +- broken-flash-reset : Some flash devices utilize stateful addressing modes
> +		   (e.g., for 32-bit addressing) which need to be managed
> +		   carefully by a system. Because these sorts of flash don't
> +		   have a standardized software reset command, and because some
> +		   systems don't toggle the flash RESET# pin upon system reset
> +		   (if the pin even exists at all), there are systems which
> +		   cannot reboot properly if the flash is left in the "wrong"
> +		   state. This boolean flag can be used on such systems, to
> +		   denote the absence of a reliable reset mechanism.
>  
>  Example:
>  
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index d9c368c44194..f028277fb1ce 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2757,8 +2757,18 @@ static int spi_nor_init(struct spi_nor *nor)
>  
>  	if ((nor->addr_width == 4) &&
>  	    (JEDEC_MFR(nor->info) != SNOR_MFR_SPANSION) &&
> -	    !(nor->info->flags & SPI_NOR_4B_OPCODES))
> +	    !(nor->info->flags & SPI_NOR_4B_OPCODES)) {
> +		/*
> +		 * If the RESET# pin isn't hooked up properly, or the system
> +		 * otherwise doesn't perform a reset command in the boot
> +		 * sequence, it's impossible to 100% protect against unexpected
> +		 * reboots (e.g., crashes). Warn the user (or hopefully, system
> +		 * designer) that this is bad.
> +		 */
> +		WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
> +			  "enabling reset hack; may not recover from unexpected reboots\n");
>  		set_4byte(nor, nor->info, 1);
> +	}
>  
>  	return 0;
>  }
> @@ -2781,7 +2791,8 @@ void spi_nor_restore(struct spi_nor *nor)
>  	/* restore the addressing mode */
>  	if ((nor->addr_width == 4) &&
>  	    (JEDEC_MFR(nor->info) != SNOR_MFR_SPANSION) &&
> -	    !(nor->info->flags & SPI_NOR_4B_OPCODES))
> +	    !(nor->info->flags & SPI_NOR_4B_OPCODES) &&
> +	    (nor->flags & SNOR_F_BROKEN_RESET))
>  		set_4byte(nor, nor->info, 0);
>  }
>  EXPORT_SYMBOL_GPL(spi_nor_restore);
> @@ -2911,6 +2922,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  		params.hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
>  	}
>  
> +	if (of_property_read_bool(np, "broken-flash-reset"))
> +		nor->flags |= SNOR_F_BROKEN_RESET;
> +
>  	/* Some devices cannot do fast-read, no matter what DT tells us */
>  	if (info->flags & SPI_NOR_NO_FR)
>  		params.hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index e60da0d34cc1..c922e97f205a 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -235,6 +235,7 @@ enum spi_nor_option_flags {
>  	SNOR_F_S3AN_ADDR_DEFAULT = BIT(3),
>  	SNOR_F_READY_XSR_RDY	= BIT(4),
>  	SNOR_F_USE_CLSR		= BIT(5),
> +	SNOR_F_BROKEN_RESET	= BIT(6),
>  };
>  
>  /**


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
