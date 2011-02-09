From: Belisko Marek <marek.belisko@gmail.com>
Subject: Re: [PATCH v3] watchdog: Add driver for Altera Watchdog Timer
Date: Wed, 9 Feb 2011 08:56:48 +0100
Message-ID: <AANLkTi=QiCgoswixhUEseK9+-=S0R_sZLA-AefmcC9=T@mail.gmail.com>
References: <1297171322-32401-1-git-send-email-tklauser@distanz.ch>
	<1297235952-20435-1-git-send-email-tklauser@distanz.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1297235952-20435-1-git-send-email-tklauser@distanz.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Tobias Klauser <tklauser@distanz.ch>
Cc: Wim Van Sebroeck <wim@iguana.be>, linux-watchdog@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Jamie Iles <jamie@jamieiles.com>, Walter Goossens <waltergoossens@home.nl>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, nios2-dev@sopc.et.ntust.edu.tw
List-Id: devicetree@vger.kernel.org

On Wed, Feb 9, 2011 at 8:19 AM, Tobias Klauser <tklauser@distanz.ch> wr=
ote:
> This driver adds support for the Altera Timer in the Watchdog Timer
> configuration. This component is usually found on SOPC (System on
> Programmable Chip) for Altera FPGAs.
>
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> Reviewed-by: Jamie Iles <jamie@jamieiles.com>
> ---
> Thanks a lot to Jamie Iles and Walter Goossens for their feedback on =
v2.
>
> changes for v3:
> =C2=A0- Make altera_wdt_setup static void (as suggested by Jamie)
> =C2=A0- Use const __be32 * for devicetree properties (as suggested by=
 Walter)
