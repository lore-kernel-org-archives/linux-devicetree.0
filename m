From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 0/7] arm64: meson: g12a: add audio devices
Date: Wed, 17 Apr 2019 07:58:19 -0700
Message-ID: <7hmukon0fo.fsf@baylibre.com>
References: <20190412125136.28232-1-jbrunet@baylibre.com> <7h5zrdpytg.fsf@baylibre.com> <CAOi56cU0dHoyRzTXeKGoiFwTms4WuJ7LV2EXTJLoEmOsC8OyrA@mail.gmail.com> <3eec8b122aa4912dfa67aeb37ad2c941c34c0a38.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3eec8b122aa4912dfa67aeb37ad2c941c34c0a38.camel@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
Cc: devicetree <devicetree@vger.kernel.org>, linux-amlogic <linux-amlogic@lists.infradead.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, patchwork-bot+notify@kernel.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> On Tue, 2019-04-16 at 12:22 -0700, Kevin Hilman wrote:
>> On Tue, Apr 16, 2019 at 11:52 AM Kevin Hilman <khilman@baylibre.com> wrote:
>> > Jerome Brunet <jbrunet@baylibre.com> writes:
>> > 
>> > > This patchset adds most the audio devices of the g12a SoCs.
>> > > 
>> > > Kevin, couple of things worth noting:
>> > >  * This patch depends of the new audio clocks binding recently applied
>> > >    by Neil [0].
>> > 
>> > Was this supposed to be part of the clk-headers dependency PR I
>> > received?  /me looks... It looks like it's applied right after the tag I
>> > pulled, so I doesn't look like it.
>> > 
>> > If I should queue $SUBJECT series up for 5.2, I'll need another stable
>> > tag.
>> 
>> Also, this doesn't apply cleanly anymore to my v5.2/dt64 branch.  When
>> the stable tag is ready, do you mind doing a rebase? (or telling me
>> what it currently applies to, and I will do the rebase.)
>
> Hi Kevin,
>
> Until we have a solution for the drive strength in pinctrl, I won't be able to
> submit the audio pins. I doubt it will happen in this cycle.
>
> Without the pins, audio won't work anyway ... so no rush
>
> If it is ok with you, I'll resend at the beginning of the next cycle. Clk and
> ASoC deps will be merged by then, so things should be more straight forward.

Works for me, thanks.

Kevin
