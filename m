From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/4] UART slave device support - version 4
Date: Fri, 7 Aug 2015 15:01:47 +0200
Message-ID: <CACRpkdZf2AM_7Od1kVcBxokK5CJfhnsfZ_oNSF5w7rmZmcenCg@mail.gmail.com>
References: <20150511013540.5709.93626.stgit@notabene.brown>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150511013540.5709.93626.stgit-wvvUuzkyo1EYVZTmpyfIwg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: NeilBrown <neil-+NVA1uvv1dVBDLzU/O5InQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, One Thousand Gnomes <gnomes-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>, Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, GTA04 owners <gta04-owner-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Neil,

first, this is a *VERY* interesting and much needed patch series,
I intend to look closer at it, and if possible test it with some
(heh) board file device. Would be happy of you put me on CC for these.

On Mon, May 11, 2015 at 3:56 AM, NeilBrown <neil-+NVA1uvv1dVBDLzU/O5InQ@public.gmane.org> wrote:

>  When a device is connected to a UART via RS-232 (or similar), there
>  is a DTR line that can be used for power management, and other "modem
>  control" lines.
>
>  On an embedded board, it is very likely that there is no "DTR", and
>  any power management need to be done using some completely separate
>  mechanism.
>
>  So these "slaves" are really just for devices permanently attached to
>  UARTs without a full "RS-232" (or similar) connection.  The driver
>  does all the extra control beyond Tx/Rx.

What is usually happening (and I have seen it in a few places) is that
the SoC has *one* fully featured RS232 with CTS/RTS and even
DTS,DCD,RI and other esoterica, which is intended to be connected to a
host serial port or so, for example if this SoC is to act as a modem
or a fax machine, or if it is to drive one.

Then they often have a few more UART blocks, usually identical, which
only have RxD+TxD available, so they are "just" UARTs.

To complicate things further, you may wonder what happened with
the CTS/RTS (etc) signals from the other blocks. Usually they are there
in the silicon but just routed to dead ends.

To complicate it even further, usually all these pins are placed under
pin control multiplexing, so in an actual electronic design, the
system will mux out CTS/RTS (etc) from the fully featured RS232
blocks and only use them as UARTs anyways.

Then there are those who created real simple RxD/TxD-only UARTs
("yeah lets dump this RS232 legacy crap" / "yeah yeah")
and then realized they want to drive modems ("oh crap, it seemed
like a good idea at the time"). Then they usually take
two GPIO pins for CTS/RTS and drive them as GPIOs using
software and you have a cheap 4-line modem line. This is what
drivers/tty/serial/serial_mctrl_gpio.c is for if you wondered.

> I've tested this set and it seems to work ... except that something
>  is sadly broken with bluetooth support in 4.1-rc1 so I've only really
>  tested the GPS driver.  I guess it is time to rebase to -rc3.

You have a hardware taget I see. Which one?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
