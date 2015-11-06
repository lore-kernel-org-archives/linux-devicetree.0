From: "Kim, Milo" <milo.kim@ti.com>
Subject: Re: [PATCH RESEND 03/16] Documentation: dt-bindings: hwmon: add TI
 LMU HWMON binding information
Date: Fri, 6 Nov 2015 12:48:06 +0900
Message-ID: <563C22F6.7030906@ti.com>
References: <1446441875-1256-1-git-send-email-milo.kim@ti.com>
 <1446441875-1256-4-git-send-email-milo.kim@ti.com>
 <20151106015757.GA32420@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151106015757.GA32420@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, lee.jones@linaro.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>, lm-sensors@lm-sensors.org
List-Id: devicetree@vger.kernel.org


On 11/6/2015 10:57 AM, Rob Herring wrote:
> On Mon, Nov 02, 2015 at 02:24:22PM +0900, Milo Kim wrote:
>> Hardware fault monitoring driver is used in LM3633 and LM3697 device.
>> Just 'compatible' property is required to describe the driver.
>>
>> Cc: devicetree@vger.kernel.org
>> Cc: Guenter Roeck <linux@roeck-us.net>
>> Cc: Jean Delvare <jdelvare@suse.com>
>> Cc: Lee Jones <lee.jones@linaro.org>
>> Cc: lm-sensors@lm-sensors.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Milo Kim <milo.kim@ti.com>
>
> Acked-by: Rob Herring <robh@kernel.org>

Thanks for your review, Rob.
HWMON maintainer, Guenter suggested moving LMU HWMON driver to MFD as 
the sysfs attributes because it has no sensor data like temperature or 
voltage.
So I'll move this property to mfd/ti-lmu.txt in the next patch.

Best regards,
Milo
