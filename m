Return-Path: <SRS0=C2Tf=WY=ti.com=peter.ujfalusi@kernel.org>
Subject: Re: [PATCH] dt-bindings: dmaengine: dma-common: Revise the
 dma-channel-mask property
References: <1566974375-32482-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <eb823985-5cf6-0d83-8613-1baeeaf7d9c8@ti.com>
 <TYAPR01MB454400436713332F1075D424D8A30@TYAPR01MB4544.jpnprd01.prod.outlook.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <3b06567c-8cfe-bfec-3973-c3e7cf71a18b@ti.com>
Date: Wed, 28 Aug 2019 12:38:46 +0300
MIME-Version: 1.0
In-Reply-To: <TYAPR01MB454400436713332F1075D424D8A30@TYAPR01MB4544.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, "vkoul@kernel.org" <vkoul@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Shimoda-san,

On 28/08/2019 11.55, Yoshihiro Shimoda wrote:
> Hi Peter,
> 
>> From: Peter Ujfalusi, Sent: Wednesday, August 28, 2019 4:25 PM
>>
>> On 28/08/2019 9.39, Yoshihiro Shimoda wrote:
>>> The commit b37e3534ac42 ("dt-bindings: dmaengine: Add YAML schemas
>>> for the generic DMA bindings") changed the property from
>>> dma-channel-mask to dma-channel-masks. So, this patch revises it.
>>>
>>> Fixes: b37e3534ac42 ("dt-bindings: dmaengine: Add YAML schemas for the generic DMA bindings")
>>> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>>> ---
>>>  Documentation/devicetree/bindings/dma/dma-common.yaml | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/dma/dma-common.yaml
>> b/Documentation/devicetree/bindings/dma/dma-common.yaml
>>> index 0141af0..ed0a49a 100644
>>> --- a/Documentation/devicetree/bindings/dma/dma-common.yaml
>>> +++ b/Documentation/devicetree/bindings/dma/dma-common.yaml
>>> @@ -24,7 +24,7 @@ properties:
>>>      description:
>>>        Used to provide DMA controller specific information.
>>>
>>> -  dma-channel-masks:
>>> +  dma-channel-mask:
>>>      $ref: /schemas/types.yaml#definitions/uint32
>>
>> How this mask supposed to be used for controllers having more than 32
>> channels (64, 300+)?
> 
> I found "dma-channels" property as 40 in arch/arm/boot/dts/ste-u300.dts.
> However, since arch/arm64/boot/dts/hisilicon/hi3660.dtsi already has
> the dma-channel-mask property, I think we should not change the property name.

I'm not asking it to be changed, I just wondered how I could use this
generic property for DMA controllers having more channels than u32
bitfield could describe. An array of multiple u32 to cover the number of
channels would probably something which can be done, but it would need
update for the documentation to make sure that it is used consistently.

I'm asking this because of: https://patchwork.kernel.org/patch/11111619/

> 
> Best regards,
> Yoshihiro Shimoda
> 
>>>      description:
>>>        Bitmask of available DMA channels in ascending order that are
>>>
>>
>> - Péter
>>
>> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
>> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
