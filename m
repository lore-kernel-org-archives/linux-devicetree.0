From: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [Gta04-owner] [PATCH 3/3] tty/slaves: add a driver to power
 on/off UART attached devices.
Date: Fri, 20 Mar 2015 19:54:51 +1100
Message-ID: <20150320195451.146a7915@notabene.brown>
References: <20150318055437.21025.13990.stgit@notabene.brown>
	<20150318055831.21025.33670.stgit@notabene.brown>
	<C53A3E5D-5AEA-4F0F-88A9-F9BC8CB0D0D6@goldelico.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/krLyAtyMGseJgGwfvxQ0wes"; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <C53A3E5D-5AEA-4F0F-88A9-F9BC8CB0D0D6-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Dr. H. Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Cc: List for communicating with real GTA04 owners <gta04-owner-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, One Thousand Gnomes <gnomes-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>, Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--Sig_/krLyAtyMGseJgGwfvxQ0wes
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 20 Mar 2015 08:54:38 +0100 "Dr. H. Nikolaus Schaller"
<hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org> wrote:

>=20
> Am 18.03.2015 um 06:58 schrieb NeilBrown <neil-+NVA1uvv1dVBDLzU/O5InQ@public.gmane.org>:
>=20
> > If a platform has a particular device permanently attached to a UART,
> > there may be out-of-band signaling necessary to power the device
> > on and off.
> >=20
> > This driver controls that signalling for a number of different devices.
> > It can
> > - enable/disable a regulator
> > - toggle a GPIO
> > - register an 'rfkill' which can force the device to be off.
> >=20
> > When the rfkill is absent or unblocked, the device will be on when the
> > associated tty device is open, and closed otherwise.
> >=20
> > Signed-off-by: NeilBrown <neil-+NVA1uvv1dVBDLzU/O5InQ@public.gmane.org>
> > ---
> > .../bindings/tty_slave/wi2wi,w2cbw003.txt          |   19 +
> > .../bindings/tty_slave/wi2wi,w2sg0004.txt          |   37 +
> > .../devicetree/bindings/vendor-prefixes.txt        |    1=20
> > drivers/tty/slave/Kconfig                          |   14 +
> > drivers/tty/slave/Makefile                         |    2=20
> > drivers/tty/slave/serial-power-manager.c           |  510 +++++++++++++=
+++++++
> > 6 files changed, 583 insertions(+)
> > create mode 100644 Documentation/devicetree/bindings/tty_slave/wi2wi,w2=
cbw003.txt
> > create mode 100644 Documentation/devicetree/bindings/tty_slave/wi2wi,w2=
sg0004.txt
> > create mode 100644 drivers/tty/slave/serial-power-manager.c
> >=20
> > diff --git a/Documentation/devicetree/bindings/tty_slave/wi2wi,w2cbw003=
.txt b/Documentation/devicetree/bindings/tty_slave/wi2wi,w2cbw003.txt
> > new file mode 100644
> > index 000000000000..cfe6ee5e01e9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/tty_slave/wi2wi,w2cbw003.txt
> > @@ -0,0 +1,19 @@
> > +wi2wi bluetooth module
> > +
> > +This is accessed via a serial port and is largely controlled via that
> > +link.  Extra configuration is needed to enable power on/off
> > +
> > +Required properties:
> > +- compatible: "wi2wi,w2cbw003"
> > +- vdd-supply: regulator used to power the device.
> > +
> > +The node for this device must be the child of a UART.
> > +
> > +Example:
> > +
> > +&uart1 {
> > +       bluetooth {
> > +               compatible =3D "wi2wi,w2cbw003";
> > +               vdd-supply =3D <&vaux4>;
> > +       };
> > +};
>=20
> Wouldn=E2=80=99t it be easier to simply write
>=20
> &uart1 {
> 	vdd-suppy =3D <&vaux4>;
> }

Easier to write: certainly.
Easier to justify? No.
Easier to get merged upstream?  Definitely not.
After all, the uart itself doesn't require a power supply.
It is the device connected to the uart which requires the power supply.


