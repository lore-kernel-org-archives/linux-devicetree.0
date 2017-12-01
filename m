From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [PATCH v4 3/8] MIPS: Octeon: Add a global resource manager.
Date: Fri, 1 Dec 2017 12:56:32 -0800
Message-ID: <1c34c7f5-4237-0fca-e871-ee18c262a3f3@caviumnetworks.com>
References: <20171129005540.28829-1-david.daney@cavium.com>
 <20171129005540.28829-4-david.daney@cavium.com>
 <20171130225333.GI27409@jhogan-linux.mipstec.com>
 <CAOFm3uGhRTTrvygBd0dMdzWZQC5kFi8yXuWQsnhDvDLtW2z7aA@mail.gmail.com>
 <99dd185d-6e5d-f474-90aa-ebee63045c42@caviumnetworks.com>
 <CAOFm3uEy52yog4H_Hco0X+OHF5yiHUZYAHaGz4MefKcYQz3LUg@mail.gmail.com>
 <2ac5ec17-cedb-5dd8-6ea7-f065025639a9@caviumnetworks.com>
 <CAOFm3uHSp3ziQ-h1-V9uz07+jiixpgoUB9UZV82fOkrMBk8aZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <CAOFm3uHSp3ziQ-h1-V9uz07+jiixpgoUB9UZV82fOkrMBk8aZQ@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Philippe Ombredanne <pombredanne@nexb.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-mips@linux-mips.org, devel@driverdev.osuosl.org, David Daney <david.daney@cavium.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, ralf@linux-mips.org, Carlos Munoz <cmunoz@cavium.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, "Steven J. Hill" <steven.hill@cavium.com>, netdev@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, James Hogan <james.hogan@mips.com>, "David S. Miller" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

On 12/01/2017 12:41 PM, Philippe Ombredanne wrote:
> David,
> 
> On Fri, Dec 1, 2017 at 9:01 PM, David Daney <ddaney@caviumnetworks.com> wrote:
>> On 12/01/2017 11:49 AM, Philippe Ombredanne wrote:
>>>
>>> David, Greg,
>>>
>>> On Fri, Dec 1, 2017 at 6:42 PM, David Daney <ddaney@caviumnetworks.com>
>>> wrote:
>>>>
>>>> On 11/30/2017 11:53 PM, Philippe Ombredanne wrote:
>>>
>>> [...]
>>>>>>>
>>>>>>> --- /dev/null
>>>>>>> +++ b/arch/mips/cavium-octeon/resource-mgr.c
>>>>>>> @@ -0,0 +1,371 @@
>>>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>>>> +/*
>>>>>>> + * Resource manager for Octeon.
>>>>>>> + *
>>>>>>> + * This file is subject to the terms and conditions of the GNU
>>>>>>> General
>>>>>>> Public
>>>>>>> + * License.  See the file "COPYING" in the main directory of this
>>>>>>> archive
>>>>>>> + * for more details.
>>>>>>> + *
>>>>>>> + * Copyright (C) 2017 Cavium, Inc.
>>>>>>> + */
>>>>>
>>>>>
>>>>>
>>>>> Since you nicely included an SPDX id, you would not need the
>>>>> boilerplate anymore. e.g. these can go alright?
>>>>
>>>>
>>>>
>>>> They may not be strictly speaking necessary, but I don't think they hurt
>>>> anything.  Unless there is a requirement to strip out the license text,
>>>> we
>>>> would stick with it as is.
>>>
>>>
>>> I think the requirement is there and that would be much better for
>>> everyone: keeping both is redundant and does not bring any value, does
>>> it? Instead it kinda removes the benefits of having the SPDX id in the
>>> first place IMHO.
>>>
>>> Furthermore, as there have been already ~12K+ files cleaned up and
>>> still over 60K files to go, it would really nice if new files could
>>> adopt the new style: this way we will not have to revisit and repatch
>>> them in the future.
>>>
>>
>> I am happy to follow any style Greg would suggest.  There doesn't seem to be
>> much documentation about how this should be done yet.
> 
> Thomas (tglx) has already submitted a first series of doc patches a
> few weeks ago. And AFAIK he might be working on posting the updates
> soon, whenever his real time clock yields a few cycles away from real
> time coding work ;)
> 
> See also these discussions with Linus [1][2][3], Thomas[4] and Greg[5]
> on this and mostly related topics
> 
> [1] https://lkml.org/lkml/2017/11/2/715
> [2] https://lkml.org/lkml/2017/11/25/125
> [3] https://lkml.org/lkml/2017/11/25/133
> [4] https://lkml.org/lkml/2017/11/2/805
> [5] https://lkml.org/lkml/2017/10/19/165
> 

OK, you convinced me.

Thanks,
David
