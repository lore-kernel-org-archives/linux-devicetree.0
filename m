From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC PATCH 2/8] firmware: arm_scmi: add basic driver
 infrastructure for SCMI
Date: Thu, 8 Jun 2017 10:28:17 +0100
Message-ID: <5310ae30-72b8-1dee-2b20-4759fad8b636@arm.com>
References: <1496851812-19623-1-git-send-email-sudeep.holla@arm.com>
 <1496851812-19623-3-git-send-email-sudeep.holla@arm.com>
 <CAKWsp+xR_1u2zrG=-dSzSktRvrr2Nfp50Hxur_YEFgr6oQ7KZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKWsp+xR_1u2zrG=-dSzSktRvrr2Nfp50Hxur_YEFgr6oQ7KZQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roy Franz <rfranz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Roy Franz <roy.franz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Harb Abdulhamid <harba-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Roy,

On 07/06/17 20:18, Roy Franz wrote:
> On Wed, Jun 7, 2017 at 9:10 AM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>> The SCMI is intended to allow OSPM to manage various functions that are
>> provided by the hardware platform it is running on, including power and
>> performance functions. SCMI provides two levels of abstraction, protocols
>> and transports. Protocols define individual groups of system control and
>> management messages. A protocol specification describes the messages
>> that it supports. Transports describe the method by which protocol
>> messages are communicated between agents and the platform.
>>
>> This patch adds basic infrastructure to manage the message allocation,
>> initialisation, packing/unpacking and shared memory management.
>>
>> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
>> ---
>>  drivers/firmware/Kconfig           |  21 ++
>>  drivers/firmware/Makefile          |   1 +
>>  drivers/firmware/arm_scmi/Makefile |   2 +
>>  drivers/firmware/arm_scmi/common.h |  74 ++++
>>  drivers/firmware/arm_scmi/driver.c | 737 +++++++++++++++++++++++++++++++++++++
>>  include/linux/scmi_protocol.h      |  48 +++
>>  6 files changed, 883 insertions(+)
>>  create mode 100644 drivers/firmware/arm_scmi/Makefile
>>  create mode 100644 drivers/firmware/arm_scmi/common.h
>>  create mode 100644 drivers/firmware/arm_scmi/driver.c
>>  create mode 100644 include/linux/scmi_protocol.h
>>

[...]

>> +
>> +#define client_to_scmi_info(c) container_of(c, struct scmi_info, cl)
>> +#define handle_to_scmi_info(h) container_of(h, struct scmi_info, handle)
>> +
>> +/*
>> + * The SCP firmware only executes in little-endian mode, so any buffers
>> + * shared through SCMI should have their contents converted to little-endian
>> + */
> 
> nit:
> This really has more to do with the SCMI protocol defining everything
> as little endian, rather the endian-ness of the SCP, right?  There could be SCP
> implementations that are not Cortex M3s or little endian.
> 

Thanks for taking time to review this RFC, much appreciated. All valid
points(on this and other patches) and fixed locally now. Also thanks for
saving time in debugging these issues. I should be able to do some
testing next week.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
