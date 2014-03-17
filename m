From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH] dma: Add Keystone Packet DMA Engine driver
Date: Mon, 17 Mar 2014 15:37:47 -0400
Message-ID: <53274F0B.5070201@ti.com>
References: <1393628200-12317-1-git-send-email-santosh.shilimkar@ti.com>
 <20140311102357.GR1976@intel.com> <531F6908.4010104@ti.com>
 <20140312160017.GY1976@intel.com> <5320CEC4.1060306@ti.com>
 <20140317044223.GA1976@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140317044223.GA1976@intel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, linux-kernel@vger.kernel.org, Sandeep Nair <sandeep_n@ti.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Monday 17 March 2014 12:42 AM, Vinod Koul wrote:
> On Thu, Mar 13, 2014 at 05:16:52AM +0800, Santosh Shilimkar wrote:
>> On Thursday 13 March 2014 12:00 AM, Vinod Koul wrote:
>>> On Wed, Mar 12, 2014 at 03:50:32AM +0800, Santosh Shilimkar wrote:
>>>> On Tuesday 11 March 2014 06:23 PM, Vinod Koul wrote:
>>>>> On Fri, Feb 28, 2014 at 05:56:40PM -0500, Santosh Shilimkar wrote:
>>>>>> From: Sandeep Nair <sandeep_n@ti.com>
>>>>>>
>>>>>> The Packet DMA driver sets up the dma channels and flows for the
>>>>>> QMSS(Queue Manager SubSystem) who triggers the actual data movements
>>>>>> across clients using destination queues. Every client modules like
>>>>>> NETCP(Network Coprocessor), SRIO(Serial Rapid IO) and CRYPTO
>>>>>> Engines has its own instance of packet dma hardware. QMSS has also
>>>>>> an internal packet DMA module which is used as an infrastructure
>>>>>> DMA with zero copy.
>>>>>>
>>>>>> Patch adds DMAEngine driver for Keystone Packet DMA hardware.
>>>>>> The specifics on the device tree bindings for Packet DMA can be
>>>>>> found in:
>>>>>> 	Documentation/devicetree/bindings/dma/keystone-pktdma.txt
>>>>>>
>>>>>> The driver implements the configuration functions using standard DMAEngine
>>>>>> apis. The data movement is managed by QMSS device driver.
>>>>> Pls use subsystem appropriate name so here would have been dmaengine: ...
>>>>>
>>>>> So i am still missing stuff like prepare calls, irq, descriptor management to
>>>>> call this a dmaengine driver.
>>>>>
>>>>> I guess you need to explain a bit more why the data movement is handled by some
>>>>> other driver and not by this one
>>>>>
>>>> To expand above statement, Packet DMA hardware blocks on Keystone SOCs
>>>> are DMAEngines. QMSS is centralised subsystem manages multiple functionalities
>>>> including triggering dma transfers, descriptor management and completion
>>>> irqs. There are separate instance of packet DMA hardware block per client
>>>> device. We program the DMA hardware to allocate channels and flows. So
>>>> the packet DMA resouces like dma channels and dma flows are configured
>>>> and managed through the DMAEngine driver. Thats why we implement only
>>>> device_alloc_chan_resources, device_free_chan_resources and device_control
>>>> DMAEngine APIs.
>>> Sorry am bit lost. If its a dmaengine then you still need to program the
>>> transfers, how does that part work?
>>>
>> To simplify this bit more, you can think of this as DMA channels, flows
>> are allocated and DMA channels are enabled by DMA engine and they remains
>> enabled always as long as the channel in use. Enablling dma channel
>> actually don't start the DMA transfer but just sets up the connection/pipe
>> with peripheral and memory and vice a versa.
>>
>> All the descriptor management, triggering, sending completion interrupt or
>> hardware signal to DMAEngine all managed by centralised QMSS.
>>
>> Actual copy of data is still done by DMA hardware but its completely
>> transparent to software. DMAEngine hardware takes care of that in the
>> backyard.
> So you will use the dmaengine just for setting up the controller. Not for actual
> transfers. Those would be governed by the QMSS, right?
>
Correct.
 
> This means that someone expecting to use dmaengine API will get confused about
> this and doing part (alloc) thru dmaengine and rest (transfers) using some other
> API. This brings to me the design approach, does it really make sense creating
> dmaengine driver for this when we are not fully complying to the API
> 
Thats fair. The rationale behind usage of DMEngine was that its the closest
available subsystem which can be leveraged for this hardware. We can
pretty much use all the standard DMAEngine device tree parsing as well as
the config API to setup DMAs. 

I think you made your stand clear, just to confirm, you don't prefer this
driver to be a DMAEngine driver considering it doesn't fully complying to
the APIs. We could document the deviation of 'transfer' handling to avoid
any confusion.

Let me know your final thoughts and thanks a lot for the review.

Regards,
Santosh
