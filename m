From: Neelesh Gupta <neelegup-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3] rtc/tpo: Driver to support rtc and wakeup on PowerNV
 platform
Date: Mon, 17 Nov 2014 11:32:38 +0530
Message-ID: <54698F7E.6090300@linux.vnet.ibm.com>
References: <20141014083447.7505.89771.stgit@localhost.localdomain> <54476F4B.8050108@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54476F4B.8050108-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org
Cc: benh-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 10/22/2014 02:18 PM, Neelesh Gupta wrote:
>
> On 10/14/2014 02:08 PM, Neelesh Gupta wrote:
>> The patch implements the OPAL rtc driver that binds with the rtc
>> driver subsystem. The driver uses the platform device infrastructure
>> to probe the rtc device and register it to rtc class framework. The
>> 'wakeup' is supported depending upon the property 'has-tpo' present
>> in the OF node. It provides a way to load the generic rtc driver in
>> in the absence of an OPAL driver.
>>
>> The patch also moves the existing OPAL rtc get/set time interfaces to 
>> the
>> new driver and exposes the necessary OPAL calls using EXPORT_SYMBOL_GPL.
>
> Hi Alessandro,
>
> Awaiting Ack from your side, so that we can take this through the 
> powerpc tree.

Hi Alessandro,

Please acknowledge..

- Neelesh

>
> Regards,
> Neelesh
>
>>
>> Test results:
>> -------------
>> Host:
>> [root@tul169p1 ~]# ls -l /sys/class/rtc/
>> total 0
>> lrwxrwxrwx 1 root root 0 Oct 14 03:07 rtc0 -> 
>> ../../devices/opal-rtc/rtc/rtc0
>> [root@tul169p1 ~]# cat /sys/devices/opal-rtc/rtc/rtc0/time
>> 08:10:07
>> [root@tul169p1 ~]# echo `date '+%s' -d '+ 2 minutes'` > 
>> /sys/class/rtc/rtc0/wakealarm
>> [root@tul169p1 ~]# cat /sys/class/rtc/rtc0/wakealarm
>> 1413274345
>> [root@tul169p1 ~]#
>>
>> FSP:
>> $ smgr mfgState
>> standby
>> $ rtim timeofday
>>
>> System time is valid: 2014/10/14 08:12:04.225115
>>
>> $ smgr mfgState
>> ipling
>> $
>>
>> Signed-off-by: Neelesh Gupta <neelegup-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
>> ---
>>
>> Changes in v3
>> =============
>> - Rebased to the latest tree.
>>
>> Changes in v2
>> =============
>> - Added Documentation/devicetree/bindings/rtc/rtc-opal.txt
>> - Explicitly turn off RTC_UIE mode by setting 'rtc->uie_unsupported'
>>
>>   Documentation/devicetree/bindings/rtc/rtc-opal.txt |   16 +
>>   arch/powerpc/include/asm/opal.h                    |    7 -
>>   arch/powerpc/kernel/time.c                         |    1
>>   arch/powerpc/platforms/powernv/opal-async.c        |    3
>>   arch/powerpc/platforms/powernv/opal-rtc.c          |   65 +----
>>   arch/powerpc/platforms/powernv/opal-wrappers.S     |    2
>>   arch/powerpc/platforms/powernv/opal.c              |    6
>>   arch/powerpc/platforms/powernv/setup.c             |    2
>>   drivers/rtc/Kconfig                                |   11 +
>>   drivers/rtc/Makefile                               |    1
>>   drivers/rtc/rtc-opal.c                             |  261 
>> ++++++++++++++++++++
>>   11 files changed, 325 insertions(+), 50 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/rtc/rtc-opal.txt
>>   create mode 100644 drivers/rtc/rtc-opal.c
>>
>
> _______________________________________________
> Linuxppc-dev mailing list
> Linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/linuxppc-dev

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
