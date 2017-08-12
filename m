From: Lokesh Vutla <lokeshvutla-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/6] dt-bindings: ti,edma: Add 66AK2G specific information
Date: Sat, 12 Aug 2017 11:13:24 +0530
Message-ID: <9a2a0a3d-cc6a-d672-ed38-bef406635d3c@ti.com>
References: <20170801044119.16201-1-lokeshvutla@ti.com>
 <20170801044119.16201-2-lokeshvutla@ti.com>
 <20170810000034.vvcdvdez3og6lhux@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170810000034.vvcdvdez3og6lhux@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux ARM Mailing List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Device Tree Mailing List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, Keerthy <j-keerthy-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On Thursday 10 August 2017 05:30 AM, Rob Herring wrote:
> On Tue, Aug 01, 2017 at 10:11:14AM +0530, Lokesh Vutla wrote:
>> Update ti,edma binding documentation to reflect 66AK2G specific
>> properties.
>>
>> Signed-off-by: Lokesh Vutla <lokeshvutla-l0cyMroinI0@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/dma/ti-edma.txt | 95 +++++++++++++++++++++--
>>  1 file changed, 90 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/dma/ti-edma.txt b/Documentation/devicetree/bindings/dma/ti-edma.txt
>> index 18090e7226b4..05fe2931d025 100644
>> --- a/Documentation/devicetree/bindings/dma/ti-edma.txt
>> +++ b/Documentation/devicetree/bindings/dma/ti-edma.txt
>> @@ -9,7 +9,12 @@ execute the actual DMA tansfer.
>>  eDMA3 Channel Controller
>>  
>>  Required properties:
>> -- compatible:	"ti,edma3-tpcc" for the channel controller(s)
>> +--------------------
>> +- compatible:	Should be:
>> +		- "ti,edma3-tpcc" for the channel controller(s) on OMAP,
>> +		  AM33xx and AM43xx SoCs.
>> +		- "ti,k2g-edma3-tpcc", "ti,edma3-tpcc" for the
> 
> If power-domains is mandatory, I don't think the fallback is 
> appropriate. Or do you expect it to work if the driver ignores the power 
> domain?

power-domains is required for pm_runtime_*() apis to work on 66AK2G.
Driver doesn't handle this property separately. Driver still works with
"ti,edma3-tpcc" compatible.

Thanks and regards,
Lokesh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
