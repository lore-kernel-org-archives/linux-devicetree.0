MIME-Version: 1.0
Date: Wed, 19 Jun 2019 07:51:00 -0600
References: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
	<20190527160736.30569-2-leif.middelschulte@klsmartin.com>
	<20190614194818.GA22146@bogus>
	<b1f40349dced90ea2ab0c9e5dc528db883e62e8d.camel@klsmartin.com>
In-Reply-To: <b1f40349dced90ea2ab0c9e5dc528db883e62e8d.camel@klsmartin.com>
Message-ID: <CAL_JsqLrMk9yNAzHWCgOFaOqnHKiwSjLOfbhU5+DzLCNBD+H_w@mail.gmail.com>
Subject: Re: [PATCH 01/10] dt-bindings: input: touchscreen: stmpe: add touch
 window configuration
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: "Middelschulte, Leif" <Leif.Middelschulte@klsmartin.com>
Cc: "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Jun 19, 2019 at 5:56 AM Middelschulte, Leif
<Leif.Middelschulte@klsmartin.com> wrote:
>
> Am Freitag, den 14.06.2019, 13:48 -0600 schrieb Rob Herring:
> > On Mon, May 27, 2019 at 06:07:27PM +0200, Leif Middelschulte wrote:
> > > The STMPE811 is able to only monitor a subwindow of the
> > > entire screen. Touches outside of this window are neglected.
> > > This change adds the corresponding documentation.
> >
> > Unless you are trying to just filter out the edge values
> I'm trying to "just filter out the edge values" by filtering the values
> right on the smpte microcontroller. It is a device specific feature, that is
> why I implemented and documented the support.
>
> But sure, one could leave that to a corresponding entry in the hwdb that
> would manipulate absinfo to gain calibrated input [1].
>
> > which I think we already have properties for,
> While there [0] is "touchscreen-min-{x,y}", I could not spot a corresponding
> "touchscreen-max-{x,y}". Could you point me to the right property?

Perhaps add them. If we have min, adding a max seems logical.

Rob
