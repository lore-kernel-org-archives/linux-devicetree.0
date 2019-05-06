MIME-Version: 1.0
Date: Mon, 6 May 2019 12:44:18 -0500
References: <20190505200022.32209-1-oss@c-mauderer.de>
	<CAL_JsqKmKzSw2-mfmBbhpyY=Ku6H7cE2KZrgkcPD7kAS_GqbFw@mail.gmail.com>
	<20190506162848.GA9522@amd>
In-Reply-To: <20190506162848.GA9522@amd>
Message-ID: <CAL_JsqJerwvjghnuiwndE9Kp_qX5ef-aSa5JcdUAoE6R6YYuYA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: Add binding for spi-byte LED.
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Pavel Machek <pavel@ucw.cz>
Cc: oss@c-mauderer.de, Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Dan Murphy <dmurphy@ti.com>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, May 6, 2019 at 11:28 AM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > > +* Single Byte SPI LED Device Driver.
> > > +
> > > +The driver can be used for controllers with a very simple SPI protocol: Only one
> > > +byte will be sent. The value of the byte can be any value between the off-value
> > > +and max-value defined in the properties.
> > > +
> > > +One example where the driver can be used is the controller in Ubiquiti airCube
> > > +ISP devices. That LED controller is based on a 8 bit microcontroller (SONiX
> > > +8F26E611LA) that has been programmed to control the single LED of the device.
> >
> > What about power control of the uC?
> >
> > > +The controller supports four modes depending on the highest two bits in a byte:
> > > +One setting for brightness, the other three provide different blink patterns.
> >
> > This part seems in no way generic.
> >
> > How does one support the blink patterns?
> >
> > > +With the leds-spi-byte driver a basic support for the brightness mode of that
> > > +controller can be easily achieved by setting the minimum and maximum to the
> > > +brightness modes minimum and maximum byte value.
> > > +
> > > +Required properties:
> > > +- compatible:          Should be "leds-spi-byte".
> >
> > Generally, we don't do "generic" bindings like this. The exceptions
> > are either we have confidence they really can be generic or they where
> > created before we knew better. A sample size of 1 doesn't convince me
> > the former is true.
> >
> > This comment *only* applies to the binding, not the driver. Specific
> > bindings can easily be bound to generic drivers.
>
> Ok, I'm afraid I caused this. What should the compatible be, then?

Knowing nothing about the h/w other than the above description:
ubiquiti,aircube-leds

Not sure if that's a registered or correct vendor prefix though.

Rob
