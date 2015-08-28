From: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [Gta04-owner] [PATCH 0/4] UART slave device support - version 4
Date: Fri, 28 Aug 2015 07:52:41 +0200
Message-ID: <CD86D8CD-20D8-44EF-8245-A3E49C2D3EA7@goldelico.com>
References: <20150511013540.5709.93626.stgit@notabene.brown> <CACRpkdZf2AM_7Od1kVcBxokK5CJfhnsfZ_oNSF5w7rmZmcenCg@mail.gmail.com> <20150812092059.361e09bc@home.neil.brown.name>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150812092059.361e09bc@home.neil.brown.name>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robherring2@gmail.com>, Pavel Machek <pavel@ucw.cz>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, Marek Belisko <marek@goldelico.com>, List for communicating with real GTA04 owners <gta04-owner@goldelico.com>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Am 12.08.2015 um 01:20 schrieb NeilBrown <neil@brown.name>:

> On Fri, 7 Aug 2015 15:01:47 +0200 Linus Walleij
> <linus.walleij@linaro.org> wrote:
>=20
>> Hi Neil,
>>=20
>> first, this is a *VERY* interesting and much needed patch series,
>> I intend to look closer at it, and if possible test it with some
>> (heh) board file device. Would be happy of you put me on CC for thes=
e.
>>=20
>> On Mon, May 11, 2015 at 3:56 AM, NeilBrown <neil@brown.name> wrote:
>>=20
>>> When a device is connected to a UART via RS-232 (or similar), there
>>> is a DTR line that can be used for power management, and other "mod=
em
>>> control" lines.
>>>=20
>>> On an embedded board, it is very likely that there is no "DTR", and
>>> any power management need to be done using some completely separate
>>> mechanism.
>>>=20
>>> So these "slaves" are really just for devices permanently attached =
to
>>> UARTs without a full "RS-232" (or similar) connection.  The driver
>>> does all the extra control beyond Tx/Rx.
>>=20
>> What is usually happening (and I have seen it in a few places) is th=
at
>> the SoC has *one* fully featured RS232 with CTS/RTS and even
>> DTS,DCD,RI and other esoterica, which is intended to be connected to=
 a
>> host serial port or so, for example if this SoC is to act as a modem
>> or a fax machine, or if it is to drive one.
>>=20
>> Then they often have a few more UART blocks, usually identical, whic=
h
>> only have RxD+TxD available, so they are "just" UARTs.
>>=20
>> To complicate things further, you may wonder what happened with
>> the CTS/RTS (etc) signals from the other blocks. Usually they are th=
ere
>> in the silicon but just routed to dead ends.
>>=20
>> To complicate it even further, usually all these pins are placed und=
er
>> pin control multiplexing, so in an actual electronic design, the
>> system will mux out CTS/RTS (etc) from the fully featured RS232
>> blocks and only use them as UARTs anyways.
>>=20
>> Then there are those who created real simple RxD/TxD-only UARTs
>> ("yeah lets dump this RS232 legacy crap" / "yeah yeah")
>> and then realized they want to drive modems ("oh crap, it seemed
>> like a good idea at the time"). Then they usually take
>> two GPIO pins for CTS/RTS and drive them as GPIOs using
>> software and you have a cheap 4-line modem line. This is what
>> drivers/tty/serial/serial_mctrl_gpio.c is for if you wondered.
>>=20
>>> I've tested this set and it seems to work ... except that something
>>> is sadly broken with bluetooth support in 4.1-rc1 so I've only real=
ly
>>> tested the GPS driver.  I guess it is time to rebase to -rc3.
>>=20
>> You have a hardware taget I see. Which one?
>=20
> GTA04 (www.gta04.org - openmoko successor).
>=20
> 3 uarts on OMAP3 are wired: one as RS-232 for console, one to bluetoo=
th
> half of a wifi/bluetooth module, and one to a GPS.
>=20
> For the GPS, I just want to power on/off when the TTY is opened/close=
d,
> but the power-on sequence is non-trivial as both "turn on" and
> "turn-off' toggle the same line, so I need to be able to detect curre=
nt
> state.
>=20
> For the bluetooth, the power is a (shared) regulator.  As well as
> power-on when the TTY is opened, I'd like regulator to be turned of
> when I "hciconfig down" - even though the TTY is still open.
> I did a patch a while ago which hooked in to hci_uart_{open,close} to
> make this work, but it isn't a really good patch.
>=20
> It would be nice to hide the TTY from user-space in the bluetooth cas=
e,
> and have the "hciattach" happen in the kernel, but I think hciattach
> does extra initialisation...
>=20
> NeilBrown


we (the developers of the hardware) have proposed an alternative
approach to Neil=92s implementation - for the same device and solving
the same problem (notifying tty open/close and uart activity to the
slave device driver), but differently.

See:
https://lkml.org/lkml/2015/6/28/91

Discussion has not yet settled on which approach is better. So your
opinion of comparing both is welcome.

BR,
Nikolaus
