From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 18/22] clk: add support for clocks provided by SCMI
Date: Thu, 2 Nov 2017 10:04:45 +0000
Message-ID: <c0b80daf-6361-87eb-fde6-a9d6a71e3e82@arm.com>
References: <1506604306-20739-1-git-send-email-sudeep.holla@arm.com>
 <1506604306-20739-19-git-send-email-sudeep.holla@arm.com>
 <20171102072350.GO30645@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171102072350.GO30645-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, ALKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Roy Franz <roy.franz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Harb Abdulhamid <harba-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>, Ryan Harkin <Ryan.Harkin-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 02/11/17 07:23, Stephen Boyd wrote:
> On 09/28, Sudeep Holla wrote:
>> On some ARM based systems, a separate Cortex-M based System Control
>> Processor(SCP) provides the overall power, clock, reset and system
>> control. System Control and Management Interface(SCMI) Message Protocol
>> is defined for the communication between the Application Cores(AP)
>> and the SCP.
>>
>> This patch adds support for the clocks provided by SCP using SCMI
>> protocol.
>>
>> Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>> Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
>> ---
> 
> Acked-by: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> 

Thanks

>>  MAINTAINERS            |   2 +-
>>  drivers/clk/Kconfig    |  10 +++
>>  drivers/clk/Makefile   |   1 +
>>  drivers/clk/clk-scmi.c | 210 +++++++++++++++++++++++++++++++++++++++++++++++++
>>  4 files changed, 222 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/clk/clk-scmi.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 23ec3471f542..32c184391aee 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -12941,7 +12941,7 @@ M:	Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
>>  L:	linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>>  S:	Maintained
>>  F:	Documentation/devicetree/bindings/arm/arm,sc[mp]i.txt
>> -F:	drivers/clk/clk-scpi.c
>> +F:	drivers/clk/clk-sc[mp]i.c
> 
> Is there a lot of copy/paste going on from clk-scpi.c? Maybe it
> could be consolidated?
> 

Not much apart from the usual driver skeleton. Also SCPI specification
will not be enhanced any further while SCMI will be. So they will
deviated in the feature set going further. Even I was thinking of
merging then together initially but based on some WIP changes to the
specification, I thought it may not be good idea. But if we think it can
be merged in future , I will do that for sure(for easy maintenance)

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
