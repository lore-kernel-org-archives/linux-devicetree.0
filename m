From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH 03/13] RTC: ds1307: Add DS1341 specific power-saving
 options
Date: Wed, 20 Jul 2016 11:02:20 +0200
Message-ID: <20160720090220.GQ7132@piout.net>
References: <1465970379-14703-1-git-send-email-andrew.smirnov@gmail.com>
 <1465970379-14703-4-git-send-email-andrew.smirnov@gmail.com>
 <20160619142934.GA8522@rob-hp-laptop>
 <CAHQ1cqFfFpLmMMr9itinha9rotG7Btr9UmWbO2_0VWxX_HeG1g@mail.gmail.com>
 <20160621204904.GA9779@rob-hp-laptop>
 <20160621210739.GY5809@piout.net>
 <CAHQ1cqGRqhOAqfJZEixkxAHZ4Y8dd-hD__T1ci0LS28Orphs3Q@mail.gmail.com>
 <20160719224728.GP7132@piout.net>
 <CAHQ1cqF+Z5sKhtxgFiTGJdaOtkQRtQmXU=DzG0qxnDDwfAMp_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHQ1cqF+Z5sKhtxgFiTGJdaOtkQRtQmXU=DzG0qxnDDwfAMp_g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, rtc-linux@googlegroups.com, Alessandro Zummo <a.zummo@towertech.it>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 19/07/2016 at 16:56:56 -0700, Andrey Smirnov wrote :
> >> I don't see any value in doing that, could you give me a realistic
> >> example of a scenario in which a user would want to spend some of
> >> uptime with RTC oscillator fault detection/glitch filtering disabled
> >> and then enable it?
> >>
> >
> > Well, the issue is not being dynamic, it is differentiating between
> > hardware description and user configuration. Configuration must not be in
> > DT.
> 
> Why? And I don't mean in a generic sense, but in this particular case.
> What is gained by not having this bit of configuration, whose only
> consumer is the driver, in the device tree file?
> 

Because configuration doesn't belong to DT. DT is about hardware
description, not configuration.


> > And this choice is definitively not hardware related (as opposed to
> > the trickle charging that depends on the battery that is used on the
> > board).
> 
> There's most certainly plenty of precedents of non hardware-related in
> device tree, first two that come to mind are "chosen" node and
> "local-mac-address" property and, granted, those might be
> exceptions/legacy bindings that are just there to stay, but even if
> you look at RTC subsystem rtc-cmos.txt, atmel,at91sam-rtc.txt and
> possibly rtc-st-lpc.txt are providing bindings that are not exactly
> hardware related.
>
> Rtc-cmos.txt is especially noticeable example since it literally does
> what I am trying to do -- allows the user to specify initial values to
> certain registers that would be initialized by the driver.
> 

Well, the RTC subsystem has been left unmaintained for a while and it is
not because we made mistakes in the past that we have to make them
again.

rtc-st-lpc is only hardware related. The mode it is used in is board
dependant. And I have a plan to change how the gpbr register is
allocated for the at91 RTT. I agree that rtc-cmos is an example of what
not to do.

> > Well, it doesn't leak abstraction as long as all the RTC that are able
> > to disable the oscillator failure detection use the same ABI.
> 
> Correct me if I am wrong, but no such, at least semi-standardized, ABI
> exist as of today, correct? If that is so, then what you are saying is
> that the abstraction doesn't leak as long as you put it inside of a
> new abstraction that doesn't leak. I am not arguing that it is
> impossible to create a new one that would allow to hide hardware
> differences, I am positive it is, what I am arguing is that to do so
> is a lot of work for as far as I can see for no gain.
> 

You are correct, that ABI doesn't exist and I'm asking to create it.
That is how kernel development happens.

> >
> >> >  - on subsequent reboots, the mode is kept alongside the time and date
> >> >
> >>
> >> This assumes that your bootloader leaves those mode bits alone.
> >>
> >
> > Well, if that is not the case, the bootloader as to be fixed anyway and
> > silently changing the configuration back using DT is probably worse.
> >
> 
> How so? Consider the following two scenarios with assumption that the
> bootloader is broken:
> 
>   - Bits set wrong by bootloader, then corrected by kernel, device is
> powered off RTC consumes expected amount of current
> 
>   - Bits set wrong by bootloader, kernel does nothing, device is
> powered off RTC consumes more than anticipated and we drain the power
> storage device and loose time.
> 
> What do you you think former is worse than latter?
> 

Whether is is done in the kernel or in userspace doesn't change much
to that use case.



-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
