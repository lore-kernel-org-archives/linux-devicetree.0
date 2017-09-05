From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 05/18] firmware: arm_scmi: add initial support for
 performance protocol
Date: Tue, 5 Sep 2017 17:54:43 +0100
Message-ID: <b7303424-d63f-5ea7-866a-bda6d1f93ff2@arm.com>
References: <1501857104-11279-1-git-send-email-sudeep.holla@arm.com>
 <1501857104-11279-6-git-send-email-sudeep.holla@arm.com>
 <2690239b-27a7-dce3-88a6-d53808e8e93c@arm.com>
 <534bae20-9f80-e79b-42a5-93d838732720@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <534bae20-9f80-e79b-42a5-93d838732720-5wv7dgnIgG8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Julien Thierry <julien.thierry-5wv7dgnIgG8@public.gmane.org>, ALKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Harb Abdulhamid <harba-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ryan Harkin <Ryan.Harkin-5wv7dgnIgG8@public.gmane.org>, Roy Franz <roy.franz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Julien,

On 05/09/17 16:56, Julien Thierry wrote:
> 
> 
> On 05/09/17 16:04, Julien Thierry wrote:

[...]


>>
>> This seems odd, shouldn't it be the following?
>> le64_to_cpu(attr->stats_addr_low | (__le64)attr->stats_addr_high << 32)
>>
> 
> After further reflexion, I think you are right. If I understood the
> specification, the address seems to be split into upper and lower 32bits
> and each one is stored as a uint32, which fits what you are doing to
> obtain the address.
> 
> You can ignore my previous comment.
> 

Sorry I am checking this bit late, you have figured out yourself
already. All the 64 bit values need to be dealt similarly as SCMI
specification restricts so. It's basically done so as the firmware
running is mostly 32-bit little endian system.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
