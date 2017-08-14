From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 16/18] hwmon: add support for sensors exported via ARM
 SCMI
Date: Mon, 14 Aug 2017 16:09:18 +0100
Message-ID: <c695dc09-fc28-518f-f287-bf74e0a2f87e@arm.com>
References: <1501857104-11279-1-git-send-email-sudeep.holla@arm.com>
 <1501857104-11279-17-git-send-email-sudeep.holla@arm.com>
 <20170804193231.GA18153@roeck-us.net>
 <20e0a388-79a1-a7f1-57b4-fa5993eed9bf@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20e0a388-79a1-a7f1-57b4-fa5993eed9bf-5wv7dgnIgG8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, ALKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Roy Franz <roy.franz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Harb Abdulhamid <harba-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>, Ryan Harkin <Ryan.Harkin-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Guenter,

On 07/08/17 13:25, Sudeep Holla wrote:
> 
> 
> On 04/08/17 20:32, Guenter Roeck wrote:
>> On Fri, Aug 04, 2017 at 03:31:42PM +0100, Sudeep Holla wrote:
> 
> [...]
> 
>>> +	platform_set_drvdata(pdev, scmi_sensors);
>>> +
>>> +	hwdev = devm_hwmon_device_register_with_groups(dev, "scmi_sensors",
>>> +						       scmi_sensors,
>>> +						       scmi_sensors->groups);
>>
>> Can you rework this to use devm_hwmon_device_register_with_info(),
>> and if possible let it handle the thermal registration ? 
>>
> 
> Thanks for the pointers. I will check on the possibility and use it if
> possible.
> 

I had a look at devm_hwmon_device_register_with_info. It mostly deals
with constant structures where all the attributes are known at the boot
time. In case of SCMI, the firmware presents all the sensors and all the
information(type, scale, name/label, ...etc). Unless I create those
structures dynamically and typecast as const during probe, I can't get
it working. Are you OK with that ? If so, I can try making those changes.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