> changes for v2:
> =C2=A0- Get driver properties from devicetree (and document them), th=
us the
> =C2=A0 driver depends on OF
> =C2=A0- Do not select WATCHDOG_NOWAYOUT, but instead implement a soft=
ware
> =C2=A0 timer resetting the watchdog timer when the device is not open
> =C2=A0- Only support a single instance of the watchdog, so the privat=
e data
> =C2=A0 can be kept in static data
> =C2=A0- Use devm_* functions in altera_wdt_probe to simplify cleanup =
and
> =C2=A0 error handling
> =C2=A0- Remove empty altera_wdt_shutdown function
> =C2=A0- Add MODULE_LICENSE (GPL)
>
>
> =C2=A0.../devicetree/bindings/watchdog/altera_wdt.txt =C2=A0 =C2=A0| =
=C2=A0 =C2=A07 +
> =C2=A0drivers/watchdog/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A08 +
> =C2=A0drivers/watchdog/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A01 +
> =C2=A0drivers/watchdog/altera_wdt.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0309 +++++++++++++++++=
+++
> =C2=A04 files changed, 325 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 Documentation/devicetree/bindings/watchdog/a=
ltera_wdt.txt
> =C2=A0create mode 100644 drivers/watchdog/altera_wdt.c
>
> diff --git a/Documentation/devicetree/bindings/watchdog/altera_wdt.tx=
t b/Documentation/devicetree/bindings/watchdog/altera_wdt.txt
> new file mode 100644
> index 0000000..16ac949
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/altera_wdt.txt
> @@ -0,0 +1,7 @@
> +Altera Watchdog Timer
> +
> +Required properties:
> +- compatible : should be "ALTR,wdt-1.0"
> +- clock-frequency : frequency of the clock input
> +- timeout : load value of the timer (number of clock ticks until wat=
chdog
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0resets)
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index bd6a33d..ebcafb0 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -69,6 +69,14 @@ config WM8350_WATCHDOG
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Support for the watchdog in the WM8=
350 AudioPlus PMIC. =C2=A0When
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the watchdog triggers the system wi=
ll be reset.
>
> +config ALTERA_WDT
> + =C2=A0 =C2=A0 =C2=A0 tristate "Altera Watchdog Timer"
> + =C2=A0 =C2=A0 =C2=A0 depends on OF
> + =C2=A0 =C2=A0 =C2=A0 help
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 Support for the Altera Timer in the Wat=
chdog Timer configuration. This
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 component is found on SOPC (System on P=
rogrammable Chip) for Altera
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 FPGAs.
> +
> =C2=A0# ALPHA Architecture
>
> =C2=A0# ARM Architecture
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index fd9c8c0..48a2167 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -153,4 +153,5 @@ obj-$(CONFIG_WATCHDOG_CP1XXX) =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D cpwd.o
> =C2=A0obj-$(CONFIG_WM831X_WATCHDOG) +=3D wm831x_wdt.o
> =C2=A0obj-$(CONFIG_WM8350_WATCHDOG) +=3D wm8350_wdt.o
> =C2=A0obj-$(CONFIG_MAX63XX_WATCHDOG) +=3D max63xx_wdt.o
> +obj-$(CONFIG_ALTERA_WDT) +=3D altera_wdt.o
> =C2=A0obj-$(CONFIG_SOFT_WATCHDOG) +=3D softdog.o
> diff --git a/drivers/watchdog/altera_wdt.c b/drivers/watchdog/altera_=
wdt.c
> new file mode 100644
> index 0000000..2a7f14a
> --- /dev/null
> +++ b/drivers/watchdog/altera_wdt.c
> @@ -0,0 +1,309 @@
> +/*
> + * Driver for the Altera Watchdog Timer
> + *
> + * Copyright (C) 2011 Tobias Klauser <tklauser@distanz.ch>
> + * Copyright (C) 2005 Walter Goossens
> + *
> + * Originally based on wdt.c which is
> + *
> + * Copyright (C) 1995-1997 Alan Cox <alan@lxorguk.ukuu.org.uk>
> + *
> + * Software timeout heartbeat code based on pika_wdt.c which is
> + *
> + * Copyright (c) 2008 PIKA Technologies
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/miscdevice.h>
> +#include <linux/watchdog.h>
> +#include <linux/platform_device.h>
> +#include <linux/fs.h>
> +#include <linux/init.h>
> +#include <linux/jiffies.h>
> +#include <linux/timer.h>
> +#include <linux/io.h>
> +#include <linux/uaccess.h>
> +#include <linux/of_platform.h>
> +
> +#define WATCHDOG_NAME =C2=A0"altera_wdt"
> +
> +/* Register offsets */
> +#define ALTERA_WDT_STATUS =C2=A0 =C2=A0 =C2=A00x00
> +#define ALTERA_WDT_CONTROL =C2=A0 =C2=A0 0x04
> +#define ALTERA_WDT_PERIODL =C2=A0 =C2=A0 0x08
> +#define ALTERA_WDT_PERIODH =C2=A0 =C2=A0 0x0C
> +
> +#define ALTERA_WDT_RUN_BIT =C2=A0 =C2=A0 0x04
> +
> +/* User land timeout */
> +#define WDT_HEARTBEAT 15
> +static int heartbeat =3D WDT_HEARTBEAT;
> +module_param(heartbeat, int, 0);
> +MODULE_PARM_DESC(heartbeat, "Watchdog heartbeats in seconds. "
> + =C2=A0 =C2=A0 =C2=A0 "(default =3D " __MODULE_STRING(WDT_HEARTBEAT)=
 ")");
