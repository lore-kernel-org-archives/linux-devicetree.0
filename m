From: Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH RESEND RFC 1/4] drivers: pinctrl: qcom: add wakeup
 capability to GPIO
Date: Fri, 10 Aug 2018 10:15:56 -0600
Message-ID: <20180810161556.GC5081@codeaurora.org>
References: <20180801194538.GA6422@codeaurora.org>
 <86wot9wb9u.wl-marc.zyngier@arm.com>
 <20180802065104.GA27850@codeaurora.org>
 <86sh3xw7m9.wl-marc.zyngier@arm.com>
 <20180802125827.GB27850@codeaurora.org>
 <153370830708.220756.4595316550560511917@swboyd.mtv.corp.google.com>
 <20180808072632.21f076b6@why.wild-wind.fr.eu.org>
 <153383585322.220756.9422019201626837843@swboyd.mtv.corp.google.com>
 <86wosypsvr.wl-marc.zyngier@arm.com>
 <153391359077.37448.3410612264580038499@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <153391359077.37448.3410612264580038499@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Marc Zyngier <marc.zyngier@arm.com>, evgreen@chromium.org, linus.walleij@linaro.org, bjorn.andersson@linaro.org, rplsssn@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 10 2018 at 09:06 -0600, Stephen Boyd wrote:
>Quoting Marc Zyngier (2018-08-10 00:45:12)
>> On Thu, 09 Aug 2018 18:30:53 +0100,
>> Stephen Boyd <swboyd@chromium.org> wrote:
>> >
>> > Quoting Marc Zyngier (2018-08-07 23:26:32)
>> > >
>> > > Level interrupts should be taken care of without doing anything, by the
>> > > very nature of being a level signal.
>> >
>> > Right. I suspect we'll still need to configure the PDC to actually wake
>> > up on the level triggered signal though so PDC needs to be told to
>> > unmask the line.
>>
>> Surely this can be done at suspend time with the PDC driver tracking
>> the interrupts that are configured as a wake-up source (although it
>> needs to track an interrupt that is logically connected to the TLMM,
>> which sucks).
>
>The PDC also needs to be configured for wakeups from deep CPU idle
>states where the GIC and TLMM are powered down. Lina, can you confirm
>this?
>
Yes, it will need to be handled as part of CPU idle as well, when the
last CPU powers down.

>Hooking system suspend in that case won't work. Is your hope that we can
>avoid using hierarchical irqdomains here entirely?
>
Well, I wasn't trying to avoid hierarchical irqdomains, there were
restrictions in using it. Not all GPIO pins have parent in PDC and the
ones that have are all not from the same bank either.

-- Lina
