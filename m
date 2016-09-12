From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: Re: [PATCH] pinctrl: Add SX150X GPIO Extender Pinctrl Driver
Date: Mon, 12 Sep 2016 12:17:10 +0200
Message-ID: <637a259a-8df8-623b-5dde-824561e6aee0@axentia.se>
References: <1473166599-29266-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473166599-29266-1-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei.Chen-kQvG35nSl+M@public.gmane.org, stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org, vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi!

Sorry for the delay, other stuff interfered...

As I stated previously, we have an sx1502, and this seems /almost/ good.
Comments inline.

On 2016-09-06 14:56, Neil Armstrong wrote:
> Since the I2C sx150x GPIO expander driver uses platform_data to manage
> the pins configurations, rewrite the driver as a pinctrl driver using
> pinconf to get/set pin configurations from DT or debugfs.
> 
> The pinctrl driver is functionnally equivalent as the gpio-only driver
> and can use DT for pinconf. The platform_data confirmation is dropped.
> 
> This patchset removed the gpio-only driver and selects the Pinctrl driver
> config instead. This patchset also migrates the gpio dt-bindings to pinctrl
> and add the pinctrl optional properties.
> 
> The driver was tested with a SX1509 device on a BeagleBone black with
> interrupt support and on a X86_64 machine over an I2C to USB converter.
> 
> Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
> This is a fixed version that builds and runs on non-OF platforms and on
> arm based OF. The GPIO version is removed and the bindings are also moved
> to the pinctrl bindings.
> 
> One remaining question, should i2c_driver remove be implemented ?
> It would be quite hard to implement due to the interrupt controller.
> 
> Peter, could you test this fixed version instead ?
> 
> Changes since RFC at http://lkml.kernel.org/r/:
>  - Put #ifdef CONFIG_OF/CONFIG_OF_GPIO to remove OF code for non-of platforms
>  - No more rely on OF_GPIO config
>  - Moved and enhanced bindings to pinctrl bindings
>  - Removed gpio-sx150x.c
>  - Temporary select PINCTRL_SX150X when GPIO_SX150X
>  - Temporary mark GPIO_SX150X as deprecated
> 
>  .../devicetree/bindings/gpio/gpio-sx150x.txt       |   41 -
>  .../devicetree/bindings/pinctrl/pinctrl-sx150x.txt |   67 ++
>  drivers/gpio/Kconfig                               |   10 +-
>  drivers/gpio/Makefile                              |    1 -
>  drivers/gpio/gpio-sx150x.c                         |  794 ---------------
>  drivers/pinctrl/Kconfig                            |   14 +
>  drivers/pinctrl/Makefile                           |    1 +
>  drivers/pinctrl/pinctrl-sx150x.c                   | 1060 ++++++++++++++++++++
>  8 files changed, 1145 insertions(+), 843 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-sx150x.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-sx150x.txt
>  delete mode 100644 drivers/gpio/gpio-sx150x.c
>  create mode 100644 drivers/pinctrl/pinctrl-sx150x.c
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt b/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt
> deleted file mode 100644
> index c809acb..0000000
> --- a/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -SEMTECH SX150x GPIO expander bindings
> -
> -
> -Required properties:
> -
> -- compatible: should be "semtech,sx1506q",
> -			"semtech,sx1508q",
> -			"semtech,sx1509q",
> -			"semtech,sx1502q".
> -
> -- reg: The I2C slave address for this device.
> -
> -- interrupt-parent: phandle of the parent interrupt controller.
> -
> -- interrupts: Interrupt specifier for the controllers interrupt.
> -
> -- #gpio-cells: Should be 2. The first cell is the GPIO number and the
> -		second cell is used to specify optional parameters:
> -		bit 0: polarity (0: normal, 1: inverted)
> -
> -- gpio-controller: Marks the device as a GPIO controller.
> -
> -- interrupt-controller: Marks the device as a interrupt controller.
> -
> -The GPIO expander can optionally be used as an interrupt controller, in
> -which case it uses the default two cell specifier as described in
> -Documentation/devicetree/bindings/interrupt-controller/interrupts.txt.
> -
> -Example:
> -
> -	i2c_gpio_expander@20{
> -		#gpio-cells = <2>;
> -		#interrupt-cells = <2>;
> -		compatible = "semtech,sx1506q";
> -		reg = <0x20>;
> -		interrupt-parent = <&gpio_1>;
> -		interrupts = <16 0>;
> -
> -		gpio-controller;
> -		interrupt-controller;
> -	};
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-sx150x.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-sx150x.txt
> new file mode 100644
> index 0000000..b8710c4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-sx150x.txt
> @@ -0,0 +1,67 @@
> +SEMTECH SX150x GPIO expander bindings
> +
> +Please refer to ../pinctrl/pinctrl-bindings.txt, gpio.txt, and

pinctrl-bindings.txt, ../gpio/gpio.txt

> +../interrupt-controller/interrupts.txt for generic information regarding
> +pin controller, GPIO, and interrupt bindings.
> +
> +Required properties:
> +- compatible: should be "semtech,sx1506q",
> +			"semtech,sx1508q",
> +			"semtech,sx1509q",
> +			"semtech,sx1502q".
> +
> +- reg: The I2C slave address for this device.
> +
> +- #gpio-cells: Should be 2. The first cell is the GPIO number and the
> +		second cell is used to specify optional parameters:
> +		bit 0: polarity (0: normal, 1: inverted)
> +
> +- gpio-controller: Marks the device as a GPIO controller.
> +
> +Optional properties :
> +- interrupt-parent: phandle of the parent interrupt controller.
> +
> +- interrupts: Interrupt specifier for the controllers interrupt.
> +
> +- interrupt-controller: Marks the device as a interrupt controller.
> +
> +- semtech,probe-reset: Will trigger a reset of the GPIO expander on probe
> +
> +The GPIO expander can optionally be used as an interrupt controller, in
> +which case it uses the default two cell specifier.
> +
> +Required properties for pin configuration sub-nodes:
> + - pins: List of pins to which the configuration applies.
> +
> +Optional properties for pin configuration sub-nodes:
> +----------------------------------------------------
> + - bias-disable: disable any pin bias, except the OSCIO pin
> + - bias-pull-up: pull up the pin, except the OSCIO pin
> + - bias-pull-down: pull down the pin, except the OSCIO pin
> + - bias-pull-pin-default: use pin-default pull state, except the OSCIO pin
> + - drive-push-pull: drive actively high and low
> + - drive-open-drain: drive with open drain only for sx1508q and sx1509q and except the OSCIO pin
> + - output-low: set the pin to output mode with low level
> + - output-high: set the pin to output mode with high level
> +
> +Example:
> +
> +	i2c_gpio_expander@20{
> +		#gpio-cells = <2>;
> +		#interrupt-cells = <2>;
> +		compatible = "semtech,sx1506q";
> +		reg = <0x20>;
> +		interrupt-parent = <&gpio_1>;
> +		interrupts = <16 0>;
> +
> +		gpio-controller;
> +		interrupt-controller;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio1_cfg_pins>;
> +
> +		gpio1_cfg_pins: gpio1_cfg {
> +			pins = "gpio1";
> +			bias-pull-up;
> +		};
> +	};
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 66a9410..3747fbc 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -761,16 +761,12 @@ config GPIO_PCF857X
>  	  platform-neutral GPIO calls.
>  
>  config GPIO_SX150X
> -	bool "Semtech SX150x I2C GPIO expander"
> -	depends on I2C=y
> -	select GPIOLIB_IRQCHIP
> +	bool "Semtech SX150x I2C GPIO expander (deprecated)"
> +	select PINCTRL_SX150X
>  	default n
>  	help
>  	  Say yes here to provide support for Semtech SX150-series I2C

SX150x-series ???