> +
> +static int nowayout =3D WATCHDOG_NOWAYOUT;
> +module_param(nowayout, int, 0);
> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started =
"
> + =C2=A0 =C2=A0 =C2=A0 "(default=3D" __MODULE_STRING(WATCHDOG_NOWAYOU=
T) ")");
> +
> +static struct {
> + =C2=A0 =C2=A0 =C2=A0 void __iomem *base;
> + =C2=A0 =C2=A0 =C2=A0 unsigned long wdt_timeout; =C2=A0 =C2=A0 =C2=A0=
/* timeout of the hardware timer */
> +
> + =C2=A0 =C2=A0 =C2=A0 unsigned long next_heartbeat; =C2=A0 /* the ne=
xt_heartbeat for the timer */
> + =C2=A0 =C2=A0 =C2=A0 unsigned long is_open;
> + =C2=A0 =C2=A0 =C2=A0 char expect_close;
> + =C2=A0 =C2=A0 =C2=A0 struct timer_list timer; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0/* software timer that pings the watchdog */
> +} altera_wdt_priv;
> +
> +/*
> + * Start the watchdog. Once it has been started, it cannot be stoppe=
d anymore.
> + */
> +static void altera_wdt_setup(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 u32 control =3D readl(altera_wdt_priv.base + A=
LTERA_WDT_CONTROL);
> +
> + =C2=A0 =C2=A0 =C2=A0 writel(control | ALTERA_WDT_RUN_BIT, altera_wd=
t_priv.base + ALTERA_WDT_CONTROL);
> +}
> +
> +/*
> + * Tickle the watchdog (reset the watchdog timer)
> + */
> +static void altera_wdt_reset(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 /* It doesn't matter what value we write */
> + =C2=A0 =C2=A0 =C2=A0 writel(1, altera_wdt_priv.base + ALTERA_WDT_PE=
RIODL);
> +}
> +
> +/*
> + * Software timer tick
> + */
> +static void altera_wdt_ping(unsigned long data)
> +{
> + =C2=A0 =C2=A0 =C2=A0 if (time_before(jiffies, altera_wdt_priv.next_=
heartbeat) ||
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 (!nowayout && !altera_wdt_priv.is_open)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 altera_wdt_reset()=
;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mod_timer(&altera_=
wdt_priv.timer, jiffies + altera_wdt_priv.wdt_timeout);
> + =C2=A0 =C2=A0 =C2=A0 } else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_crit(WATCHDOG_N=
AME ": I will reset your machine!\n");
> +}
> +
> +static void altera_wdt_keepalive(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 altera_wdt_priv.next_heartbeat =3D jiffies + h=
eartbeat * HZ;
> +}
> +
> +static void altera_wdt_start(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 altera_wdt_keepalive();
> + =C2=A0 =C2=A0 =C2=A0 mod_timer(&altera_wdt_priv.timer, jiffies + al=
tera_wdt_priv.wdt_timeout);
> +}
> +
> +static int altera_wdt_open(struct inode *inode, struct file *file)
> +{
> + =C2=A0 =C2=A0 =C2=A0 /* /dev/watchdog can only be opened once */
> + =C2=A0 =C2=A0 =C2=A0 if (test_and_set_bit(0, &altera_wdt_priv.is_op=
en))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EBUSY;
> +
> + =C2=A0 =C2=A0 =C2=A0 altera_wdt_start();
> +
> + =C2=A0 =C2=A0 =C2=A0 return nonseekable_open(inode, file);
> +}
> +
> +static int altera_wdt_release(struct inode *inode, struct file *file=
)
> +{
> + =C2=A0 =C2=A0 =C2=A0 /* stop internal ping */
> + =C2=A0 =C2=A0 =C2=A0 if (!altera_wdt_priv.expect_close)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 del_timer(&altera_=
wdt_priv.timer);
> +
> + =C2=A0 =C2=A0 =C2=A0 clear_bit(0, &altera_wdt_priv.is_open);
> + =C2=A0 =C2=A0 =C2=A0 altera_wdt_priv.expect_close =3D 0;
> +
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}
> +
> +static ssize_t altera_wdt_write(struct file *file, const char __user=
 *data,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t len, loff_t=
 *ppos)
