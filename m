From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 4/7] dt-bindings: gnss: add u-blox binding
Date: Tue, 8 May 2018 08:22:28 -0700
Message-ID: <20180508152228.GV98604@atomide.com>
References: <20180502081637.GE2285@localhost>
 <5242FCAD-3139-4A9C-B9FA-7BBAA0E6AE57@goldelico.com>
 <20180503205037.7be552c1@aktux>
 <44A0BC7C-67C7-4116-849F-90FF7CF2B1F0@goldelico.com>
 <20180504114213.3xlzqxe74n55tk5s@earth.universe>
 <20180507100135.GS2285@localhost>
 <20180507154515.GP98604@atomide.com>
 <20180507163439.GV2285@localhost>
 <20180507175032.GR98604@atomide.com>
 <20180508065852.GW2285@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180508065852.GW2285@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, "H. Nikolaus Schaller" <hns@goldelico.com>, Andreas Kemnade <andreas@kemnade.info>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Pavel Machek <pavel@ucw.cz>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

* Johan Hovold <johan@kernel.org> [180508 07:00]:
> On Mon, May 07, 2018 at 10:50:32AM -0700, Tony Lindgren wrote:
> > I don't know, they are there for the ports that don't have any
> > serdev device. But if there is a serdev child node, the sysfs
> > disappear for the 8250 port like it's /dev/ttyS* entry. That is
> > even with no hci_serdev.ko loaded :)
> 
> It sounds to me like you have a udev rule that's matching on TTY devices
> and setting an autosuspend timeout that allows the controller to runtime
> suspend. Is that so?

Oh you are right, I do have an old init script that idles the UARTs.

And that script is looking for tty[SO]*. Updating it to use
/sys/bus/platform/devices fixes the issue I was seeing:

uarts=$(find /sys/bus/platform/devices/4*.serial/power/ -type d)
for uart in $uarts; do
	echo -n 1000 > $uart/autosuspend_delay_ms
	echo -n enabled > $uart/wakeup
	echo -n auto > $uart/control
done

The above also idles the console so beware though.

> But the point is, we really don't want the runtime PM behaviour to be
> dependent on the presence of such rules. The serial controllers should
> always be idle when not in use (unless overridden by user space).

I agree, and that seems broken right now.

> > Do you have also a /dev/ttyO* entry created for the serdev port?
> 
> No, serdev claims the port and no tty device is created.

And this is no longer the issue when using /sys/bus/platform/devices
instead of tty[SO]* in my init script :)

> > > I'd say the omap drivers are broken; the controller should definitely
> > > idle when the port is closed (whether using serdev or not) without
> > > having to fiddle with sysfs.
> > 
> > This is happening for the non-serdev ports for sure. FYI, there is
> > one patch needed for omap4 to idle unused ports that I posted
> > few days ago:
> > 
> > [PATCHv3] serial: 8250: omap: Fix idling of clocks for unused uarts
> > 
> > But the serdev port is never idled, even if unused.
> 
> With the negative autosuspend set in both omap drivers probe functions,
> this is the expected behaviour. Which I think we must fix.

Yes indeed. I've been using my script for years now and have
completely missed the fact that the unused ports are not idled
at all on start-up when unused.

> > Can you check your serdev port clkctrl reg with rwmem or similar
> > tool when it's idle?
> > 
> > You can do it with:
> > 
> > rwmem -s32 0x44e004b4           # uart 1 on l4_wkup
> > rwmem -s32 0x44e0006c+0x10      # uart 2 - 5 on l4_per
> > rwmem -s32 0x44e00038           # uart 6 on l4_per
> > 
> > And here's what I have on my bbb with 8250_omap:
> > 
> > 0x44e004b4 = 0x00000002
> > 0x44e0006c = 0x00030000
> > 0x44e00070 = 0x00030000
> > 0x44e00074 = 0x00030000
> > 0x44e00078 = 0x00030000
> > 0x44e00038 = 0x00030000
> > 
> > So all disabled except for the console UART.
> 
> On BBB with omap-serial I have:
> 
> 0x44e004b4 = 0x2	(uart 1, console, open)
> 0x44e0006c = 0x2	(uart 2, serdev, closed)
> 0x44e00070 = 0x30000	(uart 3, disabled in DT)
> 0x44e00074 = 0x30000	(uart 4, disabled in DT)
> 0x44e00078 = 0x2	(uart 5, serdev, closed)
> 0x44e00038 = 0x2	(uart 6, ttyO5, closed)
> 
> So no enabled and closed port is idle, whether using serdev or not.

OK so we really have currently just one PM related bug where
unused UARTs should be idled on init. And then the serdev PM
can be handled the way you're doing it and tested with the
above rwmem.

Hmm maybe all we need for serdev runtime PM is to set the parent
UART autoidle timeout to immediate (0 instead of -1) from the serdev
child driver to allow the serdev driver manage the PM.

Regards,

Tony
