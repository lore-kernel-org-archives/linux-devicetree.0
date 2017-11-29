From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: initial V3MSK board device tree
Date: Wed, 29 Nov 2017 13:14:21 +0300
Message-ID: <06d59459-86dc-89b1-a0ed-adbd1481abc6@cogentembedded.com>
References: <20171124210313.219761525@cogentembedded.com>
 <20171129095109.d2uan35eui4kzav6@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171129095109.d2uan35eui4kzav6-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello!

On 11/29/2017 12:51 PM, Simon Horman wrote:

>> Add the initial device  tree for the V3M Starter Kit board.
>> The board has 1 debug serial port (SCIF0); include support for it,
>> so that the serial console can work.
>>
>> Based on the original (and large) patch by Vladimir Barinov.
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>>
>> ---
>>   arch/arm64/boot/dts/renesas/Makefile           |    2 -
[...]
>> Index: renesas/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
>> ===================================================================
>> --- /dev/null
>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
>> @@ -0,0 +1,44 @@
>> +/*
>> + * Device Tree Source for the V3M Starter Kit board
>> + *
>> + * Copyright (C) 2017 Renesas Electronics Corp.
>> + * Copyright (C) 2017 Cogent Embedded, Inc.
>> + *
>> + * This file is licensed under the terms of the GNU General Public License
>> + * version 2.  This program is licensed "as is" without any warranty of any
>> + * kind, whether express or implied.
>> + */
>> +
>> +/dts-v1/;
>> +#include "r8a77970.dtsi"
>> +
>> +/ {
>> +	model = "Renesas V3M Starter Kit board";
>> +	compatible = "renesas,v3msk", "renesas,r8a77970";
>> +
>> +	aliases {
>> +		serial0 = &scif0;
>> +	};
>> +
>> +	chosen {
> 
> For consistency with other Renesas boards I would like to request the
> following be added here:
> 
> 		bootargs = "ignore_loglevel rw";

    There's currently no consistency as ulcb.dtsi doesn't seem to specify 
"bootargs" prop at all. Moreover, this prop seems to be ignored by ARM64 
kernel -- I can only specify "bootargs" in U-Boot....

MBR, Sergei
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
