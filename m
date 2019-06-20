From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH 09/16] dt-bindings: dma: ti: Add document for K3 UDMA
Date: Thu, 20 Jun 2019 12:56:16 +0300
Message-ID: <f7bb4e82-95ea-a043-e2b1-f429b16642ba@ti.com>
References: <20190506123456.6777-1-peter.ujfalusi@ti.com>
 <20190506123456.6777-10-peter.ujfalusi@ti.com> <20190613181626.GA7039@bogus>
 <e0d6a264-96b5-31a6-e70b-3b1c2d863988@ti.com>
 <CAL_JsqJNMkKL_FubZfjKY6jLebMetmgR24EoendHoPM2ckrUQA@mail.gmail.com>
 <e811d674-b79f-4da8-c632-c7a90844b6c5@ti.com>
 <CAL_JsqJTWNKTB1D2wNysonzasgL9awLLvr1HdOckUnQbpgsDQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJTWNKTB1D2wNysonzasgL9awLLvr1HdOckUnQbpgsDQw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Vinod <vkoul@kernel.org>, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Dan Williams <dan.j.williams@intel.com>, "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>, Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>
List-Id: devicetree@vger.kernel.org



On 19/06/2019 17.04, Rob Herring wrote:
> On Fri, Jun 14, 2019 at 7:42 AM Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:
>>
>>
>> On 14/06/2019 16.20, Rob Herring wrote:
>>> On Thu, Jun 13, 2019 at 2:33 PM Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:
>>>>
>>>> Rob,
>>>>
>>>> On 13/06/2019 21.16, Rob Herring wrote:
>>>>>> +Remote PSI-L endpoint
>>>>>> +
>>>>>> +Required properties:
>>>>>> +--------------------
>>>>>> +- ti,psil-base:             PSI-L thread ID base of the endpoint
>>>>>> +
>>>>>> +Within the PSI-L endpoint node thread configuration subnodes must present with:
>>>>>> +ti,psil-configX naming convention, where X is the thread ID offset.
>>>>>
>>>>> Don't use vendor prefixes on node names.
>>>>
>>>> OK.
>>>>
>>>>>> +
>>>>>> +Configuration node Required properties:
>>>>>> +--------------------
>>>>>> +- linux,udma-mode:  Channel mode, can be:
>>>>>> +                    - UDMA_PKT_MODE: for Packet mode channels (peripherals)
>>>>>> +                    - UDMA_TR_MODE: for Third-Party mode
>>>>>
>>>>> This is hardly a common linux thing. What determines the value here.
>>>>
>>>> Unfortunately it is.
>>>
>>> No, it's a feature of your h/w and in no way is something linux
>>> defined which is the point of 'linux' prefix.
>>
>> The channel can be either Packet or TR mode. The HW is really flexible
>> on this (and on other things as well).
>> It just happens that Linux need to use specific channels in a specific mode.
>>
>> Would it help if we assume that all channels are used in Packet mode,
>> but we have linux,tr-mode bool to indicate that the given channel in
>> Linux need to be used in TR mode.
> 
> Your use of 'linux' prefix is wrong. Stop using it.

OK, I can not argue with that.
I'll have 'tr-mode' bool to indicate that the channel should be
configured in TR mode for the given thread.

>>>> Each channel can be configured to Packet or TR mode. For some
>>>> peripherals it is true that they only support packet mode, these are the
>>>> newer PSI-L native peripherals.
>>>> For these channels a udma-mode property would be correct.
>>>>
>>>> But we have legacy peripherals as well and they are serviced by PDMA
>>>> (which is a native peripheral designed to talk to the given legacy IP).
>>>> We can use either packet or TR mode in UDMAP to talk to PDMAs, it is in
>>>> most cases clear what to use, but for example for audio (McASP) channels
>>>> Linux is using TR channel because we need cyclic DMA while for example
>>>> RTOS is using Packet mode as it fits their needs better.
>>>>
>>>> Here I need to prefix the udma-mode with linux as the mode is used by
>>>> Linux, but other OS might opt to use different channel mode.
>>>
>>> So you'd need <os>,udma-mode? That doesn't work... If the setting is
>>> per OS, then it belongs in the OS because the same dtb should work
>>> across OS's.
>>
>> So I should have a table for the thread IDs in the DMA driver and mark
>> channels as TR or Packet in there for Linux use?
> 
> Perhaps. I haven't heard any reasons why you need this in DT. If Linux
> is dictating the modes, then sounds like it should be in Linux.
> 
> But really, I don't fully understand what you are doing here to tell
> you what to do beyond using 'linux' prefix is wrong.

We have certain peripherals (McASP/UART/McSPI/etc) which is serviced by
PDMAs to be compatible with the data movement architecture implemented
within NAVSS.
Unlike native peripherals, like networking we can configure the UDMAP
channel to either Packet or TR mode. There are differences between the
two modes, but the job can be done in both modes.
In Linux we use TR mode for audio channels as it provides the needed
functionality we need (efficient cyclic mode, can disable interrupts).

There is no information from the HW on how a given thread is best used
and other OSs can opt for not optimal use.

But the majority of threads are better served in Packet mode, so adding
a bool flag to the thread configuration to indicate that TR mode is the
advised mode for it is perfectly fine.

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
