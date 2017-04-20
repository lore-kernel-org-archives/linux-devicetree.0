From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: r8a7743: add PFC support
Date: Thu, 20 Apr 2017 15:24:13 +0300
Message-ID: <58926448-b1d7-668a-a0a3-40b245b59d27@cogentembedded.com>
References: <20170414211505.733692280@cogentembedded.com>
 <20170420085112.GF3760@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170420085112.GF3760-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 04/20/2017 11:51 AM, Simon Horman wrote:

>> Define the generic R8A7743 part of the PFC device node.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>>
>> ---
>>  arch/arm/boot/dts/r8a7743.dtsi |    7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> Index: renesas/arch/arm/boot/dts/r8a7743.dtsi
>> ===================================================================
>> --- renesas.orig/arch/arm/boot/dts/r8a7743.dtsi
>> +++ renesas/arch/arm/boot/dts/r8a7743.dtsi
>> @@ -1,7 +1,7 @@
>>  /*
>>   * Device Tree Source for the r8a7743 SoC
>>   *
>> - * Copyright (C) 2016 Cogent Embedded Inc.
>> + * Copyright (C) 2016-2017 Cogent Embedded Inc.
>>   *
>>   * This file is licensed under the terms of the GNU General Public License
>>   * version 2. This program is licensed "as is" without any warranty of any
>> @@ -123,6 +123,11 @@
>>  			#power-domain-cells = <1>;
>>  		};
>>
>> +		pfc: pin-controller@e6060000 {
>> +			compatible = "renesas,pfc-r8a7743";
>> +			reg = <0 0xe6060000 0 0x250>;
>> +		};
>> +
>
> I am curious to know why pin-controller was chosen rather than pfc which
> is dominant in the DT for Renesas SoCs.

    The reason is simple: I was trying to follow the DT specs which require 
generic node names. The "pin-controller" looked more generic than "pfc".

> And as a follow-up question, do
> you think it would be worth creating patches to make this uniform
> across the DT for Renesas SoCs.

    Yes, probably.

[...]

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
