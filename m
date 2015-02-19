From: Pantelis Antoniou <panto@antoniou-consulting.com>
Subject: Re: [PATCH 3/4] arm: am33xx: DT quirks for am33xx based beaglebone variants
Date: Thu, 19 Feb 2015 20:28:13 +0200
Message-ID: <9C7BFC7C-0751-4233-927F-D01AF078704B@antoniou-consulting.com>
References: <1424271576-1952-1-git-send-email-pantelis.antoniou@konsulko.com> <1424271576-1952-4-git-send-email-pantelis.antoniou@konsulko.com> <20150219181656.GF32521@atomide.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150219181656.GF32521@atomide.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Guenter Roeck <linux@roeck-us.net>, Ludovic Desroches <ludovic.desroches@atmel.com>, Rob Herring <robherring2@gmail.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Tony,

> On Feb 19, 2015, at 20:16 , Tony Lindgren <tony@atomide.com> wrote:
>=20
> * Pantelis Antoniou <pantelis.antoniou@konsulko.com> [150218 07:03]:
>> Implement DT quirks for the am33xx beaglebone boards.
>> --- /dev/null
>> +++ b/arch/arm/mach-omap2/am33xx-dt-quirks.c
> ...
>> +
>> +/*
>> + * The board IDs for am33xx board are in an I2C EEPROM
>> + * We are very early in the boot process so we have to
>> + * read the EEPROM directly without using the I2C layer.
>> + *
>> + * Note that we rely on the bootloader setting up the muxes
>> + * (which is the case for u-boot).
>> + */
>> +
>> +/* I2C Status Register (OMAP_I2C_STAT): */
>> +#define OMAP_I2C_STAT_XDR	(1 << 14)	/* TX Buffer draining */
>> +#define OMAP_I2C_STAT_RDR	(1 << 13)	/* RX Buffer draining */
>> +#define OMAP_I2C_STAT_BB	(1 << 12)	/* Bus busy */
>> +#define OMAP_I2C_STAT_ROVR	(1 << 11)	/* Receive overrun */
>> +#define OMAP_I2C_STAT_XUDF	(1 << 10)	/* Transmit underflow */
>> +#define OMAP_I2C_STAT_AAS	(1 << 9)	/* Address as slave */
>> +#define OMAP_I2C_STAT_BF	(1 << 8)	/* Bus Free */
>> +#define OMAP_I2C_STAT_XRDY	(1 << 4)	/* Transmit data ready */
>> +#define OMAP_I2C_STAT_RRDY	(1 << 3)	/* Receive data ready */
>> +#define OMAP_I2C_STAT_ARDY	(1 << 2)	/* Register access ready */
>> +#define OMAP_I2C_STAT_NACK	(1 << 1)	/* No ack interrupt enable */
>> +#define OMAP_I2C_STAT_AL	(1 << 0)	/* Arbitration lost int ena */
> ...
>=20
> Uhh I don't like the idea of duplicating the i2c-omap.c driver under
> arch/arm.. And in general we should initialize things later rather
> than earlier.
>=20
> What's stopping doing these quirk checks later on time with just
> a regular device driver, something like drivers/misc/bbone-quirks.c?
>=20

We have no choice; we are way early in the boot process, right after
the device tree unflattening step.

I=E2=80=99ve toyed with the idea of using early platform devices but th=
e omap-i2c driver
would need some tender love and care to make it work, and I didn=E2=80=99=
t want to get
bogged down with i2c driver details at this point.

> Regards,
>=20
> Tony

Regards

=E2=80=94 Pantelis
