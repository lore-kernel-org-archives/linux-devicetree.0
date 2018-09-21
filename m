Return-Path: <SRS0=LG2Q=MD=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779{7|8}0: add TPU support
References: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
 <009bf131-c98e-df15-9c17-fb03c7bb09e2@cogentembedded.com>
 <da71d911-7115-f389-dcb3-1ccf1ef08d76@cogentembedded.com>
 <20180921073501.fqqwwkzu5qukurzs@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <49200fd2-b534-d082-b499-5e57e59e7deb@cogentembedded.com>
Date: Fri, 21 Sep 2018 11:27:56 +0300
MIME-Version: 1.0
In-Reply-To: <20180921073501.fqqwwkzu5qukurzs@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Simon Horman <horms@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On 9/21/2018 10:35 AM, Simon Horman wrote:

>>> Describe TPU in the R8A779{7|8}0 device trees.
>>>
>>> Based on the original (and large) patches by Vladimir Barinov.
>>>
>>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>>
>>> ---
>>> This patch is against the 'renesas-devel-20180919-v4.19-rc4' branch of
>>> Simon Horman's 'renesas.git' repo.
>>>
>>>   arch/arm64/boot/dts/renesas/r8a77970.dtsi |    8 ++++++++
>>>   arch/arm64/boot/dts/renesas/r8a77980.dtsi |    9 +++++++++
>>>   2 files changed, 17 insertions(+)
>>>
>>> Index: renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
>>> ===================================================================
>>> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970.dtsi
>>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
>>> @@ -614,6 +614,14 @@
>>>   			status = "disabled";
>>>   		};
>>>   
>>> +		tpu: pwm@e6e80000 {
>>> +			compatible = "renesas,tpu-r8a77970", "renesas,tpu";
>>
>>    Oops, forgot to document the SoC specific binding...
> 
> I'm still not seeing the binding in my inbox.
 > Could you post it or point me to a link to it?

    Because I still haven't posted it. It turned out the bindings doc needs 
some fixing 1st... :-/

>>> +			reg = <0 0xe6e80000 0 0x100>;
> 
> This register range seems a little small.
>  From my reading of the documentation 0x148 would be a more obvious choice.

    Yeah, I've noticed that too -- will be fixed in v2.

> Is the driver only accessing registers in in the 0x100 range for some
> reason?

    Yes, the registers beyond 0x100 are for the step motor control...

[...]

MBR, Sergei
