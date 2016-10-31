From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v2 3/3] clocksource: Add clockevent support to NPS400
 driver
Date: Mon, 31 Oct 2016 10:51:40 -0700
Message-ID: <35bde193-8492-83e0-fb03-8385d8afd007@synopsys.com>
References: <1477224748-25223-1-git-send-email-noamca@mellanox.com>
 <1477224748-25223-4-git-send-email-noamca@mellanox.com>
 <20161031105251.GD1506@mai>
 <DB6PR0501MB2518720A0F95ACBBBCB1CB27AAAE0@DB6PR0501MB2518.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB6PR0501MB2518720A0F95ACBBBCB1CB27AAAE0@DB6PR0501MB2518.eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Noam Camus <noamca@mellanox.com>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Daniel,

On 10/31/2016 10:03 AM, Noam Camus wrote:
>> Oops, wait. Here, arch/arc/kernel/time.c should be moved in drivers/clocksource and consolidated with this driver.
>> >Very likely, CPUHP_AP_ARC_TIMER_STARTING can be used for all ARC timers.
> Indeed the ARC timer driver served as my inspiration but due to HW threads handling they are not the same.
> Moving drivers from arch/arc to driver/clocksource is not my call (Vineet Gupta is the maintainer of ARC)
> And I think they quiet differ now so consolidation gain is not obvious.

Sorry this was on my todo list at low priority. Anyways took a quick look at it now.

The problem is timer code overlaps pure driver land and ARC specific code. e.g.
CONFIG_ARC_HAS_RTC clocksource needs to check whether hardware exists or not. We
currently conveniently check that from cpuinfo populated at boot time. Now either
I need to export that info as a function (which should be done anyways) - but then
define stub for !ARC. Either that or duplicate the detection code here (orig copy
in arc setup.c)

So doing this exercise cleanly would mean exporting much of
arch/arc/include/asm/{arcregs.h, mcip.h} out of ARC into include/soc/arc/*. Isn't
this kind of going back to include/asm-<arch>/* days ?

Honestly I do want to move the driver in the right place but not sure how to do
this cleanly.

Thoughts ?

-Vineet
