From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCHv2 0/7] Add support for USB OTG on STM32F7
Date: Wed, 11 Oct 2017 16:38:08 +0200
Message-ID: <3c36db6d-75fd-1be6-e946-b75a04e3760e@st.com>
References: <1503930018-536-1-git-send-email-amelie.delaunay@st.com>
 <878tgim24i.fsf@linux.intel.com>
 <04a49088-b615-d7b8-0387-e7bfa32ee19f@st.com>
 <87vajllx8t.fsf@linux.intel.com>
 <1c4180ef-2da6-b420-7c6e-41769608384a@st.com>
 <87sheplsrm.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <87sheplsrm.fsf@linux.intel.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Felipe Balbi <felipe.balbi@linux.intel.com>, Amelie Delaunay <amelie.delaunay@st.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, John Youn <johnyoun@synopsys.com>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org



On 10/11/2017 03:26 PM, Felipe Balbi wrote:
> 
> Hi,
> 
> Alexandre Torgue <alexandre.torgue@st.com> writes:
>> Hi
>>
>> On 10/11/2017 01:50 PM, Felipe Balbi wrote:
>>>
>>> Hi,
>>>
>>> Alexandre Torgue <alexandre.torgue@st.com> writes:
>>>> Hi Felip
>>>>
>>>> On 10/11/2017 12:04 PM, Felipe Balbi wrote:
>>>>>
>>>>> Hi,
>>>>>
>>>>> Amelie Delaunay <amelie.delaunay@st.com> writes:
>>>>>> The STM32F7 MCU family embeds two DWC2 USB OTG cores. One core is USB
>>>>>> OTG FS and the other is USB OTG HS. The USB FS core only works with its
>>>>>> internal phy whilst the USB HS core can work in HS with external ULPI phy
>>>>>> or in FS/LS with the on-chip FS phy.
>>>>>>
>>>>>> Amelie Delaunay (7):
>>>>>>      dt-bindings: usb: Document the STM32F7 DWC2 USB OTG HS core binding
>>>>>>      usb: dwc2: add support for STM32F7 USB OTG HS
>>>>>>      ARM: dts: stm32: Add USB HS support for STM32F746 MCU
>>>>>
>>>>> I have applied these three patches. Should I take the rest? They seems
>>>>> like they could go upstream through the ARM maintainers.
>>>>>
>>>>
>>>> I will take other DT patches in my PR.
>>>>
>>>> Concerning "ARM: dts: stm32: Add USB HS support for STM32F746 MCU" patch
>>>> I prefer also to take it. This patch adds some pinctrl groups but stm32
>>>> pinctrl bindings will change in my next PR (we will use a macro to
>>>> define pins instead of using defined values). So if you push the DT
>>>> patch through your pull request there will be a merge issue.
>>>> It is possible that I take also this one ?
>>>
>>> In that case, it's best if you take them all :-) Here's my Ack:
>>>
>>> Acked-by: Felipe Balbi <felipe.balbi@linux.intel.com>
>>>
>>> I'll drop them from my tree now
>>
>> Ok perfect, I will take DT patches (3 to 7) and I let you take patch 1&2
>> in your tree.
> 
> Well, I have dropped them from my tree. Please two 1-7 through yours.

Hum, ok for this patchset but IMO it is better (next time) that you take 
driver pacthes in your tree and I take only DT patches in mine.
No ?

Regards
Alex

> 
