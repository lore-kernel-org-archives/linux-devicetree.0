From: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH 3/9] Input: pixcir_i2c_ts: Initialize interrupt mode and
 power mode
Date: Thu, 19 Dec 2013 11:27:13 +0530
Message-ID: <52B28AB9.5080405@ti.com>
References: <1387358480-8313-1-git-send-email-rogerq@ti.com> <1387358480-8313-4-git-send-email-rogerq@ti.com> <20131218141408.GC28504@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <20131218141408.GC28504@core.coreip.homeip.net>
Sender: linux-input-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: rydberg@euromail.se, jcbian@pixcir.com.cn, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12/18/2013 07:44 PM, Dmitry Torokhov wrote:
> On Wed, Dec 18, 2013 at 02:51:14PM +0530, Roger Quadros wrote:
>> +
>> +static int pixcir_stop(struct pixcir_i2c_ts_data *ts)
>> +{
>> +	struct device *dev = &ts->client->dev;
>> +	int ret;
>> +
>> +	/* disable interrupt generation */
>> +	ret = pixcir_int_enable(ts, 0);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to disable interrupt generation\n");
>> +		return ret;
>> +	}
>> +
>> +	disable_irq(ts->client->irq);
> 
> Why do you need to disable IRQ? If you disable interrupt generation in
> the chip I think you only need to call synchronize_irq() to make sure
> it's completed if it happens to be running. Also you need to move the
> code:

Agreed, no need to call disable_irq().

> 
> 	tsdata->exiting = true;
> 	mb();
> 
> here from pixcir_i2c_ts_remove() to make sure handler exits promptly.
> 
> You will also need to reset tsdata->exiting in your start method.
> 

OK.

cheers,
-roger
