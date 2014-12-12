From: Nikolaus Schulz <nikolaus.schulz@avionic-design.de>
Subject: Re: [PATCH v2 2/2] iio: add driver for the TI DAC8554
Date: Fri, 12 Dec 2014 16:58:04 +0100
Message-ID: <20141212155804.GA1142@avionic-0071.adnet.avionic-design.de>
References: <1416858614-32265-1-git-send-email-nikolaus.schulz@avionic-design.de>
 <1416858614-32265-2-git-send-email-nikolaus.schulz@avionic-design.de>
 <5482EA33.7020305@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5482EA33.7020305@gmx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Hartmut Knaack <knaack.h@gmx.de>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Michael Welling <mwelling@ieee.org>, Philippe Reynes <tremyfr@yahoo.fr>, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, Alban Bedel <alban.bedel@avionic-design.de>
List-Id: devicetree@vger.kernel.org

On Sat, Dec 06, 2014 at 12:36:19PM +0100, Hartmut Knaack wrote:
> Nikolaus Schulz schrieb am 24.11.2014 um 20:50:
> > The TI DAC8554 is a quad-channel Digital-to-Analog Converter with a=
n SPI
> > interface.
> >=20
> > Changes in v2:
> > * Use DMA-safe buffer for SPI transfer
> > * Normalize powerdown_mode name "hi-z" to "three_state" as per
> >   ABI/testing/sysfs-bus-iio
> > * Register device late in probe function
> > * Avoid powerdown broadcast update, which touches all DAC on the bu=
s
> There are a few issues left, please see my comments inline.
> >=20
> > Signed-off-by: Nikolaus Schulz <nikolaus.schulz@avionic-design.de>
> > ---
> >  drivers/iio/dac/Kconfig      |  10 ++
> >  drivers/iio/dac/Makefile     |   1 +
> >  drivers/iio/dac/ti-dac8554.c | 374 +++++++++++++++++++++++++++++++=
++++++++++++
> >  3 files changed, 385 insertions(+)
> >  create mode 100644 drivers/iio/dac/ti-dac8554.c
[...]
> > diff --git a/drivers/iio/dac/ti-dac8554.c b/drivers/iio/dac/ti-dac8=
554.c
> > new file mode 100644
> > index 0000000..fca751f
> > --- /dev/null
> > +++ b/drivers/iio/dac/ti-dac8554.c
> > @@ -0,0 +1,374 @@
> > +/*
> > + * TI DAC8554 Digital to Analog Converter SPI driver
> > + *
> > + * Copyright (C) 2014 Avionic Design GmbH
> > + *
> > + * Based on ad5446r_spi.c
> > + * Copyright (C) 2010,2011 Analog Devices Inc.
> > + *
> > + * This program is free software; you can redistribute it and/or m=
odify
> > + * it under the terms of the GNU General Public License version 2 =
as
> > + * published by the Free Software Foundation.
> > + */
> > +
> > +#include <linux/spi/spi.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/module.h>
> > +#include <linux/iio/iio.h>
> > +#include <linux/of.h>
> > +
> > +#define DAC8554_DRIVERNAME			"ti-dac8554"
> > +#define DAC8554_DAC_CHANNELS			4
> > +
> > +/* Load commands */
> > +#define DAC8554_CMD_STORE_DAC_N			0x0
> > +#define DAC8554_CMD_UPDATE_DAC_N		0x1
> > +#define DAC8554_CMD_STORE_DAC_N_UPDATE_ALL	0x2
> > +#define DAC8554_CMD_UPDATE_BROADCAST		0x3
> > +
> > +#define DAC8554_BROADCAST_USE_SRDATA		0x2
> Add a blank line here.

=46ixed.

> > +/* Powerdown modes (ORed PD1|PD2 bits) */
> It took my some time to figure out ORed. I think you could drop it an=
d just
> mention (PD1 | PD2 bits).

Agreed, and fixed.

