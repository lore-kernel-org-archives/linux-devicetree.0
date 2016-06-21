From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH 03/13] RTC: ds1307: Add DS1341 specific power-saving options
Date: Tue, 21 Jun 2016 16:23:00 -0700
Message-ID: <CAHQ1cqFgD--n7NMguZNQ+qdQk7zdxPHCM-Phq09wJwBacjMd8Q@mail.gmail.com>
References: <1465970379-14703-1-git-send-email-andrew.smirnov@gmail.com>
 <1465970379-14703-4-git-send-email-andrew.smirnov@gmail.com>
 <20160619142934.GA8522@rob-hp-laptop> <CAHQ1cqFfFpLmMMr9itinha9rotG7Btr9UmWbO2_0VWxX_HeG1g@mail.gmail.com>
 <20160621204904.GA9779@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160621204904.GA9779@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: rtc-linux@googlegroups.com, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> So wouldn't you want to set one mode while running and the lower power
> mode while suspended? I'm trying to understand the frequency of changing
> this. If it is always one setting for a board, then yes it belongs in
> DT. If it is a user decision, then it probably shouldn't be in DT.

I don't really see a use-case where you'd want setting that
dynamically. I might be wrong, but IMHO, power consumption of a system
in suspended mode would dwarf that of an RTC, so there's really much
to gain by enabling this feature dynamically. Where it matters the
most is time setting retention when the system is powered off and RTC
is ticking off of a battery or a some other power storage device. So
in my opinion it is more of a system design question where one has to
choose if reliability of RTC data is more important (detection of
oscillator faults and higher oscillator glitch immunity) and bigger
power storage device is needed or higher risk of RTC "malfunction" is
acceptable and cheaper/more convenient power storage device can be
used

>
> Seeing as these are reused, I've probably already had this discussion...
>
>> > They should have vendor prefix and be explicit that they are boolean.
>>
>> I was trying to be consistent with ds1339 and ds1390 bindings which do
>> not have vendor prefixes. Will fix in v2.
>
> Okay, then they are fine if you are using existing properties. Perhaps
> these should all be in a common binding doc though.

I think we have a misunderstanding. What I meant by "trying to be
consistent" was that bindings for other DS1307 variants do not prefix
their own properties with vendor name. Your comment about properties
being reused makes me suspicious that I misled you to believe that
other chip variants use those exact properties which is not the case.

Andrey
