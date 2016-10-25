From: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH/RFT v2 11/17] USB: OHCI: make ohci-da8xx a separate driver
Date: Tue, 25 Oct 2016 18:21:42 +0200
Message-ID: <CAKXjFTM8RwsAut8cD0n0foxueSjR4VB4k4WJizXo9SyaW3viOA@mail.gmail.com>
References: <20161024164634.4330-1-ahaslam@baylibre.com> <20161024164634.4330-12-ahaslam@baylibre.com>
 <403743d8-dff2-3389-105b-1082b674b0b8@lechnology.com> <CAKXjFTPvEXPRyq0HZiF7mcHWFaFoH7MjFqEKnTyuSCUOB=U7Aw@mail.gmail.com>
 <21019d11-3b01-3e0e-60bc-c4873cf20237@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <21019d11-3b01-3e0e-60bc-c4873cf20237-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Cc: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Sergei Shtylyov <sshtylyov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>, manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 25, 2016 at 6:12 PM, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org> wrote:
> On 10/25/2016 02:39 AM, Axel Haslam wrote:
>>
>> On Tue, Oct 25, 2016 at 2:38 AM, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
>> wrote:
>>>
>>> On 10/24/2016 11:46 AM, ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org wrote:
>>>>
>>>>
>>>> -#ifndef CONFIG_ARCH_DAVINCI_DA8XX
>>>> -#error "This file is DA8xx bus glue.  Define
>>>> CONFIG_ARCH_DAVINCI_DA8XX."
>>>> -#endif
>>>> +#include "ohci.h"
>>>> +
>>>> +#define DRIVER_DESC "OHCI DA8XX driver"
>>>> +
>>>> +static const char hcd_name[] = "ohci-da8xx";
>>>
>>>
>>>
>>> why static const char instead of #define? This is only used one time in a
>>> pr_info, so it seems kind of pointless anyway.
>>
>>
>> Other drivers are using static const for the same variable.
>> i think static const is preferred over #define because #define doet give a
>> type.
>> If you dont mind ill keep it static const.
>>
>
> If this string was used in this file more than one place, I would agree with
> you, but currently it is only used as the argument of a pr_info(). The
> string "ohci-da8xx" could just be included in the fmt string instead of
> using "%s".

I think the purpose was to use it in the .name of the platform_driver
structure, too. only that not everybody is doing that, i looked at some bad
 examples :(

would you agree to keep it if we use it in .name too?

-Axel

>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