> -	  GPIO expanders. Compatible models include:
> -
> -	  8 bits:  sx1508q
> -	  16 bits: sx1509q
> +	  GPIO expanders. The GPIO driver was replaced by a Pinctrl version.
>  
>  config GPIO_TPIC2810
>  	tristate "TPIC2810 8-Bit I2C GPO expander"
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 2a035ed..ffd2f4c 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -96,7 +96,6 @@ obj-$(CONFIG_GPIO_SPEAR_SPICS)	+= gpio-spear-spics.o
>  obj-$(CONFIG_GPIO_STA2X11)	+= gpio-sta2x11.o
>  obj-$(CONFIG_GPIO_STMPE)	+= gpio-stmpe.o
>  obj-$(CONFIG_GPIO_STP_XWAY)	+= gpio-stp-xway.o
> -obj-$(CONFIG_GPIO_SX150X)	+= gpio-sx150x.o
>  obj-$(CONFIG_GPIO_SYSCON)	+= gpio-syscon.o
>  obj-$(CONFIG_GPIO_TB10X)	+= gpio-tb10x.o
>  obj-$(CONFIG_GPIO_TC3589X)	+= gpio-tc3589x.o
> diff --git a/drivers/gpio/gpio-sx150x.c b/drivers/gpio/gpio-sx150x.c
> deleted file mode 100644
> index a177ebd..0000000
> --- a/drivers/gpio/gpio-sx150x.c
> +++ /dev/null
> @@ -1,794 +0,0 @@
> -/* Copyright (c) 2010, Code Aurora Forum. All rights reserved.
> - *
> - * Driver for Semtech SX150X I2C GPIO Expanders
> - *
> - * Author: Gregory Bean <gbean-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 and
> - * only version 2 as published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program; if not, write to the Free Software
> - * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
> - * 02110-1301, USA.
> - */
> -#include <linux/gpio.h>
> -#include <linux/i2c.h>
> -#include <linux/init.h>
> -#include <linux/interrupt.h>
> -#include <linux/irq.h>
> -#include <linux/mutex.h>
> -#include <linux/slab.h>
> -#include <linux/of.h>
> -#include <linux/of_address.h>
> -#include <linux/of_irq.h>
> -#include <linux/of_gpio.h>
> -#include <linux/of_device.h>
> -
> -#define NO_UPDATE_PENDING	-1
> -
> -/* The chip models of sx150x */
> -#define SX150X_123 0
> -#define SX150X_456 1
> -#define SX150X_789 2
> -
> -struct sx150x_123_pri {
> -	u8 reg_pld_mode;
> -	u8 reg_pld_table0;
> -	u8 reg_pld_table1;
> -	u8 reg_pld_table2;
> -	u8 reg_pld_table3;
> -	u8 reg_pld_table4;
> -	u8 reg_advance;
> -};
> -
> -struct sx150x_456_pri {
> -	u8 reg_pld_mode;
> -	u8 reg_pld_table0;
> -	u8 reg_pld_table1;
> -	u8 reg_pld_table2;
> -	u8 reg_pld_table3;
> -	u8 reg_pld_table4;
> -	u8 reg_advance;
> -};
> -
> -struct sx150x_789_pri {
> -	u8 reg_drain;
> -	u8 reg_polarity;
> -	u8 reg_clock;
> -	u8 reg_misc;
> -	u8 reg_reset;
> -	u8 ngpios;
> -};
> -
> -struct sx150x_device_data {
> -	u8 model;
> -	u8 reg_pullup;
> -	u8 reg_pulldn;
> -	u8 reg_dir;
> -	u8 reg_data;
> -	u8 reg_irq_mask;
> -	u8 reg_irq_src;
> -	u8 reg_sense;
> -	u8 ngpios;
> -	union {
> -		struct sx150x_123_pri x123;
> -		struct sx150x_456_pri x456;
> -		struct sx150x_789_pri x789;
> -	} pri;
> -};
> -
> -/**
> - * struct sx150x_platform_data - config data for SX150x driver
> - * @gpio_base: The index number of the first GPIO assigned to this
> - *             GPIO expander.  The expander will create a block of
> - *             consecutively numbered gpios beginning at the given base,
> - *             with the size of the block depending on the model of the
> - *             expander chip.
> - * @oscio_is_gpo: If set to true, the driver will configure OSCIO as a GPO
> - *                instead of as an oscillator, increasing the size of the
> - *                GP(I)O pool created by this expander by one.  The
> - *                output-only GPO pin will be added at the end of the block.
> - * @io_pullup_ena: A bit-mask which enables or disables the pull-up resistor
> - *                 for each IO line in the expander.  Setting the bit at
> - *                 position n will enable the pull-up for the IO at
> - *                 the corresponding offset.  For chips with fewer than
> - *                 16 IO pins, high-end bits are ignored.
> - * @io_pulldn_ena: A bit-mask which enables-or disables the pull-down
> - *                 resistor for each IO line in the expander. Setting the
> - *                 bit at position n will enable the pull-down for the IO at
> - *                 the corresponding offset.  For chips with fewer than
> - *                 16 IO pins, high-end bits are ignored.
> - * @io_polarity: A bit-mask which enables polarity inversion for each IO line
> - *               in the expander.  Setting the bit at position n inverts
> - *               the polarity of that IO line, while clearing it results
> - *               in normal polarity. For chips with fewer than 16 IO pins,
> - *               high-end bits are ignored.
> - * @irq_summary: The 'summary IRQ' line to which the GPIO expander's INT line
> - *               is connected, via which it reports interrupt events
> - *               across all GPIO lines.  This must be a real,
> - *               pre-existing IRQ line.
> - *               Setting this value < 0 disables the irq_chip functionality
> - *               of the driver.
> - * @irq_base: The first 'virtual IRQ' line at which our block of GPIO-based
> - *            IRQ lines will appear.  Similarly to gpio_base, the expander
> - *            will create a block of irqs beginning at this number.
> - *            This value is ignored if irq_summary is < 0.
> - * @reset_during_probe: If set to true, the driver will trigger a full
> - *                      reset of the chip at the beginning of the probe
> - *                      in order to place it in a known state.
> - */
> -struct sx150x_platform_data {
> -	unsigned gpio_base;
> -	bool     oscio_is_gpo;
> -	u16      io_pullup_ena;
> -	u16      io_pulldn_ena;
> -	u16      io_polarity;
> -	int      irq_summary;
> -	unsigned irq_base;
> -	bool     reset_during_probe;
> -};
> -
> -struct sx150x_chip {
> -	struct gpio_chip                 gpio_chip;
> -	struct i2c_client               *client;
> -	const struct sx150x_device_data *dev_cfg;
> -	int                              irq_summary;
> -	int                              irq_base;
> -	int				 irq_update;
> -	u32                              irq_sense;
> -	u32				 irq_masked;
> -	u32				 dev_sense;
> -	u32				 dev_masked;
> -	struct irq_chip                  irq_chip;
> -	struct mutex                     lock;
> -};
> -
> -static const struct sx150x_device_data sx150x_devices[] = {
> -	[0] = { /* sx1508q */
> -		.model = SX150X_789,
> -		.reg_pullup	= 0x03,
> -		.reg_pulldn	= 0x04,
> -		.reg_dir	= 0x07,
> -		.reg_data	= 0x08,
> -		.reg_irq_mask	= 0x09,
> -		.reg_irq_src	= 0x0c,
> -		.reg_sense	= 0x0b,
> -		.pri.x789 = {
> -			.reg_drain	= 0x05,
> -			.reg_polarity	= 0x06,
> -			.reg_clock	= 0x0f,
> -			.reg_misc	= 0x10,
> -			.reg_reset	= 0x7d,
> -		},
> -		.ngpios = 8,
> -	},
> -	[1] = { /* sx1509q */
> -		.model = SX150X_789,
> -		.reg_pullup	= 0x07,
> -		.reg_pulldn	= 0x09,
> -		.reg_dir	= 0x0f,
> -		.reg_data	= 0x11,
> -		.reg_irq_mask	= 0x13,
> -		.reg_irq_src	= 0x19,
> -		.reg_sense	= 0x17,
> -		.pri.x789 = {
> -			.reg_drain	= 0x0b,
> -			.reg_polarity	= 0x0d,
> -			.reg_clock	= 0x1e,
> -			.reg_misc	= 0x1f,
> -			.reg_reset	= 0x7d,
> -		},
> -		.ngpios	= 16
> -	},
> -	[2] = { /* sx1506q */
> -		.model = SX150X_456,
> -		.reg_pullup	= 0x05,
> -		.reg_pulldn	= 0x07,
> -		.reg_dir	= 0x03,
> -		.reg_data	= 0x01,
> -		.reg_irq_mask	= 0x09,
> -		.reg_irq_src	= 0x0f,
> -		.reg_sense	= 0x0d,
> -		.pri.x456 = {
> -			.reg_pld_mode	= 0x21,
> -			.reg_pld_table0	= 0x23,
> -			.reg_pld_table1	= 0x25,
> -			.reg_pld_table2	= 0x27,
> -			.reg_pld_table3	= 0x29,
> -			.reg_pld_table4	= 0x2b,
> -			.reg_advance	= 0xad,
> -		},
> -		.ngpios	= 16
> -	},
> -	[3] = { /* sx1502q */
> -		.model = SX150X_123,
> -		.reg_pullup	= 0x02,
> -		.reg_pulldn	= 0x03,
> -		.reg_dir	= 0x01,
> -		.reg_data	= 0x00,
> -		.reg_irq_mask	= 0x05,
> -		.reg_irq_src	= 0x08,
> -		.reg_sense	= 0x07,
> -		.pri.x123 = {
> -			.reg_pld_mode	= 0x10,
> -			.reg_pld_table0	= 0x11,
> -			.reg_pld_table1	= 0x12,
> -			.reg_pld_table2	= 0x13,
> -			.reg_pld_table3	= 0x14,
> -			.reg_pld_table4	= 0x15,
> -			.reg_advance	= 0xad,
> -		},
> -		.ngpios	= 8,
> -	},
> -};
> -
> -static const struct i2c_device_id sx150x_id[] = {
> -	{"sx1508q", 0},
> -	{"sx1509q", 1},
> -	{"sx1506q", 2},
> -	{"sx1502q", 3},
> -	{}
> -};
> -MODULE_DEVICE_TABLE(i2c, sx150x_id);
> -
> -static const struct of_device_id sx150x_of_match[] = {
> -	{ .compatible = "semtech,sx1508q" },
> -	{ .compatible = "semtech,sx1509q" },
> -	{ .compatible = "semtech,sx1506q" },
> -	{ .compatible = "semtech,sx1502q" },
> -	{},
> -};
> -MODULE_DEVICE_TABLE(of, sx150x_of_match);
> -
> -static s32 sx150x_i2c_write(struct i2c_client *client, u8 reg, u8 val)
> -{
> -	s32 err = i2c_smbus_write_byte_data(client, reg, val);
> -
> -	if (err < 0)
> -		dev_warn(&client->dev,
> -			"i2c write fail: can't write %02x to %02x: %d\n",
> -			val, reg, err);
> -	return err;
> -}
> -
> -static s32 sx150x_i2c_read(struct i2c_client *client, u8 reg, u8 *val)
> -{
> -	s32 err = i2c_smbus_read_byte_data(client, reg);
> -
> -	if (err >= 0)
> -		*val = err;
> -	else
> -		dev_warn(&client->dev,
> -			"i2c read fail: can't read from %02x: %d\n",
> -			reg, err);
> -	return err;
> -}
> -
> -static inline bool offset_is_oscio(struct sx150x_chip *chip, unsigned offset)
> -{
> -	return (chip->dev_cfg->ngpios == offset);
> -}
> -
> -/*
> - * These utility functions solve the common problem of locating and setting
> - * configuration bits.  Configuration bits are grouped into registers
> - * whose indexes increase downwards.  For example, with eight-bit registers,
> - * sixteen gpios would have their config bits grouped in the following order:
> - * REGISTER N-1 [ f e d c b a 9 8 ]
> - *          N   [ 7 6 5 4 3 2 1 0 ]
> - *
> - * For multi-bit configurations, the pattern gets wider:
> - * REGISTER N-3 [ f f e e d d c c ]
> - *          N-2 [ b b a a 9 9 8 8 ]
> - *          N-1 [ 7 7 6 6 5 5 4 4 ]
> - *          N   [ 3 3 2 2 1 1 0 0 ]
> - *
> - * Given the address of the starting register 'N', the index of the gpio
> - * whose configuration we seek to change, and the width in bits of that
> - * configuration, these functions allow us to locate the correct
> - * register and mask the correct bits.
> - */
> -static inline void sx150x_find_cfg(u8 offset, u8 width,
> -				u8 *reg, u8 *mask, u8 *shift)
> -{
> -	*reg   -= offset * width / 8;
> -	*mask   = (1 << width) - 1;
> -	*shift  = (offset * width) % 8;
> -	*mask <<= *shift;
> -}
> -
> -static s32 sx150x_write_cfg(struct sx150x_chip *chip,
> -			u8 offset, u8 width, u8 reg, u8 val)
> -{
> -	u8  mask;
> -	u8  data;
> -	u8  shift;
> -	s32 err;
> -
> -	sx150x_find_cfg(offset, width, &reg, &mask, &shift);
> -	err = sx150x_i2c_read(chip->client, reg, &data);
> -	if (err < 0)
> -		return err;
> -
> -	data &= ~mask;
> -	data |= (val << shift) & mask;
> -	return sx150x_i2c_write(chip->client, reg, data);
> -}
> -
> -static int sx150x_get_io(struct sx150x_chip *chip, unsigned offset)
> -{
> -	u8  reg = chip->dev_cfg->reg_data;
> -	u8  mask;
> -	u8  data;
> -	u8  shift;
> -	s32 err;
> -
> -	sx150x_find_cfg(offset, 1, &reg, &mask, &shift);
> -	err = sx150x_i2c_read(chip->client, reg, &data);
> -	if (err >= 0)
> -		err = (data & mask) != 0 ? 1 : 0;
> -
> -	return err;
> -}
> -
> -static void sx150x_set_oscio(struct sx150x_chip *chip, int val)
> -{
> -	sx150x_i2c_write(chip->client,
> -			chip->dev_cfg->pri.x789.reg_clock,
> -			(val ? 0x1f : 0x10));
> -}
> -
> -static void sx150x_set_io(struct sx150x_chip *chip, unsigned offset, int val)
> -{
> -	sx150x_write_cfg(chip,
> -			offset,
> -			1,
> -			chip->dev_cfg->reg_data,
> -			(val ? 1 : 0));
> -}
> -
> -static int sx150x_io_input(struct sx150x_chip *chip, unsigned offset)
> -{
> -	return sx150x_write_cfg(chip,
> -				offset,
> -				1,
> -				chip->dev_cfg->reg_dir,
> -				1);
> -}
> -
> -static int sx150x_io_output(struct sx150x_chip *chip, unsigned offset, int val)
> -{
> -	int err;
> -
> -	err = sx150x_write_cfg(chip,
> -			offset,
> -			1,
> -			chip->dev_cfg->reg_data,
> -			(val ? 1 : 0));
> -	if (err >= 0)
> -		err = sx150x_write_cfg(chip,
> -				offset,
> -				1,
> -				chip->dev_cfg->reg_dir,
> -				0);
> -	return err;
> -}
> -
> -static int sx150x_gpio_get(struct gpio_chip *gc, unsigned offset)
> -{
> -	struct sx150x_chip *chip = gpiochip_get_data(gc);
> -	int status = -EINVAL;
> -
> -	if (!offset_is_oscio(chip, offset)) {
> -		mutex_lock(&chip->lock);
> -		status = sx150x_get_io(chip, offset);
> -		mutex_unlock(&chip->lock);
> -	}
> -
> -	return (status < 0) ? status : !!status;
> -}
> -
> -static void sx150x_gpio_set(struct gpio_chip *gc, unsigned offset, int val)
> -{
> -	struct sx150x_chip *chip = gpiochip_get_data(gc);
> -
> -	mutex_lock(&chip->lock);
> -	if (offset_is_oscio(chip, offset))
> -		sx150x_set_oscio(chip, val);
> -	else
> -		sx150x_set_io(chip, offset, val);
> -	mutex_unlock(&chip->lock);
> -}
> -
> -static int sx150x_gpio_set_single_ended(struct gpio_chip *gc,
> -					unsigned offset,
> -                                        enum single_ended_mode mode)
> -{
> -	struct sx150x_chip *chip = gpiochip_get_data(gc);
> -
> -	/* On the SX160X 789 we can set open drain */
> -	if (chip->dev_cfg->model != SX150X_789)
> -		return -ENOTSUPP;
> -
> -	if (mode == LINE_MODE_PUSH_PULL)
> -		return sx150x_write_cfg(chip,
> -					offset,
> -					1,
> -					chip->dev_cfg->pri.x789.reg_drain,
> -					0);
> -
> -	if (mode == LINE_MODE_OPEN_DRAIN)
> -		return sx150x_write_cfg(chip,
> -					offset,
> -					1,
> -					chip->dev_cfg->pri.x789.reg_drain,
> -					1);
> -	return -ENOTSUPP;
> -}
> -
> -static int sx150x_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
> -{
> -	struct sx150x_chip *chip = gpiochip_get_data(gc);
> -	int status = -EINVAL;
> -
> -	if (!offset_is_oscio(chip, offset)) {
> -		mutex_lock(&chip->lock);
> -		status = sx150x_io_input(chip, offset);
> -		mutex_unlock(&chip->lock);
> -	}
> -	return status;
> -}
> -
> -static int sx150x_gpio_direction_output(struct gpio_chip *gc,
> -					unsigned offset,
> -					int val)
> -{
> -	struct sx150x_chip *chip = gpiochip_get_data(gc);
> -	int status = 0;
> -
> -	if (!offset_is_oscio(chip, offset)) {
> -		mutex_lock(&chip->lock);
> -		status = sx150x_io_output(chip, offset, val);
> -		mutex_unlock(&chip->lock);
> -	}
> -	return status;
> -}
> -
> -static void sx150x_irq_mask(struct irq_data *d)
> -{
> -	struct sx150x_chip *chip = gpiochip_get_data(irq_data_get_irq_chip_data(d));
> -	unsigned n = d->hwirq;
> -
> -	chip->irq_masked |= (1 << n);
> -	chip->irq_update = n;
> -}
> -
> -static void sx150x_irq_unmask(struct irq_data *d)
> -{
> -	struct sx150x_chip *chip = gpiochip_get_data(irq_data_get_irq_chip_data(d));
> -	unsigned n = d->hwirq;
> -
> -	chip->irq_masked &= ~(1 << n);
> -	chip->irq_update = n;
> -}
> -
> -static int sx150x_irq_set_type(struct irq_data *d, unsigned int flow_type)
> -{
> -	struct sx150x_chip *chip = gpiochip_get_data(irq_data_get_irq_chip_data(d));
> -	unsigned n, val = 0;
> -
> -	if (flow_type & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW))
> -		return -EINVAL;
> -
> -	n = d->hwirq;
> -
> -	if (flow_type & IRQ_TYPE_EDGE_RISING)
> -		val |= 0x1;
> -	if (flow_type & IRQ_TYPE_EDGE_FALLING)
> -		val |= 0x2;
> -
> -	chip->irq_sense &= ~(3UL << (n * 2));
> -	chip->irq_sense |= val << (n * 2);
> -	chip->irq_update = n;
> -	return 0;
> -}
> -
> -static irqreturn_t sx150x_irq_thread_fn(int irq, void *dev_id)
> -{
> -	struct sx150x_chip *chip = (struct sx150x_chip *)dev_id;
> -	unsigned nhandled = 0;
> -	unsigned sub_irq;
> -	unsigned n;
> -	s32 err;
> -	u8 val;
> -	int i;
> -
> -	for (i = (chip->dev_cfg->ngpios / 8) - 1; i >= 0; --i) {
> -		err = sx150x_i2c_read(chip->client,
> -				      chip->dev_cfg->reg_irq_src - i,
> -				      &val);
> -		if (err < 0)
> -			continue;
> -
> -		sx150x_i2c_write(chip->client,
> -				chip->dev_cfg->reg_irq_src - i,
> -				val);
> -		for (n = 0; n < 8; ++n) {
> -			if (val & (1 << n)) {
> -				sub_irq = irq_find_mapping(
> -					chip->gpio_chip.irqdomain,
> -					(i * 8) + n);
> -				handle_nested_irq(sub_irq);
> -				++nhandled;
> -			}
> -		}
> -	}
> -
> -	return (nhandled > 0 ? IRQ_HANDLED : IRQ_NONE);
> -}
> -
> -static void sx150x_irq_bus_lock(struct irq_data *d)
> -{
> -	struct sx150x_chip *chip = gpiochip_get_data(irq_data_get_irq_chip_data(d));
> -
> -	mutex_lock(&chip->lock);
> -}
> -
> -static void sx150x_irq_bus_sync_unlock(struct irq_data *d)
> -{
> -	struct sx150x_chip *chip = gpiochip_get_data(irq_data_get_irq_chip_data(d));
> -	unsigned n;
> -
> -	if (chip->irq_update == NO_UPDATE_PENDING)
> -		goto out;
> -
> -	n = chip->irq_update;
> -	chip->irq_update = NO_UPDATE_PENDING;
> -
> -	/* Avoid updates if nothing changed */
> -	if (chip->dev_sense == chip->irq_sense &&
> -	    chip->dev_masked == chip->irq_masked)
> -		goto out;
> -
> -	chip->dev_sense = chip->irq_sense;
> -	chip->dev_masked = chip->irq_masked;
> -
> -	if (chip->irq_masked & (1 << n)) {
> -		sx150x_write_cfg(chip, n, 1, chip->dev_cfg->reg_irq_mask, 1);
> -		sx150x_write_cfg(chip, n, 2, chip->dev_cfg->reg_sense, 0);
> -	} else {
> -		sx150x_write_cfg(chip, n, 1, chip->dev_cfg->reg_irq_mask, 0);
> -		sx150x_write_cfg(chip, n, 2, chip->dev_cfg->reg_sense,
> -				 chip->irq_sense >> (n * 2));
> -	}
> -out:
> -	mutex_unlock(&chip->lock);
> -}
> -
> -static void sx150x_init_chip(struct sx150x_chip *chip,
> -			struct i2c_client *client,
> -			kernel_ulong_t driver_data,
> -			struct sx150x_platform_data *pdata)
> -{
> -	mutex_init(&chip->lock);
> -
> -	chip->client                     = client;
> -	chip->dev_cfg                    = &sx150x_devices[driver_data];
> -	chip->gpio_chip.parent              = &client->dev;
> -	chip->gpio_chip.label            = client->name;
> -	chip->gpio_chip.direction_input  = sx150x_gpio_direction_input;
> -	chip->gpio_chip.direction_output = sx150x_gpio_direction_output;
> -	chip->gpio_chip.get              = sx150x_gpio_get;
> -	chip->gpio_chip.set              = sx150x_gpio_set;
> -	chip->gpio_chip.set_single_ended = sx150x_gpio_set_single_ended;
> -	chip->gpio_chip.base             = pdata->gpio_base;
> -	chip->gpio_chip.can_sleep        = true;
> -	chip->gpio_chip.ngpio            = chip->dev_cfg->ngpios;
> -#ifdef CONFIG_OF_GPIO
> -	chip->gpio_chip.of_node          = client->dev.of_node;
> -	chip->gpio_chip.of_gpio_n_cells  = 2;
> -#endif
> -	if (pdata->oscio_is_gpo)
> -		++chip->gpio_chip.ngpio;
> -
> -	chip->irq_chip.name                = client->name;
> -	chip->irq_chip.irq_mask            = sx150x_irq_mask;
> -	chip->irq_chip.irq_unmask          = sx150x_irq_unmask;
> -	chip->irq_chip.irq_set_type        = sx150x_irq_set_type;
> -	chip->irq_chip.irq_bus_lock        = sx150x_irq_bus_lock;
> -	chip->irq_chip.irq_bus_sync_unlock = sx150x_irq_bus_sync_unlock;
> -	chip->irq_summary                  = -1;
> -	chip->irq_base                     = -1;
> -	chip->irq_masked                   = ~0;
> -	chip->irq_sense                    = 0;
> -	chip->dev_masked                   = ~0;
> -	chip->dev_sense                    = 0;
> -	chip->irq_update		   = NO_UPDATE_PENDING;
> -}
> -
> -static int sx150x_init_io(struct sx150x_chip *chip, u8 base, u16 cfg)
> -{
> -	int err = 0;
> -	unsigned n;
> -
> -	for (n = 0; err >= 0 && n < (chip->dev_cfg->ngpios / 8); ++n)
> -		err = sx150x_i2c_write(chip->client, base - n, cfg >> (n * 8));
> -	return err;
> -}
> -
> -static int sx150x_reset(struct sx150x_chip *chip)
> -{
> -	int err;
> -
> -	err = i2c_smbus_write_byte_data(chip->client,
> -					chip->dev_cfg->pri.x789.reg_reset,
> -					0x12);
> -	if (err < 0)
> -		return err;
> -
> -	err = i2c_smbus_write_byte_data(chip->client,
> -					chip->dev_cfg->pri.x789.reg_reset,
> -					0x34);
> -	return err;
> -}
> -
> -static int sx150x_init_hw(struct sx150x_chip *chip,
> -			struct sx150x_platform_data *pdata)
> -{
> -	int err = 0;
> -
> -	if (pdata->reset_during_probe) {
> -		err = sx150x_reset(chip);
> -		if (err < 0)
> -			return err;
> -	}
> -
> -	if (chip->dev_cfg->model == SX150X_789)
> -		err = sx150x_i2c_write(chip->client,
> -				chip->dev_cfg->pri.x789.reg_misc,
> -				0x01);
> -	else if (chip->dev_cfg->model == SX150X_456)
> -		err = sx150x_i2c_write(chip->client,
> -				chip->dev_cfg->pri.x456.reg_advance,
> -				0x04);
> -	else
> -		err = sx150x_i2c_write(chip->client,
> -				chip->dev_cfg->pri.x123.reg_advance,
> -				0x00);
> -	if (err < 0)
> -		return err;
> -
> -	err = sx150x_init_io(chip, chip->dev_cfg->reg_pullup,
> -			pdata->io_pullup_ena);
> -	if (err < 0)
> -		return err;
> -
> -	err = sx150x_init_io(chip, chip->dev_cfg->reg_pulldn,
> -			pdata->io_pulldn_ena);
> -	if (err < 0)
> -		return err;
> -
> -	if (chip->dev_cfg->model == SX150X_789) {
> -		err = sx150x_init_io(chip,
> -				chip->dev_cfg->pri.x789.reg_polarity,
> -				pdata->io_polarity);
> -		if (err < 0)
> -			return err;
> -	} else if (chip->dev_cfg->model == SX150X_456) {
> -		/* Set all pins to work in normal mode */
> -		err = sx150x_init_io(chip,
> -				chip->dev_cfg->pri.x456.reg_pld_mode,
> -				0);
> -		if (err < 0)
> -			return err;
> -	} else {
> -		/* Set all pins to work in normal mode */
> -		err = sx150x_init_io(chip,
> -				chip->dev_cfg->pri.x123.reg_pld_mode,
> -				0);
> -		if (err < 0)
> -			return err;
> -	}
> -
> -
> -	if (pdata->oscio_is_gpo)
> -		sx150x_set_oscio(chip, 0);
> -
> -	return err;
> -}
> -
> -static int sx150x_install_irq_chip(struct sx150x_chip *chip,
> -				int irq_summary,
> -				int irq_base)
> -{
> -	int err;
> -
> -	chip->irq_summary = irq_summary;
> -	chip->irq_base    = irq_base;
> -
> -	/* Add gpio chip to irq subsystem */
> -	err = gpiochip_irqchip_add(&chip->gpio_chip,
> -		&chip->irq_chip, chip->irq_base,
> -		handle_edge_irq, IRQ_TYPE_EDGE_BOTH);
> -	if (err) {
> -		dev_err(&chip->client->dev,
> -			"could not connect irqchip to gpiochip\n");
> -		return  err;
> -	}
> -
> -	err = devm_request_threaded_irq(&chip->client->dev,
> -			irq_summary, NULL, sx150x_irq_thread_fn,
> -			IRQF_ONESHOT | IRQF_SHARED | IRQF_TRIGGER_FALLING,
> -			chip->irq_chip.name, chip);
> -	if (err < 0) {
> -		chip->irq_summary = -1;
> -		chip->irq_base    = -1;
> -	}
> -
> -	return err;
> -}
> -
> -static int sx150x_probe(struct i2c_client *client,
> -				const struct i2c_device_id *id)
> -{
> -	static const u32 i2c_funcs = I2C_FUNC_SMBUS_BYTE_DATA |
> -				     I2C_FUNC_SMBUS_WRITE_WORD_DATA;
> -	struct sx150x_platform_data *pdata;
> -	struct sx150x_chip *chip;
> -	int rc;
> -
> -	pdata = dev_get_platdata(&client->dev);
> -	if (!pdata)
> -		return -EINVAL;
> -
> -	if (!i2c_check_functionality(client->adapter, i2c_funcs))
> -		return -ENOSYS;
> -
> -	chip = devm_kzalloc(&client->dev,
> -		sizeof(struct sx150x_chip), GFP_KERNEL);
> -	if (!chip)
> -		return -ENOMEM;
> -
> -	sx150x_init_chip(chip, client, id->driver_data, pdata);
> -	rc = sx150x_init_hw(chip, pdata);
> -	if (rc < 0)
> -		return rc;
> -
> -	rc = devm_gpiochip_add_data(&client->dev, &chip->gpio_chip, chip);
> -	if (rc)
> -		return rc;
> -
> -	if (pdata->irq_summary >= 0) {
> -		rc = sx150x_install_irq_chip(chip,
> -					pdata->irq_summary,
> -					pdata->irq_base);
> -		if (rc < 0)
> -			return rc;
> -	}
> -
> -	i2c_set_clientdata(client, chip);
> -
> -	return 0;
> -}
> -
> -static struct i2c_driver sx150x_driver = {
> -	.driver = {
> -		.name = "sx150x",
> -		.of_match_table = of_match_ptr(sx150x_of_match),
> -	},
> -	.probe    = sx150x_probe,
> -	.id_table = sx150x_id,
> -};
> -
> -static int __init sx150x_init(void)
> -{
> -	return i2c_add_driver(&sx150x_driver);
> -}
> -subsys_initcall(sx150x_init);
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index b3fe1d3..c80ba35 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -164,6 +164,20 @@ config PINCTRL_SIRF
>  	select GENERIC_PINCONF
>  	select GPIOLIB_IRQCHIP
>  
> +config PINCTRL_SX150X
> +	bool "Semtech SX150x I2C GPIO expander pinctrl driver"
> +	depends on GPIOLIB && I2C=y
> +	select PINMUX
> +	select PINCONF
> +	select GENERIC_PINCONF
> +	select GPIOLIB_IRQCHIP
> +	help
> +	  Say yes here to provide support for Semtech SX150-series I2C

