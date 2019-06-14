From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH 09/16] dt-bindings: dma: ti: Add document for K3 UDMA
Date: Fri, 14 Jun 2019 16:43:15 +0300
Message-ID: <e811d674-b79f-4da8-c632-c7a90844b6c5@ti.com>
References: <20190506123456.6777-1-peter.ujfalusi@ti.com>
 <20190506123456.6777-10-peter.ujfalusi@ti.com> <20190613181626.GA7039@bogus>
 <e0d6a264-96b5-31a6-e70b-3b1c2d863988@ti.com>
 <CAL_JsqJNMkKL_FubZfjKY6jLebMetmgR24EoendHoPM2ckrUQA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJNMkKL_FubZfjKY6jLebMetmgR24EoendHoPM2ckrUQA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Vinod <vkoul@kernel.org>, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Dan Williams <dan.j.williams@intel.com>, "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>, Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>
List-Id: devicetree@vger.kernel.org


On 14/06/2019 16.20, Rob Herring wrote:
> On Thu, Jun 13, 2019 at 2:33 PM Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:
>>
>> Rob,
>>
>> On 13/06/2019 21.16, Rob Herring wrote:
>>>> +Remote PSI-L endpoint
>>>> +
>>>> +Required properties:
>>>> +--------------------
>>>> +- ti,psil-base:             PSI-L thread ID base of the endpoint
>>>> +
>>>> +Within the PSI-L endpoint node thread configuration subnodes must present with:
>>>> +ti,psil-configX naming convention, where X is the thread ID offset.
>>>
>>> Don't use vendor prefixes on node names.
>>
>> OK.
>>
>>>> +
>>>> +Configuration node Required properties:
>>>> +--------------------
>>>> +- linux,udma-mode:  Channel mode, can be:
>>>> +                    - UDMA_PKT_MODE: for Packet mode channels (peripherals)
>>>> +                    - UDMA_TR_MODE: for Third-Party mode
>>>
>>> This is hardly a common linux thing. What determines the value here.
>>
>> Unfortunately it is.
> 
> No, it's a feature of your h/w and in no way is something linux
> defined which is the point of 'linux' prefix.

The channel can be either Packet or TR mode. The HW is really flexible
on this (and on other things as well).
It just happens that Linux need to use specific channels in a specific mode.

Would it help if we assume that all channels are used in Packet mode,
but we have linux,tr-mode bool to indicate that the given channel in
Linux need to be used in TR mode.

>> Each channel can be configured to Packet or TR mode. For some
>> peripherals it is true that they only support packet mode, these are the
>> newer PSI-L native peripherals.
>> For these channels a udma-mode property would be correct.
>>
>> But we have legacy peripherals as well and they are serviced by PDMA
>> (which is a native peripheral designed to talk to the given legacy IP).
>> We can use either packet or TR mode in UDMAP to talk to PDMAs, it is in
>> most cases clear what to use, but for example for audio (McASP) channels
>> Linux is using TR channel because we need cyclic DMA while for example
>> RTOS is using Packet mode as it fits their needs better.
>>
>> Here I need to prefix the udma-mode with linux as the mode is used by
>> Linux, but other OS might opt to use different channel mode.
> 
> So you'd need <os>,udma-mode? That doesn't work... If the setting is
> per OS, then it belongs in the OS because the same dtb should work
> across OS's.

So I should have a table for the thread IDs in the DMA driver and mark
channels as TR or Packet in there for Linux use?
Or just an array which would mark the non packet PSI-L thread IDs?

I still prefer to have this coming via DT as a Linux parameter as other
OS is free to ignore the linux,udma-mode, but as I said there are
certain channels which must be used in Linux in certain mode while
others in different mode.

>> The reason why this needs to be in the DT is that when the channel is
>> requested we need to configure the mode and it can not be swapped
>> runtime easily between Packet and TR mode.
> 
> So when the client makes the channel request, why doesn't it specify the mode?

This is UDMAP internal information on what type of Descriptors the
channel will expect and how it is going to dispatch the work.

Packet and TR mode at the end does the same thing, but in a completely
different way.

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
