From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [v2, 4/4] dt-bindings: mtd: Add Octal SPI support to Cadence
 QSPI.
Date: Fri, 10 Mar 2017 13:52:31 +0100
Message-ID: <7d303436-77cf-fb11-30b6-c59014950ae6@gmail.com>
References: <1488959932-6657-1-git-send-email-jartur@cadence.com>
 <1488960326-13858-1-git-send-email-jartur@cadence.com>
 <132a4818-11d1-263f-aae4-bac4e76c14c8@gmail.com>
 <DM5PR07MB2780A784F8973310542FDBE3D4200@DM5PR07MB2780.namprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DM5PR07MB2780A784F8973310542FDBE3D4200@DM5PR07MB2780.namprd07.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Artur Jedrysek <jartur@cadence.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On 03/10/2017 01:03 PM, Artur Jedrysek wrote:
> 
>> From: Marek Vasut [mailto:marek.vasut@gmail.com]
>> Sent: 10 March 2017 04:39
>> On 03/08/2017 09:05 AM, Artur Jedrysek wrote:
>>> This patch updates Cadence QSPI Device Tree documentation to include
>>> information about new compatible used to indicate, whether or not
>>> Octal SPI transfers are supported by the device.
>>>
>>> Signed-off-by: Artur Jedrysek <jartur@cadence.com>
>>> ---
>>> Changelog:
>>> v2: Use new compatible, instead of boolean property, to indicate
>>> Octal SPI support.
>>> ---
>>>  Documentation/devicetree/bindings/mtd/cadence-quadspi.txt | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
>> b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
>>> index f248056..41d1e98 100644
>>> --- a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
>>> +++ b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
>>> @@ -1,7 +1,9 @@
>>>  * Cadence Quad SPI controller
>>>
>>>  Required properties:
>>> -- compatible : Should be "cdns,qspi-nor".
>>> +- compatible : Should be "cdns,{qspi|ospi}-nor".
>>
>> Please explicitly list all compatibles , ie.
>> Should be "cdns,qspi-nor" or "cdns,ospi-nor".
>>
> 
> Two possible options are also explicitly listed right below. I did that
> in the way it was done in other driver for Cadence IP:
> /Documentation/devicetree/bindings/net/macb.txt
> Should I remove all of that and replace it with both options, separated
> by an "or" word?

Wait for Rob to confirm.

>> But I think the ospi is backward compatible with qspi, right ? So the
>> binding for ospi should list both, ie.
>> compatible = "cdns,ospi-nor", "cdns,qspi-nor";
>>
> 
> Yes, the ospi is backwards compatible with qspi. However, the sole point
> of introducing new compatible was to differentiate between them (which
> was previously done using a boolean flag, but that was criticized).
> Listing both bindings for ospi would only help for kernels not
> containing driver update being subject of this patch series, as both
> ospi and qspi are handled by the same driver - just with a slight
> difference. I apologize if I got something wrong here.

You got it right, I was just curious about the compatibility.

>>> +  Use "cdns,qspi-nor" for Quad SPI controller.
>>> +  Use "cdns,ospi-nor" for Octal SPI controller.
>>>  - reg : Contains two entries, each of which is a tuple consisting of a
>>>  	physical address and length. The first entry is the address and
>>>  	length of the controller register set. The second entry is the
>>>
>>
>>
>> --
>> Best regards,
>> Marek Vasut


-- 
Best regards,
Marek Vasut
