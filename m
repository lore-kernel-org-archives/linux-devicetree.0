From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 4/7] dt-bindings: gnss: add u-blox binding
Date: Mon, 7 May 2018 10:50:32 -0700
Message-ID: <20180507175032.GR98604@atomide.com>
References: <20180426091018.GU4615@localhost>
 <CAL_JsqK=xQBx2YCd0kDP0zLn_LAZb6Mi5UfSTQf2soooVz2unQ@mail.gmail.com>
 <20180502081637.GE2285@localhost>
 <5242FCAD-3139-4A9C-B9FA-7BBAA0E6AE57@goldelico.com>
 <20180503205037.7be552c1@aktux>
 <44A0BC7C-67C7-4116-849F-90FF7CF2B1F0@goldelico.com>
 <20180504114213.3xlzqxe74n55tk5s@earth.universe>
 <20180507100135.GS2285@localhost>
 <20180507154515.GP98604@atomide.com>
 <20180507163439.GV2285@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180507163439.GV2285@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, "H. Nikolaus Schaller" <hns@goldelico.com>, Andreas Kemnade <andreas@kemnade.info>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Pavel Machek <pavel@ucw.cz>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

* Johan Hovold <johan@kernel.org> [180507 16:36]:
> On Mon, May 07, 2018 at 08:45:15AM -0700, Tony Lindgren wrote:
> > Hi,
> > 
> > * Johan Hovold <johan@kernel.org> [180507 03:03]:
> > > On Fri, May 04, 2018 at 01:42:13PM +0200, Sebastian Reichel wrote:
> > > 
> > > > Having said all of this, serdev does not yet support runtime PM (at
> > > > all). Tony is currently looking into it. Fortunately serdev allows
> > > > us to enable runtime PM by default (once implemented), since we know
> > > > the remote side and can (hopefully) avoid losing characters (i.e.
> > > > with sideband wakeup gpios).
> > > 
> > > I'm not sure we want generic runtime-pm support for the controllers in
> > > the sense that the slave device state is always reflected by the serial
> > > controller. Similar as for i2c and spi, we really only want to keep the
> > > controller active when we are doing I/O, but we may want to keep a
> > > client active for longer.
> > 
> > Yeah i2c seems to do the right thing where the bus takes care
> > of runtime PM.
> 
> Yeah, but since serial is async in contrast to i2c/spi, we may not be
> able to push this entirely into core. The serdev drivers may need to
> indicate when they expect or need to do I/O by opening and closing the
> port. And this is how I implemented these first couple of gnss drivers.

OK

> Also note that most serial driver do not do runtime pm while the port is
> open (as OMAP does), and doing so also has the drawbacks of lost
> characters etc. as Sebastian mentioned.

Yes serdev seems really nice for the oob wake gpios :)

> > > Take the u-blox driver in this series for example. As I'm using runtime
> > > PM to manage device power, user-space can chose to prevent the receiver
> > > from runtime suspending in order to avoid lengthy (re-)acquisition times
> > > in setups without a backup battery (by means of the power/control
> > > attribute).
> > 
> > Sorry I don't seem to have that one, care to paste the subject
> > line of that patch?
> 
> 	"[PATCH 5/7] gnss: add driver for u-blox receivers"
> 
> 	https://lkml.kernel.org/r/20180424163458.11947-6-johan@kernel.org

Thanks will take a look.

> > > Note that serdev not enabling runtime pm for controllers is roughly
> > > equivalent to setting the .ignore_children flag, which is what we do for
> > > i2c and spi controller, and possibly what we want here too.
> > 
> > We currently don't idle serdev at all even if not in use. What
> > I noticed is if I have these in my .config:
> > 
> > CONFIG_SERIAL_DEV_BUS=y
> > CONFIG_SERIAL_DEV_CTRL_TTYPORT=y
> > 
> > And no hci_serdev.ko driver loaded, then the 8250 port still stays
> > active and there are no sysfs entries to idle it.
> 
> Sounds like the 8250_omap driver is doing something funky. Why would
> there not be any sysfs attributes to control runtime pm?

I don't know, they are there for the ports that don't have any
serdev device. But if there is a serdev child node, the sysfs
disappear for the 8250 port like it's /dev/ttyS* entry. That is
even with no hci_serdev.ko loaded :)

> > Are you seeing this with your series?
> 
> I'm using omap-serial (on BBB) and like 8250_omap, the driver disables
> runtime pm at probe by setting a negative autosuspend timeout.

Hmm I though we now have both 8250_omap and serial-omap behave the
same way for PM.

> Changing this through sysfs causes the serial controller to runtime
> suspend, but something is not right in my setup as it doesn't wake up on
> incoming data.

Do you have also a /dev/ttyO* entry created for the serdev port?

> I'd say the omap drivers are broken; the controller should definitely
> idle when the port is closed (whether using serdev or not) without
> having to fiddle with sysfs.

This is happening for the non-serdev ports for sure. FYI, there is
one patch needed for omap4 to idle unused ports that I posted
few days ago:

[PATCHv3] serial: 8250: omap: Fix idling of clocks for unused uarts

But the serdev port is never idled, even if unused.

Can you check your serdev port clkctrl reg with rwmem or similar
tool when it's idle?

You can do it with:

rwmem -s32 0x44e004b4           # uart 1 on l4_wkup
rwmem -s32 0x44e0006c+0x10      # uart 2 - 5 on l4_per
rwmem -s32 0x44e00038           # uart 6 on l4_per

And here's what I have on my bbb with 8250_omap:

0x44e004b4 = 0x00000002
0x44e0006c = 0x00030000
0x44e00070 = 0x00030000
0x44e00074 = 0x00030000
0x44e00078 = 0x00030000
0x44e00038 = 0x00030000

So all disabled except for the console UART.

Regards,

Tony
