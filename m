From: arno@natisbad.org (Arnaud Ebalard)
Subject: Re: [PATCHv5,RESEND] rtc: Add support for Intersil ISL12057 I2C RTC chip
Date: Wed, 18 Dec 2013 20:34:33 +0100
Message-ID: <87eh5a7y2e.fsf@natisbad.org>
References: <28bfd1b8cd4725a70fb713a8b6503e7f5db13d71.1387305663.git.arno@natisbad.org>
	<20131218122419.GM28455@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20131218122419.GM28455@sirena.org.uk> (Mark Brown's message of
	"Wed, 18 Dec 2013 12:24:19 +0000")
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Rob Landley <rob@landley.net>, rtc-linux@googlegroups.com, Jason Cooper <jason@lakedaemon.net>, Guenter Roeck <linux@roeck-us.net>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

Mark Brown <broonie@kernel.org> writes:

> On Tue, Dec 17, 2013 at 08:07:28PM +0100, Arnaud Ebalard wrote:
>> 
>> Intersil ISL12057 is an I2C RTC chip also supporting two alarms. This
>> patch only adds support for basic RTC functionalities (i.e. getting and
>> setting time). Tests have been performed on NETGEAR ReadyNAS 102 w/
>> startup/shutdown scripts, hwclock, ntpdate and openntpd.
>
> Reviewed-by: Mark Brown <broonie@linaro.org>

Thanks, Mark!

>> +static int isl12057_rtc_proc(struct device *dev, struct seq_file *seq)
>> +{
>> +	struct isl12057_rtc_data *data = dev_get_drvdata(dev);
>> +	int reg, ret;
>> +
>> +	mutex_lock(&data->lock);
>> +
>> +	/* Status register */
>> +	ret = regmap_read(data->regmap, ISL12057_REG_SR, &reg);
>> +	if (ret) {
>> +		dev_err(dev, "%s: reading SR failed\n", __func__);
>> +		goto out;
>> +	}
>> +
>> +	seq_printf(seq, "status_reg\t:%s%s%s (0x%.2x)\n",
>> +		   (reg & ISL12057_REG_SR_OSF) ? " OSF" : "",
>> +		   (reg & ISL12057_REG_SR_A1F) ? " A1F" : "",
>> +		   (reg & ISL12057_REG_SR_A2F) ? " A2F" : "", reg);
>> +
>> +	/* Control register */
>> +	ret = regmap_read(data->regmap, ISL12057_REG_INT, &reg);
>> +	if (ret) {
>> +		dev_err(dev, "%s: reading INT failed\n", __func__);
>> +		goto out;
>> +	}
>> +
>> +	seq_printf(seq, "control_reg\t:%s%s%s%s%s%s (0x%.2x)\n",
>> +		   (reg & ISL12057_REG_INT_A1IE) ?  " A1IE"  : "",
>> +		   (reg & ISL12057_REG_INT_A2IE) ?  " A2IE"  : "",
>> +		   (reg & ISL12057_REG_INT_INTCN) ? " INTCN" : "",
>> +		   (reg & ISL12057_REG_INT_RS1) ?   " RS1"   : "",
>> +		   (reg & ISL12057_REG_INT_RS2) ?   " RS2"   : "",
>> +		   (reg & ISL12057_REG_INT_EOSC) ?  " EOSC"  : "", reg);
>> +
>> + out:
>> +	mutex_unlock(&data->lock);
>
> I'm not sure the lock is achieving anything any more - the only time it
> actualy protects more than one operation is the above but since the
> status register is volatile anyway it might change between it being read
> and the control register being read.

Well, I guess the lock will be more useful when alarm code will be added
back, even if it does not hurt above. Now, regarding protection of
regmap_bulk_write/read() calls in set/read time helpers, I also
protected those because I thought it was good practice in general to
serialize concurrent accesses to both the regmap structure and the
device *in the driver*. But looking at the internals of regmap functions
in more details, I guess I could have relied on those (they acquire an
internal lock before action).

Cheers,

a+
