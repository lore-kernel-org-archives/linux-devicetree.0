From: Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH v6 06/12] dt-bindings: irqchip: Introduce TISCI Interrupt
 router bindings
Date: Fri, 12 Apr 2019 11:42:51 +0300
Message-ID: <7e41405b-74e2-dc53-982a-766dee8a6884@ti.com>
References: <20190410041358.16809-1-lokeshvutla@ti.com>
 <20190410041358.16809-7-lokeshvutla@ti.com>
 <20190411150023.GQ2839@atomide.com>
 <9cd4b818-905c-08a4-5675-a5ee763cea98@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9cd4b818-905c-08a4-5675-a5ee763cea98@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Lokesh Vutla <lokeshvutla@ti.com>, Tony Lindgren <tony@atomide.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, jason@lakedaemon.net, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Device Tree Mailing List <devicetree@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: devicetree@vger.kernel.org

On 12/04/2019 07:24, Lokesh Vutla wrote:
> 
> 
> On 11/04/19 8:30 PM, Tony Lindgren wrote:
>> Hi,
>>
>> * Lokesh Vutla <lokeshvutla@ti.com> [190410 04:15]:
>>> +Example:
>>> +--------
>>> +The following example demonstrates both interrupt router node and the consumer
>>> +node(main gpio) on the AM654 SoC:
>>> +
>>> +main_intr: interrupt-controller0 {
>>> +	compatible = "ti,sci-intr";
>>> +	ti,intr-trigger-type = <1>;
>>> +	interrupt-controller;
>>> +	interrupt-parent = <&gic500>;
>>> +	#interrupt-cells = <3>;
>>> +	ti,sci = <&dmsc>;
>>> +	ti,sci-dst-id = <56>;
>>> +	ti,sci-rm-range-girq = <0x1>;
>>> +};
>>
>> To me it seems there should not be too many of these interrupt
>> controller nodes for each SoC. Maybe you're already planning on
>> doing it, but I suggest that you just add more specific compatibles
>> and then look up the dst-id from a mapping table in the driver
>> similar to what patch 04/12 in this series is already doing.
>>
>> That way you don't need to add custom TI specific (firmware
>> defined) device tree properties listed above ;)
> 

< snip: I think Lokesh had a bad day or something :) >

Anyways, the reason why we want these as custom properties in the DT is 
that there are multiple instances of the routers within one SoC. On 
AM65x we have MAIN NAVSS, MCU NAVSS, GPIOs for both etc., if we add 
driver data for each of these, it easily explodes quite a bit. 
Especially going forward with new SoCs.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
