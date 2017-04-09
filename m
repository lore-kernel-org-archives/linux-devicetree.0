From: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 22/23] drivers/fsi: Add hub master support
Date: Sun, 9 Apr 2017 16:07:02 -0500
Message-ID: <0abce906-778f-2478-a859-f993cd40988f@linux.vnet.ibm.com>
References: <20170405020607.79939-1-cbostic@linux.vnet.ibm.com>
 <20170405020607.79939-23-cbostic@linux.vnet.ibm.com>
 <8c841062-62e9-77c6-b0c9-e0da73cad3ac@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8c841062-62e9-77c6-b0c9-e0da73cad3ac-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 4/5/17 11:36 AM, Randy Dunlap wrote:
> On 04/04/17 19:06, Christopher Bostic wrote:
>> From: Chris Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
>>
>> Add an engine driver to expose a "hub" FSI master - which has a set of
>> control registers in the engine address space, and uses a chunk of the
>> slave address space for actual FSI communication.
>>
>> Additional changes from Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>.
>>
>> Signed-off-by: Chris Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
>> Signed-off-by: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
>> Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
>> ---
>>   drivers/fsi/Kconfig          |   9 ++
>>   drivers/fsi/Makefile         |   1 +
>>   drivers/fsi/fsi-master-hub.c | 327 +++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 337 insertions(+)
>>   create mode 100644 drivers/fsi/fsi-master-hub.c
>>
>> diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
>> index 0fa265c..e1156b4 100644
>> --- a/drivers/fsi/Kconfig
>> +++ b/drivers/fsi/Kconfig
>> @@ -18,6 +18,15 @@ config FSI_MASTER_GPIO
>>   	---help---
>>   	This option enables a FSI master driver using GPIO lines.
>>   
>> +config FSI_MASTER_HUB
>> +	tristate "FSI hub master"
>> +	depends on FSI
> redundant again.

Will correct.

Thanks,
Chris
>
>> +	---help---
>> +	This option enables a FSI hub master driver.  Hub is a type of FSI
>> +	master that is connected to the upstream master via a slave.  Hubs
>> +	allow chaining of FSI links to an arbitrary depth.  This allows for
>> +	a high target device fanout.
>> +
>>   config FSI_SCOM
>>   	tristate "SCOM FSI client device driver"
>>   	depends on FSI
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
