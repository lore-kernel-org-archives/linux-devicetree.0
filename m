MIME-Version: 1.0
Date: Wed, 12 Sep 2018 13:45:15 -0500
References: <bbe4833a-ea46-6cad-eafb-4a7bc5b7a607@xor.wtf>
	<CAF1QFj_gev-_wB0cNkS1wv4uiVNKttW3wKMDOAd7FMhS211o-A@mail.gmail.com>
	<af240ebf-50ba-1ba4-0d41-040b14f811be@xor.wtf>
	<3f3637e4-618e-e95c-bd1c-ee3afd8c8e0f@posteo.de>
In-Reply-To: <3f3637e4-618e-e95c-bd1c-ee3afd8c8e0f@posteo.de>
Message-ID: <CAL_JsqKudVXevW2YdEPvbOgK4CoszjqKNvCDrvKx-iOqRj0KWg@mail.gmail.com>
Subject: Re: SPI CAN device enumeration / network device naming
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: menschel.p@posteo.de
Cc: xor@xor.wtf, linux-can@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Sep 12, 2018 at 11:11 AM Patrick Menschel <menschel.p@posteo.de> wrote:
>
> Hi,
>
> I'm adding the devicetree mailing list to CC as they are the experts.
>
> Normally you should get your numbering to work with aliases but I'm not
> sure if it is used the same way in overlays.
>
> aliases {
>          can0 = &can0;
>          can1 = &can1;
>          can2 = &can2;
>          can3 = &can3;
>          };

Yes, some platforms do this for built-in CAN controllers. I'm not sure
if this can really work for overlays though. You might get away with
it because the base dt doesn't have any can aliases, but what if it
did? Or what happens when you plugin a USB to CAN device (assuming
such a thing exists)?

I'd suggest using "label" properties if there's a human identifiable
connector/port and then support something like /dev/can/by-label/<some
label name>. udev would create symlinks for each /sys/class/can/
device. That's how other classes of devices work. I guess if it is
like ethernet though, that's a bit different, but still solved without
fixed numbering.

> Btw nice that my kicad contributions come to work by itself.
> https://github.com/KiCad/kicad-symbols/pull/201
> I was routing my own board but unpredictably holidays were over ;-)
>
> Regards,
> Patrick
>
>
> > Thank you Chris!
> >
> > Unfortunately, using multiple DT overlays is not a good solution for me;
> > I want the raspi bootloader to load the overlay from the hat's EEPROM,
> > and afaik, there can be only one overlay per EEPROM.
> >
> > For now, I'm using a udev rules file:
> > ---
> > ACTION=="add", SUBSYSTEM=="net", DEVPATH=="/devices/platform/soc/*/spi0.0/net/can?", NAME="can0"
> > ACTION=="add", SUBSYSTEM=="net", DEVPATH=="/devices/platform/soc/*/spi0.1/net/can?", NAME="can1"
> > ACTION=="add", SUBSYSTEM=="net", DEVPATH=="/devices/platform/soc/*/spi1.0/net/can?", NAME="can2"
> > ACTION=="add", SUBSYSTEM=="net", DEVPATH=="/devices/platform/soc/*/spi1.1/net/can?", NAME="can3"

The main problem with this is it is very much platform specific.

This problem is solved for other devices and not by fixed indexes. No
one expects eth0, eth1, etc. anymore.

Rob
