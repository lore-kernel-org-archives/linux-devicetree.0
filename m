From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 04/11] soc: renesas: rcar-sysc: add R8A77980 support
Date: Wed, 7 Feb 2018 13:56:17 +0300
Message-ID: <d10a47a1-e3e5-04ae-e8b9-0297f1ecac02@cogentembedded.com>
References: <46fca582-220d-e5a7-62cd-2fc77a29846b@cogentembedded.com>
 <0309d18d-d5d8-ab59-9c15-79b4093e0a51@cogentembedded.com>
 <20180207102942.jmggcp5isiwdzwqt@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180207102942.jmggcp5isiwdzwqt-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Content-Language: en-MW
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/07/2018 01:29 PM, Simon Horman wrote:

>> Add support for R-Car V3H (R8A77980) SoC power areas to the R-Car SYSC
>> driver.
>>
>> Based on the original (and large) patch by Vladimir Barinov.
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> 
> For the record, this matches my reading of the documentation:
> 
> Reviewed-by: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>

   Thank you! :-)

> ...
> 
>> Index: renesas/drivers/soc/renesas/r8a77980-sysc.c
>> ===================================================================
>> --- /dev/null
>> +++ renesas/drivers/soc/renesas/r8a77980-sysc.c
>> @@ -0,0 +1,52 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Renesas R-Car V3H System Controller
>> + *
>> + * Copyright (C) 2018 Renesas Electronics Corp.
>> + * Copyright (C) 2018 Cogent Embedded, Inc.
>> + */
>> +
>> +#include <linux/bug.h>
>> +#include <linux/kernel.h>
>> +
>> +#include <dt-bindings/power/r8a77980-sysc.h>
>> +
>> +#include "rcar-sysc.h"
>> +
>> +static const struct rcar_sysc_area r8a77980_areas[] __initconst = {
>> +	{ "always-on",	    0, 0, R8A77980_PD_ALWAYS_ON, -1, PD_ALWAYS_ON },
>> +	{ "ca53-scu",	0x140, 0, R8A77980_PD_CA53_SCU,	R8A77980_PD_ALWAYS_ON,
>> +	  PD_SCU },
>> +	{ "ca53-cpu0",	0x200, 0, R8A77980_PD_CA53_CPU0, R8A77980_PD_CA53_SCU,
>> +	  PD_CPU_NOCR },
> 
> ...
> 
> The above seems consistent with existing usage of struct rcar_sysc_area,
> however, I am wondering if any consideration has been given to using
> symbolic names for the register offsets that are the 2nd field of the
> structure. Something like this for the values used in this patch:
> 
> #define RCAR_GEN3_SYSCSR  0
> #define RCAR_GEN3_PWRSR3  0x140
> #define RCAR_GEN3_PWRSR4  0x180
> #define RCAR_GEN3_PWRSR6  0x200
> #define RCAR_GEN3_PWRSR7  0x240
> #define RCAR_GEN3_PWRSR11 0x400
> #define RCAR_GEN3_PWRSR12 0x2c0
> #define RCAR_GEN3_PWRSR13 0x300
> #define RCAR_GEN3_PWRSR14 0x280

   No. Perhaps a good idea indeed...

MBR, Sergei
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