Again, SX150x-series ???

> +	  GPIO expanders as pinctrl module.
> +	  Compatible models include:
> +	  - 8 bits:  sx1508q, sx1502q
> +	  - 16 bits: sx1509q, sx1506q
> +
>  config PINCTRL_PISTACHIO
>  	def_bool y if MACH_PISTACHIO
>  	depends on GPIOLIB
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index 8ebd7b8..f7e748d 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -25,6 +25,7 @@ obj-$(CONFIG_PINCTRL_PISTACHIO)	+= pinctrl-pistachio.o
>  obj-$(CONFIG_PINCTRL_ROCKCHIP)	+= pinctrl-rockchip.o
>  obj-$(CONFIG_PINCTRL_SINGLE)	+= pinctrl-single.o
>  obj-$(CONFIG_PINCTRL_SIRF)	+= sirf/
> +obj-$(CONFIG_PINCTRL_SX150X)	+= pinctrl-sx150x.o
>  obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
>  obj-$(CONFIG_PINCTRL_TZ1090)	+= pinctrl-tz1090.o
>  obj-$(CONFIG_PINCTRL_TZ1090_PDC)	+= pinctrl-tz1090-pdc.o
> diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
> new file mode 100644
> index 0000000..1be899c
> --- /dev/null
> +++ b/drivers/pinctrl/pinctrl-sx150x.c
> @@ -0,0 +1,1060 @@
> +/*
> + * Copyright (c) 2010, BayLibre, SAS. All rights reserved.

Did you really do this conversion 6 years ago? :-)

> + * Author: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> + *
> + * Copyright (c) 2010, Code Aurora Forum. All rights reserved.
> + *
> + * Driver for Semtech SX150X I2C GPIO Expanders
> + *
> + * Author: Gregory Bean <gbean-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 and
> + * only version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +#include <linux/of.h>
> +#include <linux/gpio.h>
> +#include <linux/pinctrl/machine.h>
> +#include <linux/pinctrl/pinconf.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +#include <linux/pinctrl/pinconf-generic.h>
> +
> +#include "core.h"
> +#include "pinconf.h"
> +#include "pinctrl-utils.h"
> +
> +/* The chip models of sx150x */
> +enum {
> +	SX150X_123 = 0,
> +	SX150X_456,
> +	SX150X_789,
> +};
> +
> +struct sx150x_123_pri {
> +	u8 reg_pld_mode;
> +	u8 reg_pld_table0;
> +	u8 reg_pld_table1;
> +	u8 reg_pld_table2;
> +	u8 reg_pld_table3;
> +	u8 reg_pld_table4;
> +	u8 reg_advance;
> +};
> +
> +struct sx150x_456_pri {
> +	u8 reg_pld_mode;
> +	u8 reg_pld_table0;
> +	u8 reg_pld_table1;
> +	u8 reg_pld_table2;
> +	u8 reg_pld_table3;
> +	u8 reg_pld_table4;
> +	u8 reg_advance;
> +};
> +
> +struct sx150x_789_pri {
> +	u8 reg_drain;
> +	u8 reg_polarity;
> +	u8 reg_clock;
> +	u8 reg_misc;
> +	u8 reg_reset;
> +	u8 ngpios;
> +};
> +
> +struct sx150x_device_data {
> +	u8 model;
> +	u8 reg_pullup;
> +	u8 reg_pulldn;
> +	u8 reg_dir;
> +	u8 reg_data;
> +	u8 reg_irq_mask;
> +	u8 reg_irq_src;
> +	u8 reg_sense;
> +	u8 ngpios;
> +	union {
> +		struct sx150x_123_pri x123;
> +		struct sx150x_456_pri x456;
> +		struct sx150x_789_pri x789;
> +	} pri;
> +	const struct pinctrl_pin_desc *pins;
> +	unsigned int npins;
> +};
> +
> +struct sx150x_pinctrl {
> +	struct device *dev;
> +	struct i2c_client *client;
> +	struct pinctrl_dev *pctldev;
> +	struct pinctrl_desc pinctrl_desc;
> +	struct gpio_chip gpio;
> +	struct irq_chip irq_chip;
> +	struct {
> +		int update;
> +		u32 sense;
> +		u32 masked;
> +		u32 dev_sense;
> +		u32 dev_masked;
> +	} irq;
> +	struct mutex lock;
> +	const struct sx150x_device_data *data;
> +};
> +
> +static const struct pinctrl_pin_desc sx150x_8_pins[] = {
> +	PINCTRL_PIN(0, "gpio0"),
> +	PINCTRL_PIN(1, "gpio1"),
> +	PINCTRL_PIN(2, "gpio2"),
> +	PINCTRL_PIN(3, "gpio3"),
> +	PINCTRL_PIN(4, "gpio4"),
> +	PINCTRL_PIN(5, "gpio5"),
> +	PINCTRL_PIN(6, "gpio6"),
> +	PINCTRL_PIN(7, "gpio7"),
> +	PINCTRL_PIN(8, "oscio"),
> +};
> +
> +static const struct pinctrl_pin_desc sx150x_16_pins[] = {
> +	PINCTRL_PIN(0, "gpio0"),
> +	PINCTRL_PIN(1, "gpio1"),
> +	PINCTRL_PIN(2, "gpio2"),
> +	PINCTRL_PIN(3, "gpio3"),
> +	PINCTRL_PIN(4, "gpio4"),
> +	PINCTRL_PIN(5, "gpio5"),
> +	PINCTRL_PIN(6, "gpio6"),
> +	PINCTRL_PIN(7, "gpio7"),
> +	PINCTRL_PIN(8, "gpio8"),
> +	PINCTRL_PIN(9, "gpio9"),
> +	PINCTRL_PIN(10, "gpio10"),
> +	PINCTRL_PIN(11, "gpio11"),
> +	PINCTRL_PIN(12, "gpio12"),
> +	PINCTRL_PIN(13, "gpio13"),
> +	PINCTRL_PIN(14, "gpio14"),
> +	PINCTRL_PIN(15, "gpio15"),
> +	PINCTRL_PIN(16, "oscio"),
> +};
> +
> +static const struct sx150x_device_data sx1508q_device_data = {
> +	.model = SX150X_789,
> +	.reg_pullup	= 0x03,
> +	.reg_pulldn	= 0x04,
> +	.reg_dir	= 0x07,
> +	.reg_data	= 0x08,
> +	.reg_irq_mask	= 0x09,
> +	.reg_irq_src	= 0x0c,
> +	.reg_sense	= 0x0b,
> +	.pri.x789 = {
> +		.reg_drain	= 0x05,
> +		.reg_polarity	= 0x06,
> +		.reg_clock	= 0x0f,
> +		.reg_misc	= 0x10,
> +		.reg_reset	= 0x7d,
> +	},
> +	.ngpios = 8,
> +	.pins = sx150x_8_pins,
> +	.npins = ARRAY_SIZE(sx150x_8_pins),
> +};
> +
> +static const struct sx150x_device_data sx1509q_device_data = {
> +	.model = SX150X_789,
> +	.reg_pullup	= 0x07,
> +	.reg_pulldn	= 0x09,
> +	.reg_dir	= 0x0f,
> +	.reg_data	= 0x11,
> +	.reg_irq_mask	= 0x13,
> +	.reg_irq_src	= 0x19,
> +	.reg_sense	= 0x17,
> +	.pri.x789 = {
> +		.reg_drain	= 0x0b,
> +		.reg_polarity	= 0x0d,
> +		.reg_clock	= 0x1e,
> +		.reg_misc	= 0x1f,
> +		.reg_reset	= 0x7d,
> +	},
> +	.ngpios	= 16,
> +	.pins = sx150x_16_pins,
> +	.npins = ARRAY_SIZE(sx150x_16_pins),
> +};
> +
> +static const struct sx150x_device_data sx1506q_device_data = {
> +	.model = SX150X_456,
> +	.reg_pullup	= 0x05,
> +	.reg_pulldn	= 0x07,
> +	.reg_dir	= 0x03,
> +	.reg_data	= 0x01,
> +	.reg_irq_mask	= 0x09,
> +	.reg_irq_src	= 0x0f,
> +	.reg_sense	= 0x0d,
> +	.pri.x456 = {
> +		.reg_pld_mode	= 0x21,
> +		.reg_pld_table0	= 0x23,
> +		.reg_pld_table1	= 0x25,
> +		.reg_pld_table2	= 0x27,
> +		.reg_pld_table3	= 0x29,
> +		.reg_pld_table4	= 0x2b,
> +		.reg_advance	= 0xad,
> +	},
> +	.ngpios	= 16,
> +	.pins = sx150x_16_pins,
> +	.npins = ARRAY_SIZE(sx150x_16_pins),

I don't think the oscio pin is available here...

> +};
> +
> +static const struct sx150x_device_data sx1502q_device_data = {
> +	.model = SX150X_123,
> +	.reg_pullup	= 0x02,
> +	.reg_pulldn	= 0x03,
> +	.reg_dir	= 0x01,
> +	.reg_data	= 0x00,
> +	.reg_irq_mask	= 0x05,
> +	.reg_irq_src	= 0x08,
> +	.reg_sense	= 0x07,
> +	.pri.x123 = {
> +		.reg_pld_mode	= 0x10,
> +		.reg_pld_table0	= 0x11,
> +		.reg_pld_table1	= 0x12,
> +		.reg_pld_table2	= 0x13,
> +		.reg_pld_table3	= 0x14,
> +		.reg_pld_table4	= 0x15,
> +		.reg_advance	= 0xad,
> +	},
> +	.ngpios	= 8,
> +	.pins = sx150x_8_pins,
> +	.npins = ARRAY_SIZE(sx150x_8_pins),

...or here, which causes a problem because the pins are named gpio503
etc when exporting in sysfs, instead of being based at gpio504 as they
were with the old gpio-only driver. I simply subtracted 1 from the
npins assignment for sx1502, but I think there should be separate
sx150x_8_pins_osc and sx150x_16_pins_osc arrays. Or sx150x_9_pins and
sx150x_17_pins. Or something.

> +};
> +
> +static s32 sx150x_i2c_write(struct i2c_client *client, u8 reg, u8 val)
> +{
> +	s32 err = i2c_smbus_write_byte_data(client, reg, val);
> +
> +	if (err < 0)
> +		dev_warn(&client->dev,
> +			"i2c write fail: can't write %02x to %02x: %d\n",
> +			val, reg, err);
> +	return err;
> +}
> +
> +static s32 sx150x_i2c_read(struct i2c_client *client, u8 reg, u8 *val)
> +{
> +	s32 err = i2c_smbus_read_byte_data(client, reg);
> +
> +	if (err >= 0)
> +		*val = err;
> +	else
> +		dev_warn(&client->dev,
> +			"i2c read fail: can't read from %02x: %d\n",
> +			reg, err);
> +	return err;
> +}
> +
> +/*
> + * These utility functions solve the common problem of locating and setting
> + * configuration bits.  Configuration bits are grouped into registers
> + * whose indexes increase downwards.  For example, with eight-bit registers,
> + * sixteen gpios would have their config bits grouped in the following order:
> + * REGISTER N-1 [ f e d c b a 9 8 ]
> + *          N   [ 7 6 5 4 3 2 1 0 ]
> + *
> + * For multi-bit configurations, the pattern gets wider:
> + * REGISTER N-3 [ f f e e d d c c ]
> + *          N-2 [ b b a a 9 9 8 8 ]
> + *          N-1 [ 7 7 6 6 5 5 4 4 ]
> + *          N   [ 3 3 2 2 1 1 0 0 ]
> + *
> + * Given the address of the starting register 'N', the index of the gpio
> + * whose configuration we seek to change, and the width in bits of that
> + * configuration, these functions allow us to locate the correct
> + * register and mask the correct bits.
> + */
> +static inline void sx150x_find_cfg(u8 offset, u8 width,
> +				   u8 *reg, u8 *mask, u8 *shift)
> +{
> +	*reg   -= offset * width / 8;
> +	*mask   = (1 << width) - 1;
> +	*shift  = (offset * width) % 8;
> +	*mask <<= *shift;
> +}
> +
> +static int sx150x_write_cfg(struct i2c_client *client,
> +			    u8 offset, u8 width, u8 reg, u8 val)
> +{
> +	u8  mask;
> +	u8  data;
> +	u8  shift;
> +	int err;
> +
> +	sx150x_find_cfg(offset, width, &reg, &mask, &shift);
> +	err = sx150x_i2c_read(client, reg, &data);
> +	if (err < 0)
> +		return err;
> +
> +	data &= ~mask;
> +	data |= (val << shift) & mask;
> +	return sx150x_i2c_write(client, reg, data);
> +}
> +
> +static int sx150x_read_cfg(struct i2c_client *client,
> +			   u8 offset, u8 width, u8 reg)
> +{
> +	u8  mask;
> +	u8  data;
> +	u8  shift;
> +	int err;
> +
> +	sx150x_find_cfg(offset, width, &reg, &mask, &shift);
> +	err = sx150x_i2c_read(client, reg, &data);
> +	if (err < 0)
> +		return err;
> +
> +	return (data & mask);
> +}
> +
> +static int sx150x_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
> +{
> +	return 0;
> +}
> +
> +static const char *sx150x_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
> +						unsigned int group)
> +{
> +	return NULL;
> +}
> +
> +static int sx150x_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
> +					unsigned int group,
> +					const unsigned int **pins,
> +					unsigned int *num_pins)
> +{
> +	return -ENOTSUPP;
> +}
> +
> +static const struct pinctrl_ops sx150x_pinctrl_ops = {
> +	.get_groups_count = sx150x_pinctrl_get_groups_count,
> +	.get_group_name = sx150x_pinctrl_get_group_name,
> +	.get_group_pins = sx150x_pinctrl_get_group_pins,
> +#ifdef CONFIG_OF
> +	.dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
> +	.dt_free_map = pinctrl_utils_free_map,
> +#endif
> +};
> +
> +static bool sx150x_pin_is_oscio(struct sx150x_pinctrl *pctl, unsigned int pin)
> +{
> +	if (pin >= pctl->data->npins)
> +		return false;
> +
> +	return !strcmp(pctl->data->pins[pin].name, "oscio");
> +}
> +
> +static int sx150x_gpio_get_direction(struct gpio_chip *chip,
> +				      unsigned int offset)
> +{
> +	struct sx150x_pinctrl *pctl = gpiochip_get_data(chip);
> +	int status;
> +
> +	if (sx150x_pin_is_oscio(pctl, offset))
> +		return false;
> +
> +	status = sx150x_read_cfg(pctl->client, offset, 1, pctl->data->reg_dir);
> +	if (status >= 0)
> +		status = !!status;
> +
> +	return status;
> +}
> +
> +static int sx150x_gpio_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +	struct sx150x_pinctrl *pctl = gpiochip_get_data(chip);
> +	int status;
> +
> +	if (sx150x_pin_is_oscio(pctl, offset))
> +		return -EINVAL;
> +
> +	status = sx150x_read_cfg(pctl->client, offset, 1, pctl->data->reg_data);
> +	if (status >= 0)
> +		status = !!status;
> +
> +	return status;
> +}
> +
> +static int sx150x_gpio_set_single_ended(struct gpio_chip *chip,
> +					unsigned int offset,
> +					enum single_ended_mode mode)
> +{
> +	struct sx150x_pinctrl *pctl = gpiochip_get_data(chip);
> +	int ret;
> +
> +	switch (mode) {
> +	case LINE_MODE_PUSH_PULL:
> +		if (pctl->data->model != SX150X_789 ||
> +		    sx150x_pin_is_oscio(pctl, offset))
> +			return 0;
> +
> +		mutex_lock(&pctl->lock);
> +		ret = sx150x_write_cfg(pctl->client, offset, 1,
> +				       pctl->data->pri.x789.reg_drain,
> +				       0);
> +		mutex_unlock(&pctl->lock);
> +		if (ret < 0)
> +			return ret;
> +		break;
> +
> +	case LINE_MODE_OPEN_DRAIN:
> +		if (pctl->data->model != SX150X_789 ||
> +		    sx150x_pin_is_oscio(pctl, offset))
> +			return -ENOTSUPP;
> +
> +		mutex_lock(&pctl->lock);
> +		ret = sx150x_write_cfg(pctl->client, offset, 1,
> +				       pctl->data->pri.x789.reg_drain,
> +				       1);
> +		mutex_unlock(&pctl->lock);
> +		if (ret < 0)
> +			return ret;
> +		break;
> +
> +	default:
> +		return -ENOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static void sx150x_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +			       int value)
> +{
> +	struct sx150x_pinctrl *pctl = gpiochip_get_data(chip);
> +
> +	if (sx150x_pin_is_oscio(pctl, offset)) {
> +
> +		mutex_lock(&pctl->lock);
> +		sx150x_i2c_write(pctl->client,
> +				       pctl->data->pri.x789.reg_clock,
> +				       (value ? 0x1f : 0x10));
> +		mutex_unlock(&pctl->lock);
> +	} else {
> +		mutex_lock(&pctl->lock);
> +		sx150x_write_cfg(pctl->client, offset, 1,
> +				       pctl->data->reg_data,
> +				       (value ? 1 : 0));
> +		mutex_unlock(&pctl->lock);
> +	}
> +}
> +
> +static int sx150x_gpio_direction_input(struct gpio_chip *chip,
> +				      unsigned int offset)
> +{
> +	struct sx150x_pinctrl *pctl = gpiochip_get_data(chip);
> +	int ret;
> +
> +	if (sx150x_pin_is_oscio(pctl, offset))
> +		return -EINVAL;
> +
> +	mutex_lock(&pctl->lock);
> +	ret = sx150x_write_cfg(pctl->client, offset, 1,
> +				pctl->data->reg_dir, 1);
> +	mutex_unlock(&pctl->lock);
> +
> +	return ret;
> +}
> +
> +static int sx150x_gpio_direction_output(struct gpio_chip *chip,
> +				       unsigned int offset, int value)
> +{
> +	struct sx150x_pinctrl *pctl = gpiochip_get_data(chip);
> +	int status;
> +
> +	if (sx150x_pin_is_oscio(pctl, offset)) {
> +		sx150x_gpio_set(chip, offset, value);
> +		return 0;
> +	}
> +
> +	mutex_lock(&pctl->lock);
> +	status = sx150x_write_cfg(pctl->client, offset, 1,
> +				  pctl->data->reg_data,
> +				  (value ? 1 : 0));
> +	if (status >= 0)
> +		status = sx150x_write_cfg(pctl->client, offset, 1,
> +					  pctl->data->reg_dir, 0);
> +	mutex_unlock(&pctl->lock);
> +
> +	return status;
> +}
> +
> +static void sx150x_irq_mask(struct irq_data *d)
> +{
> +	struct sx150x_pinctrl *pctl =
> +			gpiochip_get_data(irq_data_get_irq_chip_data(d));
> +	unsigned int n = d->hwirq;
> +
> +	pctl->irq.masked |= (1 << n);
> +	pctl->irq.update = n;
> +}
> +
> +static void sx150x_irq_unmask(struct irq_data *d)
> +{
> +	struct sx150x_pinctrl *pctl =
> +			gpiochip_get_data(irq_data_get_irq_chip_data(d));
> +	unsigned int n = d->hwirq;
> +
> +	pctl->irq.masked &= ~(1 << n);
> +	pctl->irq.update = n;
> +}
> +
> +static int sx150x_irq_set_type(struct irq_data *d, unsigned int flow_type)
> +{
> +	struct sx150x_pinctrl *pctl =
> +			gpiochip_get_data(irq_data_get_irq_chip_data(d));
> +	unsigned int n, val = 0;
> +
> +	if (flow_type & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW))
> +		return -EINVAL;
> +
> +	n = d->hwirq;
> +
> +	if (flow_type & IRQ_TYPE_EDGE_RISING)
> +		val |= 0x1;
> +	if (flow_type & IRQ_TYPE_EDGE_FALLING)
> +		val |= 0x2;
> +
> +	pctl->irq.sense &= ~(3UL << (n * 2));
> +	pctl->irq.sense |= val << (n * 2);
> +	pctl->irq.update = n;
> +	return 0;
> +}
> +
> +static irqreturn_t sx150x_irq_thread_fn(int irq, void *dev_id)
> +{
> +	struct sx150x_pinctrl *pctl = (struct sx150x_pinctrl *)dev_id;
> +	unsigned int nhandled = 0;
> +	unsigned int sub_irq;
> +	unsigned int n;
> +	s32 err;
> +	u8 val;
> +	int i;
> +
> +	for (i = (pctl->data->ngpios / 8) - 1; i >= 0; --i) {
> +		err = sx150x_i2c_read(pctl->client,
> +				      pctl->data->reg_irq_src - i,
> +				      &val);
> +		if (err < 0)
> +			continue;
> +
> +		err = sx150x_i2c_write(pctl->client,
> +				       pctl->data->reg_irq_src - i,
> +				       val);
> +		if (err < 0)
> +			continue;
> +
> +		for (n = 0; n < 8; ++n) {
> +			if (val & (1 << n)) {
> +				sub_irq = irq_find_mapping(
> +						pctl->gpio.irqdomain,
> +						(i * 8) + n);
> +				handle_nested_irq(sub_irq);
> +				++nhandled;
> +			}
> +		}
> +	}
> +
> +	return (nhandled > 0 ? IRQ_HANDLED : IRQ_NONE);
> +}
> +
> +static void sx150x_irq_bus_lock(struct irq_data *d)
> +{
> +	struct sx150x_pinctrl *pctl =
> +			gpiochip_get_data(irq_data_get_irq_chip_data(d));
> +
> +	mutex_lock(&pctl->lock);
> +}
> +
> +static void sx150x_irq_bus_sync_unlock(struct irq_data *d)
> +{
> +	struct sx150x_pinctrl *pctl =
> +			gpiochip_get_data(irq_data_get_irq_chip_data(d));
> +	unsigned int n;
> +
> +	if (pctl->irq.update < 0)
> +		goto out;
> +
> +	n = pctl->irq.update;
> +	pctl->irq.update = -1;
> +
> +	/* Avoid updates if nothing changed */
> +	if (pctl->irq.dev_sense == pctl->irq.sense &&
> +	    pctl->irq.dev_masked == pctl->irq.masked)
> +		goto out;
> +
> +	pctl->irq.dev_sense = pctl->irq.sense;
> +	pctl->irq.dev_masked = pctl->irq.masked;
> +
> +	if (pctl->irq.masked & (1 << n)) {
> +		sx150x_write_cfg(pctl->client, n, 1,
> +				 pctl->data->reg_irq_mask, 1);
> +		sx150x_write_cfg(pctl->client, n, 2,
> +				 pctl->data->reg_sense, 0);
> +	} else {
> +		sx150x_write_cfg(pctl->client, n, 1,
> +				 pctl->data->reg_irq_mask, 0);
> +		sx150x_write_cfg(pctl->client, n, 2,
> +				 pctl->data->reg_sense,
> +				 pctl->irq.sense >> (n * 2));
> +	}
> +out:
> +	mutex_unlock(&pctl->lock);
> +}
> +
> +static int sx150x_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
> +			      unsigned long *config)
> +{
> +	struct sx150x_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
> +	unsigned int param = pinconf_to_config_param(*config);
> +	int ret;
> +	u32 arg;
> +
> +	if (sx150x_pin_is_oscio(pctl, pin)) {
> +		u8 data;
> +
> +		switch (param) {
> +		case PIN_CONFIG_DRIVE_PUSH_PULL:
> +		case PIN_CONFIG_OUTPUT:
> +			mutex_lock(&pctl->lock);
> +			ret = sx150x_i2c_read(pctl->client,
> +					pctl->data->pri.x789.reg_clock,
> +					&data);
> +			mutex_unlock(&pctl->lock);
> +
> +			if (ret < 0)
> +				return ret;
> +
> +			if (param == PIN_CONFIG_DRIVE_PUSH_PULL)
> +				arg = (data & 0x1f) ? 1 : 0;
> +			else {
> +				if ((data & 0x1f) == 0x1f)
> +					arg = 1;
> +				else if ((data & 0x1f) == 0x10)
> +					arg = 0;
> +				else
> +					return -EINVAL;
> +			}
> +
> +			break;
> +		default:
> +			return -ENOTSUPP;
> +		}
> +
> +		goto out;
> +	}
> +
> +	switch (param) {
> +	case PIN_CONFIG_BIAS_PULL_DOWN:
> +		mutex_lock(&pctl->lock);
> +		ret = sx150x_read_cfg(pctl->client, pin, 1,
> +				      pctl->data->reg_pulldn);
> +		mutex_unlock(&pctl->lock);
> +
> +		if (ret < 0)
> +			return ret;
> +
> +		if (!ret)
> +			return -EINVAL;
> +
> +		arg = 1;
> +		break;
> +
> +	case PIN_CONFIG_BIAS_PULL_UP:
> +		mutex_lock(&pctl->lock);
> +		ret = sx150x_read_cfg(pctl->client, pin, 1,
> +				      pctl->data->reg_pullup);
> +		mutex_unlock(&pctl->lock);
> +
> +		if (ret < 0)
> +			return ret;
> +
> +		if (!ret)
> +			return -EINVAL;
> +
> +		arg = 1;
> +		break;
> +
> +	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> +		if (pctl->data->model != SX150X_789)
> +			return -ENOTSUPP;
> +
> +		mutex_lock(&pctl->lock);
> +		ret = sx150x_read_cfg(pctl->client, pin, 1,
> +				      pctl->data->pri.x789.reg_drain);
> +		mutex_unlock(&pctl->lock);
> +
> +		if (ret < 0)
> +			return ret;
> +
> +		if (!ret)
> +			return -EINVAL;
> +
> +		arg = 1;
> +		break;
> +
> +	case PIN_CONFIG_DRIVE_PUSH_PULL:
> +		if (pctl->data->model != SX150X_789)
> +			arg = true;
> +		else {
> +			mutex_lock(&pctl->lock);
> +			ret = sx150x_read_cfg(pctl->client, pin, 1,
> +					      pctl->data->pri.x789.reg_drain);
> +			mutex_unlock(&pctl->lock);
> +
> +			if (ret < 0)
> +				return ret;
> +
> +			if (ret)
> +				return -EINVAL;
> +
> +			arg = 1;
> +		}
> +		break;
> +
> +	case PIN_CONFIG_OUTPUT:
> +		ret = sx150x_gpio_get_direction(&pctl->gpio, pin);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (ret)
> +			return -EINVAL;
> +
> +		ret = sx150x_gpio_get(&pctl->gpio, pin);
> +		if (ret < 0)
> +			return ret;
> +
> +		arg = ret;
> +		break;
> +
> +	default:
> +		return -ENOTSUPP;
> +	}
> +
> +out:
> +	*config = pinconf_to_config_packed(param, arg);
> +
> +	return 0;
> +}
> +
> +static int sx150x_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
> +			      unsigned long *configs, unsigned int num_configs)
> +{
> +	struct sx150x_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
> +	enum pin_config_param param;
> +	u32 arg;
> +	int i;
> +	int ret;
> +
> +	for (i = 0; i < num_configs; i++) {
> +		param = pinconf_to_config_param(configs[i]);
> +		arg = pinconf_to_config_argument(configs[i]);
> +
> +		if (sx150x_pin_is_oscio(pctl, pin)) {
> +			if (param == PIN_CONFIG_OUTPUT) {
> +				ret = sx150x_gpio_direction_output(&pctl->gpio,
> +								   pin, arg);
> +				if (ret < 0)
> +					return ret;
> +
> +				continue;
> +			} else
> +				return -ENOTSUPP;
> +		}
> +
> +		switch (param) {
> +		case PIN_CONFIG_BIAS_PULL_PIN_DEFAULT:
> +		case PIN_CONFIG_BIAS_DISABLE:
> +			mutex_lock(&pctl->lock);
> +			ret = sx150x_write_cfg(pctl->client, pin, 1,
> +					       pctl->data->reg_pulldn, 0);
> +			mutex_unlock(&pctl->lock);
> +			if (ret < 0)
> +				return ret;
> +
> +			mutex_lock(&pctl->lock);
> +			ret = sx150x_write_cfg(pctl->client, pin, 1,
> +					       pctl->data->reg_pullup, 0);
> +			mutex_unlock(&pctl->lock);
> +			if (ret < 0)
> +				return ret;
> +
> +			break;
> +
> +		case PIN_CONFIG_BIAS_PULL_UP:
> +			mutex_lock(&pctl->lock);
> +			ret = sx150x_write_cfg(pctl->client, pin, 1,
> +					       pctl->data->reg_pullup,
> +					       1);
> +			mutex_unlock(&pctl->lock);
> +			if (ret < 0)
> +				return ret;
> +
> +			break;
> +
> +		case PIN_CONFIG_BIAS_PULL_DOWN:
> +			mutex_lock(&pctl->lock);
> +			ret = sx150x_write_cfg(pctl->client, pin, 1,
> +					       pctl->data->reg_pulldn,
> +					       1);
> +			mutex_unlock(&pctl->lock);
> +			if (ret < 0)
> +				return ret;
> +
> +			break;
> +
> +		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> +			ret = sx150x_gpio_set_single_ended(&pctl->gpio,
> +						pin, LINE_MODE_OPEN_DRAIN);
> +			if (ret < 0)
> +				return ret;
> +
> +			break;
> +
> +		case PIN_CONFIG_DRIVE_PUSH_PULL:
> +			ret = sx150x_gpio_set_single_ended(&pctl->gpio,
> +						pin, LINE_MODE_PUSH_PULL);
> +			if (ret < 0)
> +				return ret;
> +
> +			break;
> +
> +		case PIN_CONFIG_OUTPUT:
> +			ret = sx150x_gpio_direction_output(&pctl->gpio,
> +							   pin, arg);
> +			if (ret < 0)
> +				return ret;
> +
> +			break;
> +
> +		default:
> +			return -ENOTSUPP;
> +		}
> +	} /* for each config */
> +
> +	return 0;
> +}
> +
> +static const struct pinconf_ops sx150x_pinconf_ops = {
> +	.pin_config_get = sx150x_pinconf_get,
> +	.pin_config_set = sx150x_pinconf_set,
> +	.is_generic = true,
> +};
> +
> +static const struct i2c_device_id sx150x_id[] = {
> +	{"sx1508q", (kernel_ulong_t) &sx1508q_device_data },
> +	{"sx1509q", (kernel_ulong_t) &sx1509q_device_data },
> +	{"sx1506q", (kernel_ulong_t) &sx1506q_device_data },
> +	{"sx1502q", (kernel_ulong_t) &sx1502q_device_data },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, sx150x_id);
> +
> +static const struct of_device_id sx150x_of_match[] = {
> +	{ .compatible = "semtech,sx1508q" },
> +	{ .compatible = "semtech,sx1509q" },
> +	{ .compatible = "semtech,sx1506q" },
> +	{ .compatible = "semtech,sx1502q" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, sx150x_of_match);
> +
> +
> +static int sx150x_init_io(struct sx150x_pinctrl *pctl, u8 base, u16 cfg)
> +{
> +	int err = 0;
> +	unsigned int n;
> +
> +	for (n = 0; err >= 0 && n < (pctl->data->ngpios / 8); ++n)
> +		err = sx150x_i2c_write(pctl->client, base - n, cfg >> (n * 8));
> +	return err;
> +}
> +
> +static int sx150x_reset(struct sx150x_pinctrl *pctl)
> +{
> +	int err;
> +

Perhaps

	if (pctl->data->model != SX150X_789)
		return -ENOTSUPP;

???

> +	err = i2c_smbus_write_byte_data(pctl->client,
> +					pctl->data->pri.x789.reg_reset,
> +					0x12);
> +	if (err < 0)
> +		return err;
> +
> +	err = i2c_smbus_write_byte_data(pctl->client,
> +					pctl->data->pri.x789.reg_reset,
> +					0x34);
> +	return err;
> +}
> +
> +static int sx150x_init_hw(struct sx150x_pinctrl *pctl)
> +{
> +	int err;
> +
> +	if (of_property_read_bool(pctl->dev->of_node, "semtech,probe-reset")) {
> +		err = sx150x_reset(pctl);
> +		if (err < 0)
> +			return err;
> +	}
> +
> +	if (pctl->data->model == SX150X_789)
> +		err = sx150x_i2c_write(pctl->client,
> +				pctl->data->pri.x789.reg_misc,
> +				0x01);
> +	else if (pctl->data->model == SX150X_456)
> +		err = sx150x_i2c_write(pctl->client,
> +				pctl->data->pri.x456.reg_advance,
> +				0x04);
> +	else
> +		err = sx150x_i2c_write(pctl->client,
> +				pctl->data->pri.x123.reg_advance,
> +				0x00);
> +	if (err < 0)
> +		return err;
> +
> +	/* Set all pins to work in normal mode */
> +	if (pctl->data->model == SX150X_789) {
> +		err = sx150x_init_io(pctl,
> +				pctl->data->pri.x789.reg_polarity,
> +				0);
> +		if (err < 0)
> +			return err;
> +	} else if (pctl->data->model == SX150X_456) {
> +		/* Set all pins to work in normal mode */
> +		err = sx150x_init_io(pctl,
> +				pctl->data->pri.x456.reg_pld_mode,
> +				0);
> +		if (err < 0)
> +			return err;
> +	} else {
> +		/* Set all pins to work in normal mode */
> +		err = sx150x_init_io(pctl,
> +				pctl->data->pri.x123.reg_pld_mode,
> +				0);
> +		if (err < 0)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static int sx150x_probe(struct i2c_client *client,
> +			const struct i2c_device_id *id)
> +{
> +	static const u32 i2c_funcs = I2C_FUNC_SMBUS_BYTE_DATA |
> +				     I2C_FUNC_SMBUS_WRITE_WORD_DATA;
> +	struct device *dev = &client->dev;
> +	struct sx150x_pinctrl *pctl;
> +	int ret;
> +
> +	if (!id->driver_data)
> +		return -EINVAL;
> +
> +	if (!i2c_check_functionality(client->adapter, i2c_funcs))
> +		return -ENOSYS;
> +
> +	pctl = devm_kzalloc(dev, sizeof(*pctl), GFP_KERNEL);
> +	if (!pctl)
> +		return -ENOMEM;
> +
> +	pctl->dev = dev;
> +	pctl->client = client;
> +	pctl->data = (void *)id->driver_data;
> +
> +	mutex_init(&pctl->lock);
> +
> +	ret = sx150x_init_hw(pctl);
> +	if (ret)
> +		return ret;
> +
> +	/* Register GPIO controller */
> +	pctl->gpio.label = devm_kstrdup(dev, client->name, GFP_KERNEL);
> +	pctl->gpio.base = -1;
> +	pctl->gpio.ngpio = pctl->data->npins;
> +	pctl->gpio.get_direction = sx150x_gpio_get_direction;
> +	pctl->gpio.direction_input = sx150x_gpio_direction_input;
> +	pctl->gpio.direction_output = sx150x_gpio_direction_output;
> +	pctl->gpio.get = sx150x_gpio_get;
> +	pctl->gpio.set = sx150x_gpio_set;
> +	pctl->gpio.set_single_ended = sx150x_gpio_set_single_ended;
> +	pctl->gpio.parent = dev;
> +#ifdef CONFIG_OF_GPIO
> +	pctl->gpio.of_node = dev->of_node;
> +#endif
> +	pctl->gpio.can_sleep = true;
> +
> +	ret = devm_gpiochip_add_data(dev, &pctl->gpio, pctl);
> +	if (ret)
> +		return ret;
> +
> +	/* Add Interrupt support if an irq is specified */
> +	if (client->irq > 0) {
> +		pctl->irq_chip.name = devm_kstrdup(dev, client->name,
> +						   GFP_KERNEL);
> +		pctl->irq_chip.irq_mask = sx150x_irq_mask;
> +		pctl->irq_chip.irq_unmask = sx150x_irq_unmask;
> +		pctl->irq_chip.irq_set_type = sx150x_irq_set_type;
> +		pctl->irq_chip.irq_bus_lock = sx150x_irq_bus_lock;
> +		pctl->irq_chip.irq_bus_sync_unlock = sx150x_irq_bus_sync_unlock;
> +
> +		pctl->irq.masked = ~0;
> +		pctl->irq.sense = 0;
> +		pctl->irq.dev_masked = ~0;
> +		pctl->irq.dev_sense = 0;
> +		pctl->irq.update = -1;
> +
> +		ret = gpiochip_irqchip_add(&pctl->gpio,
> +					   &pctl->irq_chip, 0,
> +					   handle_edge_irq, IRQ_TYPE_EDGE_BOTH);
> +		if (ret) {
> +			dev_err(dev, "could not connect irqchip to gpiochip\n");
> +			return ret;
> +		}
> +
> +		ret = devm_request_threaded_irq(dev, client->irq, NULL,
> +						sx150x_irq_thread_fn,
> +						IRQF_ONESHOT | IRQF_SHARED |
> +						IRQF_TRIGGER_FALLING,
> +						pctl->irq_chip.name, pctl);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	/* Pinctrl_desc */
> +	pctl->pinctrl_desc.name = "sx150x-pinctrl";
> +	pctl->pinctrl_desc.pctlops = &sx150x_pinctrl_ops;
> +	pctl->pinctrl_desc.confops = &sx150x_pinconf_ops;
> +	pctl->pinctrl_desc.pins = pctl->data->pins;
> +	pctl->pinctrl_desc.npins = pctl->data->npins;
> +	pctl->pinctrl_desc.owner = THIS_MODULE;
> +
> +	pctl->pctldev = pinctrl_register(&pctl->pinctrl_desc, dev, pctl);
> +	if (IS_ERR(pctl->pctldev)) {
> +		dev_err(dev, "Failed to register pinctrl device\n");
> +		return PTR_ERR(pctl->pctldev);
> +	}
> +
> +	return 0;
> +}
> +
> +static struct i2c_driver sx150x_driver = {
> +	.driver = {
> +		.name = "sx150x-pinctrl",
> +		.of_match_table = of_match_ptr(sx150x_of_match),
> +	},
> +	.probe    = sx150x_probe,
> +	.id_table = sx150x_id,
> +};
> +
> +static int __init sx150x_init(void)
> +{
> +	return i2c_add_driver(&sx150x_driver);
> +}
> +subsys_initcall(sx150x_init);
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
