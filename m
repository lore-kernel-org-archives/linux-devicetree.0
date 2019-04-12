From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH V5 3/3] hwmon: pwm-fan: Add RPM support via external
 interrupt
Date: Fri, 12 Apr 2019 13:07:40 +0200
Message-ID: <019733e8-6b12-f5c1-e251-fd7eabe2891b@i2se.com>
References: <1554989411-23666-1-git-send-email-stefan.wahren@i2se.com>
 <1554989411-23666-4-git-send-email-stefan.wahren@i2se.com>
 <20190411165742.GA29395@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411165742.GA29395@roeck-us.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Kamil Debski <kamil@wypas.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Robin Murphy <robin.murphy@arm.com>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11.04.19 18:57, Guenter Roeck wrote:
> On Thu, Apr 11, 2019 at 03:30:11PM +0200, Stefan Wahren wrote:
>>  
>> -ATTRIBUTE_GROUPS(pwm_fan);
>> +static umode_t pwm_fan_attrs_visible(struct kobject *kobj, struct attribute *a,
>> +				     int n)
>> +{
>> +	struct device *dev = container_of(kobj, struct device, kobj);
>> +	struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
>> +	struct device_attribute *devattr;
>> +
>> +	/* Hide fan_input in case no interrupt is available  */
>> +	devattr = container_of(a, struct device_attribute, attr);
> Field day for static analyzers - devattr is no longer used.
> No need to resend. I'll let the series rest for a couple of days
> and then apply to hwmon-next (after removing devattr) unless there are
> additional comments.
>
Thank you

Stefan
