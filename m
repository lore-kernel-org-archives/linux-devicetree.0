From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 2/3] iio: adc: ina3221: Add support for IIO ADC driver
 for TI INA3221
Date: Fri, 3 Jun 2016 17:01:00 +0530
Message-ID: <57516A74.4060008@nvidia.com>
References: <1464784454-7988-1-git-send-email-ldewangan@nvidia.com> <1464784454-7988-2-git-send-email-ldewangan@nvidia.com> <44e28639-67b6-7586-5e6d-c0180ccded79@kernel.org> <20f70b31-afb5-e012-0baf-ba0b83ac6d36@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-hwmon-owner@vger.kernel.org>
In-Reply-To: <20f70b31-afb5-e012-0baf-ba0b83ac6d36@kernel.org>
Sender: linux-hwmon-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, robh+dt@kernel.org, corbet@lwn.net, lars@metafoo.de
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-iio@vger.kernel.org, linux-hwmon@vger.kernel.org, Jean Delvare <khali@linux-fr.org>, Guenter Roeck <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org


On Friday 03 June 2016 03:46 PM, Jonathan Cameron wrote:
> On 03/06/16 11:06, Jonathan Cameron wrote:
>>
>> Code looks good, bu these more fundamental bits need sorting.
> Another minor point - why do the power calculations in driver?
> no hardware support for it, so why not just leave it to userspace?

Device supports the bus and shunt voltage monitoring. So even no 
current. Also the warning/critical limit is for the voltage across shunt.

So should we only expose the shunt/bus voltage, no power/current?

I am thinking that user space should not know the platform and hence 
shunt resistance and so exposing the current and power on bus is better 
option.


