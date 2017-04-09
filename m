From: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 21/23] drivers/fsi: Add SCOM FSI client device driver
Date: Sun, 9 Apr 2017 16:06:28 -0500
Message-ID: <90dac991-03db-614e-09f6-ab55b8db79be@linux.vnet.ibm.com>
References: <20170405020607.79939-1-cbostic@linux.vnet.ibm.com>
 <20170405020607.79939-22-cbostic@linux.vnet.ibm.com>
 <bddbb80e-10b6-fbb9-152a-6e192dfe0745@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bddbb80e-10b6-fbb9-152a-6e192dfe0745-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, "Edward A . James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 4/5/17 11:35 AM, Randy Dunlap wrote:
> On 04/04/17 19:06, Christopher Bostic wrote:
>> From: Chris Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
>>
>> Create a simple SCOM engine device driver that reads and writes
>> its control registers via an FSI bus.
>>
>> Includes changes from Edward A. James <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>.
>>
>> Signed-off-by: Chris Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
>> Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
>> Signed-off-by: Edward A. James <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
>> ---
>>   drivers/fsi/Kconfig    |   6 ++
>>   drivers/fsi/Makefile   |   1 +
>>   drivers/fsi/fsi-scom.c | 263 +++++++++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 270 insertions(+)
>>   create mode 100644 drivers/fsi/fsi-scom.c
>>
>> diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
>> index 9cf8345..0fa265c 100644
>> --- a/drivers/fsi/Kconfig
>> +++ b/drivers/fsi/Kconfig
>> @@ -18,6 +18,12 @@ config FSI_MASTER_GPIO
>>   	---help---
>>   	This option enables a FSI master driver using GPIO lines.
>>   
>> +config FSI_SCOM
>> +	tristate "SCOM FSI client device driver"
>> +	depends on FSI
> depends on FSI is redundant.

Will correct.

Thanks,
Chris
>
>> +	---help---
>> +	This option enables an FSI based SCOM device driver.
>> +
>>   endif
>>   
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