>=20
> > diff --git a/Documentation/devicetree/bindings/tty_slave/wi2wi,w2sg0004=
.txt b/Documentation/devicetree/bindings/tty_slave/wi2wi,w2sg0004.txt
> > new file mode 100644
> > index 000000000000..fdc52cf56533
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/tty_slave/wi2wi,w2sg0004.txt
> > @@ -0,0 +1,37 @@
> > +wi2wi GPS device
> > +
> > +This is accessed via a serial port and is largely controlled via that
> > +link.  Extra configuration is needed to enable power on/off
> > +
> > +Required properties:
> > +- compatible: "wi2wi,w2sg0004"
> > +- gpios: gpios used to toggle 'on/off' pin
> > +- interrupts: interrupt generated by RX pin when device
> > +      should be off
> > +
> > +Optional properties:
> > +- vdd-supply: regulator used to power antenna
> > +- pinctrl: "default", "off"
> > +      if "off" setting is provided it is imposed when device should
> > +      be off.  This can route the RX pin to a GPIO interrupt.
> > +
> > +The w2sg0004 uses a pin-toggle both to power-on and to
> > +power-off, so the driver needs to detect what state it is in.
> > +It does this by detecting characters on the RX line.
> > +When it should be off, these can optionally be detected by a GPIO.
> > +
> > +The node for this device must be the child of a UART.
> > +
> > +Example:
> > +&uart2 {
> > +       gps {
> > +               compatible =3D "wi2iw,w2sg0004";
> > +               vdd-supply =3D <&vsim>;
> > +               gpios =3D <&gpio5 17 0>; /* GPIO_145 */
> > +               interrupts-extended =3D <&gpio5 19 0>; /* GPIO_147 */
> > +               /* When off, switch RX to be an interrupt */
> > +               pinctrl-names =3D "default", "off";
> > +               pinctrl-0 =3D <&uart2_pins>;
> > +               pinctrl-1 =3D <&uart2_pins_rx_gpio>;
> > +       };
> > +};
>=20
> If the wi2wi driver is a regulator driver one would write
>=20
> / {
>        gps-regulator: gps {
>                compatible =3D "wi2iw,w2sg0004";
>                vdd-supply =3D <&vsim>;
>                gpios =3D <&gpio5 17 0>; /* GPIO_145 */
>                interrupts-extended =3D <&gpio5 19 0>; /* GPIO_147 */
>                /* When off, switch RX to be an interrupt */
>                pinctrl-names =3D "default", "off";
>                pinctrl-0 =3D <&uart2_pins>;
>                pinctrl-1 =3D <&uart2_pins_rx_gpio>;
>        };
> }
>=20
> &uart2 {
> 	vdd-suppy =3D <&gps-regulator>;
> };
>=20
> Which IMHO better describes that the uart controls power of a separate dr=
iver.

But the uart doesn't control the power.
An 'open' on the tty causes one driver to turn on a regulator, and another
driver to activate a uart so that the device represented by the tty can be
communicated with.

>=20
> And this pattern for writing a DT would IMHO be more flexible because you
> can =E2=80=9Econnect=E2=80=9C to any regulator, e.g. a regulator for a RS=
232 level shifter.

I'm sure there are lots of ways we could find to make DT more flexible, only
then it wouldn't be DT any more - it would be something similar but differe=
nt.

There needs to be one device-node for each device, and that device-node nee=
ds
to be a child of the device-node for the device which is the primary
connection to the child device.  That is how devicetree is structured - for
better or worse.



