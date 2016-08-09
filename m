From: Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: [PATCH 1/3] dt/bindings: arm-pl330: add description of
 arm,pl330-periph-burst
Date: Tue, 9 Aug 2016 17:12:40 +0800
Message-ID: <1d42542f-c43c-5c4b-01b7-ba0ca085004a@rock-chips.com>
References: <1470365602-32586-1-git-send-email-shawn.lin@rock-chips.com>
 <1470365602-32586-2-git-send-email-shawn.lin@rock-chips.com>
 <20160805033410.GJ9681@localhost>
 <ea3572fa-4bff-87db-d5ad-f406809f8296@rock-chips.com>
 <0df0ab4f-0032-6487-2c30-b1ccd7d9ae62@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0df0ab4f-0032-6487-2c30-b1ccd7d9ae62@metafoo.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vinod.koul@intel.com>
Cc: shawn.lin@rock-chips.com, Rob Herring <robh+dt@kernel.org>, Huibin Hong <huibin.hong@rock-chips.com>, Xing Zheng <zhengxing@rock-chips.com>, devicetree@vger.kernel.org, dianders@chromium.org, briannorris@chromium.org, Caesar Wang <wxt@rock-chips.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Lars-Peter,

在 2016/8/9 16:39, Lars-Peter Clausen 写道:
> On 08/05/2016 09:25 AM, Shawn Lin wrote:
>> Hi Vinod,
>>
>> 在 2016/8/5 11:34, Vinod Koul 写道:
>>> On Fri, Aug 05, 2016 at 10:53:20AM +0800, Shawn Lin wrote:
>>>> This patch adds the "arm,pl330-periph-burst" for arm-pl330 to
>>>> support busrt mode.
>>>
>>> why should this be DT property. Only reason I can think of if some hw
>>> versions support this and some won't.
>>
>> yes, if we want to support burst mode, both of the master(pl330) and
>> client(several peripherals) should implement it, otherwise it will
>> be broken when enabling.
>
> As you said, it is up to the consumer peripheral whether it supports BURST,
> SINGLE or both. So this is a per client property, but you specify this as a
> a global property on the producer side.

Thanks for comment.

yup, but what is the proper way to add it ? :)


a) If pl330 support BURST as well as all the peripherals, we could
enable it.

b) If pl300 support BURST, but all the peripherals don't support it,
we could not enable it.

c) If pl300 support BURST, but not all the peripherals support it,
we also could not enable it.

the burst feature of peripheral IP may be vendor-specific, but the
common driver for this peripheral are used for many many vendors which
means we could not check all of this info. It's very likely to break
them... I couldn't figure out how many upstreamed peripheral drivers
who are using pl300 either.

So this check should be done by all this vendors but we could make
sure we don't break them before they check a), b), c), right?


>
>
>
>


-- 
Best Regards
Shawn Lin
