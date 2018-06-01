From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 4/8] dt-bindings: gnss: add u-blox binding
Date: Fri, 1 Jun 2018 10:15:48 +0200
Message-ID: <20180601081548.GN3259@localhost>
References: <20180530103242.20773-1-johan@kernel.org>
 <20180530103242.20773-5-johan@kernel.org>
 <20180531035805.GA16906@rob-hp-laptop>
 <20180531082241.GD3259@localhost>
 <CAL_Jsq+-NBqR8H49oB-XZtH8XSCn_BO92Zf17=KfEXfE5mvjAg@mail.gmail.com>
 <20180531143428.GK3259@localhost>
 <CAL_JsqLfqgUbzMWdE_c96DrdgB31gSixbJo+JvsZhoJGJRWYMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqLfqgUbzMWdE_c96DrdgB31gSixbJo+JvsZhoJGJRWYMw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, "H . Nikolaus Schaller" <hns@goldelico.com>, Pavel Machek <pavel@ucw.cz>, Marcel Holtmann <marcel@holtmann.org>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>, Tony Lindgren <tony@atomide.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, May 31, 2018 at 10:58:59AM -0500, Rob Herring wrote:
> On Thu, May 31, 2018 at 9:34 AM, Johan Hovold <johan@kernel.org> wrote:
> > On Thu, May 31, 2018 at 08:55:10AM -0500, Rob Herring wrote:
> >> On Thu, May 31, 2018 at 3:22 AM, Johan Hovold <johan@kernel.org> wrote:
> >> > On Wed, May 30, 2018 at 10:58:05PM -0500, Rob Herring wrote:
> >> >> On Wed, May 30, 2018 at 12:32:38PM +0200, Johan Hovold wrote:
> >> >> > Add binding for u-blox GNSS receivers.

> >> >> > +Optional properties:
> >> >> > +
> >> >> > +- timepulse-gpios  : Time pulse GPIO
> >> >> > +- u-blox,extint-gpios      : External interrupt GPIO
> >> >>
> >> >> This should be interrupts property instead of a gpio.
> >> >
> >> > Contrary to what the name may suggest, this pin is actually an input
> >> > which can be used to control active power or to provide time or
> >> > frequency aiding data to the receiver (see section 1.13 in [1]).
> >> >
> >> > I only added it for completeness as the driver does not use it
> >> > currently. Remove, leave as is, or add "input" to the description as in:
> >> >
> >> >         - u-blox,extint-gpios   : External interrupt input GPIO
> >>
> >> Yes. You should also define the active level.
> >
> > The active level appears to be runtime configurable and dependent on the
> > selected function. For power control it can be used to control force-on
> > (active high), force-off (active low) or both; and for time aiding
> > sampling on falling or rising edge is also configurable. And who knows
> > what else this pin is used for next time they update the firmware. ;)
> 
> Okay.
> 
> > Shall I remove the property, or just add "input" as suggested above?
> 
> Just add "input".

I ended up rewording this as

	u-blox,extint-gpios  : GPIO connected to the "external
			       interrupt" input pin

to avoid any confusion about the direction of the GPIO.

Thanks,
Johan
