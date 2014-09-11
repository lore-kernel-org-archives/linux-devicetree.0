From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v2] clocksource: arch_timer: Allow the device tree to
 specify the physical timer
Date: Thu, 11 Sep 2014 18:00:24 +0100
Message-ID: <5411D528.4050605@arm.com>
References: <1410452204-7277-1-git-send-email-dianders@chromium.org> <20140911164710.GW6158@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140911164710.GW6158@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>
Cc: Doug Anderson <dianders@chromium.org>, "olof@lixom.net" <olof@lixom.net>, Sonny Rao <sonnyrao@chromium.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Mark Rutland <Mark.Rutland@arm.com>, Stephen Boyd <sboyd@codeaurora.org>, Sudeep Holla <Sudeep.Holla@arm.com>, Christopher Covington <cov@codeaurora.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Nathan Lynch <Nathan_Lynch@mentor.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 11/09/14 17:47, Will Deacon wrote:
> On Thu, Sep 11, 2014 at 05:16:44PM +0100, Doug Anderson wrote:
>> Some 32-bit (ARMv7) systems are architected like this:
>>
>> * The firmware doesn't know and doesn't care about hypervisor mode and
>>   we don't want to add the complexity of hypervisor there.
>>
>> * The firmware isn't involved in SMP bringup or resume.
>>
>> * The ARCH timer come up with an uninitialized offset between the
>>   virtual and physical counters.  Each core gets a different random
>>   offset.
>>
>> On systems like the above, it doesn't make sense to use the virtual
>> counter.  There's nobody managing the offset and each time a core goes
>> down and comes back up it will get reinitialized to some other random
>> value.
> 
> You probably need to rephrase this slightly, as there *is* still a
> requirement on the hypervisor/firmware (actually, two!). See below.
> 
>> Let's add a property to the device tree to say that we shouldn't use
>> the virtual timer.  Firmware could potentially remove this property
>> before passing the device tree to the kernel if it really wants the
>> kernel to use a virtual timer.
>>
>> Note that it's been said that ARM64 (ARMv8) systems the firmware and
>> kernel really can't be architected as described above.  That means
>> using the physical timer like this really only makes sense for ARMv7
>> systems.
> 
> I'd go further: this only makes sense if you're booting in secure SVC
> mode.

If that's the case, what's the problem? Enter monitor mode, set SCR.NS
to one, nuke CNTVOFF, revert, job done.

What am I missing?

	M.
-- 
Jazz is not dead. It just smells funny...
