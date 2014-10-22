From: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH 1/2] misc: Add Wi2Wi w2sc0004 gps driver
Date: Thu, 23 Oct 2014 00:35:05 +0200
Message-ID: <6C2130E0-02B3-4F70-A465-3E8FB58F01CB@goldelico.com>
References: <1413491183-15018-1-git-send-email-marek@goldelico.com> <20141021104931.GC23161@amd>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141021104931.GC23161@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Marek Belisko <marek@goldelico.com>, arnd@arndb.de, gregkh@linuxfoundation.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, NeilBrown <neilb@suse.de>
List-Id: devicetree@vger.kernel.org

Hi,

Am 21.10.2014 um 12:49 schrieb Pavel Machek <pavel@ucw.cz>:

> Hi!
>=20
>> --- a/drivers/misc/Kconfig
>> +++ b/drivers/misc/Kconfig
>> @@ -515,6 +515,16 @@ config VEXPRESS_SYSCFG
>> 	  bus. System Configuration interface is one of the possible means
>> 	  of generating transactions on this bus.
>>=20
>> +config W2SG0004
>> +	tristate "W2SG0004 on/off control"
>=20
>                           ~~ insert GPS here.

ok!

> And make it bool if it can=92t be a module.
>=20
>> +	depends on GPIOLIB
>> +	help
>> +	  Enable on/off control of W2SG0004 GPS using a virtual GPIO.
>> +	  The virtual GPIO can be connected to a DTR line of a serial
>> +	  interface to allow powering up if the /dev/tty$n is opened.
>> +	  It also provides a rfkill gps node to control the LNA power.
>> +	  NOTE: can=92t currently be compiled as module, so please choose =
Y.

Sorry, this is a bug in the description that was coorect before using t=
he pinctrl
framework. The driver has been tested to work compiled as a module.

>> +
>=20
>> +++ b/drivers/misc/w2sg0004.c
>> @@ -0,0 +1,512 @@
>> +/*
>> + * w2sg0004.c
>> + * Virtual GPIO of controlling the w2sg0004 GPS receiver.
>> + *
>> + * Copyright (C) 2011 Neil Brown <neil@brown.name>
>> + *
>> + * This receiver has an ON/OFF pin which must be toggled to
>> + * turn the device 'on' or 'off'.  A high->low->high toggle
>> + * will switch the device on if it is off, and off if it is on.
>> + * It is not possible to directly detect the state of the device.
>> + * However when it is on it will send characters on a UART line
>> + * regularly.
>> + * On the OMAP3, the UART line can also be programmed as a GPIO
>> + * on which we can receive interrupts.
>> + * So when we want the device to be 'off' we can reprogram
>> + * the line, toggle the ON/OFF pin and hope that it is off.
>> + * However if an interrupt arrives we know that it is really on
>> + * and can toggle again.
>> + *
>> + * To enable receiving on/off requests we create a gpio_chip
>> + * with a single 'output' GPIO.  When it is low, the
>> + * GPS is turned off.  When it is high, it is turned on.
>> + * This can be configured as the DTR GPIO on the UART which
>> + * connects the GPS.  Then whenever the tty is open, the GPS
>> + * will be switched on, and whenever it is closed, the GPS will
>> + * be switched off.
>> + *
>> + * In addition we register as a rfkill client so that we can
>> + * control the LNA power.
>> + *
>> + */
>=20
> GPL?
>=20
>> +/*
>> + * There seems to restrictions on how quickly we can toggle the
>> + * on/off line.  data sheets says "two rtc ticks", whatever that me=
ans.
>=20
> =93seems to"?

-> =93seems to be=94

> data -> Data?

ok!

>=20
>> +enum w2sg_state {
>> +	W2SG_IDLE,	/* is not changing state */
>> +	W2SG_PULSE,	/* activate on/off impulse */
>> +	W2SG_NOPULSE	/* desctivate on/off impulse */
>> +};
>=20
> deactivate.

ok.

>=20
>> +
>> +struct gpio_w2sg {
>> +	struct		rfkill *rf_kill;
>> +	struct		regulator *lna_regulator;
>> +	int		lna_blocked;	/* rfkill block gps active */
>> +	int		lna_is_off;	/* LNA is currently off */
>> +	int		is_on;		/* current state (0/1) */
>> +	unsigned long	last_toggle;
>> +	unsigned long	backoff;	/* time to wait since last_toggle */
>> +	int		on_off_gpio;
>> +	int		rx_irq;
>> +
>> +	struct pinctrl *p;
>> +	struct pinctrl_state *default_state;	/* should be UART mode */
>> +	struct pinctrl_state *monitor_state;	/* monitor RX as GPIO */
>> +	enum w2sg_state	state;
>> +	int		requested;	/* requested state (0/1) */
>> +	int		suspended;
>> +	int		rx_redirected;
>> +	spinlock_t	lock;
>> +#ifdef CONFIG_GPIOLIB
>> +	struct gpio_chip gpio;
>> +	const char	*gpio_name[1];
>> +#endif
>=20
> Depends on gpiolib, why ifdef?

historic=85

>=20
> Array of names?

Yes, that is how it should be defined (usually gpio_chips have more tha=
n 1 entry).
Otherwise we have to provide some & operators when passing to the gpiol=
ib functions
where all other similar drivers simply use the array name. So it is a m=
atter of taste
where we need to introduce confusion. AFAIK the compiler generated bina=
ry code
should be identical.

>=20
>=20
>> +	rf_kill =3D rfkill_alloc("GPS", &pdev->dev, RFKILL_TYPE_GPS,
>> +				&gpio_w2sg0004_rfkill_ops, gw2sg);
>=20
> Actually, is rfkill interface right one on GPS? GPS is not supposed t=
o
> transmit=85

We have not invented RFKILL_TYPE_GPS. We just use it.
And AFAIK no system that transmits GPS runs Linux.

The function here is to stop it from receiving (and allows to power dow=
n
any RF amplifiers and active antennas)=85

>=20
>> +	int	gpio_base;	/* (not used by DT) - defines the  gpio.base */
>=20
>=20
> Is non-device tree path still usefull?

Probably not. At least we don=92t need it in our projects any more.

>=20
> 									Pavel

BR,
Nikolaus
