From: James Morse <james.morse@arm.com>
Subject: Re: [PATCH 2/2] EDAC: add ARM Cortex A15 L2 internal asynchronous
 error detection driver
Date: Wed, 9 Jan 2019 09:57:06 +0000
Message-ID: <52dc5125-9213-9ee4-eca6-cc8ffbc869f7@arm.com>
References: <AM6PR0702MB379953E130CC1E1DEE18B79BFA8A0@AM6PR0702MB3799.eurprd07.prod.outlook.com>
 <20190108104204.GA14243@zn.tnic>
 <e1458b95-6d17-21be-5dd8-ee7ff8d8b3fb@arm.com>
 <20190108181206.GA3848@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190108181206.GA3848@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: Borislav Petkov <bp@alien8.de>, "Wiebe, Wladislav (Nokia - DE/Ulm)" <wladislav.wiebe@nokia.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "arnd@arndb.de" <arnd@arndb.de>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kernel@vger.ker
List-Id: devicetree@vger.kernel.org

Hi Greg,

On 01/08/2019 06:12 PM, gregkh@linuxfoundation.org wrote:
> On Tue, Jan 08, 2019 at 05:57:24PM +0000, James Morse wrote:
>>>> diff --git a/drivers/edac/cortex_a15_l2_async_edac.c b/drivers/edac/cortex_a15_l2_async_edac.c
>>>> new file mode 100644
>>>> index 000000000000..26252568e961
>>>> --- /dev/null
>>>> +++ b/drivers/edac/cortex_a15_l2_async_edac.c
>>>> @@ -0,0 +1,134 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * Copyright (C) 2018 Nokia Corporation
>>
>> (boiler plate not needed with the SPDX header)
> 
> Not true at all.  Copyright is not the same thing as an SPDX license
> identifier in any way, shape, or form.  As-is, this is just fine.


This looks funny because I removed the GPL license text that was here, 
but left this comment when trimming the reply. I should have left a few 
lines of it for context.

(Originally: 
https://lore.kernel.org/lkml/20190108104204.GA14243@zn.tnic/T/#u)


Thanks,

James