> > +#define DAC8554_PWRDN_HIZ			0x0
> > +#define DAC8554_PWRDN_1K			0x1
> > +#define DAC8554_PWRDN_100K			0x2
> > +
> > +#define DAC8554_PWRDN_TO_SR(mode)		(BIT(16) | (mode) << 14)
> > +
> > +/**
> > + * struct dac8554_state - driver instance specific data
> > + * @spi:		spi_device
> SPI device?

Yes, fixed.

> > + * @reg:		supply regulator
> > + * @addr:		two-bit chip address
> > + * @vref_mv:		reference voltage in millivolt
> > + * @val			DAC/channel data
> DAC channel data?

"channel data" will do, actually.

> > + * @powerdown		channel powerdown flag
> > + * @powerdown_mode	channel powerdown mode
> > + * @xfer		SPI transfer buffer
> Half of the comments are with colon, the other half are missing it.

=46ixed.

> > + */
> > +struct dac8554_state {
> > +	struct spi_device		*spi;
> > +	struct regulator		*reg;
> > +	unsigned			addr;
> > +	unsigned			vref_mv;
> > +	u16				val[DAC8554_DAC_CHANNELS];
> > +	bool				powerdown[DAC8554_DAC_CHANNELS];
> > +	u8				powerdown_mode[DAC8554_DAC_CHANNELS];
> > +
> > +	/*
> > +	 * DMA (thus cache coherency maintenance) requires the
> > +	 * transfer buffers to live in their own cache lines.
> > +	 */
> > +	u8				xfer[3] ____cacheline_aligned;
> > +};
> > +
> > +static int dac8554_spi_write(struct dac8554_state *st,
> > +			     unsigned cmd,
> > +			     unsigned chan_addr,
> > +			     unsigned val)
> > +{
> > +	u32 data;
> > +
> > +	/*
> > +	 * The input shift register is 24 bits wide. The 8 MSB are
> > +	 * control bits, followed by 16 data bits.
> > +	 * The first two bits A1 and A0 address a DAC8554 chip.
> > +	 * The next two are the command bits, LD1 and LD0.
> > +	 * After a don't-care-bit, the next two bits select the channel.
> > +	 * The final control bit PD0 is a flag signalling if the data
> > +	 * bits encode a powerdown mode. We merge PD0 with the adjacent
> > +	 * data bits.
> > +	 */
> > +
> > +	if (cmd > 3 || chan_addr > 3 ||
> > +			(val > 0xffff && (val & ~DAC8554_PWRDN_TO_SR(3))))
> > +		return -EINVAL;
> > +
> > +	data =3D (st->addr << 22) | (cmd << 20) | (chan_addr << 17) | val=
;
> Could be more readable by using definition for the magic shifts, or m=
acros.

Hmm. The magic is all concentrated at this place, and the variable name=
s
tell the story, so I figured that's ok.  But, why not: fixed.

> > +	st->xfer[0] =3D data >> 16;
> > +	st->xfer[1] =3D data >> 8;
> > +	st->xfer[2] =3D data;
> > +
> > +	return spi_write(st->spi, st->xfer, sizeof(st->xfer));
> > +}
> > +
> > +static int dac8554_read_raw(struct iio_dev *indio_dev,
> > +			    struct iio_chan_spec const *chan,
> > +			    int *val,
> > +			    int *val2,
> > +			    long m)
> Commonly, m is called mask (like you do in _write_raw).

Ah yes. Fixed.