> +{
> + =C2=A0 =C2=A0 =C2=A0 if (!len)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
> +
> + =C2=A0 =C2=A0 =C2=A0 /* Scan for magic character */
> + =C2=A0 =C2=A0 =C2=A0 if (!nowayout) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t i;
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 altera_wdt_priv.ex=
pect_close =3D 0;
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < =
len; i++) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 char c;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (get_user(c, data + i))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EFAULT;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (c =3D=3D 'V') {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 altera_wdt_priv.expect_close =3D 42=
;
=46or what this value is used? Why 42? It's never checked in code to su=
ch a value.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 altera_wdt_keepalive();
> +
> + =C2=A0 =C2=A0 =C2=A0 return len;
> +}
> +
> +static const struct watchdog_info altera_wdt_info =3D {
> + =C2=A0 =C2=A0 =C2=A0 .identity =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D "Altera Watchdog",
> + =C2=A0 =C2=A0 =C2=A0 .options =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D WDIOF_SETTIMEOUT |
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WDIOF_KEEPALIVEPING |
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WDIOF_MAGICCLOSE,
> + =C2=A0 =C2=A0 =C2=A0 .firmware_version =C2=A0 =C2=A0 =C2=A0 =3D 1,
> +};
> +
> +static long altera_wdt_ioctl(struct file *file, unsigned int cmd,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long arg)
> +{
> + =C2=A0 =C2=A0 =C2=A0 void __user *argp =3D (void __user *) arg;
> + =C2=A0 =C2=A0 =C2=A0 int __user *p =3D argp;
> + =C2=A0 =C2=A0 =C2=A0 int new_value;
> +
> + =C2=A0 =C2=A0 =C2=A0 switch (cmd) {
> + =C2=A0 =C2=A0 =C2=A0 case WDIOC_GETSUPPORT:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return copy_to_use=
r(argp, &altera_wdt_info, sizeof(altera_wdt_info));
> +
> + =C2=A0 =C2=A0 =C2=A0 case WDIOC_GETSTATUS:
> + =C2=A0 =C2=A0 =C2=A0 case WDIOC_GETBOOTSTATUS:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return put_user(0,=
 p);
> +
> + =C2=A0 =C2=A0 =C2=A0 case WDIOC_KEEPALIVE:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 altera_wdt_keepali=
ve();
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
> +
> + =C2=A0 =C2=A0 =C2=A0 case WDIOC_SETTIMEOUT:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (get_user(new_v=
alue, p))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 return -EFAULT;
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 heartbeat =3D new_=
value;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 altera_wdt_keepali=
ve();
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return put_user(ne=
w_value, p); =C2=A0/* return current value */
> +
> + =C2=A0 =C2=A0 =C2=A0 case WDIOC_GETTIMEOUT:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return put_user(he=
artbeat, p);
> +
> + =C2=A0 =C2=A0 =C2=A0 default:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOTTY;
> + =C2=A0 =C2=A0 =C2=A0 }
> +}
> +
> +static const struct file_operations altera_wdt_fops =3D {
> + =C2=A0 =C2=A0 =C2=A0 .owner =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D T=
HIS_MODULE,
> + =C2=A0 =C2=A0 =C2=A0 .llseek =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D no_lls=
eek,
> + =C2=A0 =C2=A0 =C2=A0 .open =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D a=
ltera_wdt_open,
> + =C2=A0 =C2=A0 =C2=A0 .release =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D altera=
_wdt_release,
> + =C2=A0 =C2=A0 =C2=A0 .write =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D a=
ltera_wdt_write,
> + =C2=A0 =C2=A0 =C2=A0 .unlocked_ioctl =3D altera_wdt_ioctl,
> +};
> +
> +static struct miscdevice altera_wdt_miscdev =3D {
> + =C2=A0 =C2=A0 =C2=A0 .minor =C2=A0=3D WATCHDOG_MINOR,
> + =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =3D "watchdog",
> + =C2=A0 =C2=A0 =C2=A0 .fops =C2=A0 =3D &altera_wdt_fops,
> +};
> +
> +static int __devinit altera_wdt_probe(struct platform_device *pdev)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct resource *res, *mem;
> + =C2=A0 =C2=A0 =C2=A0 const __be32 *freq_prop, *timeout_prop;
> + =C2=A0 =C2=A0 =C2=A0 unsigned long timeout;
> + =C2=A0 =C2=A0 =C2=A0 int ret;
> +
> + =C2=A0 =C2=A0 =C2=A0 res =3D platform_get_resource(pdev, IORESOURCE=
_MEM, 0);
> + =C2=A0 =C2=A0 =C2=A0 if (!res)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOENT;
> +
> + =C2=A0 =C2=A0 =C2=A0 mem =3D devm_request_mem_region(&pdev->dev, re=
s->start,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 resource_size(=
res), pdev->name);
> + =C2=A0 =C2=A0 =C2=A0 if (!mem)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EBUSY;
> +
> + =C2=A0 =C2=A0 =C2=A0 altera_wdt_priv.base =3D devm_ioremap_nocache(=
&pdev->dev, mem->start,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 resource_size(mem));
> + =C2=A0 =C2=A0 =C2=A0 if (!altera_wdt_priv.base)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;
> +
> + =C2=A0 =C2=A0 =C2=A0 freq_prop =3D of_get_property(pdev->dev.of_nod=
e, "clock-frequency", NULL);
> + =C2=A0 =C2=A0 =C2=A0 if (!freq_prop)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;
> +
> + =C2=A0 =C2=A0 =C2=A0 timeout_prop =3D of_get_property(pdev->dev.of_=
node, "timeout", NULL);
> + =C2=A0 =C2=A0 =C2=A0 if (!timeout_prop)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;
> +
> + =C2=A0 =C2=A0 =C2=A0 /* Add 1 as the timeout property actually hold=
s the load value */
> + =C2=A0 =C2=A0 =C2=A0 timeout =3D be32_to_cpup(timeout_prop) + 1;
> + =C2=A0 =C2=A0 =C2=A0 /* Convert timeout to msecs */
> + =C2=A0 =C2=A0 =C2=A0 timeout =3D timeout / (be32_to_cpup(freq_prop)=
 / MSEC_PER_SEC);
