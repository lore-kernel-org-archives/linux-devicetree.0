From: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 19/23] drivers/fsi: Add GPIO based FSI master
Date: Sun, 9 Apr 2017 16:04:59 -0500
Message-ID: <518e0abc-f1da-2ca0-fa44-6802e2b74c71@linux.vnet.ibm.com>
References: <20170405020607.79939-1-cbostic@linux.vnet.ibm.com>
 <20170405020607.79939-20-cbostic@linux.vnet.ibm.com>
 <5d173f9c-e01c-6093-16ab-d114857009b2@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5d173f9c-e01c-6093-16ab-d114857009b2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, "Edward A . James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 4/5/17 11:35 AM, Randy Dunlap wrote:
> On 04/04/17 19:06, Christopher Bostic wrote:
>> From: Chris Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
>>
>> Implement a FSI master using GPIO.  Will generate FSI protocol for
>> read and write commands to particular addresses.  Sends master command
>> and waits for and decodes a slave response.
>>
>> Includes changes from Edward A. James <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org> and Jeremy
>> Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>.
>>
>> Signed-off-by: Edward A. James <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
>> Signed-off-by: Chris Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
>> Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
>> ---
>>   drivers/fsi/Kconfig           |  11 +
>>   drivers/fsi/Makefile          |   1 +
>>   drivers/fsi/fsi-master-gpio.c | 610 ++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 622 insertions(+)
>>   create mode 100644 drivers/fsi/fsi-master-gpio.c
>>
>> diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
>> index 04c1a0e..9cf8345 100644
>> --- a/drivers/fsi/Kconfig
>> +++ b/drivers/fsi/Kconfig
>> @@ -9,4 +9,15 @@ config FSI
>>   	---help---
>>   	  FSI - the FRU Support Interface - is a simple bus for low-level
>>   	  access to POWER-based hardware.
>> +
>> +if FSI
>> +
>> +config FSI_MASTER_GPIO
>> +	tristate "GPIO-based FSI master"
>> +	depends on FSI && GPIOLIB
> depends on FSI is redundant since "if FSI" does the same thing.

Hi Randy,
Thanks for the feedback, will correct.

-Chris
>> +	---help---
>> +	This option enables a FSI master driver using GPIO lines.
>> +
>> +endif
>> +
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
