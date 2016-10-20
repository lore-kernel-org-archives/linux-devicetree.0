From: Rich Felker <dalias@libc.org>
Subject: Re: [PATCH v9 0/2] J-Core timer support
Date: Wed, 19 Oct 2016 21:22:25 -0400
Message-ID: <20161020012225.GK19318@brightrain.aerifal.cx>
References: <cover.1476393790.git.dalias@libc.org>
 <20161017093013.GA1703@mai>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161017093013.GA1703@mai>
Sender: linux-sh-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 17, 2016 at 11:30:13AM +0200, Daniel Lezcano wrote:
> On Thu, Oct 13, 2016 at 09:51:06PM +0000, Rich Felker wrote:
> > This version of the patch makes the changes requested by Daniel
> > Lezcano in review of v8.
> > 
> > Rich Felker (2):
> >   of: add J-Core timer bindings
> >   clocksource: add J-Core timer/clocksource driver
> > 
> >  .../devicetree/bindings/timer/jcore,pit.txt        |  24 ++
> >  drivers/clocksource/Kconfig                        |  10 +
> >  drivers/clocksource/Makefile                       |   1 +
> >  drivers/clocksource/jcore-pit.c                    | 249 +++++++++++++++++++++
> >  include/linux/cpuhotplug.h                         |   1 +
> >  5 files changed, 285 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/timer/jcore,pit.txt
> >  create mode 100644 drivers/clocksource/jcore-pit.c
> 
> Hi Rich,
> 
> I applied your patches on my tree.
> 
> Thanks !

Thanks! Which is your current tree? I was looking and couldn't find
it. This is the one thing (and it's a boot blocker) keeping Linux on
J2 from working out of the box and I'd really love to see it go in
4.9.

Rich
