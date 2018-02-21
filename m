Return-Path: <SRS0=vlEr=FP=ti.com=t-kristo@kernel.org>
Subject: Re: [PATCH] dt-bindings: memory: ti-emif: add edac support under emif
References: <1518542129-25813-1-git-send-email-t-kristo@ti.com>
 <20180219031009.wduweeg53lnncntd@rob-hp-laptop>
 <186b6e13-be1d-e8e8-38db-efa5e3496dd8@ti.com>
 <CAL_JsqJTv+QH8xMGv6L7Dd-iF=mBZL+j4F0bVUWKipcMfY3zOQ@mail.gmail.com>
From: Tero Kristo <t-kristo@ti.com>
Message-ID: <e36fc21f-8dc7-733a-9c43-789c99d9cb36@ti.com>
Date: Wed, 21 Feb 2018 21:00:04 +0200
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJTv+QH8xMGv6L7Dd-iF=mBZL+j4F0bVUWKipcMfY3zOQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Santosh Shilimkar <ssantosh@kernel.org>, linux-omap <linux-omap@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 20/02/18 17:52, Rob Herring wrote:
> On Mon, Feb 19, 2018 at 12:21 AM, Tero Kristo <t-kristo@ti.com> wrote:
>> On 19/02/18 05:10, Rob Herring wrote:
>>>
>>> On Tue, Feb 13, 2018 at 07:15:29PM +0200, Tero Kristo wrote:
>>>>
>>>> Certain revisions of the TI EMIF IP contain ECC support in them. Reflect
>>>> this in the DT binding. Also, add interrupts property as a required
>>>> property for the emif controller, as all revisions of the emif IP contain
>>>> interrupt support; this might remain unused by the kernel driver though.
>>>>
>>>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>>>> ---
>>>>    .../devicetree/bindings/memory-controllers/ti/emif.txt      | 13
>>>> ++++++++++++-
>>>>    1 file changed, 12 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git
>>>> a/Documentation/devicetree/bindings/memory-controllers/ti/emif.txt
>>>> b/Documentation/devicetree/bindings/memory-controllers/ti/emif.txt
>>>> index 621b41c..87022a9 100644
>>>> --- a/Documentation/devicetree/bindings/memory-controllers/ti/emif.txt
>>>> +++ b/Documentation/devicetree/bindings/memory-controllers/ti/emif.txt
>>>> @@ -3,7 +3,9 @@
>>>>    EMIF - External Memory Interface - is an SDRAM controller used in
>>>>    TI SoCs. EMIF supports, based on the IP revision, one or more of
>>>>    DDR2/DDR3/LPDDR2 protocols. This binding describes a given instance
>>>> -of the EMIF IP and memory parts attached to it.
>>>> +of the EMIF IP and memory parts attached to it. Certain revisions
>>>> +of the EMIF controller also contain optional ECC support, which
>>>> +corrects one bit errors and detects two bit errors.
>>>>      Required properties:
>>>>    - compatible  : Should be of the form "ti,emif-<ip-rev>" where <ip-rev>
>>>> @@ -11,6 +13,8 @@ Required properties:
>>>>      compatible should be one of the following:
>>>>               "ti,emif-am3352"
>>>>               "ti,emif-am4372"
>>>> +            "ti,emif-dra7xx"
>>>> +            "ti,emif-keystone"
>>>>      - phy-type  : <u32> indicating the DDR phy type. Following are the
>>>>      allowed values
>>>> @@ -22,6 +26,7 @@ Required properties:
>>>>    - ti,hwmods   : For TI hwmods processing and omap device creation
>>>>      the value shall be "emif<n>" where <n> is the number of the EMIF
>>>>      instance with base 1.
>>>> +- interrupts   : interrupt used by the controller
>>>
>>>
>>> Only for the new compatibles?
>>
>>
>> I added this as required property for all, as all EMIF versions actually do
>> have IRQ. Should this still be marked as optional as only certain versions
>> of the driver use it? On am3/am4 only it is optional right now, and not used
>> by the existing driver. On omap4 and omap5 it is required also (list of
>> compatibles for the binding seem to be missing these actually; ti,emif-4d
>> and ti,emif-4d5.)
>>
>> Either way, I can mark this as optional property for am3/am4 if you want (I
>> actually asked this already before but did not get clear response), what is
>> your final take on this?
> 
> Okay. I'm fine if it is required. You're going to update all the dts
> files, right?

Yeah, I will post patches for those, thanks for review.

-Tero

> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
