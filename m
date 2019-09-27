From: David Dai <daidavid1@codeaurora.org>
Subject: Re: [RFC PATCH] interconnect: Replace of_icc_get() with icc_get() and
 reduce DT binding
Date: Fri, 27 Sep 2019 10:16:07 -0700
Message-ID: <91d09847-31ad-e238-d84d-f7e0e21c6ef1@codeaurora.org>
References: <20190925054133.206992-1-swboyd@chromium.org>
 <20190925055933.GA2810@tuxbook-pro>
 <5d8b6b8b.1c69fb81.14b36.c053@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5d8b6b8b.1c69fb81.14b36.c053@mx.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Georgi Djakov <georgi.djakov@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Maxime Ripard <mripard@kernel.org>, linux-pm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Evan Green <evgreen@chromium.org>
List-Id: devicetree@vger.kernel.org


On 9/25/2019 6:28 AM, Stephen Boyd wrote:
> Quoting Bjorn Andersson (2019-09-24 22:59:33)
>> On Tue 24 Sep 22:41 PDT 2019, Stephen Boyd wrote:
>>
>>> The DT binding could also be simplified somewhat. Currently a path needs
>>> to be specified in DT for each and every use case that is possible for a
>>> device to want. Typically the path is to memory, which looks to be
>>> reserved for in the binding with the "dma-mem" named path, but sometimes
>>> the path is from a device to the CPU or more generically from a device
>>> to another device which could be a CPU, cache, DMA master, or another
>>> device if some sort of DMA to DMA scenario is happening. Let's remove
>>> the pair part of the binding so that we just list out a device's
>>> possible endpoints on the bus or busses that it's connected to.
>>>
>>> If the kernel wants to figure out what the path is to memory or the CPU
>>> or a cache or something else it should be able to do that by finding the
>>> node for the "destination" endpoint, extracting that node's
>>> "interconnects" property, and deriving the path in software. For
>>> example, we shouldn't need to write out each use case path by path in DT
>>> for each endpoint node that wants to set a bandwidth to memory. We
>>> should just be able to indicate what endpoint(s) a device sits on based
>>> on the interconnect provider in the system and then walk the various
>>> interconnects to find the path from that source endpoint to the
>>> destination endpoint.
>>>
>> But doesn't this implies that the other end of the path is always some
>> specific node, e.g. DDR? With a single node how would you describe
>> CPU->LLCC or GPU->OCIMEM?
> By only specifying the endpoint the device uses it describes what the
> hardware block interfaces with. It doesn't imply that there's only one
> other end of the path. It implies that the paths should be discoverable
> by walking the interconnect graph given some source device node and
> target device node. In most cases the target device node will be a DDR
> controller node, but sometimes it could be LLCC or OCIMEM. We may need
> to add some sort of "get the DDR controller device" API or work it into
> the interconnect API somehow to indicate what target endpoint is
> desired. By not listing all those paths in DT we gain flexibility to add
> more paths later on without having to update or tweak DT to describe
> more paths/routes through the interconnect.


I'm unsure that using the target device node or target source device is 
the correct way to represent the constraints that the consumers apply on 
the interconnects. While it's true the traffic is intended for the 
targeted devices, the constraints(QoS or BW) are for the interconnect or 
specifically the paths that span across the ports of various 
interconnects(NoC devices in this case). I think having both src and dst 
properties is still the simplest way to achieve the flexibility that we 
require to set the constraints for ports(that may not have a target 
device defined in DT or exists as some intermediate port across multiple 
interconnects).

>>> Obviously this patch doesn't compile but I'm sending it out to start
>>> this discussion so we don't get stuck on the binding or the kernel APIs
>>> for a long time. It looks like we should be OK in terms of backwards
>>> compatibility because we can just ignore the second element in an old
>>> binding, but maybe we'll want to describe paths in different directions
>>> (e.g. the path from the CPU to the SD controller may be different than
>>> the path the SD controller takes to the CPU) and that may require
>>> extending interconnect-names to indicate what direction/sort of path it
>>> is. I'm basically thinking about master vs. slave ports in AXI land.
>>>
>>> Cc: Maxime Ripard <mripard@kernel.org>
>>> Cc: <linux-pm@vger.kernel.org>
>>> Cc: Rob Herring <robh+dt@kernel.org>
>>> Cc: <devicetree@vger.kernel.org>
>>> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
>>> Cc: Evan Green <evgreen@chromium.org>
>>> Cc: David Dai <daidavid1@codeaurora.org>
>>> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>>> ---
>>>   .../bindings/interconnect/interconnect.txt    | 19 ++++---------------
>>>   include/linux/interconnect.h                  | 13 ++-----------
>>>   2 files changed, 6 insertions(+), 26 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/interconnect/interconnect.txt b/Documentation/devicetree/bindings/interconnect/interconnect.txt
>>> index 6f5d23a605b7..f8979186b8a7 100644
>>> --- a/Documentation/devicetree/bindings/interconnect/interconnect.txt
>>> +++ b/Documentation/devicetree/bindings/interconnect/interconnect.txt
>>> @@ -11,7 +11,7 @@ The interconnect provider binding is intended to represent the interconnect
>>>   controllers in the system. Each provider registers a set of interconnect
>>>   nodes, which expose the interconnect related capabilities of the interconnect
>>>   to consumer drivers. These capabilities can be throughput, latency, priority
>>> -etc. The consumer drivers set constraints on interconnect path (or endpoints)
>>> +etc. The consumer drivers set constraints on interconnect paths (or endpoints)
>>>   depending on the use case. Interconnect providers can also be interconnect
>>>   consumers, such as in the case where two network-on-chip fabrics interface
>>>   directly.
>>> @@ -42,23 +42,12 @@ multiple paths from different providers depending on use case and the
>>>   components it has to interact with.
>>>   
>>>   Required properties:
>>> -interconnects : Pairs of phandles and interconnect provider specifier to denote
>>> -             the edge source and destination ports of the interconnect path.
>>> -
>>> -Optional properties:
>>> -interconnect-names : List of interconnect path name strings sorted in the same
>>> -                  order as the interconnects property. Consumers drivers will use
>>> -                  interconnect-names to match interconnect paths with interconnect
>>> -                  specifier pairs.
>>> -
>>> -                     Reserved interconnect names:
>>> -                      * dma-mem: Path from the device to the main memory of
>>> -                                 the system
>>> +interconnects : phandle and interconnect provider specifier to denote
>>> +             the edge source for this node.
>>>   
>>>   Example:
>>>   
>>>        sdhci@7864000 {
>>>                ...
>>> -             interconnects = <&pnoc MASTER_SDCC_1 &bimc SLAVE_EBI_CH0>;
>>> -             interconnect-names = "sdhc-mem";
>>> +             interconnects = <&pnoc MASTER_SDCC_1>;
>> This example seems incomplete, as it doesn't describe the path between
>> CPU and the config space, with this in place I think you need the
>> interconnect-names.
>>
>>
>> But with a single interconnect, the interconnect-names should be
>> omitted, as done in other frameworks.
>>
> Sure, no names makes sense when it's just one path.
>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
