From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: Re: [PATCH v2] clk: add userspace clock consumer
Date: Thu, 25 Feb 2016 23:40:34 +0900
Message-ID: <CAC5umyjs_Q_G4jpcmPWk4Ug16tdwq+7c3UH1kwastj2P1UenqA@mail.gmail.com>
References: <1456141719-2543-1-git-send-email-akinobu.mita@gmail.com>
	<20160223214944.GA20852@rob-hp-laptop>
	<20160224220819.GF4847@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160224220819.GF4847@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Rob Herring <robh@kernel.org>, linux-clk@vger.kernel.org, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>
List-Id: devicetree@vger.kernel.org

2016-02-25 7:08 GMT+09:00 Stephen Boyd <sboyd@codeaurora.org>:
> On 02/23, Rob Herring wrote:
>> On Mon, Feb 22, 2016 at 08:48:39PM +0900, Akinobu Mita wrote:
>> > This adds userspace consumer for common clock.
>> >
>> > This driver is inspired from Userspace regulator consumer
>> > (REGULATOR_USERSPACE_CONSUMER) and it is useful for test purposes and
>> > some classes of devices that are controlled entirely from user space.
>>
>> Whether the kernel handles a clock or userspace does should have nothing
>> to do with DT. Plus DT does not expose many of the clocks, so any
>> debug feature needs to expose all clocks and be independent of DT.
>>
>> Beyond debug, I don't think we should be exposing clock control to
>> userspace.
>
> Agreed. Plus, the userspace regulator consumer doesn't have any
> DT binding for it, so I don't see why we would have a DT binding
> for the clk one.

OK.  I'll drop a DT binding part of this driver.

I'll still try to expose this feature by platform device instead of
exposing under clk debugfs.  Because we don't want to allow controlling
all clock devices (which may result abuse of the feature).  Instead,
this userspace consumer only allows explicitly specified devices to
control.
