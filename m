From: Eddie James <eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/7] drivers/hwmon: Add On-Chip Controller (OCC) hwmon
 driver
Date: Fri, 23 Jun 2017 08:38:50 -0500
Message-ID: <4d77d0b7-d7eb-d62f-a10e-63dde83bd407@linux.vnet.ibm.com>
References: <1498171716-26620-1-git-send-email-eajames@linux.vnet.ibm.com>
 <7806f15f-a594-2cfb-777a-29f1e8a3fd97@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7806f15f-a594-2cfb-777a-29f1e8a3fd97-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jdelvare-IBi9RG/b67k@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, "Edward A. James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 06/22/2017 11:52 PM, Guenter Roeck wrote:
> On 06/22/2017 03:48 PM, Eddie James wrote:
>> From: "Edward A. James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
>>
>> This series adds a hwmon driver to support the OCC on POWER8 and POWER9
>> processors. The OCC is an embedded processor that provides realtime 
>> power and
>> thermal monitoring and management.
>>
>> This driver has two different platform drivers as a "base" for the
>> hwmon stuff, as the means of communicating with the OCC on P8 and P9 is
>> completely different. For P8, the driver is an I2C client driver. For 
>> P9 the
>> driver is an FSI-based OCC client driver, and uses the OCC driver 
>> in-kernel
>> API.
>>
>> There was a previous version of this driver that wasn't written with the
>> differences in communication methods between the two versions in 
>> mind. This
>> driver has been considerably simplified.
>>
>
> I thought I did see this before.
>
> It is customary to use "v2" in such situations, and add a change log.
> You expect me to go into the two versions and compare them to figure
> out what changed to evaluate if it makes sense. Do you really believe 
> that
> I have enough time to do that, and that I would be willing to spend that
> time in the first place ?
>
> Presumably you know what changed. Why not just tell me ?

Hi,

This driver does not build upon the previous patch set at all, so I 
didn't mark it as a v2. It is completely rewritten from scratch. I sent 
a note saying that the previous patch set was abandoned. There may be 
some similarities with the previous one, simply because the drivers do 
the same thing, but I don't think there is any need to compare it with 
the old driver I mailed out.

Thanks for your time,
Eddie

>
> Guenter
>
>> Edward A. James (7):
>>    drivers/hwmon: Add On-Chip Controller (OCC) hwmon driver
>>    drivers/hwmon/occ: Add command transport method for P8 and P9
>>    drivers/hwmon/occ: Parse OCC poll response
>>    drivers/hwmon/occ: Add sensor types and versions
>>    drivers/hwmon/occ: Add sensor attributes and register hwmon device
>>    drivers/hwmon/occ: Add non-hwmon attributes
>>    drivers/hwmon/occ: Add error handling
>>
>>   Documentation/ABI/testing/sysfs-driver-occ-hwmon   |   77 ++
>>   .../devicetree/bindings/fsi/ibm,p9-occ-hwmon.txt   |   18 +
>>   .../devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt   |   25 +
>>   Documentation/hwmon/occ                            |   84 ++
>>   drivers/hwmon/Kconfig                              |    2 +
>>   drivers/hwmon/Makefile                             |    1 +
>>   drivers/hwmon/occ/Kconfig                          |   28 +
>>   drivers/hwmon/occ/Makefile                         |   11 +
>>   drivers/hwmon/occ/common.c                         | 1242 
>> ++++++++++++++++++++
>>   drivers/hwmon/occ/common.h                         |  151 +++
>>   drivers/hwmon/occ/p8_i2c.c                         |  250 ++++
>>   drivers/hwmon/occ/p9_sbe.c                         |  144 +++
>>   12 files changed, 2033 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-driver-occ-hwmon
>>   create mode 100644 
>> Documentation/devicetree/bindings/fsi/ibm,p9-occ-hwmon.txt
>>   create mode 100644 
>> Documentation/devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt
>>   create mode 100644 Documentation/hwmon/occ
>>   create mode 100644 drivers/hwmon/occ/Kconfig
>>   create mode 100644 drivers/hwmon/occ/Makefile
>>   create mode 100644 drivers/hwmon/occ/common.c
>>   create mode 100644 drivers/hwmon/occ/common.h
>>   create mode 100644 drivers/hwmon/occ/p8_i2c.c
>>   create mode 100644 drivers/hwmon/occ/p9_sbe.c
>>
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
