From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH 2/2] hwmon: pwm-fan: Add optional regulator support
Date: Fri, 1 Feb 2019 11:38:06 +0100
Message-ID: <2c05a0dc-6e5a-97a7-bc79-f01275fe956c@i2se.com>
References: <1548781631-5736-1-git-send-email-stefan.wahren@i2se.com>
 <1548781631-5736-2-git-send-email-stefan.wahren@i2se.com>
 <20190131175651.GA16231@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190131175651.GA16231@roeck-us.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Kamil Debski <kamil@wypas.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Guenter,

Am 31.01.19 um 18:56 schrieb Guenter Roeck:
> On Tue, Jan 29, 2019 at 06:07:11PM +0100, Stefan Wahren wrote:
>> This adds optional regulator support to the pwm-fan driver. This is
>> necessary for pwm fans which are powered by a switchable supply.
>>
>> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
>> ---
>>  drivers/hwmon/pwm-fan.c | 35 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 35 insertions(+)
>>
>> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
>> index 2c94482..9e0591e 100644
>> --- a/drivers/hwmon/pwm-fan.c
>> +++ b/drivers/hwmon/pwm-fan.c
>> @@ -23,6 +23,7 @@
>>  #include <linux/of.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/pwm.h>
>> +#include <linux/regulator/consumer.h>
>>  #include <linux/sysfs.h>
>>  #include <linux/thermal.h>
>>  
>> @@ -31,6 +32,7 @@
>>  struct pwm_fan_ctx {
>>  	struct mutex lock;
>>  	struct pwm_device *pwm;
>> +	struct regulator *reg_en;
>>  	unsigned int pwm_value;
>>  	unsigned int pwm_fan_state;
>>  	unsigned int pwm_fan_max_state;
>> @@ -244,6 +246,23 @@ static int pwm_fan_probe(struct platform_device *pdev)
>>  		return ret;
>>  	}
>>  
>> +	ctx->reg_en = devm_regulator_get_optional(&pdev->dev, "fan");
>> +	if (!IS_ERR(ctx->reg_en)) {
> It is customary to handle the error case first.
>
>> +		ret = regulator_enable(ctx->reg_en);
>> +		if (ret)
>> +			dev_err(&pdev->dev,
>> +				"Failed to enable fan supply: %d\n", ret);
>> +	} else {
>> +		switch (PTR_ERR(ctx->reg_en)) {
>> +		case -ENODEV:
>> +		case -ENOSYS:
> Does devm_regulator_get_optional() ever return -ENOSYS ?
> I glanced through other calls to devm_regulator_get_optional(),
> but I don't see that check anywhere.

sorry, i mixed this up with. In case CONFIG_REGULATOR=n we are getting
-ENODEV.

Thanks Stefan
