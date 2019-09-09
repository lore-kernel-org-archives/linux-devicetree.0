From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [RFC 1/3] dt-bindings: dma: Add documentation for DMA domains
Date: Mon, 9 Sep 2019 09:30:39 +0300
Message-ID: <a452cd06-79ca-424d-b259-c8d60fc59772@ti.com>
References: <20190906141816.24095-1-peter.ujfalusi@ti.com>
 <20190906141816.24095-2-peter.ujfalusi@ti.com>
 <961d30ea-d707-1120-7ecf-f51c11c41891@ti.com>
 <20190908121058.GL2672@vkoul-mobl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190908121058.GL2672@vkoul-mobl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: robh+dt@kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, dan.j.williams@intel.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 08/09/2019 15.10, Vinod Koul wrote:
> On 08-09-19, 10:47, Peter Ujfalusi wrote:
>>
>>
>> On 06/09/2019 17.18, Peter Ujfalusi wrote:
>>> On systems where multiple DMA controllers available, none Slave (for example
>>> memcpy operation) users can not be described in DT as there is no device
>>> involved from the DMA controller's point of view, DMA binding is not usable.
>>> However in these systems still a peripheral might need to be serviced by or
>>> it is better to serviced by specific DMA controller.
>>> When a memcpy is used to/from a memory mapped region for example a DMA in the
>>> same domain can perform better.
>>> For generic software modules doing mem 2 mem operations it also matter that
>>> they will get a channel from a controller which is faster in DDR to DDR mode
>>> rather then from the first controller happen to be loaded.
>>>
>>> This property is inherited, so it may be specified in a device node or in any
>>> of its parent nodes.
>>>
>>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
>>> ---
>>>  .../devicetree/bindings/dma/dma-domain.yaml   | 59 +++++++++++++++++++
>>>  1 file changed, 59 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/dma/dma-domain.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/dma/dma-domain.yaml b/Documentation/devicetree/bindings/dma/dma-domain.yaml
>>> new file mode 100644
>>> index 000000000000..c2f182f30081
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/dma/dma-domain.yaml
>>> @@ -0,0 +1,59 @@
>>> +# SPDX-License-Identifier: GPL-2.0
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/dma/dma-controller.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: DMA Domain Controller Definition
>>> +
>>> +maintainers:
>>> +  - Vinod Koul <vkoul@kernel.org>
>>> +
>>> +allOf:
>>> +  - $ref: "dma-controller.yaml#"
>>> +
>>> +description:
>>> +  On systems where multiple DMA controllers available, none Slave (for example
>>> +  memcpy operation) users can not be described in DT as there is no device
>>> +  involved from the DMA controller's point of view, DMA binding is not usable.
>>> +  However in these systems still a peripheral might need to be serviced by or
>>> +  it is better to serviced by specific DMA controller.
>>> +  When a memcpy is used to/from a memory mapped region for example a DMA in the
>>> +  same domain can perform better.
>>> +  For generic software modules doing mem 2 mem operations it also matter that
>>> +  they will get a channel from a controller which is faster in DDR to DDR mode
>>> +  rather then from the first controller happen to be loaded.
>>> +
>>> +  This property is inherited, so it may be specified in a device node or in any
>>> +  of its parent nodes.
>>> +
>>> +properties:
>>> +  $dma-domain-controller:
>>
>> or domain-dma-controller?
> 
> I feel dma-domain-controller sounds fine as we are defining domains for
> dmaengine. Another thought which comes here is that why not extend this to
> slave as well and define dma-domain-controller for them as use that for
> filtering, that is what we really need along with slave id in case a
> specific channel is to be used by a peripheral
> 
> Thoughts..?

I have thought about this, we should be able to drop the phandle to the
dma controller from the slave binding just fine.

However we have the dma routers for the slave channels and there is no
clear way to handle them.
They are not needed for non slave channels as there is no trigger to
route. In DRA7 for example we have an event router for EDMA and another
one for sDMA. If a slave device is to be serviced by EDMA, the EDMA
event router needs to be specified, for sDMA clients should use the sDMA
event router.
In DRA7 case we don't really have DMA controllers for domains, but we
use the DMA which can service the peripheral better (sDMA is better to
be used for UART, but can not be used for McASP for example)

Then we have the other type of DMA router for daVinci/am33xx/am43xx
where the crossbar is not for the whole EDMA controller like in DRA7,
but we have small crossbars for some channels.

Other vendors have their own dma router topology..

Too many variables to handle the cases without gotchas, which would need
heavy churn in the core or in drivers.

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
