MIME-Version: 1.0
In-Reply-To: <4e6952d7-4896-71d3-9522-fe4c67f03ed2@rock-chips.com>
References: <1524471030-3527-1-git-send-email-shawn.lin@rock-chips.com>
	<20180427185458.6o5tlfic75gy2vqr@rob-hp-laptop>
	<979a598a-9b8f-0bcc-0de0-f1d02496515d@rock-chips.com>
	<CAPDyKFrYyaRASpAx7c6BvJ_5LP4whNeRUv-ZrveLftnV6ywO3w@mail.gmail.com>
	<4e6952d7-4896-71d3-9522-fe4c67f03ed2@rock-chips.com>
Date: Mon, 7 May 2018 08:46:07 -0500
Message-ID: <CAL_Jsq+X6US=oZreqSL7JSQE_+fk5QTUU3+x-_192sMa5WtU1Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Documentation: mmc: add description for power-delay-ms
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Adrian Hunter <adrian.hunter@intel.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, May 3, 2018 at 2:26 AM, Shawn Lin <shawn.lin@rock-chips.com> wrote:
> On 2018/5/2 20:46, Ulf Hansson wrote:
>>
>> On 28 April 2018 at 03:11, Shawn Lin <shawn.lin@rock-chips.com> wrote:
>>>
>>> Hi Rob and Ulf,
>>>
>>> On 2018/4/28 2:54, Rob Herring wrote:
>>>>
>>>>
>>>> On Mon, Apr 23, 2018 at 04:10:29PM +0800, Shawn Lin wrote:
>>>
>>>
>>>
>>> ...
>>>
>>>>> +- power-delay-ms: Tunable delay waiting for I/O signalling and card
>>>>> power supply
>>>>> +  to be stable. Default to 10ms if no available.
>>>>
>>>>
>>>>
>>>> How long do you need? Would changing the default to say 20ms work and
>>>> still be short enough others don't care?
>>>
>>>
>>>
>>> It varies from board-2-board, but my boards only need 2ms or less. The
>>> hard-coded 10ms was increased from 2ms since 2009, just for fixing one
>>> board. And nobody complained 10ms is too short(including me), so it's
>>> fine for everybody probably. However, nobody complained it's toooo long
>>> as well, expect me, so my best guess is either others don't care it at
>>> all, or haven't noticed it. So the intention for this patch, is to save
>>> the unnecessary waste for the boot-time sensitive environment, by
>>> reducing the delay but don't break anything else.
>>>
>>>
>>>>
>>>> Can we use the same property as the mmc pwrseq binding defines:
>>>> post-power-on-delay-ms
>>>
>>>
>>>
>>> I'm fine with using post-power-on-delay-ms, but it depends on whether
>>> using pwrseq_simple. So I need add parsing it in two places for
>>> different prupose. Is it ok, or better idea?
>>
>>
>> I don't think the parsing is an issue, but that we need to allow two
>> different descriptions of the same property name may be a bit
>> confusing.
>
>
>> I would rather keep them separate, but I have no strong onion.
>>
>
> I also would like to keep the separate. Rob, any suggestion? :)

I think it is fine to describe it in 2 places. It just needs to have
the same definition in terms of what happens before and after it.

Rob
