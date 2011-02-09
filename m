From: Tobias Klauser <tklauser@distanz.ch>
Subject: Re: [PATCH v3] watchdog: Add driver for Altera Watchdog Timer
Date: Wed, 9 Feb 2011 09:15:40 +0100
Message-ID: <20110209081540.GS29757@distanz.ch>
References: <1297171322-32401-1-git-send-email-tklauser@distanz.ch> <1297235952-20435-1-git-send-email-tklauser@distanz.ch> <AANLkTi=QiCgoswixhUEseK9+-=S0R_sZLA-AefmcC9=T@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AANLkTi=QiCgoswixhUEseK9+-=S0R_sZLA-AefmcC9=T@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Belisko Marek <marek.belisko@gmail.com>
Cc: Wim Van Sebroeck <wim@iguana.be>, linux-watchdog@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Jamie Iles <jamie@jamieiles.com>, Walter Goossens <waltergoossens@home.nl>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, nios2-dev@sopc.et.ntust.edu.tw
List-Id: devicetree@vger.kernel.org

On 2011-02-09 at 08:56:48 +0100, Belisko Marek <marek.belisko@gmail.com=
> wrote:
> On Wed, Feb 9, 2011 at 8:19 AM, Tobias Klauser <tklauser@distanz.ch> =
wrote:
> > This driver adds support for the Altera Timer in the Watchdog Timer
> > configuration. This component is usually found on SOPC (System on
> > Programmable Chip) for Altera FPGAs.
> >
> > Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> > Reviewed-by: Jamie Iles <jamie@jamieiles.com>
> > ---
> > Thanks a lot to Jamie Iles and Walter Goossens for their feedback o=
n v2.
> >
> > changes for v3:
> > =A0- Make altera_wdt_setup static void (as suggested by Jamie)
> > =A0- Use const __be32 * for devicetree properties (as suggested by =
Walter)
> > changes for v2:
> > =A0- Get driver properties from devicetree (and document them), thu=
s the
> > =A0 driver depends on OF
> > =A0- Do not select WATCHDOG_NOWAYOUT, but instead implement a softw=
are
> > =A0 timer resetting the watchdog timer when the device is not open
> > =A0- Only support a single instance of the watchdog, so the private=
 data
> > =A0 can be kept in static data
> > =A0- Use devm_* functions in altera_wdt_probe to simplify cleanup a=
nd
> > =A0 error handling
> > =A0- Remove empty altera_wdt_shutdown function
> > =A0- Add MODULE_LICENSE (GPL)
> >
> >
> > =A0.../devicetree/bindings/watchdog/altera_wdt.txt =A0 =A0| =A0 =A0=
7 +
> > =A0drivers/watchdog/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 | =A0 =A08 +
> > =A0drivers/watchdog/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0| =A0 =A01 +
> > =A0drivers/watchdog/altera_wdt.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0309 ++++++++++++++++++++
> > =A04 files changed, 325 insertions(+), 0 deletions(-)
> > =A0create mode 100644 Documentation/devicetree/bindings/watchdog/al=
tera_wdt.txt
> > =A0create mode 100644 drivers/watchdog/altera_wdt.c
> >
> > diff --git a/Documentation/devicetree/bindings/watchdog/altera_wdt.=
txt b/Documentation/devicetree/bindings/watchdog/altera_wdt.txt
> > new file mode 100644
> > index 0000000..16ac949
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/watchdog/altera_wdt.txt
> > @@ -0,0 +1,7 @@
> > +Altera Watchdog Timer
> > +
> > +Required properties:
> > +- compatible : should be "ALTR,wdt-1.0"
> > +- clock-frequency : frequency of the clock input
> > +- timeout : load value of the timer (number of clock ticks until w=
atchdog
> > + =A0 =A0 =A0 =A0 =A0 =A0resets)
> > diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> > index bd6a33d..ebcafb0 100644
> > --- a/drivers/watchdog/Kconfig
> > +++ b/drivers/watchdog/Kconfig
> > @@ -69,6 +69,14 @@ config WM8350_WATCHDOG
> > =A0 =A0 =A0 =A0 =A0Support for the watchdog in the WM8350 AudioPlus=
 PMIC. =A0When
