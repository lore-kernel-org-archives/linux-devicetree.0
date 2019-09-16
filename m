From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH 1/3] dt-bindings: dma: Add documentation for DMA domains
Date: Mon, 16 Sep 2019 14:21:50 +0300
Message-ID: <82254a3e-12fe-14d8-d49a-6627dd1d3559@ti.com>
References: <20190910115037.23539-1-peter.ujfalusi@ti.com>
 <20190910115037.23539-2-peter.ujfalusi@ti.com>
 <5d7ba96c.1c69fb81.ee467.32b9@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5d7ba96c.1c69fb81.ee467.32b9@mx.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, dan.j.williams@intel.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 13/09/2019 17.36, Rob Herring wrote:
> On Tue, Sep 10, 2019 at 02:50:35PM +0300, Peter Ujfalusi wrote:
>> On systems where multiple DMA controllers available, non Slave (for example
>> memcpy operation) users can not be described in DT as there is no device
>> involved from the DMA controller's point of view, DMA binding is not usable.
>> However in these systems still a peripheral might need to be serviced by or
>> it is better to serviced by specific DMA controller.
>> When a memcpy is used to/from a memory mapped region for example a DMA in the
>> same domain can perform better.
>> For generic software modules doing mem 2 mem operations it also matter that
>> they will get a channel from a controller which is faster in DDR to DDR mode
>> rather then from the first controller happen to be loaded.
>>
>> This property is inherited, so it may be specified in a device node or in any
>> of its parent nodes.
> 
> If a device needs mem2mem dma, I think we should just use the existing 
> dma binding. The provider will need a way to define cell values which 
> mean mem2mem.

But isn't it going to be an abuse of the binding? Each DMA controller
would hack this in different ways, probably using out of range DMA
request/trigger number or if they have direction in the binding or some
other parameter would be set to something invalid...

> For generic s/w, it should be able to query the dma speed or get a 
> preferred one IMO. It's not a DT problem.
> 
> We measure memcpy speeds at boot time to select the fastest 
> implementation for a chip, why not do that for mem2mem DMA?

It would make an impact on boot time since the tests would need to be
done with a large enough copy to be able to see clearly which one is faster.

Also we should be able to handle different probing orders:
client1 should have mem2mem channel from dma2.

- dma1 probes
- client1 probes and asks for a mem2mem channel
- dma2 probes

Here client1 should deffer until dma2 is probed.

Probably the property should be dma-mem2mem-domain to be more precise on
it's purpose and avoid confusion?

> 
>>
>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
>> ---
>>  .../devicetree/bindings/dma/dma-domain.yaml   | 88 +++++++++++++++++++
>>  1 file changed, 88 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/dma/dma-domain.yaml
> 
> Note that you have several errors in your schema. Run 'make dt_bindings_check'.

That does not do anything on my system, but git dt-doc-validate running
via https://github.com/robherring/yaml-bindings.git.

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
