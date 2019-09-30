From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: dma: ti-edma: Document
 dma-channel-mask for EDMA
Date: Mon, 30 Sep 2019 13:55:23 +0300
Message-ID: <dd88e5a3-eb9b-7ea7-7316-c036dec41fe9@ti.com>
References: <20190926111954.9184-1-peter.ujfalusi@ti.com>
 <20190926111954.9184-3-peter.ujfalusi@ti.com> <20190927204854.GA20463@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190927204854.GA20463@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, dan.j.williams@intel.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 27/09/2019 23.48, Rob Herring wrote:
> On Thu, Sep 26, 2019 at 02:19:53PM +0300, Peter Ujfalusi wrote:
>> Similarly to paRAM slots, channels can be used by other cores.
>>
>> The common dma-channel-mask property can be used for specifying the
>> available channels.
>>
>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
>> ---
>>  Documentation/devicetree/bindings/dma/ti-edma.txt | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/dma/ti-edma.txt b/Documentation/devicetree/bindings/dma/ti-edma.txt
>> index 4bbc94d829c8..014187088020 100644
>> --- a/Documentation/devicetree/bindings/dma/ti-edma.txt
>> +++ b/Documentation/devicetree/bindings/dma/ti-edma.txt
>> @@ -42,6 +42,11 @@ Optional properties:
>>  - ti,edma-reserved-slot-ranges: PaRAM slot ranges which should not be used by
>>  		the driver, they are allocated to be used by for example the
>>  		DSP. See example.
>> +- dma-channel-mask: Mask of usable channels.
>> +		Single uint32 for EDMA with 32 channels, array of two uint32 for
>> +		EDMA with 64 channels. See example and
>> +		Documentation/devicetree/bindings/dma/dma-common.yaml
>> +
>>  
>>  ------------------------------------------------------------------------------
>>  eDMA3 Transfer Controller
>> @@ -91,6 +96,9 @@ edma: edma@49000000 {
>>  	ti,edma-memcpy-channels = <20 21>;
>>  	/* The following PaRAM slots are reserved: 35-44 and 100-109 */
>>  	ti,edma-reserved-slot-ranges = <35 10>, <100 10>;
>> +	/* The following channels are reserved: 35-44 */
>> +	dma-channel-mask = <0xffffffff>, /* Channel 0-31 */
>> +			   <0xffffe007>; /* Channel 32-63 */
> 
> Doesn't matter yet, but you have a mismatch here with the schema. While 
> the <> around each int or not doesn't matter for the dtb, it does for 
> the schema.
> 
> dma-channel-mask = <0xffffffff>, <0xffffe007>;
> minItems: 1
> maxItems: 255
> 
> dma-channel-mask = <0xffffffff 0xffffe007>;
> items:
>   minItems: 1
>   maxItems: 255
> 
> I think the latter case is slightly more logical here as you have 1 
> thing (a mask). If had N of something (like interrupts), then the former 
> makes sense.

So, in dma-common.yaml:
    allOf:
      - $ref: /schemas/types.yaml#/definitions/uint32-array

    items:
      minItems: 1
      # Should be enough
      maxItems: 255

and here in the example:
	dma-channel-mask = <0xffffffff /* Channel 0-31 */
			    0xffffe007>; /* Channel 32-63 */

I'll send an updated series with these changes.

Thanks,
- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
