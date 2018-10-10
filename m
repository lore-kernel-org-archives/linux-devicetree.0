Return-Path: <SRS0=QTcC=MW=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77980: add thermal support
References: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
 <90451643-6beb-e61f-912c-3adff4c943cb@cogentembedded.com>
 <20181010083645.sugql3zp4ttj2fll@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <43384bfd-bea4-6f5b-0839-fb111427557a@cogentembedded.com>
Date: Wed, 10 Oct 2018 13:47:36 +0300
MIME-Version: 1.0
In-Reply-To: <20181010083645.sugql3zp4ttj2fll@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Simon Horman <horms@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
List-ID: <devicetree@vger.kernel.org>

On 10/10/2018 11:36 AM, Simon Horman wrote:

>> Describe THS/CIVM in the R8A77980 device trees.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>> This patch is against the 'renesas-devel-20181008-v4.19-rc7' tag of Simon
>> Horman's 'renesas.git' repo.
>>
>> The thermal driver/bindings patches have been just posted...
>>
>>  arch/arm64/boot/dts/renesas/r8a77980.dtsi |   38 ++++++++++++++++++++++++++++++
> 
> Thanks Sergei, one minor nit from me below.
> 
> Niklas, I'd value your review of this patch.
> 
>>  1 file changed, 38 insertions(+)
>>
>> Index: renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
>> ===================================================================
>> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
>> @@ -330,6 +330,19 @@
>>  			#power-domain-cells = <1>;
>>  		};
>>  
>> +		thermal: thermal@e6198000 {
> 
> "tsc:" would be consistent with other R-Car Gen 3 dtsi that
> describe this device.

   There's no consistency even among those: R8A779{5|6}0 use "tsc:", 
R8A77995 uses "thermal:"... :-)

[...]

MBR, Sergei
