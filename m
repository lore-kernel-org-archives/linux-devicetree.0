From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: dma: ti-edma: Document
 dma-channel-mask for EDMA
Date: Wed, 18 Sep 2019 17:06:02 +0300
Message-ID: <8949605b-34e8-cec1-818c-838291b72622@ti.com>
References: <20190910114559.22810-1-peter.ujfalusi@ti.com>
 <20190910114559.22810-3-peter.ujfalusi@ti.com> <20190918132931.GA14832@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190918132931.GA14832@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, dan.j.williams@intel.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 18/09/2019 16.29, Rob Herring wrote:
> On Tue, Sep 10, 2019 at 02:45:58PM +0300, Peter Ujfalusi wrote:
>> Similarly to paRAM slots, channels can be used by other cores.
>>
>> The common dma-channel-mask property can be used for specifying the
>> available channels.
>>
>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
>> ---
>>  Documentation/devicetree/bindings/dma/ti-edma.txt | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/dma/ti-edma.txt b/Documentation/devicetree/bindings/dma/ti-edma.txt
>> index 4bbc94d829c8..3c7736246354 100644
>> --- a/Documentation/devicetree/bindings/dma/ti-edma.txt
>> +++ b/Documentation/devicetree/bindings/dma/ti-edma.txt
>> @@ -42,6 +42,9 @@ Optional properties:
>>  - ti,edma-reserved-slot-ranges: PaRAM slot ranges which should not be used by
>>  		the driver, they are allocated to be used by for example the
>>  		DSP. See example.
>> +- dma-channel-mask: Mask of usable channels, see
>> +		Documentation/devicetree/bindings/dma/dma-common.yaml
>> +
> 
> What's the size? 2 cells?

Depending on the EDMA, some have 32, some have 64 channels. I'll update
the patch to reflect this.

>>  
>>  ------------------------------------------------------------------------------
>>  eDMA3 Transfer Controller
>> @@ -91,6 +94,9 @@ edma: edma@49000000 {
>>  	ti,edma-memcpy-channels = <20 21>;
>>  	/* The following PaRAM slots are reserved: 35-44 and 100-109 */
>>  	ti,edma-reserved-slot-ranges = <35 10>, <100 10>;
>> +	/* The following channels are reserved: 35-44 */
>> +	dma-channel-mask = <0xffffffff>, /* Channel 0-31 */
>> +			   <0xffffe007>; /* Channel 32-63 */
>>  };
>>  
>>  edma_tptc0: tptc@49800000 {
>> -- 
>> Peter
>>
>> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
>> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>>

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
