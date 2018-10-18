Return-Path: <SRS0=Vfqj=M6=gmail.com=dmitry.torokhov@kernel.org>
Date: Wed, 17 Oct 2018 17:39:18 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] Input: qt1050 - add Microchip AT42QT1050 support
Message-ID: <20181018003918.GA205061@dtor-ws>
References: <20180924151330.6114-1-m.felsch@pengutronix.de>
 <20181016034434.GA56342@dtor-ws>
 <20181017233153.s4ihu5gmc5qpul7u@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181017233153.s4ihu5gmc5qpul7u@pengutronix.de>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, voice.shen@atmel.com, raphaelpereira@gmail.com, linux-input@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

On Thu, Oct 18, 2018 at 01:31:53AM +0200, Marco Felsch wrote:
> Hi Dmitry,
> 
> thanks for your review.
> 
> On 18-10-15 20:44, Dmitry Torokhov wrote:
> > Hi Marco,
> > 
> > On Mon, Sep 24, 2018 at 05:13:30PM +0200, Marco Felsch wrote:
> > > Add initial support for the AT42QT1050 (QT1050) device. The device
> > > supports up to five input keys, dependent on the mode. Since it adds only
> > > the initial support the "1 to 4 keys plus Guard Channel" mode isn't
> > > support.
> > > 
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > ---
> > >  .../bindings/input/microchip,qt1050.txt       |  54 ++
> > >  drivers/input/keyboard/Kconfig                |  11 +
> > >  drivers/input/keyboard/Makefile               |   1 +
> > >  drivers/input/keyboard/qt1050.c               | 589 ++++++++++++++++++
> > >  4 files changed, 655 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/input/microchip,qt1050.txt
> > >  create mode 100644 drivers/input/keyboard/qt1050.c
> > > 
> > > diff --git a/Documentation/devicetree/bindings/input/microchip,qt1050.txt b/Documentation/devicetree/bindings/input/microchip,qt1050.txt
> > > new file mode 100644
> > > index 000000000000..d63e286f6526
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/input/microchip,qt1050.txt
> > > @@ -0,0 +1,54 @@
> > > +Microchip AT42QT1050 Five-channel Touch Sensor IC
> > > +
> > > +The AT42QT1050 (QT1050) is a QTouchADC sensor driver. The device can sense from
> > > +one to five keys, dependent on mode. The QT1050 includes all signal processing
> > > +functions necessary to provide stable sensing under a wide variety of changing
> > > +conditions, and the outputs are fully debounced.
> > > +
> > > +The touchkey device node should be placed inside an I2C bus node.
> > > +
> > > +Required properties:
> > > +- compatible: Must be "microchip,qt1050"
> > > +- reg: The I2C address of the touchkeys
> > > +- interrupts: The sink for the touchpad's IRQ output,
> > > +  see ../interrupt-controller/interrupts.txt
> > > +- linux,keycodes: Specifies an array of numeric keycode values to be used for
> > > +  reporting button presses. The array can contain up to 5 entries. Array index
> > > +  0 correspond to key 0 and so on. If the keys aren't continuous the
> > > +  KEY_RESERVED must be used. Keys marked as KEY_RESERVED or not specified will
> > > +  be disabled.
> > > +
> > > +Optional properties:
> > > +- pre-charge-time: Specifies an array of precharge times in ns for each touch
> > > +  pad. The value for each pad depend on the hardware layouts. If not specified
> > > +  or invalid values are specified the default value is taken.
> > > +  Valid value range [ns]: 0 - 637500; values must be a multiple of 2500;
> > > +  default is 0.
> > > +- touchscreen-average-samples: Please see ../input/touchscreen/touchscreen.txt
> > > +  for more information. Unlike the general binding, this is an array to specify
> > > +  the samples for each pad. If not specified or invalid values are specified
> > > +  the default value is taken.
> > > +  Valid values: 1, 4, 16, 64, 256, 1024, 4096, 16384; default is 1.
> > > +- touchscreen-pre-scaling: Please see ../input/touchscreen/touchscreen.txt for
> > > +  more information. Unlike the general binding, this is an array to specify the
> > > +  scaling factor for each pad. If not specified or invalid values are specified
> > > +  the default value is taken.
> > > +  Valid values: 1, 2, 4, 8, 16, 32, 64, 128; default is 1.
> > > +- touchscreen-fuzz-pressure: Please see ../input/touchscreen/touchscreen.txt for
> > > +  more information. Unlike the general binding, this is an array to specify the
> > > +  noise (threshold) value for each pad. If not specified or invalid values are
> > > +  specified the default value is taken.
> > 
> > I am confused why we refer to touchscreen bindings here... Yes, the
> > device is a capacitive touch sensor, but it it not a touchscreen
> > controller. I think referring to generic touchscreen binding is
> > confusing. Especially since they even do not map to the generic binding
> > (list vs scalar value).
> 
> Yes I'm deliberated about that too. I'm with you it isn't touchscreen
> controller and you're right the driver accepts arrays, but the meaning
> of the bindings map 1:1

