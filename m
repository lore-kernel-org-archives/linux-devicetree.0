From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 4/7] dt-bindings: gnss: add u-blox binding
Date: Wed, 2 May 2018 10:16:37 +0200
Message-ID: <20180502081637.GE2285@localhost>
References: <20180424163458.11947-1-johan@kernel.org>
 <20180424163458.11947-5-johan@kernel.org>
 <CAL_Jsq+mCp=geT8t_j+0fuTxAB7C9RYn6pESRpLc2GH273fM1Q@mail.gmail.com>
 <20180426091018.GU4615@localhost>
 <CAL_JsqK=xQBx2YCd0kDP0zLn_LAZb6Mi5UfSTQf2soooVz2unQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqK=xQBx2YCd0kDP0zLn_LAZb6Mi5UfSTQf2soooVz2unQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, "H . Nikolaus Schaller" <hns@goldelico.com>, Pavel Machek <pavel@ucw.cz>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, May 01, 2018 at 09:05:42AM -0500, Rob Herring wrote:
> On Thu, Apr 26, 2018 at 4:10 AM, Johan Hovold <johan@kernel.org> wrote:
> > On Wed, Apr 25, 2018 at 01:16:58PM -0500, Rob Herring wrote:
> >> On Tue, Apr 24, 2018 at 11:34 AM, Johan Hovold <johan@kernel.org> wrote:
> >> > Add binding for u-blox GNSS receivers.
> >> >
> >> > Note that the u-blox product names encodes form factor (e.g. "neo"),
> >> > chipset (e.g. "8") and variant (e.g. "q"), but that only formfactor and
> >> > chipset is used for the compatible strings (for now).
> >> >
> >> > Signed-off-by: Johan Hovold <johan@kernel.org>
> >> > ---
> >> >  .../devicetree/bindings/gnss/u-blox.txt       | 31 +++++++++++++++++++
> >> >  .../devicetree/bindings/vendor-prefixes.txt   |  1 +
> >> >  2 files changed, 32 insertions(+)
> >> >  create mode 100644 Documentation/devicetree/bindings/gnss/u-blox.txt
> >> >
> >> > diff --git a/Documentation/devicetree/bindings/gnss/u-blox.txt b/Documentation/devicetree/bindings/gnss/u-blox.txt
> >> > new file mode 100644
> >> > index 000000000000..bb54b83a177f
> >> > --- /dev/null
> >> > +++ b/Documentation/devicetree/bindings/gnss/u-blox.txt
> >> > @@ -0,0 +1,31 @@
> >> > +u-blox GNSS Receiver DT binding
> >> > +
> >> > +The u-blox GNSS receivers can use UART, DDC (I2C), SPI and USB interfaces.
> >> > +
> >> > +Please see Documentation/devicetree/bindings/gnss/gnss.txt for generic
> >> > +properties.
> >> > +
> >> > +Required Properties:
> >> > +
> >> > +- compatible   : Must be one of
> >> > +
> >> > +                       "u-blox,neo-8"
> >> > +                       "u-blox,neo-m8"
> >> > +
> >> > +- vcc-supply   : Main voltage regulator (VCC)
> >>
> >> What about V_BCKP?
> >
> > That's the backup supply for for the RTC and batter-backed RAM. In
> > configurations where a battery is not used it should be connected to
> > VCC.
> >
> > How would you model that? I can enable a vbckp regulator at probe, but
> > what if someone then accurately describes the corresponding pin as being
> > connected to VCC?
> 
> You mean how to model a battery? It would just be a 'regulator'
> because the regulator binding covers any supply really.
> 
> Then you just set both rails to the same supply phandle.

Yes, but...

> > I guess we can check if the regulators are identical,
> > and then just have the driver ignore V_BKUP. Knowing whether there is
> > a (hopefully charged) battery connected could be useful.
> 
> Regulators are ref counted, so just enable it twice. Or the driver can
> just ignore it until it supports battery backup.

...my point was that in case there's no backup battery, you don't want
to enable vcc (via v_bckp) at probe (and instead have the device cold
boot whenever it's used).

Hence, the driver would need to check if the v_bckp-supply is identical
to vcc and not enable the former at probe in that case (i.e. similar to
if no v_bckp had been specified and we considered it optional).

> >> > +- timepulse-gpios      : Timepulse (e.g. 1PPS) GPIO (TIMEPULSE)
> >>
> >> Why the 3rd "TIMEPULSE"?
> >
> > That's the pin name, which in this case is identical to the property
> > name, so I'll drop it here.
> 
> Then what is the 2nd "Timepulse"?

That's the generic function name.

> Maybe just a "pin name: X" prefix so it is clear.

For u-blox devices, where property-, function- and pin name coincide, I
could just change this to:

+- timepulse-gpios      : Timepulse GPIO

and then for the sirfstar binding, which will be used by devices from
multiple vendors which have decided to name their pins differently, I
can add a "pin name: " prefix for clarity?

> > Take a look at the sirf binding; vendors use different names for their
> > timepulse pins and in that case I added the actual pin names (1PPS, TM)
> > in parenthesis after the description.
> >
> > Note that I mentioned "timepulse-gpios" in the generic binding with the
> > intent of trying to enforce a generic name for pins with such a
> > function (similarly for "enable-gpios", which I guess is already
> > established).
> 
> Yes, I think that's good.
> 
> Though with the enable-gpios I was debating the name for sirfstar a
> bit because it isn't the normal drive it active to enable, but rather
> a pulse to enable or disable.

I had some concerns along those lines as well, and if you agree I'll
change the property name to on_off-gpios (or onoff-gpios) which matches
the vendor data sheets for this pin, and which I think would be better.

Thanks,
Johan
