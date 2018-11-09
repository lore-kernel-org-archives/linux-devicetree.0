From: Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH] arm64: dts: k3-am65-wakeup: Fix wakeup_uart reg address
Date: Fri, 9 Nov 2018 18:45:49 +0200
Message-ID: <b75e5f48-f4db-5de0-8c28-45ec065b88da@ti.com>
References: <20180927050146.17847-1-vigneshr@ti.com>
 <8dc7a5d5-3e21-c2be-fde1-3f2bc6396bec@ti.com>
 <20181107210059.j2wd4v2uawsjniol@kahuna>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181107210059.j2wd4v2uawsjniol@kahuna>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Nishanth Menon <nm@ti.com>, "Vutla, Lokesh" <lokeshvutla@ti.com>
Cc: "R, Vignesh" <vigneshr@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 07/11/2018 23:00, Nishanth Menon wrote:
> On 10:10-20181005, Vutla, Lokesh wrote:
>>
>>
>> On Thursday 27 September 2018 10:31 AM, Vignesh R wrote:
>>> cbass_wakeup interconnect which is the parent of wakeup_uart node
>>> defines address-cells=1 and size-cells=1, therefore fix up reg property
>>> of wakeup_uart node accordingly. Otherwise, this UART instance fails to
>>> probe if enabled.
>>>
>>> Fixes: 4201af2544b3 ("arm64: dts: ti: am654: Add uart nodes")
>>> Signed-off-by: Vignesh R <vigneshr@ti.com>
>>
>> Reviewed-by: Lokesh Vutla <lokeshvutla@ti.com>
> 
> Tero:
> 
> Could we pick this up for rc2? looks like $subject might be good to fix
> up to:
> arm64: dts: ti: k3-am65-wakeup: Fix wakeup_uart reg address
> instead of
> arm64: dts: k3-am65-wakeup: Fix wakeup_uart reg address
> 
> could be fixed locally.
> 

Thanks, queued up for 4.20-rc.

-Tero

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
