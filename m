From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v5 03/20] firmware: arm_scmi: add basic driver
 infrastructure for SCMI
Date: Thu, 11 Jan 2018 14:56:12 +0000
Message-ID: <63af0db6-4d78-aa86-cf96-1ad33a5ed604@arm.com>
References: <1514904162-11201-1-git-send-email-sudeep.holla@arm.com>
 <1514904162-11201-4-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1514904162-11201-4-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: ALKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Roy Franz <roy.franz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Harb Abdulhamid <harba-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Alexey Klimov <klimov.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ryan Harkin <Ryan.Harkin-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 02/01/18 14:42, Sudeep Holla wrote:
> The SCMI is intended to allow OSPM to manage various functions that are
> provided by the hardware platform it is running on, including power and
> performance functions. SCMI provides two levels of abstraction, protocols
> and transports. Protocols define individual groups of system control and
> management messages. A protocol specification describes the messages
> that it supports. Transports describe the method by which protocol
> messages are communicated between agents and the platform.
> 
> This patch adds basic infrastructure to manage the message allocation,
> initialisation, packing/unpacking and shared memory management.
> 

Any chance you could review patches 3-14 ? All the drivers (15-20) are
already acked by the maintainer. I know it's late for v4.16, I want it
to be ready for v4.17 ASAP. It's on the list without much progress for
few months now :(, hence the push. Sorry for the nag.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
