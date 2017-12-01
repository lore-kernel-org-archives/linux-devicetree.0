From: Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>
Subject: Re: [PATCH v4 3/8] MIPS: Octeon: Add a global resource manager.
Date: Sat, 2 Dec 2017 00:33:30 +0100
Message-ID: <CAOFm3uGm3qo5yzb7vhi=5CnLUNw01abMc0uY3WF-Nc6-8=brWg@mail.gmail.com>
References: <20171129005540.28829-1-david.daney@cavium.com>
 <20171129005540.28829-4-david.daney@cavium.com> <20171130225333.GI27409@jhogan-linux.mipstec.com>
 <CAOFm3uGhRTTrvygBd0dMdzWZQC5kFi8yXuWQsnhDvDLtW2z7aA@mail.gmail.com>
 <99dd185d-6e5d-f474-90aa-ebee63045c42@caviumnetworks.com> <CAOFm3uEy52yog4H_Hco0X+OHF5yiHUZYAHaGz4MefKcYQz3LUg@mail.gmail.com>
 <2ac5ec17-cedb-5dd8-6ea7-f065025639a9@caviumnetworks.com> <CAOFm3uHSp3ziQ-h1-V9uz07+jiixpgoUB9UZV82fOkrMBk8aZQ@mail.gmail.com>
 <1c34c7f5-4237-0fca-e871-ee18c262a3f3@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1c34c7f5-4237-0fca-e871-ee18c262a3f3-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Carlos Munoz <cmunoz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Steven J. Hill" <steven.hill-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, James Hogan <james.hogan-8NJIiSa5LzA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 1, 2017 at 9:56 PM, David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org> wrote:
> On 12/01/2017 12:41 PM, Philippe Ombredanne wrote:
>>
>> David,
>>
>> On Fri, Dec 1, 2017 at 9:01 PM, David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
>> wrote:
>>>
>>> On 12/01/2017 11:49 AM, Philippe Ombredanne wrote:
>>>>
>>>>
>>>> David, Greg,
>>>>
>>>> On Fri, Dec 1, 2017 at 6:42 PM, David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
>>>> wrote:
>>>>>
>>>>>
>>>>> On 11/30/2017 11:53 PM, Philippe Ombredanne wrote:
>>>>
>>>>
>>>> [...]
>>>>>>>>
>>>>>>>>
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/arch/mips/cavium-octeon/resource-mgr.c
>>>>>>>> @@ -0,0 +1,371 @@
>>>>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>>>>> +/*
>>>>>>>> + * Resource manager for Octeon.
>>>>>>>> + *
>>>>>>>> + * This file is subject to the terms and conditions of the GNU
>>>>>>>> General
>>>>>>>> Public
>>>>>>>> + * License.  See the file "COPYING" in the main directory of this
>>>>>>>> archive
>>>>>>>> + * for more details.
>>>>>>>> + *
>>>>>>>> + * Copyright (C) 2017 Cavium, Inc.
>>>>>>>> + */
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>> Since you nicely included an SPDX id, you would not need the
>>>>>> boilerplate anymore. e.g. these can go alright?
>>>>>
>>>>>
>>>>>
>>>>>
>>>>> They may not be strictly speaking necessary, but I don't think they
>>>>> hurt
>>>>> anything.  Unless there is a requirement to strip out the license text,
>>>>> we
>>>>> would stick with it as is.
>>>>
>>>>
>>>>
>>>> I think the requirement is there and that would be much better for
>>>> everyone: keeping both is redundant and does not bring any value, does
>>>> it? Instead it kinda removes the benefits of having the SPDX id in the
>>>> first place IMHO.
>>>>
>>>> Furthermore, as there have been already ~12K+ files cleaned up and
>>>> still over 60K files to go, it would really nice if new files could
>>>> adopt the new style: this way we will not have to revisit and repatch
>>>> them in the future.
>>>>
>>>
>>> I am happy to follow any style Greg would suggest.  There doesn't seem to
>>> be
>>> much documentation about how this should be done yet.
>>
>>
>> Thomas (tglx) has already submitted a first series of doc patches a
>> few weeks ago. And AFAIK he might be working on posting the updates
>> soon, whenever his real time clock yields a few cycles away from real
>> time coding work ;)
>>
>> See also these discussions with Linus [1][2][3], Thomas[4] and Greg[5]
>> on this and mostly related topics
>>
>> [1] https://lkml.org/lkml/2017/11/2/715
>> [2] https://lkml.org/lkml/2017/11/25/125
>> [3] https://lkml.org/lkml/2017/11/25/133
>> [4] https://lkml.org/lkml/2017/11/2/805
>> [5] https://lkml.org/lkml/2017/10/19/165
>>
>
> OK, you convinced me.
>
> Thanks,
> David
>

No! Thank you to you: For doing real work on the kernel that makes my
servers and laptops run, while I am nitpicking you on comments.

-- 
Cordially
Philippe Ombredanne
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