> > =A0 =A0 =A0 =A0 =A0the watchdog triggers the system will be reset.
> >
> > +config ALTERA_WDT
> > + =A0 =A0 =A0 tristate "Altera Watchdog Timer"
> > + =A0 =A0 =A0 depends on OF
> > + =A0 =A0 =A0 help
> > + =A0 =A0 =A0 =A0 Support for the Altera Timer in the Watchdog Time=
r configuration. This
> > + =A0 =A0 =A0 =A0 component is found on SOPC (System on Programmabl=
e Chip) for Altera
> > + =A0 =A0 =A0 =A0 FPGAs.
> > +
> > =A0# ALPHA Architecture
> >
> > =A0# ARM Architecture
> > diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> > index fd9c8c0..48a2167 100644
> > --- a/drivers/watchdog/Makefile
> > +++ b/drivers/watchdog/Makefile
> > @@ -153,4 +153,5 @@ obj-$(CONFIG_WATCHDOG_CP1XXX) =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 +=3D cpwd.o
> > =A0obj-$(CONFIG_WM831X_WATCHDOG) +=3D wm831x_wdt.o
> > =A0obj-$(CONFIG_WM8350_WATCHDOG) +=3D wm8350_wdt.o
> > =A0obj-$(CONFIG_MAX63XX_WATCHDOG) +=3D max63xx_wdt.o
> > +obj-$(CONFIG_ALTERA_WDT) +=3D altera_wdt.o
> > =A0obj-$(CONFIG_SOFT_WATCHDOG) +=3D softdog.o
> > diff --git a/drivers/watchdog/altera_wdt.c b/drivers/watchdog/alter=
a_wdt.c
> > new file mode 100644
> > index 0000000..2a7f14a
> > --- /dev/null
> > +++ b/drivers/watchdog/altera_wdt.c
> > @@ -0,0 +1,309 @@
> > +/*
> > + * Driver for the Altera Watchdog Timer
> > + *
> > + * Copyright (C) 2011 Tobias Klauser <tklauser@distanz.ch>
> > + * Copyright (C) 2005 Walter Goossens
> > + *
> > + * Originally based on wdt.c which is
> > + *
> > + * Copyright (C) 1995-1997 Alan Cox <alan@lxorguk.ukuu.org.uk>
> > + *
> > + * Software timeout heartbeat code based on pika_wdt.c which is
> > + *
> > + * Copyright (c) 2008 PIKA Technologies
> > + *
> > + * This program is free software; you can redistribute it and/or m=
odify
> > + * it under the terms of the GNU General Public License as publish=
ed by
> > + * the Free Software Foundation; either version 2 of the License, =
or
> > + * (at your option) any later version.
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/kernel.h>
> > +#include <linux/miscdevice.h>
> > +#include <linux/watchdog.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/fs.h>
> > +#include <linux/init.h>
> > +#include <linux/jiffies.h>
> > +#include <linux/timer.h>
> > +#include <linux/io.h>
> > +#include <linux/uaccess.h>
> > +#include <linux/of_platform.h>
> > +
> > +#define WATCHDOG_NAME =A0"altera_wdt"
> > +
> > +/* Register offsets */
> > +#define ALTERA_WDT_STATUS =A0 =A0 =A00x00
> > +#define ALTERA_WDT_CONTROL =A0 =A0 0x04
> > +#define ALTERA_WDT_PERIODL =A0 =A0 0x08
> > +#define ALTERA_WDT_PERIODH =A0 =A0 0x0C
> > +
> > +#define ALTERA_WDT_RUN_BIT =A0 =A0 0x04
> > +
> > +/* User land timeout */
> > +#define WDT_HEARTBEAT 15
> > +static int heartbeat =3D WDT_HEARTBEAT;
> > +module_param(heartbeat, int, 0);
> > +MODULE_PARM_DESC(heartbeat, "Watchdog heartbeats in seconds. "
> > + =A0 =A0 =A0 "(default =3D " __MODULE_STRING(WDT_HEARTBEAT) ")");
> > +
> > +static int nowayout =3D WATCHDOG_NOWAYOUT;
> > +module_param(nowayout, int, 0);
> > +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once starte=
d "
> > + =A0 =A0 =A0 "(default=3D" __MODULE_STRING(WATCHDOG_NOWAYOUT) ")")=
;
> > +
> > +static struct {
> > + =A0 =A0 =A0 void __iomem *base;
> > + =A0 =A0 =A0 unsigned long wdt_timeout; =A0 =A0 =A0/* timeout of t=
he hardware timer */
> > +
> > + =A0 =A0 =A0 unsigned long next_heartbeat; =A0 /* the next_heartbe=
at for the timer */
> > + =A0 =A0 =A0 unsigned long is_open;
> > + =A0 =A0 =A0 char expect_close;
> > + =A0 =A0 =A0 struct timer_list timer; =A0 =A0 =A0 =A0/* software t=
imer that pings the watchdog */
> > +} altera_wdt_priv;
> > +
> > +/*
> > + * Start the watchdog. Once it has been started, it cannot be stop=
ped anymore.
> > + */
> > +static void altera_wdt_setup(void)
> > +{
> > + =A0 =A0 =A0 u32 control =3D readl(altera_wdt_priv.base + ALTERA_W=
DT_CONTROL);
> > +
> > + =A0 =A0 =A0 writel(control | ALTERA_WDT_RUN_BIT, altera_wdt_priv.=
base + ALTERA_WDT_CONTROL);
> > +}
> > +
> > +/*
> > + * Tickle the watchdog (reset the watchdog timer)
> > + */
> > +static void altera_wdt_reset(void)
> > +{
> > + =A0 =A0 =A0 /* It doesn't matter what value we write */
> > + =A0 =A0 =A0 writel(1, altera_wdt_priv.base + ALTERA_WDT_PERIODL);
> > +}
> > +
> > +/*
> > + * Software timer tick
> > + */
> > +static void altera_wdt_ping(unsigned long data)
> > +{
> > + =A0 =A0 =A0 if (time_before(jiffies, altera_wdt_priv.next_heartbe=
at) ||
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (!nowayout && !altera=
_wdt_priv.is_open)) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 altera_wdt_reset();
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mod_timer(&altera_wdt_priv.timer, jif=
fies + altera_wdt_priv.wdt_timeout);
> > + =A0 =A0 =A0 } else
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_crit(WATCHDOG_NAME ": I will reset=
 your machine!\n");
> > +}
> > +
> > +static void altera_wdt_keepalive(void)
> > +{
> > + =A0 =A0 =A0 altera_wdt_priv.next_heartbeat =3D jiffies + heartbea=
t * HZ;
> > +}
> > +
> > +static void altera_wdt_start(void)
> > +{
> > + =A0 =A0 =A0 altera_wdt_keepalive();
> > + =A0 =A0 =A0 mod_timer(&altera_wdt_priv.timer, jiffies + altera_wd=
t_priv.wdt_timeout);
> > +}
> > +
> > +static int altera_wdt_open(struct inode *inode, struct file *file)
> > +{
> > + =A0 =A0 =A0 /* /dev/watchdog can only be opened once */
> > + =A0 =A0 =A0 if (test_and_set_bit(0, &altera_wdt_priv.is_open))
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EBUSY;
> > +
> > + =A0 =A0 =A0 altera_wdt_start();
> > +
> > + =A0 =A0 =A0 return nonseekable_open(inode, file);
> > +}
> > +
> > +static int altera_wdt_release(struct inode *inode, struct file *fi=
le)
> > +{
> > + =A0 =A0 =A0 /* stop internal ping */
> > + =A0 =A0 =A0 if (!altera_wdt_priv.expect_close)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 del_timer(&altera_wdt_priv.timer);
> > +
> > + =A0 =A0 =A0 clear_bit(0, &altera_wdt_priv.is_open);
> > + =A0 =A0 =A0 altera_wdt_priv.expect_close =3D 0;
> > +
> > + =A0 =A0 =A0 return 0;
> > +}
> > +
> > +static ssize_t altera_wdt_write(struct file *file, const char __us=
er *data,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 size_t len, loff_t *ppos)
> > +{
> > + =A0 =A0 =A0 if (!len)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> > +
> > + =A0 =A0 =A0 /* Scan for magic character */
> > + =A0 =A0 =A0 if (!nowayout) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 size_t i;
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 altera_wdt_priv.expect_close =3D 0;
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (i =3D 0; i < len; i++) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 char c;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (get_user(c, data =
+ i))
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 retur=
n -EFAULT;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (c =3D=3D 'V') {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 alter=
a_wdt_priv.expect_close =3D 42;
> For what this value is used? Why 42? It's never checked in code to su=
ch a value.

The value 42 is arbitrary, I used it because other watchdog drivers
implementing software timers to tickle the watchdog are using it that
way too. Its value is not explicitely checked for, it's only checked in
altera_wdt_release for being 0/not 0 to determine whether to stop the
software timer.

Thanks
Tobias