> + =C2=A0 =C2=A0 =C2=A0 /* Tickle the watchdog twice per timeout perio=
d */
> + =C2=A0 =C2=A0 =C2=A0 altera_wdt_priv.wdt_timeout =3D msecs_to_jiffi=
es(timeout / 2);
> +
> + =C2=A0 =C2=A0 =C2=A0 ret =3D misc_register(&altera_wdt_miscdev);
> + =C2=A0 =C2=A0 =C2=A0 if (ret)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;
> +
> + =C2=A0 =C2=A0 =C2=A0 altera_wdt_setup();
> + =C2=A0 =C2=A0 =C2=A0 altera_wdt_priv.next_heartbeat =3D jiffies + h=
eartbeat * HZ;
> + =C2=A0 =C2=A0 =C2=A0 setup_timer(&altera_wdt_priv.timer, altera_wdt=
_ping, 0);
> + =C2=A0 =C2=A0 =C2=A0 mod_timer(&altera_wdt_priv.timer, jiffies + al=
tera_wdt_priv.wdt_timeout);
> +
> + =C2=A0 =C2=A0 =C2=A0 pr_info(WATCHDOG_NAME " enabled (heartbeat=3D%=
d sec, nowayout=3D%d)\n",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 heartbeat, nowayou=
t);
> +
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}
> +
> +static int __devexit altera_wdt_remove(struct platform_device *pdev)
> +{
> + =C2=A0 =C2=A0 =C2=A0 misc_deregister(&altera_wdt_miscdev);
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}
> +
> +static struct of_device_id altera_wdt_match[] =3D {
> + =C2=A0 =C2=A0 =C2=A0 { .compatible =3D "altr,wdt-1.0", },
> + =C2=A0 =C2=A0 =C2=A0 {},
> +};
> +MODULE_DEVICE_TABLE(of, altera_wdt_match);
> +
> +static struct platform_driver altera_wdt_driver =3D {
> + =C2=A0 =C2=A0 =C2=A0 .probe =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D a=
ltera_wdt_probe,
> + =C2=A0 =C2=A0 =C2=A0 .remove =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D __deve=
xit_p(altera_wdt_remove),
> + =C2=A0 =C2=A0 =C2=A0 .driver =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .owner =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0=3D THIS_MODULE,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D WATCHDOG_NAME,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .of_match_table =3D=
 altera_wdt_match,
> + =C2=A0 =C2=A0 =C2=A0 },
> +};
> +
> +static int __init altera_wdt_init(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 return platform_driver_register(&altera_wdt_dr=
iver);
> +}
> +
> +static void __exit altera_wdt_exit(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&altera_wdt_driver)=
;
> +}
> +
> +module_init(altera_wdt_init);
> +module_exit(altera_wdt_exit);
> +
> +MODULE_AUTHOR("Walter Goossens, Tobias Klauser <tklauser@distanz.ch>=
");
> +MODULE_DESCRIPTION("Driver for Altera Watchdog Timer");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS_MISCDEV(WATCHDOG_MINOR);
> +MODULE_ALIAS("platform:" WATCHDOG_NAME);
> --
> 1.7.0.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
> Please read the FAQ at =C2=A0http://www.tux.org/lkml/
>

thanks,

marek

--=20
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
=46reelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
icq: 290551086
web: http://open-nandra.com
