From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 4/5] dt-bindings: auxdisplay: Add bindings for Hitachi
 HD44780
Date: Mon, 20 Mar 2017 16:48:31 +0100
Message-ID: <20170320154831.GA19564@kroah.com>
References: <1489155321-25666-1-git-send-email-geert@linux-m68k.org>
 <1489155321-25666-5-git-send-email-geert@linux-m68k.org>
 <20170320151516.dscqfjihoeezzhgi@rob-hp-laptop>
 <CAMuHMdX_9-yze0ErxKxTM0rgLAhWhtfvkW8wvXxR6vMdVXXGbg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdX_9-yze0ErxKxTM0rgLAhWhtfvkW8wvXxR6vMdVXXGbg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>, Willy Tarreau <willy@haproxy.com>, Ksenija Stanojevic <ksenija.stanojevic@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>, Akira Tsukamoto <akira.tsukamoto@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 20, 2017 at 04:27:01PM +0100, Geert Uytterhoeven wrote:
> Hi Rob, Greg,
> 
> On Mon, Mar 20, 2017 at 4:15 PM, Rob Herring <robh@kernel.org> wrote:
> > On Fri, Mar 10, 2017 at 03:15:20PM +0100, Geert Uytterhoeven wrote:
> >> Add DT bindings for an Hitachi HD44780 Character LCD Controller where
> >> its M6800 bus interface is connected to GPIOs.
> >>
> >> Memory-mapped configurations are not yet supported.
> >>
> >> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/auxdisplay/hit,hd44780.txt
> 
> >> +Required properties:
> >> +  - compatible: Must contain "hit,hd44780",
> >> +  - data-gpios: Must contain an array of either 4 or 8 GPIO specifiers,
> >> +    referring to the GPIO pins connected to the data signal lines DB0-DB7
> >> +    (8-bit mode) or DB4-DB7 (4-bit mode) of the LCD Controller's bus interface,
> >> +  - enable-gpios: Must contain a GPIO specifier, referring to the GPIO pin
> >> +    connected to the "E" (Enable) signal line of the LCD Controller's bus
> >> +    interface,
> >> +  - rs-gpios: Must contain a GPIO specifier, referring to the GPIO pin
> >> +    connected to the "RS" (Register Select) signal line of the LCD Controller's
> >> +    bus interface,
> >> +  - display-height: Height of the display, in character cells,
> >> +  - display-width: Width of the display, in character cells.
> >
> > display-{width,height}-chars
> 
> Makes sense.
> 
> Greg: As this is already in char-misc-next, shall I send an update for
> the bindings and the driver?

Please do.

thanks,

greg k-h
