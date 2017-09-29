From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 17/22] firmware: arm_scmi: add device power domain
 support using genpd
Date: Fri, 29 Sep 2017 14:40:49 +0100
Message-ID: <68c18868-99c5-20e0-d65e-6ad1afdedde5@arm.com>
References: <1506604306-20739-1-git-send-email-sudeep.holla@arm.com>
 <1506604306-20739-18-git-send-email-sudeep.holla@arm.com>
 <CAPDyKFo0oFrtGgb9REX-y3mAgQ7pTFnyD6ZcqwhEZ7oSRfV4oA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPDyKFo0oFrtGgb9REX-y3mAgQ7pTFnyD6ZcqwhEZ7oSRfV4oA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, ALKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Roy Franz <roy.franz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Harb Abdulhamid <harba-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>, Ryan Harkin <Ryan.Harkin-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 28/09/17 22:18, Ulf Hansson wrote:
> On 28 September 2017 at 15:11, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>> This patch hooks up the support for device power domain provided by
>> SCMI using the Linux generic power domain infrastructure.
>>
>> Cc: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>> Cc: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
>> ---
>>  drivers/firmware/Kconfig                   |  13 +++
>>  drivers/firmware/arm_scmi/Makefile         |   1 +
>>  drivers/firmware/arm_scmi/scmi_pm_domain.c | 134 +++++++++++++++++++++++++++++
>>  3 files changed, 148 insertions(+)
>>  create mode 100644 drivers/firmware/arm_scmi/scmi_pm_domain.c
>>

[...]

>> +       for (i = 0; i < num_domains; i++, scmi_pd++) {
>> +               domains[i] = &scmi_pd->genpd;
>> +
>> +               scmi_pd->domain = i;
>> +               scmi_pd->handle = handle;
>> +               scmi_pd->name = handle->power_ops->name_get(handle, i);
>> +               scmi_pd->genpd.name = scmi_pd->name;
>> +               scmi_pd->genpd.power_off = scmi_pd_power_off;
>> +               scmi_pd->genpd.power_on = scmi_pd_power_on;
>> +
>> +               /*
>> +                * Treat all power domains as off at boot.
>> +                *
>> +                * The SCP firmware itself may have switched on some domains,
>> +                * but for reference counting purpose, keep it this way.
>> +                */
> 
> I think it would be better to give the correct information about the
> state of the PM domain. Otherwise genpd may end up thinking a PM
> domain is off, while in fact it's on - thus wasting power.
> 

Agreed, I missed to notice that. I will fixup and send the update.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
