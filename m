From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v5 08/12] dt-bindings: mediatek: Change the binding for
 mmsys clocks
Date: Thu, 4 Jul 2019 11:08:46 +0200
Message-ID: <84d1c444-d6cb-9537-1bf5-b4e736443239@gmail.com>
References: <20181116125449.23581-1-matthias.bgg@kernel.org>
 <20181116125449.23581-9-matthias.bgg@kernel.org>
 <20181116231522.GA18006@bogus>
 <2a23e407-4cd4-2e2b-97a5-4e2bb96846e0@gmail.com>
 <CAL_JsqKJQwfDJbpmwW+oCxiDkSp5+6mG-uoURmCQVEMP_jFOEg@mail.gmail.com>
 <154281878765.88331.10581984256202566195@swboyd.mtv.corp.google.com>
 <458178ac-c0fc-9671-7fc8-ed2d6f61424c@suse.com>
 <154356023767.88331.18401188808548429052@swboyd.mtv.corp.google.com>
 <a229bfc7-683f-5b0d-7b71-54f934de6214@suse.com>
 <1561953318.25914.9.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561953318.25914.9.camel@mtksdaap41>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>, Matthias Brugger <mbrugger@suse.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sean Wang <sean.wang@kernel.org>, David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>, Sean Wang <Sean.Wang@mediatek.com>, Stephen Boyd <sboyd@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Randy Dunlap <rdunlap@infradead.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>, "matthias.bgg@kernel.org" <matthias.bgg@kernel.org>"linux-mediatek@lists.infradead.org" <linux->
List-Id: devicetree@vger.kernel.org

Hi CK-Hu,

On 01/07/2019 05:55, CK Hu wrote:
> Hi, Matthias:
> 
> On Fri, 2018-11-30 at 16:59 +0800, Matthias Brugger wrote:
>>
>> On 30/11/2018 07:43, Stephen Boyd wrote:
>>> Quoting Matthias Brugger (2018-11-21 09:09:52)
>>>>
>>>>
>>>> On 21/11/2018 17:46, Stephen Boyd wrote:
>>>>> Quoting Rob Herring (2018-11-19 11:15:16)
>>>>>> On Sun, Nov 18, 2018 at 11:12 AM Matthias Brugger
>>>>>> <matthias.bgg@gmail.com> wrote:
>>>>>>> On 11/17/18 12:15 AM, Rob Herring wrote:
>>>>>>>> On Fri, Nov 16, 2018 at 01:54:45PM +0100, matthias.bgg@kernel.org wrote:
>>>>>>>>> -    #clock-cells = <1>;
>>>>>>>>> +
>>>>>>>>> +    mmsys_clk: clock-controller@14000000 {
>>>>>>>>> +            compatible = "mediatek,mt2712-mmsys-clk";
>>>>>>>>> +            #clock-cells = <1>;
>>>>>>>>
>>>>>>>> This goes against the general direction of not defining separate nodes
>>>>>>>> for providers with no resources.
>>>>>>>>
>>>>>>>> Why do you need this and what does it buy if you have to continue to
>>>>>>>> support the existing chips?
>>>>>>>>
>>>>>>>
>>>>>>> It would show explicitly that the mmsys block is used to probe two
>>>>>>> drivers, one for the gpu and one for the clocks. Otherwise that is
>>>>>>> hidden in the drm driver code. I think it is cleaner to describe that in
>>>>>>> the device tree.
>>>>>>
>>>>>> No, that's maybe cleaner for the driver implementation in the Linux
>>>>>> kernel. What about other OS's or when Linux drivers and subsystems
>>>>>> needs change? Cleaner for DT is design bindings that reflect the h/w.
>>>>>> Hardware is sometimes just messy.
>>>>>>
>>>>>
>>>>> I agree. I fail to see what this patch series is doing besides changing
>>>>> driver probe and device creation methods and making a backwards
>>>>> incompatible change to DT. Is there any other benefit here?
>>>>>
>>>>
>>>> You are referring whole series?
>>>> Citing the cover letter:
>>>> "MMSYS in Mediatek SoCs has some registers to control clock gates (which is
>>>> used in the clk driver) and some registers to set the routing and enable
>>>> the differnet (sic!) blocks of the display subsystem.
>>>>
>>>> Up to now both drivers, clock and drm are probed with the same device tree
>>>> compatible. But only the first driver get probed, which in effect breaks
>>>> graphics on mt8173 and mt2701.
>>>
>>> Ouch!
>>>
>>
>> Yes :)
>>
>>>>
>>>> This patch uses a platform device registration in the DRM driver, which
>>>> will trigger the probe of the corresponding clock driver. It was tested on the
>>>> bananapi-r2 and the Acer R13 Chromebook."
>>>
>>> Alright, please don't add nodes in DT just to make device drivers probe.
>>> Instead, register clks from the drm driver or create a child platform
>>> device for the clk bits purely in the drm driver and have that probe the
>>> associated clk driver from there.
>>>
>>
>> I'll make the other SoCs probe via a child platform device from the drm driver,
>> as already done in 2/12 and 3/12.
> 
> This series have been pending for half an year, would you keep going on
> this series? If you're busy, I could complete this series, but I need to
> know what you have plan to do.
> 

You are right, it took far too long for me to respond with a new version of the
series. The problem I face is, that I use my mt8173 based chromebook for
testing. It needs some downstream patches and broke somewhere between my last
email and a few month ago. I wasn't able to get serial console to work, which
made things even more complicated. Anyway, long story short, I got sidetracked
with other stuff and didn't send a new version.

If you have time to work on this, I'd happy to see things being pushed forward
by you :)

> I guess that 1/12 ~ 5/12 is for MT2701/MT8173 and that patches meet this
> discussion. 6/12 ~ 12/12 is for MT2712/MT6797 but that patches does not
> meet this discussion. So the unfinished work is to make MT2712/MT6797 to
> align MT2701/MT8173, is this right?

After re-reading the emails I think the missing part is, to probe the clocks
from the DRM driver instead of adding a new devicetree binding for them.

Regards,
Matthias

> 
> Regards,
> CK
> 
>>
>> Regards,
>> Matthias
>>
>>>>
>>>> DT is broken right now, because two drivers rely on the same node, which gets
>>>> consumed just once. The new DT introduced does not break anything because it is
>>>> only used for boards that: "[..] are not available to the general public
>>>> (mt2712e) or only have the mmsys clock driver part implemented (mt6797)."
>>>
>>> Ok, so backwards compatibility is irrelevant then. Sounds fine to me.
>>>
>>>
>>
>> _______________________________________________
>> Linux-mediatek mailing list
>> Linux-mediatek@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-mediatek
> 
> 
