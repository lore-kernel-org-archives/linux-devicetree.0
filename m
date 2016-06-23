From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 01/13] ARM: shmobile: r8a7792: add clock index macros
Date: Thu, 23 Jun 2016 13:49:53 +0300
Message-ID: <f2050a34-606d-efc0-5927-3a683b903434@cogentembedded.com>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
 <2280165.siMXMbFrFe@wasted.cogentembedded.com>
 <20160601005246.GF20527@verge.net.au>
 <b9619ed2-1ebf-0991-ca90-f9dbe6d1d4f6@cogentembedded.com>
 <20160622223330.GA15843@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160622223330.GA15843-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 6/23/2016 1:33 AM, Simon Horman wrote:

>>>> Add macros usable by the device tree sources to reference the R8A7792
>>>> clocks  by index.
>>>>
>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>>>>
>>>> ---
>>>> include/dt-bindings/clock/r8a7792-clock.h |  104 ++++++++++++++++++++++++++++++
>>>> 1 file changed, 104 insertions(+)
>>>>
>>>> Index: renesas/include/dt-bindings/clock/r8a7792-clock.h
>>>> ===================================================================
>>>> --- /dev/null
>>>> +++ renesas/include/dt-bindings/clock/r8a7792-clock.h
>>>> @@ -0,0 +1,104 @@
>>>> +/*
>>>> + * Copyright (C) 2016 Cogent Embedded, Inc.
>>>> + *
>>>> + * This program is free software; you can redistribute it and/or modify
>>>> + * it under the terms of the GNU General Public License as published by
>>>> + * the Free Software Foundation; either version 2 of the License, or
>>>> + * (at your option) any later version.
>>>> + */
>>>> +
>>>> +#ifndef __DT_BINDINGS_CLOCK_R8A7792_H__
>>>> +#define __DT_BINDINGS_CLOCK_R8A7792_H__
>>>> +
>>>> +/* CPG */
>>>> +#define R8A7792_CLK_MAIN		0
>>>> +#define R8A7792_CLK_PLL0		1
>>>> +#define R8A7792_CLK_PLL1		2
>>>> +#define R8A7792_CLK_PLL3		3
>>>> +#define R8A7792_CLK_LB			4
>>>> +#define R8A7792_CLK_QSPI		5
>>>> +#define R8A7792_CLK_SDH			6
>>>> +#define R8A7792_CLK_SD0			7
>>>> +#define R8A7792_CLK_SD1			8
>>>> +#define R8A7792_CLK_Z			9
>>>
>>> According to my copy of the documentation (v2.00) SDH, SD0 and SD1 do
>>> not seem to be provided by the r8a7792 CPG.
>>
>>    I've just downloaded and opened rev2.00 manual, and still, there's no
>> CPG registers other than FRQCRB on V2H.
>>
>>> It does, however, provide RCAN and ADSP which are supported by the CPG
>>> driver. You may wish to add them now for completeness though from my point
>>> of view they could also be added later when they are used.
>>
>>    My copy of the manual says there's no ADSP on V2H, and thus no ADSP clock.
>
> I was looking at Figure 7.1c. Perhaps it is inaccurate.

    Indeed, it's the only place where the ADSP clock is mentioned for V2H, and 
it looks like this is in error. I guess I'll try to verify if there's writable 
ADSPCKCR and then remove the ADSP clock if not.

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
