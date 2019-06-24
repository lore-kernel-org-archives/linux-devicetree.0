From: Chen-Yu Tsai <wens@kernel.org>
Subject: Re: [PATCH 0/3] rtc: pcf8563: Fix unhandled interrupt storm
Date: Mon, 24 Jun 2019 18:34:29 +0800
Message-ID: <CAGb2v67sf3L9zH9Li6tF3xunQ4-isoodBLQmSv2VJtAj6hS7Ug@mail.gmail.com>
References: <20190604042337.26129-1-wens@kernel.org> <20190620162220.GA23549@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190620162220.GA23549@piout.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Alessandro Zummo <a.zummo@towertech.it>, Vincent Donnefort <vdonnefort@gmail.com>, linux-rtc@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 21, 2019 at 12:22 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 04/06/2019 12:23:34+0800, Chen-Yu Tsai wrote:
> > From: Chen-Yu Tsai <wens@csie.org>
> >
> > Hi everyone,
> >
> > While bringing up my Pine H64, I encountered an interrupt storm from the
> > pcf8563 RTC. The RTC chip's interrupt line is shared with the PMIC, and
> > was not properly added to the device tree. Also, the driver was using an
> > trigger method incompatible with the PMIC, preventing the interrupt line
> > from being shared. Last, the driver only clears and masks the alarm
> > interrupt, while leaving the timer interrupt untouched. This is a
> > problem if previous systems left the timer interrupt enabled, and there
> > was an interrupt pending.
> >
> > This patch set fixes all three issues, one per patch.
> >
> > Please have a look.
> >
>
> I don't have that particular RTC so I can't test but the interrupt
> handling in pcf8563_irq seems problematic too. I guess the RTC will only
> trigger once per second because the call to pcf8563_set_alarm_mode will
> explicitely leave the alarm enabled. The core doesn't really care but it
> doesn't really expect the alarm to stay enabled. i.e. It will ensure the
> alarm is enabled again after setting it when necessary. I think it would
> be safer to simply clear both AIE and AF here. Could you test?

Yeah, that bit looked weird to me as well. And actually the alarm doesn't
go down to the second, only the minute.

Is there a test program I can use to test the alarms?

Thanks
ChenYu

> > Chen-Yu Tsai (3):
> >   rtc: pcf8563: Fix interrupt trigger method
> >   rtc: pcf8563: Clear event flags and disable interrupts before
> >     requesting irq
> >   arm64: dts: allwinner: h6: Pine H64: Add interrupt line for RTC
> >
> >  .../arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts |  2 ++
> >  drivers/rtc/rtc-pcf8563.c                           | 13 ++++++-------
> >  2 files changed, 8 insertions(+), 7 deletions(-)
> >
> > --
> > 2.20.1
> >
>
> --
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
