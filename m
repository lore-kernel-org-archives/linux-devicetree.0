From: Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH v5 08/12] dt-bindings: mediatek: Change the binding for
 mmsys clocks
Date: Fri, 30 Nov 2018 09:59:51 +0100
Message-ID: <a229bfc7-683f-5b0d-7b71-54f934de6214@suse.com>
References: <20181116125449.23581-1-matthias.bgg@kernel.org>
 <20181116125449.23581-9-matthias.bgg@kernel.org>
 <20181116231522.GA18006@bogus>
 <2a23e407-4cd4-2e2b-97a5-4e2bb96846e0@gmail.com>
 <CAL_JsqKJQwfDJbpmwW+oCxiDkSp5+6mG-uoURmCQVEMP_jFOEg@mail.gmail.com>
 <154281878765.88331.10581984256202566195@swboyd.mtv.corp.google.com>
 <458178ac-c0fc-9671-7fc8-ed2d6f61424c@suse.com>
 <154356023767.88331.18401188808548429052@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <154356023767.88331.18401188808548429052@swboyd.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>
Cc: matthias.bgg@kernel.org, Mark Rutland <mark.rutland@arm.com>, CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sean Wang <sean.wang@mediatek.com>, Sean Wang <sean.wang@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Chen-Yu Tsai <wens@csie.org>, dri-devel <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, linux-clk <linux-clk@vger.kernel.>
List-Id: devicetree@vger.kernel.org



On 30/11/2018 07:43, Stephen Boyd wrote:
> Quoting Matthias Brugger (2018-11-21 09:09:52)
>>
>>
>> On 21/11/2018 17:46, Stephen Boyd wrote:
>>> Quoting Rob Herring (2018-11-19 11:15:16)
>>>> On Sun, Nov 18, 2018 at 11:12 AM Matthias Brugger
>>>> <matthias.bgg@gmail.com> wrote:
>>>>> On 11/17/18 12:15 AM, Rob Herring wrote:
>>>>>> On Fri, Nov 16, 2018 at 01:54:45PM +0100, matthias.bgg@kernel.org wrote:
>>>>>>> -    #clock-cells = <1>;
>>>>>>> +
>>>>>>> +    mmsys_clk: clock-controller@14000000 {
>>>>>>> +            compatible = "mediatek,mt2712-mmsys-clk";
>>>>>>> +            #clock-cells = <1>;
>>>>>>
>>>>>> This goes against the general direction of not defining separate nodes
>>>>>> for providers with no resources.
>>>>>>
>>>>>> Why do you need this and what does it buy if you have to continue to
>>>>>> support the existing chips?
>>>>>>
>>>>>
>>>>> It would show explicitly that the mmsys block is used to probe two
>>>>> drivers, one for the gpu and one for the clocks. Otherwise that is
>>>>> hidden in the drm driver code. I think it is cleaner to describe that in
>>>>> the device tree.
>>>>
>>>> No, that's maybe cleaner for the driver implementation in the Linux
>>>> kernel. What about other OS's or when Linux drivers and subsystems
>>>> needs change? Cleaner for DT is design bindings that reflect the h/w.
>>>> Hardware is sometimes just messy.
>>>>
>>>
>>> I agree. I fail to see what this patch series is doing besides changing
>>> driver probe and device creation methods and making a backwards
>>> incompatible change to DT. Is there any other benefit here?
>>>
>>
>> You are referring whole series?
>> Citing the cover letter:
>> "MMSYS in Mediatek SoCs has some registers to control clock gates (which is
>> used in the clk driver) and some registers to set the routing and enable
>> the differnet (sic!) blocks of the display subsystem.
>>
>> Up to now both drivers, clock and drm are probed with the same device tree
>> compatible. But only the first driver get probed, which in effect breaks
>> graphics on mt8173 and mt2701.
> 
> Ouch!
> 

Yes :)

>>
>> This patch uses a platform device registration in the DRM driver, which
>> will trigger the probe of the corresponding clock driver. It was tested on the
>> bananapi-r2 and the Acer R13 Chromebook."
> 
> Alright, please don't add nodes in DT just to make device drivers probe.
> Instead, register clks from the drm driver or create a child platform
> device for the clk bits purely in the drm driver and have that probe the
> associated clk driver from there.
> 

I'll make the other SoCs probe via a child platform device from the drm driver,
as already done in 2/12 and 3/12.

Regards,
Matthias

>>
>> DT is broken right now, because two drivers rely on the same node, which gets
>> consumed just once. The new DT introduced does not break anything because it is
>> only used for boards that: "[..] are not available to the general public
>> (mt2712e) or only have the mmsys clock driver part implemented (mt6797)."
> 
> Ok, so backwards compatibility is irrelevant then. Sounds fine to me.
> 
> 
