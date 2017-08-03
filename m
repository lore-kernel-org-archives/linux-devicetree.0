From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: add new compatible strings for mtk nor
 controller
Date: Thu, 3 Aug 2017 12:09:44 +0200
Message-ID: <0796f86e-044b-5891-e56e-c96242611608@gmail.com>
References: <1500948617-19627-1-git-send-email-guochun.mao@mediatek.com>
 <1500948617-19627-2-git-send-email-guochun.mao@mediatek.com>
 <03016ea3-51ad-0b2d-e824-0a20913bd7c1@gmail.com>
 <20170802103637.16cd6548@bbrezillon>
 <535cc2d5-7bc9-2cb7-42cf-9d7058e64226@wedev4u.fr>
 <1501726602.4381.23.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501726602.4381.23.camel@mhfsdcap03>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Guochun Mao <guochun.mao@mediatek.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, linux-mediatek@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 08/03/2017 04:16 AM, Guochun Mao wrote:
> Hi Cyrille,
> 
> On Wed, 2017-08-02 at 17:31 +0200, Cyrille Pitchen wrote:
>> Hi Guochun,
>>
>> Le 02/08/2017 à 10:36, Boris Brezillon a écrit :
>>> Hi Matthias,
>>>
>>> On Tue, 1 Aug 2017 14:33:22 +0200
>>> Matthias Brugger <matthias.bgg@gmail.com> wrote:
>>>
>>>> On 07/25/2017 04:10 AM, Guochun Mao wrote:
>>>>> Add "mediatek,mt2712-nor" and "mediatek,mt7622-nor"
>>>>> for nor flash node's compatible strings.
>>>>>
>>>>> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
>>>>> Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
>>>>> ---
>>>>>    .../devicetree/bindings/mtd/mtk-quadspi.txt        |    2 ++
>>>>>    1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
>>>>> index 5ded66a..9845ff4 100644
>>>>> --- a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
>>>>> +++ b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
>>>>> @@ -3,6 +3,8 @@
>>>>>    Required properties:
>>>>>    - compatible: 	  The possible values are:
>>>>>    		  "mediatek,mt2701-nor"
>>>>> +		  "mediatek,mt2712-nor"
>>>>> +		  "mediatek,mt7622-nor"
>>>>>    		  "mediatek,mt7623-nor"
>>>>>    		  "mediatek,mt8173-nor"
>>>>>    		  For mt8173, compatible should be "mediatek,mt8173-nor".
>>>>>
>>
>> There should be another patch to update the mtk_nor_of_ids[] array in
>> the mtk-quadspi.c driver, shouldn't it?
>>
>> Currently, I only see the "mediatek,mt8173-nor" compatible string at the
>> driver side. The driver and its documentation should be aligned and both
>> patches should be applied at the same time.
> 
>> Best regards,
>>
>> Cyrille
> 
> 
>  From my designer's info, these IPs' nor controller could use same
> driver, and I had verified it. I think there's no need to update
> mtk_nor_of_ids[], unless we find difference between these IPs(exactly
> compared with mt8173).
> How do you think?
>


Right, mt8173-nor is the fallback binding which will be used by the driver. As 
the documentation states, the compatible string should be something like:
"mediatek,mt7622-nor", "mediatek,mt8173-nor"

So the mt7622-nor binding is not matched in the driver, as the driver is the 
same on all SoCs. Nonetheless if we realize in the future that mt7622 IP has 
some special feature/bug, we can use the binding to implement that in the driver.

AFAIK this is the standard way for bindings. Cyrille, is this ok for you, or do 
want all bindings to be reflected in the driver even though they don't change 
any functionality?

Regards,
Matthias

> And, we will add dts patches for new SOCs, are these patches should
> applied with this documentation?
> 
> Best regards,
> Guochun
> 
