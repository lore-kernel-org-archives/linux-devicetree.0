From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 01/13] ARM: shmobile: r8a7792: add clock index macros
Date: Wed, 22 Jun 2016 22:52:04 +0300
Message-ID: <b9619ed2-1ebf-0991-ca90-f9dbe6d1d4f6@cogentembedded.com>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
 <2280165.siMXMbFrFe@wasted.cogentembedded.com>
 <20160601005246.GF20527@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20160601005246.GF20527@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/01/2016 03:52 AM, Simon Horman wrote:

>> Add macros usable by the device tree sources to reference the R8A7792
>> clocks  by index.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>>  include/dt-bindings/clock/r8a7792-clock.h |  104 ++++++++++++++++++++++++++++++
>>  1 file changed, 104 insertions(+)
>>
>> Index: renesas/include/dt-bindings/clock/r8a7792-clock.h
>> ===================================================================
>> --- /dev/null
>> +++ renesas/include/dt-bindings/clock/r8a7792-clock.h
>> @@ -0,0 +1,104 @@
>> +/*
>> + * Copyright (C) 2016 Cogent Embedded, Inc.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + */
>> +
>> +#ifndef __DT_BINDINGS_CLOCK_R8A7792_H__
>> +#define __DT_BINDINGS_CLOCK_R8A7792_H__
>> +
>> +/* CPG */
>> +#define R8A7792_CLK_MAIN		0
>> +#define R8A7792_CLK_PLL0		1
>> +#define R8A7792_CLK_PLL1		2
>> +#define R8A7792_CLK_PLL3		3
>> +#define R8A7792_CLK_LB			4
>> +#define R8A7792_CLK_QSPI		5
>> +#define R8A7792_CLK_SDH			6
>> +#define R8A7792_CLK_SD0			7
>> +#define R8A7792_CLK_SD1			8
>> +#define R8A7792_CLK_Z			9
>
> According to my copy of the documentation (v2.00) SDH, SD0 and SD1 do
> not seem to be provided by the r8a7792 CPG.

    I've just downloaded and opened rev2.00 manual, and still, there's no
CPG registers other than FRQCRB on V2H.

> It does, however, provide RCAN and ADSP which are supported by the CPG
> driver. You may wish to add them now for completeness though from my point
> of view they could also be added later when they are used.

    My copy of the manual says there's no ADSP on V2H, and thus no ADSP clock.

MBR, Sergei
