From: Joe Burmeister <joe.burmeister@devtank.co.uk>
Subject: Re: [PATCH] Add optional chip erase functionality to AT25 EEPROM
 driver.
Date: Fri, 9 Aug 2019 14:18:24 +0100
Message-ID: <d6534808-aa41-0bf0-a516-cee9bbd8e97a@devtank.co.uk>
References: <20190809125358.24440-1-joe.burmeister@devtank.co.uk>
 <20190809130005.GA13962@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190809130005.GA13962@kroah.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, YueHaibing <yuehaibing@huawei.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Greg,

On 09/08/2019 14:00, Greg Kroah-Hartman wrote:
> On Fri, Aug 09, 2019 at 01:53:55PM +0100, Joe Burmeister wrote:
>> +static void _eeprom_at25_store_erase_locked(struct at25_data *at25)
>> +{
>> +	unsigned long	timeout, retries;
>> +	int				sr, status;
>> +	u8	cp;
>> +
>> +	cp = AT25_WREN;
>> +	status = spi_write(at25->spi, &cp, 1);
>> +	if (status < 0) {
>> +		dev_dbg(&at25->spi->dev, "ERASE WREN --> %d\n", status);
>> +		return;
>> +	}
>> +	cp = at25->erase_instr;
>> +	status = spi_write(at25->spi, &cp, 1);
>> +	if (status < 0) {
>> +		dev_dbg(&at25->spi->dev, "CHIP_ERASE --> %d\n", status);
>> +		return;
>> +	}
>> +	/* Wait for non-busy status */
>> +	timeout = jiffies + msecs_to_jiffies(ERASE_TIMEOUT);
>> +	retries = 0;
>> +	do {
>> +		sr = spi_w8r8(at25->spi, AT25_RDSR);
>> +		if (sr < 0 || (sr & AT25_SR_nRDY)) {
>> +			dev_dbg(&at25->spi->dev,
>> +				"rdsr --> %d (%02x)\n", sr, sr);
>> +			/* at HZ=100, this is sloooow */
>> +			msleep(1);
>> +			continue;
>> +		}
>> +		if (!(sr & AT25_SR_nRDY))
>> +			return;
>> +	} while (retries++ < 200 || time_before_eq(jiffies, timeout));
>> +
>> +	if ((sr < 0) || (sr & AT25_SR_nRDY)) {
>> +		dev_err(&at25->spi->dev,
>> +			"chip erase, timeout after %u msecs\n",
>> +			jiffies_to_msecs(jiffies -
>> +				(timeout - ERASE_TIMEOUT)));
>> +		status = -ETIMEDOUT;
>> +		return;
>> +	}
>> +}
>> +
>> +
> No need for 2 lines :(

Sorry, other coding conventions I'm used to.


>> +static ssize_t eeprom_at25_store_erase(struct device *dev,
>> +					 struct device_attribute *attr,
>> +					 const char *buf, size_t count)
>> +{
>> +	struct at25_data *at25 = dev_get_drvdata(dev);
>> +	int erase = 0;
>> +
>> +	sscanf(buf, "%d", &erase);
>> +	if (erase) {
>> +		mutex_lock(&at25->lock);
>> +		_eeprom_at25_store_erase_locked(at25);
>> +		mutex_unlock(&at25->lock);
>> +	}
>> +
>> +	return count;
>> +}
>> +
>> +static DEVICE_ATTR(erase, S_IWUSR, NULL, eeprom_at25_store_erase);
>> +
>> +
> Same here.
>
> Also, where is the Documentation/ABI/ update for the new sysfs file?

There isn't anything for the existing SPI EEPROM stuff I can see.

Would I have to document what was already there to add my bit?


>>   static int at25_probe(struct spi_device *spi)
>>   {
>>   	struct at25_data	*at25 = NULL;
>> @@ -311,6 +379,7 @@ static int at25_probe(struct spi_device *spi)
>>   	int			err;
>>   	int			sr;
>>   	int			addrlen;
>> +	int			has_erase;
>>   
>>   	/* Chip description */
>>   	if (!spi->dev.platform_data) {
>> @@ -352,6 +421,9 @@ static int at25_probe(struct spi_device *spi)
>>   	spi_set_drvdata(spi, at25);
>>   	at25->addrlen = addrlen;
>>   
>> +	/* Optional chip erase instruction */
>> +	device_property_read_u8(&spi->dev, "chip_erase_instruction", &at25->erase_instr);
>> +
>>   	at25->nvmem_config.name = dev_name(&spi->dev);
>>   	at25->nvmem_config.dev = &spi->dev;
>>   	at25->nvmem_config.read_only = chip.flags & EE_READONLY;
>> @@ -370,17 +442,22 @@ static int at25_probe(struct spi_device *spi)
>>   	if (IS_ERR(at25->nvmem))
>>   		return PTR_ERR(at25->nvmem);
>>   
>> -	dev_info(&spi->dev, "%d %s %s eeprom%s, pagesize %u\n",
>> +	has_erase = (!(chip.flags & EE_READONLY) && at25->erase_instr);
>> +
>> +	dev_info(&spi->dev, "%d %s %s eeprom%s, pagesize %u%s\n",
>>   		(chip.byte_len < 1024) ? chip.byte_len : (chip.byte_len / 1024),
>>   		(chip.byte_len < 1024) ? "Byte" : "KByte",
>>   		at25->chip.name,
>>   		(chip.flags & EE_READONLY) ? " (readonly)" : "",
>> -		at25->chip.page_size);
>> +		at25->chip.page_size, (has_erase)?" <has erase>":"");
>> +
>> +	if (has_erase && device_create_file(&spi->dev, &dev_attr_erase))
>> +		dev_err(&spi->dev, "can't create erase interface\n");
> You just raced with userspace and lost :(
>
> Please create an attribute group and add it to the .dev_groups pointer
> in struct driver so it can be created properly in a race-free manner.
>
> See the thread at:
> 	https://lore.kernel.org/r/20190731124349.4474-2-gregkh@linuxfoundation.org
> for the details on how to do that.

Clearly I didn't know about that. I'll do some reading when I've got a 
bit of time and try a again.


> thanks,
>
> greg k-h

Cheers,

Joe
