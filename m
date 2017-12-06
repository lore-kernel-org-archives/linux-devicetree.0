From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 0/3] eeprom: at25: Add DT support for 25lc040
Date: Wed, 6 Dec 2017 15:12:05 -0600
Message-ID: <20171206211205.t4qf6hqmzr74stg7@rob-hp-laptop>
References: <1512048586-17534-1-git-send-email-geert+renesas@glider.be>
 <20171204212215.f5dqiei6eqk6d7de@rob-hp-laptop>
 <CAMuHMdXUWXxQr5T6AnSDecZ6VMKpU46aBQpT3FCuuhvgpP3zhA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdXUWXxQr5T6AnSDecZ6VMKpU46aBQpT3FCuuhvgpP3zhA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Ivo Sieben <meltedpianoman@gmail.com>, Chris Wright <chrisw@sous-sol.org>, Wolfram Sang <wsa@the-dreams.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 05, 2017 at 10:04:21AM +0100, Geert Uytterhoeven wrote:
> Hi Rob,
> 
> On Mon, Dec 4, 2017 at 10:22 PM, Rob Herring <robh@kernel.org> wrote:
> > On Thu, Nov 30, 2017 at 02:29:43PM +0100, Geert Uytterhoeven wrote:
> >> Some "atmel,at25" compatible SPI EEPROMs (e.g. Microchip 25lc040) use an
> >> odd number of address bits.  This patch series adds support for
> >> instantiating such devices from DT.
> >>
> >> Do EEPROMs using 17 or 25 address bits, as mentioned in
> >> include/linux/spi/eeprom.h, really exist?
> >> Or should we just limit it to a single odd value (9 bits)?
> >>
> >> This has been tested with a bunch of 25lc040 EEPROMs.
> >>
> >> Thanks!
> >>
> >> Geert Uytterhoeven (3):
> >>   eeprom: at25: Add DT support for EEPROMs with odd address bits
> >>   dt-bindings: eeprom: at25: Grammar s/are can/can/
> >>   dt-bindings: eeprom: at25: Document device-specific compatible values
> >
> > 2 and 3 are fixes and I'll apply for 4.15 if you don't mind.
> 
> Thanks, I don't mind.

Both applied.

Rob