> > +{
> > +	struct dac8554_state *st =3D iio_priv(indio_dev);
> > +
> > +	switch (m) {
> > +	case IIO_CHAN_INFO_RAW:
> > +		*val =3D st->val[chan->address];
> > +		return IIO_VAL_INT;
> > +	case IIO_CHAN_INFO_SCALE:
> > +		*val =3D st->vref_mv;
> > +		*val2 =3D 16;
> > +		return IIO_VAL_FRACTIONAL_LOG2;
> > +	}
> > +	return -EINVAL;
> > +}
> > +
> > +static int dac8554_write_raw(struct iio_dev *indio_dev,
> > +			     struct iio_chan_spec const *chan,
> > +			     int val,
> > +			     int val2,
> > +			     long mask)
> > +{
> > +	struct dac8554_state *st =3D iio_priv(indio_dev);
> > +	int err;
> > +
> > +	switch (mask) {
> > +	case IIO_CHAN_INFO_RAW:
> > +		if (val > 0xffff || val < 0)
> > +			return -EINVAL;
> > +
> > +		err =3D dac8554_spi_write(st, DAC8554_CMD_UPDATE_DAC_N,
> > +					chan->address, val);
> > +		if (err)
> > +			return err;
> > +
> > +		st->val[chan->address] =3D val;
> > +
> > +		/* By hw design, DAC updates automatically trigger powerup. */
> > +		st->powerdown[chan->address] =3D false;
> > +
> > +		return 0;
> > +
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +
> > +static int dac8554_get_powerdown_mode(struct iio_dev *indio_dev,
> > +				      const struct iio_chan_spec *chan)
> > +{
> > +	struct dac8554_state *st =3D iio_priv(indio_dev);
> > +
> > +	return st->powerdown_mode[chan->address];
> > +}
> > +
> > +static int dac8554_set_powerdown_mode(struct iio_dev *indio_dev,
> > +				      const struct iio_chan_spec *chan,
> > +				      unsigned int mode)
> > +{
> > +	struct dac8554_state *st =3D iio_priv(indio_dev);
> > +
> > +	st->powerdown_mode[chan->address] =3D mode;
> > +
> > +	return 0;
> > +}
> > +
> > +static ssize_t dac8554_read_dac_powerdown(struct iio_dev *indio_de=
v,
> > +					  uintptr_t private,
> > +					  const struct iio_chan_spec *chan,
> > +					  char *buf)
> > +{
> > +	struct dac8554_state *st =3D iio_priv(indio_dev);
> > +
> > +	return sprintf(buf, "%d\n", st->powerdown[chan->address]);
> > +}
> > +
> > +static ssize_t dac8554_write_dac_powerdown(struct iio_dev *indio_d=
ev,
> > +					   uintptr_t private,
> > +					   const struct iio_chan_spec *chan,
> > +					   const char *buf,
> > +					   size_t len)
> > +{
> > +	bool powerdown;
> > +	int ret;
> > +	struct dac8554_state *st =3D iio_priv(indio_dev);
> > +	u8 powerdown_mode;
> > +
> > +	ret =3D strtobool(buf, &powerdown);
> > +	if (ret)
> > +		return ret;
> > +
> > +	st->powerdown[chan->address] =3D powerdown;
> > +
> > +	if (powerdown) {
> > +		powerdown_mode =3D st->powerdown_mode[chan->address];
> > +		ret =3D dac8554_spi_write(st,
> > +				DAC8554_CMD_UPDATE_DAC_N,
> > +				chan->address,
> > +				DAC8554_PWRDN_TO_SR(powerdown_mode));
> The parameters sill fit on line even with proper indentation.

=46ixed.

> > +	} else {
> > +		/* Load DAC with cached value. This triggers a powerup. */
> > +		ret =3D dac8554_spi_write(st,
> > +				DAC8554_CMD_UPDATE_DAC_N,
> > +				chan->address,
> > +				st->val[chan->address]);
> Same here with indentation.

=46ixed.

> > +	}
> > +
> > +	if (ret)
> > +		return ret;
> > +
> > +	return len;
> Just: return (ret) ? ret : len;

I think avoiding the ternary operator makes the code more readable, and
it separates the error path from normal operation. So I would prefer to
keep it that way.

> > +}
> > +
> > +static int dac8554_powerdown(struct dac8554_state *st,
> > +			     u8 powerdown_mode)
> > +{
> > +	int chan, cmd, ret;
> > +
> > +	for (chan =3D DAC8554_DAC_CHANNELS-1; chan >=3D 0; --chan) {
> Please mind spaces around operators.

=46ixed.

> > +		cmd =3D chan ? DAC8554_CMD_STORE_DAC_N
> > +			   : DAC8554_CMD_STORE_DAC_N_UPDATE_ALL;
> > +		ret =3D dac8554_spi_write(st, cmd, chan,
> > +				DAC8554_PWRDN_TO_SR(powerdown_mode));
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	memset(st->powerdown_mode, powerdown_mode, sizeof(st->powerdown_m=
ode));
> > +	memset(st->powerdown, true, sizeof(st->powerdown));
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct iio_info dac8554_info =3D {
> > +	.write_raw =3D dac8554_write_raw,
> > +	.read_raw =3D dac8554_read_raw,
> > +	.driver_module =3D THIS_MODULE,
> > +};
> > +
> > +static const char * const dac8554_powerdown_modes[] =3D {
> > +	"three_state",
> > +	"1kohm_to_gnd",
> > +	"100kohm_to_gnd"
> > +};
> > +
> > +static const struct iio_enum dac8854_powerdown_mode_enum =3D {
> > +	.items =3D dac8554_powerdown_modes,
> > +	.num_items =3D ARRAY_SIZE(dac8554_powerdown_modes),
> > +	.get =3D dac8554_get_powerdown_mode,
> > +	.set =3D dac8554_set_powerdown_mode,
> > +};
> > +
> > +static const struct iio_chan_spec_ext_info dac8554_ext_info[] =3D =
{
> > +	{
> > +		.name =3D "powerdown",
> > +		.read =3D dac8554_read_dac_powerdown,
> > +		.write =3D dac8554_write_dac_powerdown,
> > +		.shared =3D IIO_SEPARATE,
> > +	},
> > +	IIO_ENUM("powerdown_mode", IIO_SEPARATE,
> > +		 &dac8854_powerdown_mode_enum),
> > +	IIO_ENUM_AVAILABLE("powerdown_mode", &dac8854_powerdown_mode_enum=
),
> > +	{ },
> > +};
> > +
> > +#define DAC8554_CHANNEL(chan) { \
> > +	.type =3D IIO_VOLTAGE, \
> > +	.indexed =3D 1, \
> > +	.output =3D 1, \
> > +	.channel =3D (chan), \
> > +	.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW), \
> > +	.info_mask_shared_by_type =3D BIT(IIO_CHAN_INFO_SCALE), \
> > +	.address =3D (chan), \
> > +	.ext_info =3D dac8554_ext_info, \
> > +}
> > +const struct iio_chan_spec dac8554_channels[] =3D {
> > +	DAC8554_CHANNEL(0),
> > +	DAC8554_CHANNEL(1),
> > +	DAC8554_CHANNEL(2),
> > +	DAC8554_CHANNEL(3),
> > +};
> > +#undef DAC8554_CHANNEL
> > +
> > +static int dac8554_probe(struct spi_device *spi)
> > +{
> > +	struct dac8554_state *st;
> > +	struct iio_dev *indio_dev;
> > +	int ret, voltage_uv;
> > +	u32 addr;
> > +
> > +	indio_dev =3D devm_iio_device_alloc(&spi->dev, sizeof(*st));
> > +	if (!indio_dev)
> > +		return -ENOMEM;
> > +
> > +	indio_dev->dev.parent =3D &spi->dev;
> > +	indio_dev->name =3D DAC8554_DRIVERNAME;
> > +	indio_dev->info =3D &dac8554_info;
> > +	indio_dev->modes =3D INDIO_DIRECT_MODE;
> > +	indio_dev->channels =3D dac8554_channels;
> > +	indio_dev->num_channels =3D ARRAY_SIZE(dac8554_channels);
> > +
> > +	spi_set_drvdata(spi, indio_dev);
> > +
> > +	st =3D iio_priv(indio_dev);
> > +
> > +	if (!spi->dev.of_node) {
> > +		dev_err(&spi->dev, "missing OF node");
> > +		return -ENODEV;
> > +	}
> > +	ret =3D of_property_read_u32(spi->dev.of_node, "address", &addr);
> > +	if (ret || addr < 0 || addr > 2) {
> > +		dev_err(&spi->dev, "no or invalid chip address");
> > +		return -ENODEV;
> > +	}
> > +
> > +	st->spi =3D spi;
> > +	st->addr =3D addr;
> > +
> According to your DT bindings, the regulator from property "vref-supp=
ly" should
> be used. This is missing here.

Uhm, it's right below, no?

> > +	st->reg =3D devm_regulator_get(&spi->dev, "vref");
> > +	if (IS_ERR(st->reg))
> > +		return PTR_ERR(st->reg);
> > +
> > +	ret =3D regulator_enable(st->reg);
> > +	if (ret)
> > +		return ret;
> > +
> > +	voltage_uv =3D regulator_get_voltage(st->reg);
> > +	if (voltage_uv < 0)
> > +		goto error_disable_reg;
> Missing ret =3D voltage_uv before goto. Or just drop voltage_uv compl=
etely and use ret instead.

=46ixed.

> > +	st->vref_mv =3D voltage_uv / 1000;
> How hard do you want to depend on a voltage regulator? Doing regulato=
r_get_voltage()
> could even be called dynamically in _read_raw(), making a real regula=
tor optional.

Hmm. I understand that the DAC voltage input may not be provided by a
regulator, but is that a common scenario?  No other DAC driver I looked
at handles that case, they all consider it an error if the regulator is
absent.

> > +
> > +	ret =3D dac8554_powerdown(st, DAC8554_PWRDN_100K);
> > +	if (ret)
> > +		goto error_disable_reg;
> > +
> > +	ret =3D iio_device_register(indio_dev);
> > +	if (ret)
> > +		goto error_disable_reg;
> > +
> > +	return 0;
> > +
> > +error_disable_reg:
> > +	regulator_disable(st->reg);
> > +	return ret;
> > +}
> > +
> > +static int dac8554_remove(struct spi_device *spi)
> > +{
> > +	struct iio_dev *indio_dev =3D spi_get_drvdata(spi);
> > +	struct dac8554_state *st =3D iio_priv(indio_dev);
> > +
> > +	iio_device_unregister(indio_dev);
> > +	regulator_disable(st->reg);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id dac8554_of_match[] =3D {
> > +	{ .compatible =3D "ti,dac8554" },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, dac8554_of_match);
> > +
> > +static struct spi_driver dac8554_driver =3D {
> > +	.driver =3D {
> > +		.name =3D DAC8554_DRIVERNAME,
> > +		.owner =3D THIS_MODULE,
> > +		.of_match_table =3D dac8554_of_match,
> > +	 },
> > +	.probe =3D dac8554_probe,
> > +	.remove =3D dac8554_remove,
> > +};
> > +module_spi_driver(dac8554_driver);
> > +
> > +MODULE_AUTHOR("Nikolaus Schulz <nikolaus.schulz@avionic-design.de>=
");
> > +MODULE_DESCRIPTION("Texas Instruments DAC8554 SPI driver");
> > +MODULE_LICENSE("GPL v2");

Thanks for the review!

Nikolaus
--=20
Avionic Design GmbH
Nikolaus Schulz
Wragekamp 10
D-22397 Hamburg
Germany

Tel.:  +49 40 88187-163
=46ax:   +49 40 88187-150
Email: nikolaus.schulz@avionic-design.de

Avionic Design GmbH
Amtsgericht Hamburg HRB 82598
Gesch=E4ftsf=FChrung: Cornelis Broers
Ust.-Ident-Nr.: DE813378254
