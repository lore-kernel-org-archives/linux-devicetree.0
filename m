From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] Add optional chip erase functionality to AT25 EEPROM
 driver.
Date: Fri, 9 Aug 2019 15:28:09 +0200
Message-ID: <20190809132809.GA30876@kroah.com>
References: <20190809125358.24440-1-joe.burmeister@devtank.co.uk>
 <20190809130005.GA13962@kroah.com>
 <d6534808-aa41-0bf0-a516-cee9bbd8e97a@devtank.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d6534808-aa41-0bf0-a516-cee9bbd8e97a@devtank.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Burmeister <joe.burmeister@devtank.co.uk>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, YueHaibing <yuehaibing@huawei.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 09, 2019 at 02:18:24PM +0100, Joe Burmeister wrote:
> Hi Greg,
> 
> On 09/08/2019 14:00, Greg Kroah-Hartman wrote:
> > On Fri, Aug 09, 2019 at 01:53:55PM +0100, Joe Burmeister wrote:
> > > +static void _eeprom_at25_store_erase_locked(struct at25_data *at25)
> > > +{
> > > +	unsigned long	timeout, retries;
> > > +	int				sr, status;
> > > +	u8	cp;
> > > +
> > > +	cp = AT25_WREN;
> > > +	status = spi_write(at25->spi, &cp, 1);
> > > +	if (status < 0) {
> > > +		dev_dbg(&at25->spi->dev, "ERASE WREN --> %d\n", status);
> > > +		return;
> > > +	}
> > > +	cp = at25->erase_instr;
> > > +	status = spi_write(at25->spi, &cp, 1);
> > > +	if (status < 0) {
> > > +		dev_dbg(&at25->spi->dev, "CHIP_ERASE --> %d\n", status);
> > > +		return;
> > > +	}
> > > +	/* Wait for non-busy status */
> > > +	timeout = jiffies + msecs_to_jiffies(ERASE_TIMEOUT);
> > > +	retries = 0;
> > > +	do {
> > > +		sr = spi_w8r8(at25->spi, AT25_RDSR);
> > > +		if (sr < 0 || (sr & AT25_SR_nRDY)) {
> > > +			dev_dbg(&at25->spi->dev,
> > > +				"rdsr --> %d (%02x)\n", sr, sr);
> > > +			/* at HZ=100, this is sloooow */
> > > +			msleep(1);
> > > +			continue;
> > > +		}
> > > +		if (!(sr & AT25_SR_nRDY))
> > > +			return;
> > > +	} while (retries++ < 200 || time_before_eq(jiffies, timeout));
> > > +
> > > +	if ((sr < 0) || (sr & AT25_SR_nRDY)) {
> > > +		dev_err(&at25->spi->dev,
> > > +			"chip erase, timeout after %u msecs\n",
> > > +			jiffies_to_msecs(jiffies -
> > > +				(timeout - ERASE_TIMEOUT)));
> > > +		status = -ETIMEDOUT;
> > > +		return;
> > > +	}
> > > +}
> > > +
> > > +
> > No need for 2 lines :(
> 
> Sorry, other coding conventions I'm used to.

checkpatch.pl should have warned you about this, you did run that before
sending your patch out, right?

> > > +static ssize_t eeprom_at25_store_erase(struct device *dev,
> > > +					 struct device_attribute *attr,
> > > +					 const char *buf, size_t count)
> > > +{
> > > +	struct at25_data *at25 = dev_get_drvdata(dev);
> > > +	int erase = 0;
> > > +
> > > +	sscanf(buf, "%d", &erase);
> > > +	if (erase) {
> > > +		mutex_lock(&at25->lock);
> > > +		_eeprom_at25_store_erase_locked(at25);
> > > +		mutex_unlock(&at25->lock);
> > > +	}
> > > +
> > > +	return count;
> > > +}
> > > +
> > > +static DEVICE_ATTR(erase, S_IWUSR, NULL, eeprom_at25_store_erase);
> > > +
> > > +
> > Same here.
> > 
> > Also, where is the Documentation/ABI/ update for the new sysfs file?
> 
> There isn't anything for the existing SPI EEPROM stuff I can see.
> 
> Would I have to document what was already there to add my bit?

Yes, someone has to, sorry :)

thanks,

greg k-h