>=20
>=20
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Do=
cumentation/devicetree/bindings/vendor-prefixes.txt
> > index 389ca1347a77..81d259303710 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > @@ -189,6 +189,7 @@ variscite	Variscite Ltd.
> > via	VIA Technologies, Inc.
> > virtio	Virtual I/O Device Specification, developed by the OASIS consort=
ium
> > voipac	Voipac Technologies s.r.o.
> > +wi2wi	wi2wi Inc.  http://www.wi2wi.com/
> > winbond Winbond Electronics corp.
> > wlf	Wolfson Microelectronics
> > wm	Wondermedia Technologies, Inc.
> > diff --git a/drivers/tty/slave/Kconfig b/drivers/tty/slave/Kconfig
> > index 3976760c2e28..05c5d966ae57 100644
> > --- a/drivers/tty/slave/Kconfig
> > +++ b/drivers/tty/slave/Kconfig
> > @@ -5,3 +5,17 @@ menuconfig TTY_SLAVE
> > 	  Devices which attach via a uart, but need extra
> > 	  driver support for power management etc.
> >=20
> > +if TTY_SLAVE
> > +
> > +config SERIAL_POWER_MANAGER
> > +	tristate "Power Management controller for serial-attached devices"
> > +	default n
> > +	help
> > +	  Some devices permanently attached via a UART can benefit from
> > +	  being power-managed when the tty device is opened or closed.
> > +	  This driver can support several such devices with simple
> > +	  power requirements such as enabling a regulator.
> > +
> > +	  If in doubt, say 'N'
> > +
> > +endif
> > diff --git a/drivers/tty/slave/Makefile b/drivers/tty/slave/Makefile
> > index 65669acb392e..a2f7d2847319 100644
> > --- a/drivers/tty/slave/Makefile
> > +++ b/drivers/tty/slave/Makefile
> > @@ -1,2 +1,4 @@
> >=20
> > obj-$(CONFIG_TTY_SLAVE) +=3D tty_slave_core.o
> > +
> > +obj-$(CONFIG_SERIAL_POWER_MANAGER) +=3D serial-power-manager.o
> > diff --git a/drivers/tty/slave/serial-power-manager.c b/drivers/tty/sla=
ve/serial-power-manager.c
> > new file mode 100644
> > index 000000000000..662a526d8630
> > --- /dev/null
> > +++ b/drivers/tty/slave/serial-power-manager.c
> > @@ -0,0 +1,510 @@
> > +/*
> > + * Serial-power-manager
> > + * tty-slave device that intercepts open/close events on the tty,
> > + * and turns power on/off for the device which is connected.
> > + *
> > + * Currently supported devices:
> > + *  wi2wi,w2sg0004 - GPS with on/off toggle on a GPIO
> > + *  wi2wi,w2cbw003 - bluetooth port; powered by regulator.
> > + *
> > + * When appropriate, an RFKILL will be registered which
> > + * can power-down the device even when it is open.
> > + *
> > + * Device can be turned on either by
> > + *  - enabling a regulator.  Disable to turn off
> > + *  - toggling a GPIO.  Toggle again to turn off.  This requires
> > + *     that we know the current state.  It is assumed to be 'off'
> > + *     at boot, however if an interrupt can be generated when on,
> > + *     such as by connecting RX to a GPIO, that can be used to detect
> > + *     if the device is on when it should be off.
>=20
> Why does this driver mix both things?=20
>=20
> The only thing they have in common is that both are uart slaves
> and that they have a serial interface. But power control is very
> different.

Because if I wrote two drivers, they would have more code in common than th=
ey
would have differences.


>=20
> One driver per fundamentally different chip...
>=20
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/slab.h>
> > +#include <linux/err.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/of_device.h>
> > +#include <linux/tty.h>
> > +#include <linux/gpio.h>
> > +#include <linux/of_gpio.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/delay.h>
> > +#include <linux/rfkill.h>
> > +
> > +#include <linux/tty_slave.h>
> > +
> > +/* This is used for testing. Setting this module parameter
> > + * will simulate booting with the device "on"
> > + */
> > +static bool toggle_on_probe =3D false;
> > +module_param(toggle_on_probe, bool, 0);
> > +MODULE_PARM_DESC(toggle_on_probe, "simulate power-on with devices acti=
ve");
> > +
> > +struct spm_config {
> > +	int	rfkill_type;		/* type of rfkill to register */
> > +	int	toggle_time;		/* msec to pulse GPIO for on/off */
> > +	int	toggle_gap;		/* min msecs between toggles */
> > +	bool	off_in_suspend;
> > +}
> > +	simple_config =3D {
> > +		.off_in_suspend =3D true,
> > +	},
> > +	w2sg_config =3D {
> > +		.rfkill_type =3D RFKILL_TYPE_GPS,
>=20
> The driver pretends to be generic by its name but incorporates a lot of s=
pecific
> knowledge about the w2sg chip, e.g. that it is a GPS chip.
>=20
> > +		.toggle_time =3D 10,
> > +		.toggle_gap =3D 500,
> > +		.off_in_suspend =3D true,
> > +	};
> > +
> > +const static struct of_device_id spm_dt_ids[] =3D {
> > +       { .compatible =3D "wi2wi,w2sg0004", .data =3D &w2sg_config},
> > +       { .compatible =3D "wi2wi,w2cbw003", .data =3D &simple_config},
>=20
> Well, how large will this table become if other uart slave device types
> are added?

When that becomes a problem it can trivially be solved.  While it is not a
problem there is no value in solving it.


>=20
> > +       {}
> > +};
> > +
> > +struct spm_data {
> > +	const struct spm_config *config;
> > +	struct gpio_desc *gpiod;
> > +	int		irq;	/* irq line from RX pin when pinctrl
> > +				 * set to 'idle' */
> > +	struct regulator *reg;
> > +
> > +	unsigned long	toggle_time;
> > +	unsigned long	toggle_gap;
> > +	unsigned long	last_toggle;	/* jiffies when last toggle completed. */
> > +	unsigned long	backoff;	/* jiffies since last_toggle when
> > +					 * we try again
> > +					 */
> > +	enum {Idle, Down, Up} state;	/* state-machine state. */
> > +
> > +	int		open_cnt;
> > +	bool		requested, is_on;
> > +	bool		suspended;
> > +	bool		reg_enabled;
> > +
> > +	struct pinctrl	*pins;
> > +	struct pinctrl_state *pins_off;
> > +
> > +	struct delayed_work work;
> > +	spinlock_t	lock;
> > +	struct device	*dev;
> > +
> > +	struct rfkill	*rfkill;
> > +
> > +	int (*old_open)(struct tty_struct * tty, struct file * filp);
> > +	void (*old_close)(struct tty_struct * tty, struct file * filp);
> > +
> > +};
> > +
> > +/* When a device is powered on/off by toggling a GPIO we perform
> > + * all the toggling via a workqueue to ensure only one toggle happens
> > + * at a time and to allow easy timing.
> > + * This is managed as a state machine which transitions
> > + *  Idle -> Down -> Up -> Idle
> > + * The GPIO is held down for toggle_time and then up for toggle_time,
> > + * and then we assume the device has changed state.
> > + * We never toggle until at least toggle_gap has passed since the
> > + * last toggle.
> > + */
> > +static void toggle_work(struct work_struct *work)
> > +{
> > +	struct spm_data *data =3D container_of(
> > +		work, struct spm_data, work.work);
> > +
> > +	if (data->gpiod =3D=3D NULL)
> > +		return;
> > +
> > +	spin_lock_irq(&data->lock);
> > +	switch (data->state) {
> > +	case Up:
> > +		data->state =3D Idle;
> > +		if (data->requested =3D=3D data->is_on)
> > +			break;
> > +		if (!data->requested)
> > +			/* Assume it is off unless activity is detected */
> > +			break;
> > +		/* Try again in a while unless we get some activity */
> > +		dev_dbg(data->dev, "Wait %dusec until retry\n",
> > +			jiffies_to_msecs(data->backoff));
> > +		schedule_delayed_work(&data->work, data->backoff);
> > +		break;
> > +	case Idle:
> > +		if (data->requested =3D=3D data->is_on)
> > +			break;
> > +
> > +		/* Time to toggle */
> > +		dev_dbg(data->dev, "Starting toggle to turn %s\n",
> > +			data->requested ? "on" : "off");
> > +		data->state =3D Down;
> > +		spin_unlock_irq(&data->lock);
> > +		gpiod_set_value_cansleep(data->gpiod, 1);
> > +		schedule_delayed_work(&data->work, data->toggle_time);
> > +
> > +		return;
> > +
> > +	case Down:
> > +		data->state =3D Up;
> > +		data->last_toggle =3D jiffies;
> > +		dev_dbg(data->dev, "Toggle completed, should be %s now.\n",
> > +			data->is_on ? "off" : "on");
> > +		data->is_on =3D ! data->is_on;
> > +		spin_unlock_irq(&data->lock);
> > +
> > +		gpiod_set_value_cansleep(data->gpiod, 0);
> > +		schedule_delayed_work(&data->work, data->toggle_time);
> > +
> > +		return;
> > +	}
> > +	spin_unlock_irq(&data->lock);
> > +}
> > +
> > +static irqreturn_t spm_isr(int irq, void *dev_id)
> > +{
> > +	struct spm_data *data =3D dev_id;
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&data->lock, flags);
> > +	if (!data->requested && !data->is_on && data->state =3D=3D Idle &&
> > +	    time_after(jiffies, data->last_toggle + data->backoff)) {
> > +		data->is_on =3D 1;
> > +		data->backoff *=3D 2;
> > +		dev_dbg(data->dev, "Received data, must be on. Try to turn off\n");
> > +		if (!data->suspended)
> > +			schedule_delayed_work(&data->work, 0);
> > +	}
> > +	spin_unlock_irqrestore(&data->lock, flags);
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +static void spm_on(struct spm_data *data)
> > +{
> > +	if (!data->rfkill || !rfkill_blocked(data->rfkill)) {
> > +		unsigned long flags;
> > +
> > +		if (!data->reg_enabled &&
> > +		    data->reg &&
> > +		    regulator_enable(data->reg) =3D=3D 0)
> > +			data->reg_enabled =3D true;
> > +
> > +		spin_lock_irqsave(&data->lock, flags);
> > +		if (!data->requested) {
> > +			dev_dbg(data->dev, "TTY open - turn device on\n");
> > +			data->requested =3D true;
> > +			data->backoff =3D data->toggle_gap;
> > +			if (data->irq > 0) {
> > +				disable_irq(data->irq);
> > +				pinctrl_pm_select_default_state(data->dev);
> > +			}
> > +			if (!data->suspended && data->state =3D=3D Idle)
> > +				schedule_delayed_work(&data->work, 0);
> > +		}
> > +		spin_unlock_irqrestore(&data->lock, flags);
> > +	}
> > +}
> > +
> > +static int spm_open(struct tty_struct *tty, struct file *filp)
> > +{
> > +	struct spm_data *data =3D dev_get_drvdata(tty->dev->parent);
> > +
> > +	data->open_cnt++;
> > +	spm_on(data);
> > +	if (data->old_open)
> > +		return data->old_open(tty, filp);
> > +}
> > +
> > +static void spm_off(struct spm_data *data)
> > +{
> > +	unsigned long flags;
> > +
> > +	if (data->reg && data->reg_enabled)
> > +		if (regulator_disable(data->reg) =3D=3D 0)
> > +			data->reg_enabled =3D false;
> > +
> > +	spin_lock_irqsave(&data->lock, flags);
> > +	if (data->requested) {
> > +		data->requested =3D false;
> > +		data->backoff =3D data->toggle_gap;
> > +		if (data->pins_off) {
> > +			pinctrl_select_state(data->pins,
> > +					     data->pins_off);
> > +			enable_irq(data->irq);
> > +		}
> > +		if (!data->suspended && data->state =3D=3D Idle)
> > +			schedule_delayed_work(&data->work, 0);
> > +	}
> > +	spin_unlock_irqrestore(&data->lock, flags);
> > +}
> > +
> > +static void spm_close(struct tty_struct *tty, struct file *filp)
> > +{
> > +	struct spm_data *data =3D dev_get_drvdata(tty->dev->parent);
> > +
> > +	data->open_cnt--;
> > +	if (!data->open_cnt) {
> > +		dev_dbg(data->dev, "TTY closed - turn device off\n");
> > +		spm_off(data);
> > +	}
> > +
> > +	if (data->old_close)
> > +		data->old_close(tty, filp);
> > +}
> > +
> > +static int spm_rfkill_set_block(void *vdata, bool blocked)
> > +{
> > +	struct spm_data *data =3D vdata;
> > +
> > +	dev_dbg(data->dev, "rfkill_set_blocked %d\n", blocked);
> > +	if (blocked)
> > +		spm_off(data);
> > +
> > +	if (!blocked &&
> > +	    data->open_cnt)
> > +		spm_on(data);
> > +
> > +	return 0;
> > +}
> > +
> > +static struct rfkill_ops spm_rfkill_ops =3D {
> > +	.set_block =3D spm_rfkill_set_block,
> > +};
> > +
> > +static int spm_suspend(struct device *dev)
> > +{
> > +	/* Ignore incoming data and just turn device off.
> > +	 * we cannot really wait for a separate thread to
> > +	 * do things, so we disable that and do it all
> > +	 * here
> > +	 */
> > +	struct spm_data *data =3D dev_get_drvdata(dev);
> > +
> > +	spin_lock_irq(&data->lock);
> > +	data->suspended =3D true;
> > +	spin_unlock_irq(&data->lock);
> > +	if (!data->config->off_in_suspend)
> > +		return 0;
> > +
> > +	if (data->gpiod) {
> > +
> > +		cancel_delayed_work_sync(&data->work);
> > +		if (data->state =3D=3D Down) {
> > +			dev_dbg(data->dev, "Suspending while GPIO down - raising\n");
> > +			msleep(data->config->toggle_time);
> > +			gpiod_set_value_cansleep(data->gpiod, 0);
> > +			data->last_toggle =3D jiffies;
> > +			data->is_on =3D !data->is_on;
> > +			data->state =3D Up;
> > +		}
> > +		if (data->state =3D=3D Up) {
> > +			msleep(data->config->toggle_time);
> > +			data->state =3D Idle;
> > +		}
> > +		if (data->is_on) {
> > +			dev_dbg(data->dev, "Suspending while device on: toggling\n");
> > +			gpiod_set_value_cansleep(data->gpiod, 1);
> > +			msleep(data->config->toggle_time);
> > +			gpiod_set_value_cansleep(data->gpiod, 0);
> > +			data->is_on =3D 0;
> > +		}
> > +	}
> > +
> > +	if (data->reg && data->reg_enabled)
> > +		if (regulator_disable(data->reg) =3D=3D 0)
> > +			data->reg_enabled =3D false;
> > +
> > +	return 0;
> > +}
> > +
> > +static int spm_resume(struct device *dev)
> > +{
> > +	struct spm_data *data =3D dev_get_drvdata(dev);
> > +
> > +	spin_lock_irq(&data->lock);
> > +	data->suspended =3D false;
> > +	spin_unlock_irq(&data->lock);
> > +	schedule_delayed_work(&data->work, 0);
> > +
> > +	if (data->open_cnt &&
> > +	    (!data->rfkill || !rfkill_blocked(data->rfkill))) {
> > +		if (!data->reg_enabled &&
> > +		    data->reg &&
> > +		    regulator_enable(data->reg) =3D=3D 0)
> > +			data->reg_enabled =3D true;
> > +	}
> > +	return 0;
> > +}
> > +
> > +static const struct dev_pm_ops spm_pm_ops =3D {
> > +	SET_SYSTEM_SLEEP_PM_OPS(spm_suspend, spm_resume)
> > +};
> > +
> > +static int spm_probe(struct device *dev)
> > +{
> > +	struct tty_slave *slave =3D container_of(dev, struct tty_slave, dev);
> > +	struct spm_data *data;
> > +	struct regulator *reg;
> > +	int err;
> > +	const struct of_device_id *id;
> > +	const char *name;
> > +
> > +	if (dev->parent =3D=3D NULL)
> > +		return -ENODEV;
> > +
> > +	id =3D of_match_device(spm_dt_ids, dev);
> > +	if (!id)
> > +		return -ENODEV;
> > +
> > +	if (dev->of_node && dev->of_node->name)
> > +		name =3D dev->of_node->name;
> > +	else
> > +		name =3D "serial-power-manager";
> > +
> > +	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	data->config =3D id->data;
> > +	data->toggle_time =3D msecs_to_jiffies(data->config->toggle_time) + 1;
> > +	data->toggle_gap =3D msecs_to_jiffies(data->config->toggle_gap) + 1;
> > +	data->last_toggle =3D jiffies;
> > +	data->backoff =3D data->toggle_gap;
> > +	data->state =3D Idle;
> > +	spin_lock_init(&data->lock);
> > +	INIT_DELAYED_WORK(&data->work, toggle_work);
> > +
> > +	/* If a regulator is provided, it is enabled on 'open'
> > +	 * and disabled on 'release'
> > +	 */
> > +	reg =3D devm_regulator_get(dev, "vdd");
> > +	if (IS_ERR(reg)) {
> > +		err =3D PTR_ERR(reg);
> > +		if (err !=3D -ENODEV)
> > +			goto out;
> > +	} else
> > +		data->reg =3D reg;
> > +
> > +	/* If an irq is provided, any transitions are taken as
> > +	 * indication that the device is currently "on"
> > +	 */
> > +	data->irq =3D of_irq_get(dev->of_node, 0);
> > +	if (data->irq < 0) {
> > +		err =3D data->irq;
> > +		if (err !=3D -EINVAL)
> > +			goto out;
> > +	} else {
> > +		dev_dbg(dev, "IRQ configured: %d\n", data->irq);
> > +
> > +		irq_set_status_flags(data->irq, IRQ_NOAUTOEN);
> > +		err =3D devm_request_irq(dev, data->irq, spm_isr,
> > +				       IRQF_TRIGGER_FALLING,
> > +				       name, data);
> > +
> > +		if (err)
> > +			goto out;
> > +
> > +	}
>=20
> Up to here it is generic and makes no assumptions about a specific
> device.
>=20
> > +
> > +	/* If a gpio is provided, then it is used to turn the device
> > +	 * on/off.
>=20
> You have a compatible record (for two well defined chips), but you
> do control which functions are really used by providing/not providing
> some DT parameters.
>=20
> Either one is redundant.
>=20
> > +	 * If toggle_time is zero, then the GPIO directly controls
> > +	 * the device.
>=20
> Very hidden and non-obvoius functionality.

Yes, that should probably be documented more clearly, or removed.


>=20
> >  If non-zero, then the GPIO must be toggled to
> > +	 * change the state of the device.
>=20
> All the following is very special logic for the w2sg0004 chip which shoul=
d be
> divided out into a separate driver.
>=20
> Marek and me already had proposed such a chip specific driver (to be loca=
ted
> in drivers/misc) some months ago. It would encapsulate everything w2sg0004
> specific and present itself as a regulator (because that is its main purp=
ose:
> control the LDO regulator inside the w2sg0004 chip).

Presenting itself as a regulator would be wrong because it isn't a regulato=
r.


Thanks,
NeilBrown


>=20
> We can resubmit it as soon as this driver stabilizes and finds acceptance.
>=20
> > +	 */
> > +	data->gpiod =3D devm_gpiod_get(dev, NULL, GPIOD_OUT_LOW);
> > +	if (IS_ERR(data->gpiod)) {
> > +		err =3D PTR_ERR(data->gpiod);
> > +		if (err !=3D -ENOENT)
> > +			goto out;
> > +		data->gpiod =3D NULL;
> > +	} else
> > +		dev_dbg(dev, "GPIO configured: %d\n",
> > +			desc_to_gpio(data->gpiod));
> > +
> > +	/* If an 'off' pinctrl state is defined, we apply that
> > +	 * when the device is assumed to be off.  This is expected to
> > +	 * route the 'rx' line to the 'irq' interrupt.
> > +	 */
> > +	data->pins =3D devm_pinctrl_get(dev);
> > +	if (data->pins && data->irq > 0) {
> > +		data->pins_off =3D pinctrl_lookup_state(data->pins, "off");
> > +		if (IS_ERR(data->pins_off))
> > +			data->pins_off =3D NULL;
> > +	}
> > +
> > +	if (data->config->rfkill_type) {
> > +		data->rfkill =3D rfkill_alloc(name, dev,
> > +					    data->config->rfkill_type,
> > +					    &spm_rfkill_ops, data);
> > +		if (!data->rfkill) {
> > +			err =3D -ENOMEM;
> > +			goto out;
> > +		}
> > +		err =3D rfkill_register(data->rfkill);
> > +		if (err) {
> > +			dev_err(dev, "Cannot register rfkill device");
> > +			rfkill_destroy(data->rfkill);
> > +			goto out;
> > +		}
> > +	}
> > +	dev_set_drvdata(dev, data);
> > +	data->dev =3D dev;
> > +	data->old_open =3D slave->ops.open;
> > +	data->old_close =3D slave->ops.close;
> > +	slave->ops.open =3D spm_open;
> > +	slave->ops.close =3D spm_close;
> > +	tty_slave_finalize(slave);
> > +
> > +	if (data->pins_off)
> > +		pinctrl_select_state(data->pins, data->pins_off);
> > +	if (data->irq > 0)
> > +		enable_irq(data->irq);
> > +
> > +	if (toggle_on_probe && data->gpiod) {
> > +		dev_dbg(data->dev, "Performing initial toggle\n");
> > +		gpiod_set_value_cansleep(data->gpiod, 1);
> > +		msleep(data->config->toggle_time);
> > +		gpiod_set_value_cansleep(data->gpiod, 0);
> > +		msleep(data->config->toggle_time);
> > +	}
> > +	err =3D 0;
> > +out:
> > +	dev_dbg(data->dev, "Probed: err=3D%d\n", err);
> > +	return err;
> > +}
> > +
> > +static int spm_remove(struct device *dev)
> > +{
> > +       struct spm_data *data =3D dev_get_drvdata(dev);
> > +
> > +       if (data->rfkill) {
> > +               rfkill_unregister(data->rfkill);
> > +               rfkill_destroy(data->rfkill);
> > +       }
> > +       return 0;
> > +}
> > +
> > +static struct device_driver spm_driver =3D {
> > +	.name		=3D "serial-power-manager",
> > +	.owner		=3D THIS_MODULE,
> > +	.of_match_table	=3D spm_dt_ids,
> > +	.probe		=3D spm_probe,
> > +	.remove		=3D spm_remove,
> > +};
> > +
> > +static int __init spm_init(void)
> > +{
> > +       return tty_slave_driver_register(&spm_driver);
> > +}
> > +module_init(spm_init);
> > +
> > +static void __exit spm_exit(void)
> > +{
> > +	driver_unregister(&spm_driver);
> > +}
> > +module_exit(spm_exit);
> > +
> > +MODULE_AUTHOR("NeilBrown <neil-+NVA1uvv1dVBDLzU/O5InQ@public.gmane.org>");
> > +MODULE_DEVICE_TABLE(of, spm_dt_ids);
> > +MODULE_DESCRIPTION("Power management for Serial-attached device.");
> > +MODULE_LICENSE("GPL v2");
> >=20
> >=20
> > _______________________________________________
> > Gta04-owner mailing list
> > Gta04-owner-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org
> > http://lists.goldelico.com/mailman/listinfo.cgi/gta04-owner
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/


--Sig_/krLyAtyMGseJgGwfvxQ0wes
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUBVQvgWznsnt1WYoG5AQJMcQ//eDTyq7NaNgzBmGFSmTUc1DNPIXfzibdP
vrGU5LknSkiVzfK4jmmtjFRPNXf47KOt3BjuLq/n7ckL3dE+1ATeSRir2Ry2qU1h
c3KHJ34xDnTKhNY9IkK+Bkudk5ACIW/9I+7Qn1XjPoDTC3h6LVBpoA6KbhO6X/yc
66pnDvdPE5Dbf7EYUflAtWyDTkX+F2vtvlgW6qFZ59dcdBT22ph+N6Kn55H/WJuf
de04/2RYNIjKL66KaG6LEHaDGf2zm7JL4StxrZhflnUhqBsJRc4zMHQVohJfHi5V
A0kyuRL2WsjFK4kXs1GSQWy3cDLkLL0QEsXhLLlvLPpTxV0BAxIK2TfsQ0+HKkmP
w40ZSNsLuBBZaOLZjrMAEbvnwfx6fJZXEVjcMsq6LtWGqBhYOZlxc6YzEJ/EggjJ
iy1nLa1xyGN+htVjiGnQdtba5uBDjoC2X4O7/AwiHf5ZMmQElnDHbxeIEvAEuWNu
FDIYv6kfrdBkRgCbh6H+kUyNi0KqpTyouQ6hzZz8RN9EFi3ljxVEyuiiqvrPsABx
Ufa03LNYn91F40GQL6bzkwsIRdd7FPeWOadQ7SZQid8Aplf2p1G+hsiaD5qHHdTP
W3BpBHnCwTcSwjFrYXiUljVcl/b7MV6T2WhO79yVCFf6KiT7zTS/ossgqQc737DV
Fl1MWtmgUNE=
=1jvg
-----END PGP SIGNATURE-----

--Sig_/krLyAtyMGseJgGwfvxQ0wes--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
