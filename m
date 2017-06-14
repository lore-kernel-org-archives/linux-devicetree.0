From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] soc: brcmstb: Add driver for DPFE
Date: Wed, 14 Jun 2017 14:32:54 -0700
Message-ID: <79cb33fc-cc6a-e79c-5e5c-af632e20dc76@gmail.com>
References: <20170613223710.31719-1-code@mmayer.net>
 <20170613223710.31719-3-code@mmayer.net>
 <5b79dee6-bb84-30b3-1bb2-287b24d42534@gmail.com>
 <CANEuBv6N3TTNzSuDQXk-eiEV_fvGtVJZhdWUO_XdgPj6+j7q5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CANEuBv6N3TTNzSuDQXk-eiEV_fvGtVJZhdWUO_XdgPj6+j7q5A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Markus Mayer <code-7CzEARzsJhSsTnJN9+BGXg@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Markus Mayer <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Broadcom Kernel List <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Device Tree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/14/2017 09:34 AM, Markus Mayer wrote:
> On 13 June 2017 at 17:03, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hi Markus,
>>
>> On 06/13/2017 03:37 PM, Markus Mayer wrote:
>>> From: Markus Mayer <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>>
>>> This driver allows access to DRAM properties, such as the refresh rate,
>>> via the Broadcom STB DDR PHY Front End (DPFE). The refresh rate can be
>>> used as indirect indicator of the DRAM temperature.
>>>
>>> The driver also allows setting of the sampling interval.
>>>
>>> Signed-off-by: Markus Mayer <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>> ---
>>>  MAINTAINERS                      |   8 +
>>>  drivers/soc/bcm/brcmstb/Makefile |   2 +-
>>>  drivers/soc/bcm/brcmstb/dpfe.c   | 689 +++++++++++++++++++++++++++++++++++++++
>>>  3 files changed, 698 insertions(+), 1 deletion(-)
>>>  create mode 100644 drivers/soc/bcm/brcmstb/dpfe.c
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index f7d568b..04f0be6 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -2864,6 +2864,14 @@ S:     Maintained
>>>  F:   Documentation/devicetree/bindings/cpufreq/brcm,stb-avs-cpu-freq.txt
>>>  F:   drivers/cpufreq/brcmstb*
>>>
>>> +BROADCOM STB SOC DPFE DRIVER
>>> +M:   Markus Mayer <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>> +M:   bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
>>> +L:   linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org (moderated for non-subscribers)
>>> +S:   Maintained
>>> +F:   Documentation/devicetree/bindings/soc/bcm/brcm,dpfe-cpu.txt
>>> +F:   drivers/misc/brcmstb-dpfe.c
>>
>> Just one nit: this should be drivers/soc/bcm/brcmstb/dpfe.c, other than
>> that, I just need an Ack from Rob on the binding, and I will queue this
>> up, thanks!
> 
> Oops. Thanks for catching that. Would you like me to re-send or will
> you fix up that path on your end?

I can fix it up if Rob is happy with the current binding, if you need to
resubmit, please fix that as well. Thanks!
-- 
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
