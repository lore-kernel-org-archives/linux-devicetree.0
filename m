From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 3/4] arm: am33xx: DT quirks for am33xx based beaglebone
 variants
Date: Thu, 19 Feb 2015 10:16:57 -0800
Message-ID: <20150219181656.GF32521@atomide.com>
References: <1424271576-1952-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1424271576-1952-4-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1424271576-1952-4-git-send-email-pantelis.antoniou@konsulko.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: devicetree@vger.kernel.org, Pantelis Antoniou <panto@antoniou-consulting.com>, Koen Kooi <koen@dominion.thruhere.net>, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Ludovic Desroches <ludovic.desroches@atmel.com>, linux-arm-kernel@lists.infradead.org, Matt Porter <matt.porter@linaro.org>, Guenter Roeck <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org

* Pantelis Antoniou <pantelis.antoniou@konsulko.com> [150218 07:03]:
> Implement DT quirks for the am33xx beaglebone boards.
> --- /dev/null
> +++ b/arch/arm/mach-omap2/am33xx-dt-quirks.c
...
> +
> +/*
> + * The board IDs for am33xx board are in an I2C EEPROM
> + * We are very early in the boot process so we have to
> + * read the EEPROM directly without using the I2C layer.
> + *
> + * Note that we rely on the bootloader setting up the muxes
> + * (which is the case for u-boot).
> + */
> +
> +/* I2C Status Register (OMAP_I2C_STAT): */
> +#define OMAP_I2C_STAT_XDR	(1 << 14)	/* TX Buffer draining */
> +#define OMAP_I2C_STAT_RDR	(1 << 13)	/* RX Buffer draining */
> +#define OMAP_I2C_STAT_BB	(1 << 12)	/* Bus busy */
> +#define OMAP_I2C_STAT_ROVR	(1 << 11)	/* Receive overrun */
> +#define OMAP_I2C_STAT_XUDF	(1 << 10)	/* Transmit underflow */
> +#define OMAP_I2C_STAT_AAS	(1 << 9)	/* Address as slave */
> +#define OMAP_I2C_STAT_BF	(1 << 8)	/* Bus Free */
> +#define OMAP_I2C_STAT_XRDY	(1 << 4)	/* Transmit data ready */
> +#define OMAP_I2C_STAT_RRDY	(1 << 3)	/* Receive data ready */
> +#define OMAP_I2C_STAT_ARDY	(1 << 2)	/* Register access ready */
> +#define OMAP_I2C_STAT_NACK	(1 << 1)	/* No ack interrupt enable */
> +#define OMAP_I2C_STAT_AL	(1 << 0)	/* Arbitration lost int ena */
...

Uhh I don't like the idea of duplicating the i2c-omap.c driver under
arch/arm.. And in general we should initialize things later rather
than earlier.

What's stopping doing these quirk checks later on time with just
a regular device driver, something like drivers/misc/bbone-quirks.c?

Regards,

Tony
