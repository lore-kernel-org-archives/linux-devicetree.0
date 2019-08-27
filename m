From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/2] hwmon: Add Synaptics AS370 PVT sensor driver
Date: Mon, 26 Aug 2019 20:51:42 -0700
Message-ID: <e0bfae1c-07f5-f907-0003-2c2f959e8099@roeck-us.net>
References: <20190826174942.2b28ff05@xhacker.debian>
 <20190826175029.433632f6@xhacker.debian>
 <35b05950-4a72-9e00-50ab-ecd0a7e759a4@roeck-us.net>
 <20190827105110.0be8d669@xhacker.debian>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190827105110.0be8d669@xhacker.debian>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 8/26/19 8:02 PM, Jisheng Zhang wrote:
> Hi Guenter,
> 
> On Mon, 26 Aug 2019 06:44:34 -0700 Guenter Roeck wrote:
> 
>>
>>
>> On 8/26/19 3:01 AM, Jisheng Zhang wrote:
>>> Add a new driver for Synaptics AS370 PVT sensors. Currently, only
>>> temperature is supported.
>>>
>>> Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
>>> ---
>>>    drivers/hwmon/Kconfig       |  10 +++
>>>    drivers/hwmon/Makefile      |   1 +
>>>    drivers/hwmon/as370-hwmon.c | 158 ++++++++++++++++++++++++++++++++++++
>>>    3 files changed, 169 insertions(+)
>>>    create mode 100644 drivers/hwmon/as370-hwmon.c
>>>
>>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>>> index 650dd71f9724..d31610933faa 100644
>>> --- a/drivers/hwmon/Kconfig
>>> +++ b/drivers/hwmon/Kconfig
>>> @@ -246,6 +246,16 @@ config SENSORS_ADT7475
>>>          This driver can also be built as a module. If so, the module
>>>          will be called adt7475.
>>>
>>> +config SENSORS_AS370
>>> +     tristate "Synaptics AS370 SoC hardware monitoring driver"
>>
>> I think this needs "depends on HAS_IOMEM".
> 
> HWMON depends on HAS_IOMEM, so the dependency has been required
> by the common HWMON, we don't need it here.
> 

This is so wrong :-(. As if I2C or SPI based sensor chips would
require iomem. Oh well, no one complained in 12+ years, so I guess
we are "fine", at least for the time being.

Thanks for noticing.

Guenter
