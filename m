From: NeilBrown <neil@brown.name>
Subject: Re: [PATCH 0/4] UART slave device support - version 4
Date: Wed, 12 Aug 2015 09:20:59 +1000
Message-ID: <20150812092059.361e09bc@home.neil.brown.name>
References: <20150511013540.5709.93626.stgit@notabene.brown>
	<CACRpkdZf2AM_7Od1kVcBxokK5CJfhnsfZ_oNSF5w7rmZmcenCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZf2AM_7Od1kVcBxokK5CJfhnsfZ_oNSF5w7rmZmcenCg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robherring2@gmail.com>, Pavel Machek <pavel@ucw.cz>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, GTA04 owners <gta04-owner@goldelico.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, 7 Aug 2015 15:01:47 +0200 Linus Walleij
<linus.walleij@linaro.org> wrote:

> Hi Neil,
> 
> first, this is a *VERY* interesting and much needed patch series,
> I intend to look closer at it, and if possible test it with some
> (heh) board file device. Would be happy of you put me on CC for these.
> 
> On Mon, May 11, 2015 at 3:56 AM, NeilBrown <neil@brown.name> wrote:
> 
> >  When a device is connected to a UART via RS-232 (or similar), there
> >  is a DTR line that can be used for power management, and other "modem
> >  control" lines.
> >
> >  On an embedded board, it is very likely that there is no "DTR", and
> >  any power management need to be done using some completely separate
> >  mechanism.
> >
> >  So these "slaves" are really just for devices permanently attached to
> >  UARTs without a full "RS-232" (or similar) connection.  The driver
> >  does all the extra control beyond Tx/Rx.
> 
> What is usually happening (and I have seen it in a few places) is that
> the SoC has *one* fully featured RS232 with CTS/RTS and even
> DTS,DCD,RI and other esoterica, which is intended to be connected to a
> host serial port or so, for example if this SoC is to act as a modem
> or a fax machine, or if it is to drive one.
> 
> Then they often have a few more UART blocks, usually identical, which
> only have RxD+TxD available, so they are "just" UARTs.
> 
> To complicate things further, you may wonder what happened with
> the CTS/RTS (etc) signals from the other blocks. Usually they are there
> in the silicon but just routed to dead ends.
> 
> To complicate it even further, usually all these pins are placed under
> pin control multiplexing, so in an actual electronic design, the
> system will mux out CTS/RTS (etc) from the fully featured RS232
> blocks and only use them as UARTs anyways.
> 
> Then there are those who created real simple RxD/TxD-only UARTs
> ("yeah lets dump this RS232 legacy crap" / "yeah yeah")
> and then realized they want to drive modems ("oh crap, it seemed
> like a good idea at the time"). Then they usually take
> two GPIO pins for CTS/RTS and drive them as GPIOs using
> software and you have a cheap 4-line modem line. This is what
> drivers/tty/serial/serial_mctrl_gpio.c is for if you wondered.
> 
> > I've tested this set and it seems to work ... except that something
> >  is sadly broken with bluetooth support in 4.1-rc1 so I've only really
> >  tested the GPS driver.  I guess it is time to rebase to -rc3.
> 
> You have a hardware taget I see. Which one?

GTA04 (www.gta04.org - openmoko successor).

3 uarts on OMAP3 are wired: one as RS-232 for console, one to bluetooth
half of a wifi/bluetooth module, and one to a GPS.

For the GPS, I just want to power on/off when the TTY is opened/closed,
but the power-on sequence is non-trivial as both "turn on" and
"turn-off' toggle the same line, so I need to be able to detect current
state.

For the bluetooth, the power is a (shared) regulator.  As well as
power-on when the TTY is opened, I'd like regulator to be turned of
when I "hciconfig down" - even though the TTY is still open.
I did a patch a while ago which hooked in to hci_uart_{open,close} to
make this work, but it isn't a really good patch.

It would be nice to hide the TTY from user-space in the bluetooth case,
and have the "hciattach" happen in the kernel, but I think hciattach
does extra initialisation...

NeilBrown