Not quite. For example, in input fuzz is used to "smooth out" the
readings (see input_defuzz_abs_event) and not a threshhold (which it
seems to be from the name in the driver). And I have no idea what
"touchscreen-pre-scaling" is as it is not in my tree...

> and I wouldn't introduce new vendor-specific
> bindings.

I think vendor-neutral bindings only make sense if the meaning and the
type of data (and devices) are the same. I.e. if we have and IIO
pressure meter device it should not be using touchscreen-fuzz-pressure
even though device is dealing with pressure.

> Rob what do you think about that? Should I replace it by:
> 
> s/touchscreen-/microchip,touch-/
> 
> > > +  Valid value range: 0 - 255; default is 20.
> > > +
> > > +Example:
> > > +QT1050 with 3 non continuous key, key3 and key5 are disabled.
> > > +
> > > +touchkeys@41 {
> > > +	compatible = "microchip,qt1050";
> > > +	reg = <0x41>;
> > > +	interrupt-parent = <&gpio0>;
> > > +	interrupts = <17 IRQ_TYPE_EDGE_FALLING>;
> > > +	linux,keycodes = <KEY_UP>, <KEY_RIGHT>, <KEY_RESERVED>, <KEY_DOWN>;
> > > +	touchscreen-average-samples = <64>, <64>, <64>, <256>;
> > > +	touchscreen-pre-scaling = <16>, <8>, <16>, <16>;
> > > +};
> > > diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
> > > index 4713957b0cbb..08aba5e7cd93 100644
> > > --- a/drivers/input/keyboard/Kconfig
> > > +++ b/drivers/input/keyboard/Kconfig
> > > @@ -137,6 +137,17 @@ config KEYBOARD_ATKBD_RDI_KEYCODES
> > >  	  right-hand column will be interpreted as the key shown in the
> > >  	  left-hand column.
> > >  
> > > +config KEYBOARD_QT1050
> > > +	tristate "Microchip AT42QT1050 Touch Sensor Chip"
> > > +	depends on I2C
> > > +	select REGMAP_I2C
> > > +	help
> > > +	  Say Y here if you want to use Microchip AT42QT1050 QTouch
> > > +	  Sensor chip as input device.
> > > +
> > > +	  To compile this driver as a module, choose M here:
> > > +	  the module will be called qt1050
> > > +
> > >  config KEYBOARD_QT1070
> > >         tristate "Atmel AT42QT1070 Touch Sensor Chip"
> > >         depends on I2C
> > > diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Makefile
> > > index 182e92985dbf..f0291ca39f62 100644
> > > --- a/drivers/input/keyboard/Makefile
> > > +++ b/drivers/input/keyboard/Makefile
> > > @@ -50,6 +50,7 @@ obj-$(CONFIG_KEYBOARD_OPENCORES)	+= opencores-kbd.o
> > >  obj-$(CONFIG_KEYBOARD_PMIC8XXX)		+= pmic8xxx-keypad.o
> > >  obj-$(CONFIG_KEYBOARD_PXA27x)		+= pxa27x_keypad.o
> > >  obj-$(CONFIG_KEYBOARD_PXA930_ROTARY)	+= pxa930_rotary.o
> > > +obj-$(CONFIG_KEYBOARD_QT1050)           += qt1050.o
> > >  obj-$(CONFIG_KEYBOARD_QT1070)           += qt1070.o
> > >  obj-$(CONFIG_KEYBOARD_QT2160)		+= qt2160.o
> > >  obj-$(CONFIG_KEYBOARD_SAMSUNG)		+= samsung-keypad.o
> > > diff --git a/drivers/input/keyboard/qt1050.c b/drivers/input/keyboard/qt1050.c
> > > new file mode 100644
> > > index 000000000000..80415586955d
> > > --- /dev/null
> > > +++ b/drivers/input/keyboard/qt1050.c
> > > @@ -0,0 +1,589 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + *  Microchip AT42QT1050 QTouch Sensor Controller
> > > + *
> > > + *  Authors: Marco Felsch <kernel@pengutronix.de>
> > > + *
> > > + *  Base on AT42QT1070 driver by:
> > > + *  Bo Shen <voice.shen@atmel.com>
> > > + *  Copyright (C) 2011 Atmel
> > > + */
> > > +
> > > +#include <linux/delay.h>
> > > +#include <linux/i2c.h>
> > > +#include <linux/input.h>
> > > +#include <linux/interrupt.h>
> > > +#include <linux/kernel.h>
> > > +#include <linux/log2.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/regmap.h>
> > > +
> > > +/* Chip ID */
> > > +#define QT1050_CHIP_ID		0x00
> > > +#define QT1050_CHIP_ID_VER	0x46
> > > +
> > > +/* Firmware version */
> > > +#define QT1050_FW_VERSION	0x01
> > > +
> > > +/* Detection status */
> > > +#define QT1050_DET_STATUS	0x02
> > > +
> > > +/* Key status */
> > > +#define QT1050_KEY_STATUS	0x03
> > > +
> > > +/* Key Signals */
> > > +#define QT1050_KEY_SIGNAL_0_MSB	0x06
> > > +#define QT1050_KEY_SIGNAL_0_LSB	0x07
> > > +#define QT1050_KEY_SIGNAL_1_MSB	0x08
> > > +#define QT1050_KEY_SIGNAL_1_LSB	0x09
> > > +#define QT1050_KEY_SIGNAL_2_MSB	0x0c
> > > +#define QT1050_KEY_SIGNAL_2_LSB	0x0d
> > > +#define QT1050_KEY_SIGNAL_3_MSB	0x0e
> > > +#define QT1050_KEY_SIGNAL_3_LSB	0x0f
> > > +#define QT1050_KEY_SIGNAL_4_MSB	0x10
> > > +#define QT1050_KEY_SIGNAL_4_LSB	0x11
> > > +
> > > +/* Reference data */
> > > +#define QT1050_REF_DATA_0_MSB	0x14
> > > +#define QT1050_REF_DATA_0_LSB	0x15
> > > +#define QT1050_REF_DATA_1_MSB	0x16
> > > +#define QT1050_REF_DATA_1_LSB	0x17
> > > +#define QT1050_REF_DATA_2_MSB	0x1a
> > > +#define QT1050_REF_DATA_2_LSB	0x1b
> > > +#define QT1050_REF_DATA_3_MSB	0x1c
> > > +#define QT1050_REF_DATA_3_LSB	0x1d
> > > +#define QT1050_REF_DATA_4_MSB	0x1e
> > > +#define QT1050_REF_DATA_4_LSB	0x1f
> > > +
> > > +/* Negative threshold level */
> > > +#define QT1050_NTHR_0		0x21
> > > +#define QT1050_NTHR_1		0x22
> > > +#define QT1050_NTHR_2		0x24
> > > +#define QT1050_NTHR_3		0x25
> > > +#define QT1050_NTHR_4		0x26
> > > +
> > > +/* Pulse / Scale  */
> > > +#define QT1050_PULSE_SCALE_0	0x28
> > > +#define QT1050_PULSE_SCALE_1	0x29
> > > +#define QT1050_PULSE_SCALE_2	0x2b
> > > +#define QT1050_PULSE_SCALE_3	0x2c
> > > +#define QT1050_PULSE_SCALE_4	0x2d
> > > +
> > > +/* Detection integrator counter / AKS */
> > > +#define QT1050_DI_AKS_0		0x2f
> > > +#define QT1050_DI_AKS_1		0x30
> > > +#define QT1050_DI_AKS_2		0x32
> > > +#define QT1050_DI_AKS_3		0x33
> > > +#define QT1050_DI_AKS_4		0x34
> > > +
> > > +/* Charge Share Delay */
> > > +#define QT1050_CSD_0		0x36
> > > +#define QT1050_CSD_1		0x37
> > > +#define QT1050_CSD_2		0x39
> > > +#define QT1050_CSD_3		0x3a
> > > +#define QT1050_CSD_4		0x3b
> > > +
> > > +/* Low Power Mode */
> > > +#define QT1050_LPMODE		0x3d
> > > +
> > > +/* Calibration and Reset */
> > > +#define QT1050_RES_CAL		0x3f
> > > +#define QT1050_RES_CAL_RESET		BIT(7)
> > > +#define QT1050_RES_CAL_CALIBRATE	BIT(1)
> > > +
> > > +#define QT1050_MAX_KEYS		5
> > > +#define QT1050_RESET_TIME	255
> > > +
> > > +struct qt1050_key {
> > > +	u32 charge_delay;
> > > +	u32 thr_cnt;
> > > +	u32 samples;
> > > +	u32 scale;
> > > +	u16 keycode;
> > > +};
> > > +
> > > +struct qt1050_priv {
> > > +	struct i2c_client	*client;
> > > +	struct input_dev	*input;
> > > +	struct regmap		*regmap;
> > > +	struct qt1050_key	keys[QT1050_MAX_KEYS];
> > > +	unsigned short		keycodes[QT1050_MAX_KEYS];
> > > +	u8			last_keys;
> > > +};
> > > +
> > > +static bool qt1050_volatile_reg(struct device *dev, unsigned int reg)
> > > +{
> > > +	switch (reg) {
> > > +	case QT1050_DET_STATUS:
> > > +	case QT1050_KEY_STATUS:
> > > +	case QT1050_KEY_SIGNAL_0_MSB:
> > > +	case QT1050_KEY_SIGNAL_0_LSB:
> > > +	case QT1050_KEY_SIGNAL_1_MSB:
> > > +	case QT1050_KEY_SIGNAL_1_LSB:
> > > +	case QT1050_KEY_SIGNAL_2_MSB:
> > > +	case QT1050_KEY_SIGNAL_2_LSB:
> > > +	case QT1050_KEY_SIGNAL_3_MSB:
> > > +	case QT1050_KEY_SIGNAL_3_LSB:
> > > +	case QT1050_KEY_SIGNAL_4_MSB:
> > > +	case QT1050_KEY_SIGNAL_4_LSB:
> > > +		return true;
> > > +	default:
> > > +		return false;
> > > +	}
> > > +}
> > > +
> > > +static const struct regmap_range qt1050_readable_ranges[] = {
> > > +	regmap_reg_range(QT1050_CHIP_ID, QT1050_KEY_STATUS),
> > > +	regmap_reg_range(QT1050_KEY_SIGNAL_0_MSB, QT1050_KEY_SIGNAL_1_LSB),
> > > +	regmap_reg_range(QT1050_KEY_SIGNAL_2_MSB, QT1050_KEY_SIGNAL_4_LSB),
> > > +	regmap_reg_range(QT1050_REF_DATA_0_MSB, QT1050_REF_DATA_1_LSB),
> > > +	regmap_reg_range(QT1050_REF_DATA_2_MSB, QT1050_REF_DATA_4_LSB),
> > > +	regmap_reg_range(QT1050_NTHR_0, QT1050_NTHR_1),
> > > +	regmap_reg_range(QT1050_NTHR_2, QT1050_NTHR_4),
> > > +	regmap_reg_range(QT1050_PULSE_SCALE_0, QT1050_PULSE_SCALE_1),
> > > +	regmap_reg_range(QT1050_PULSE_SCALE_2, QT1050_PULSE_SCALE_4),
> > > +	regmap_reg_range(QT1050_DI_AKS_0, QT1050_DI_AKS_1),
> > > +	regmap_reg_range(QT1050_DI_AKS_2, QT1050_DI_AKS_4),
> > > +	regmap_reg_range(QT1050_CSD_0, QT1050_CSD_1),
> > > +	regmap_reg_range(QT1050_CSD_2, QT1050_RES_CAL),
> > > +};
> > > +
> > > +static const struct regmap_access_table qt1050_readable_table = {
> > > +	.yes_ranges = qt1050_readable_ranges,
> > > +	.n_yes_ranges = ARRAY_SIZE(qt1050_readable_ranges),
> > > +};
> > > +
> > > +static const struct regmap_range qt1050_writeable_ranges[] = {
> > > +	regmap_reg_range(QT1050_NTHR_0, QT1050_NTHR_1),
> > > +	regmap_reg_range(QT1050_NTHR_2, QT1050_NTHR_4),
> > > +	regmap_reg_range(QT1050_PULSE_SCALE_0, QT1050_PULSE_SCALE_1),
> > > +	regmap_reg_range(QT1050_PULSE_SCALE_2, QT1050_PULSE_SCALE_4),
> > > +	regmap_reg_range(QT1050_DI_AKS_0, QT1050_DI_AKS_1),
> > > +	regmap_reg_range(QT1050_DI_AKS_2, QT1050_DI_AKS_4),
> > > +	regmap_reg_range(QT1050_CSD_0, QT1050_CSD_1),
> > > +	regmap_reg_range(QT1050_CSD_2, QT1050_RES_CAL),
> > > +};
> > > +
> > > +static const struct regmap_access_table qt1050_writeable_table = {
> > > +	.yes_ranges = qt1050_writeable_ranges,
> > > +	.n_yes_ranges = ARRAY_SIZE(qt1050_writeable_ranges),
> > > +};
> > > +
> > > +static struct regmap_config qt1050_regmap_config = {
> > > +	.reg_bits = 8,
> > > +	.val_bits = 8,
> > > +	.max_register = QT1050_RES_CAL,
> > > +
> > > +	.cache_type = REGCACHE_RBTREE,
> > > +
> > > +	.wr_table = &qt1050_writeable_table,
> > > +	.rd_table = &qt1050_readable_table,
> > > +	.volatile_reg = qt1050_volatile_reg,
> > > +};
> > > +
> > > +static bool qt1050_identify(struct qt1050_priv *ts)
> > > +{
> > > +	unsigned int val;
> > > +
> > > +	/* Read Chip ID */
> > > +	regmap_read(ts->regmap, QT1050_CHIP_ID, &val);
> > > +	if (val != QT1050_CHIP_ID_VER) {
> > > +		dev_err(&ts->client->dev, "ID %d not supported\n", val);
> > > +		return false;
> > > +	}
> > > +
> > > +	/* Read firmware version */
> > > +	regmap_read(ts->regmap, QT1050_FW_VERSION, &val);
> > > +	if (val < 0) {
> > > +		dev_err(&ts->client->dev, "could not read the firmware version\n");
> > > +		return false;
> > > +	}
> > > +
> > > +	dev_info(&ts->client->dev, "AT42QT1050 firmware version %1d.%1d\n",
> > > +		 val >> 4, val & 0xf);
> > > +
> > > +	return true;
> > > +}
> > > +
> > > +static irqreturn_t qt1050_irq_threaded(int irq, void *dev_id)
> > > +{
> > > +	struct qt1050_priv *ts = dev_id;
> > > +	struct input_dev *input = ts->input;
> > > +	unsigned long new_keys, changed;
> > > +	unsigned int val;
> > > +	int i, err;
> > > +
> > > +	/* Read the detected status register, thus clearing interrupt */
> > > +	err = regmap_read(ts->regmap, QT1050_DET_STATUS, &val);
> > > +	if (err) {
> > > +		dev_err(&ts->client->dev, "Fail to read detection status: %d\n",
> > > +			err);
> > > +		return IRQ_NONE;
> > > +	}
> > > +
> > > +	/* Read which key changed, keys are not continuous */
> > > +	err = regmap_read(ts->regmap, QT1050_KEY_STATUS, &val);
> > > +	if (err) {
> > > +		dev_err(&ts->client->dev,
> > > +			"Fail to determine the key status: %d\n", err);
> > > +		return IRQ_NONE;
> > > +	}
> > > +	new_keys = (val & 0x70) >> 2 | (val & 0x6) >> 1;
> > > +	changed = ts->last_keys ^ new_keys;
> > > +
> > > +	for_each_set_bit(i, &changed, 8) {
> > > +		input_report_key(input, ts->keycodes[i],
> > > +				 test_bit(i, &new_keys));
> > > +	}
> > > +
> > > +	ts->last_keys = new_keys;
> > > +	input_sync(input);
> > > +
> > > +	return IRQ_HANDLED;
> > > +}
> > > +
> > > +static int qt1050_disable_key(struct regmap *map, int number)
> > > +{
> > > +	unsigned int reg;
> > > +
> > > +	switch (number) {
> > > +	case 0:
> > > +		reg = QT1050_DI_AKS_0;
> > > +		break;
> > > +	case 1:
> > > +		reg = QT1050_DI_AKS_1;
> > > +		break;
> > > +	case 2:
> > > +		reg = QT1050_DI_AKS_2;
> > > +		break;
> > > +	case 3:
> > > +		reg = QT1050_DI_AKS_3;
> > > +		break;
> > > +	case 4:
> > > +		reg = QT1050_DI_AKS_4;
> > > +		break;

I wonder if there is any value in doing

	reg = QT1050_DI_AKS_0 + i + (i > 2);

and similarly for other registers.

> > > +	}
> > > +
> > > +	return regmap_update_bits(map, reg, 0xfc, 0x00);
> > > +}
> > > +
> > > +#ifdef CONFIG_OF
> > > +static int qt1050_set_dt_data(struct qt1050_priv *ts)
> > > +{
> > > +	struct regmap *map = ts->regmap;
> > > +	struct qt1050_key *k;
> > > +	int i, err;
> > > +	unsigned int pulsc_reg, csd_reg, nthr_reg;
> > > +
> > > +	for (i = 0; i < QT1050_MAX_KEYS; i++) {
> > > +		k = &ts->keys[i];
> > > +		/* disable all keys which are marked as KEY_RESERVED */
> > > +		if (k->keycode == KEY_RESERVED) {
> > > +			err = qt1050_disable_key(map, i);
> > > +			if (err)
> > > +				return err;
> > > +			continue;
> > > +		}
> > > +
> > > +		switch (i) {
> > > +		case 0:
> > > +			pulsc_reg = QT1050_PULSE_SCALE_0;
> > > +			csd_reg = QT1050_CSD_0;
> > > +			nthr_reg = QT1050_NTHR_0;
> > > +			break;
> > > +		case 1:
> > > +			pulsc_reg = QT1050_PULSE_SCALE_1;
> > > +			csd_reg = QT1050_CSD_1;
> > > +			nthr_reg = QT1050_NTHR_1;
> > > +			break;
> > > +		case 2:
> > > +			pulsc_reg = QT1050_PULSE_SCALE_1;

Should it be QT1050_PULSE_SCALE_2?

> > > +			csd_reg = QT1050_CSD_2;
> > > +			nthr_reg = QT1050_NTHR_2;
> > > +			break;
> > > +		case 3:
> > > +			pulsc_reg = QT1050_PULSE_SCALE_3;
> > > +			csd_reg = QT1050_CSD_3;
> > > +			nthr_reg = QT1050_NTHR_3;
> > > +			break;
> > > +		case 4:
> > > +			pulsc_reg = QT1050_PULSE_SCALE_4;
> > > +			csd_reg = QT1050_CSD_4;
> > > +			nthr_reg = QT1050_NTHR_4;
> > > +			break;
> > > +		}
> > > +
> > > +		err = regmap_write(map, pulsc_reg,
> > > +				   (k->samples << 4) | (k->scale));
> > > +		if (err)
> > > +			return err;
> > > +		err = regmap_write(map, csd_reg, k->charge_delay);
> > > +		if (err)
> > > +			return err;
> > > +		err = regmap_write(map, nthr_reg, k->thr_cnt);
> > > +		if (err)
> > > +			return err;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int qt1050_parse_dt(struct qt1050_priv *ts)
> > > +{
> > > +	struct device *dev = &ts->client->dev;
> > > +	struct device_node *node = dev->of_node;
> > > +	int ret, i, n_keys;
> > > +	u32 tmp[QT1050_MAX_KEYS];
> > > +
> > > +	ret = of_property_read_variable_u32_array(node, "linux,keycodes",
> > > +						  &tmp[0], 1,
> > > +						  QT1050_MAX_KEYS);
> > > +
> > > +	/*
> > > +	 * remaining keys are mapped to KEY_RESERVED in case of
> > > +	 * n_keys < QT1050_MAX_KEYS
> > > +	 */
> > > +	n_keys = ret;
> > > +	for (i = 0; i < n_keys; i++) {
> > > +		if (tmp[i] >= KEY_MAX) {
> > > +			dev_err(dev, "wrong keycode 0x%x\n", tmp[i]);
> > > +			return -EINVAL;
> > > +		}
> > > +		ts->keys[i].keycode = (u16)tmp[i];
> > > +	}
> > > +
> > > +	ret = of_property_read_variable_u32_array(node, "pre-charge-time",
> > > +						  &tmp[0], 1, QT1050_MAX_KEYS);
> > > +	if (!IS_ERR_VALUE(ret)) {
> > > +		for (i = 0; i < QT1050_MAX_KEYS; i++) {
> > > +			if (i < n_keys && (tmp[i] % 2500 == 0))
> > > +				ts->keys[i].charge_delay = tmp[i] / 2500;
> > > +			else
> > > +				ts->keys[i].charge_delay = 0;
> > > +		}
> > > +	}
> > > +
> > > +	ret = of_property_read_variable_u32_array(node,
> > > +						  "touchscreen-average-samples",
> > > +						  &tmp[0], 1, QT1050_MAX_KEYS);
> > > +	if (!IS_ERR_VALUE(ret)) {
> > > +		for (i = 0; i < QT1050_MAX_KEYS; i++) {
> > > +			if (i < n_keys && is_power_of_2(tmp[i]))
> > > +				ts->keys[i].samples = ilog2(tmp[i]);
> > > +			else
> > > +				ts->keys[i].samples = 0;
> > > +		}
> > > +	}
> > > +
> > > +	ret = of_property_read_variable_u32_array(node,
> > > +						  "touchscreen-pre-scaling",
> > > +						  &tmp[0], 1, QT1050_MAX_KEYS);
> > > +	if (!IS_ERR_VALUE(ret)) {
> > > +		for (i = 0; i < QT1050_MAX_KEYS; i++) {
> > > +			if (i < n_keys && is_power_of_2(tmp[i]))
> > > +				ts->keys[i].scale = ilog2(tmp[i]);
> > > +			else
> > > +				ts->keys[i].scale = 0;
> > > +		}
> > > +	}
> > > +
> > > +	ret = of_property_read_variable_u32_array(node,
> > > +						  "touchscreen-fuzz-pressure",
> > > +						  &tmp[0], 1, QT1050_MAX_KEYS);
> > > +	if (!IS_ERR_VALUE(ret))
> > > +		for (i = 0; i < QT1050_MAX_KEYS; i++)
> > > +			ts->keys[i].thr_cnt = i < n_keys ? tmp[i] : 20;
> > > +
> > > +	return 0;
> > > +}
> > > +#endif
> > > +
> > > +static int qt1050_probe(struct i2c_client *client,
> > > +				const struct i2c_device_id *id)
> > > +{
> > > +	struct qt1050_priv *ts;
> > > +	struct input_dev *input;
> > > +	struct device *dev = &client->dev;
> > > +	struct regmap *map;
> > > +	unsigned int status;
> > > +	int i;
> > > +	int err;
> > > +
> > > +	/* Check basic functionality */
> > > +	err = i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE);
> > > +	if (!err) {
> > > +		dev_err(&client->dev, "%s adapter not supported\n",
> > > +			dev_driver_string(&client->adapter->dev));
> > > +		return -ENODEV;
> > > +	}
> > > +
> > > +	if (!client->irq) {
> > > +		dev_err(dev, "assign a irq line to this device\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	ts = devm_kzalloc(dev, sizeof(*ts), GFP_KERNEL);
> > > +	input = devm_input_allocate_device(dev);
> > > +	if (!ts || !input) {
> > > +		dev_err(dev, "insufficient memory\n");
> > > +		return -ENOMEM;
> > > +	}
> > > +
> > > +	map = devm_regmap_init_i2c(client, &qt1050_regmap_config);
> > > +	if (IS_ERR(map))
> > > +		return PTR_ERR(map);
> > > +
> > > +	ts->client = client;
> > > +	ts->input = input;
> > > +	ts->regmap = map;
> > > +
> > > +	i2c_set_clientdata(client, ts);
> > > +
> > > +	/* Identify the qt1050 chip */
> > > +	if (!qt1050_identify(ts))
> > > +		return -ENODEV;
> > > +
> > > +	if (IS_ENABLED(CONFIG_OF)) {
> > > +		err = qt1050_parse_dt(ts);
> > > +		if (err) {
> > > +			dev_err(dev, "Failed to parse dt: %d\n", err);
> > > +			return err;
> > > +		}
> > > +	} else {
> > > +		/* init each key with a valid code */
> > > +		for (i = 0; i < QT1050_MAX_KEYS; i++)
> > > +			ts->keys[i].keycode = KEY_1 + i;
> > > +	}
> > 
> > I'd rather we used generic device properties (i.e.
> > device_property_read_xxx() instead of of_property_read_xxx()) and did
> > not provide this fallback.
> 
> I'm with you, but I wanted to use the of_property_read_variable_*()
> helpers, since all properties can distinguish in their array size.
> Sure I can add a helper to reimplement that localy using the 
> device_property_read_xxx() functions. IMHO this will be a later on
> feature, if the acpi guys needs this features too. Is that okay?

Well, that is an argument for adding proper
device_property_read_variable_*(). However, after lookign at the binding
again, I wonder if you should not describe this as sub-nodes:

	touchkeys@41 {
		...
		up@0 {
			reg = <0>;
			linux,code = <KEY_UP>;
			average-samples = <64>;
			pre-scaling = <16>;
			pressure-threshold = <...>;
		};

		right@1 {
			reg = <1>;
			linux,code = <KEY_RIGHT>;
			average-samples = <64>;
			pre-scaling = <8>;
			pressure-threshold = <2>;
		};
		...
	};

and then use device_for_each_child_node() to parse it.

Thanks.

-- 
Dmitry
