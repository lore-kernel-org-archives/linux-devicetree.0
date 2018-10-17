Return-Path: <SRS0=5M8v=M5=pengutronix.de=mfe@kernel.org>
Date: Thu, 18 Oct 2018 00:48:38 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH] Input: qt1050 - add Microchip AT42QT1050 support
Message-ID: <20181017224838.dkfx2ji567apavjn@pengutronix.de>
References: <20180924151330.6114-1-m.felsch@pengutronix.de>
 <20181015162029.GA6949@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181015162029.GA6949@bogus>
To: Rob Herring <robh@kernel.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, voice.shen@atmel.com, dmitry.torokhov@gmail.com, raphaelpereira@gmail.com, linux-input@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

Hi Rob,

On 18-10-15 11:20, Rob Herring wrote:
> On Mon, Sep 24, 2018 at 05:13:30PM +0200, Marco Felsch wrote:
> > Add initial support for the AT42QT1050 (QT1050) device. The device
> > supports up to five input keys, dependent on the mode. Since it adds only
> > the initial support the "1 to 4 keys plus Guard Channel" mode isn't
> > support.
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  .../bindings/input/microchip,qt1050.txt       |  54 ++
> 
> Please split binding patches.

Okay I will split it in my v2.

> >  drivers/input/keyboard/Kconfig                |  11 +
> >  drivers/input/keyboard/Makefile               |   1 +
> >  drivers/input/keyboard/qt1050.c               | 589 ++++++++++++++++++
> >  4 files changed, 655 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/input/microchip,qt1050.txt
> >  create mode 100644 drivers/input/keyboard/qt1050.c
> > 
> > diff --git a/Documentation/devicetree/bindings/input/microchip,qt1050.txt b/Documentation/devicetree/bindings/input/microchip,qt1050.txt
> > new file mode 100644
> > index 000000000000..d63e286f6526
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/input/microchip,qt1050.txt
> > @@ -0,0 +1,54 @@
> > +Microchip AT42QT1050 Five-channel Touch Sensor IC
> > +
> > +The AT42QT1050 (QT1050) is a QTouchADC sensor driver. The device can sense from
> 
> s/driver/device/
> 
> Bindings don't describe drivers.

Sorry, my mistake.
 
> > +one to five keys, dependent on mode. The QT1050 includes all signal processing
> > +functions necessary to provide stable sensing under a wide variety of changing
> > +conditions, and the outputs are fully debounced.
> > +
> > +The touchkey device node should be placed inside an I2C bus node.
> > +
> > +Required properties:
> > +- compatible: Must be "microchip,qt1050"
> > +- reg: The I2C address of the touchkeys
> > +- interrupts: The sink for the touchpad's IRQ output,
> > +  see ../interrupt-controller/interrupts.txt
> > +- linux,keycodes: Specifies an array of numeric keycode values to be used for
> > +  reporting button presses. The array can contain up to 5 entries. Array index
> > +  0 correspond to key 0 and so on. If the keys aren't continuous the
> > +  KEY_RESERVED must be used. Keys marked as KEY_RESERVED or not specified will
> > +  be disabled.
> > +
> > +Optional properties:
> > +- pre-charge-time: Specifies an array of precharge times in ns for each touch
> > +  pad. The value for each pad depend on the hardware layouts. If not specified
> > +  or invalid values are specified the default value is taken.
> > +  Valid value range [ns]: 0 - 637500; values must be a multiple of 2500;
> > +  default is 0.
> 
> Needs a unit suffix as defined in property-units.txt.

I reused the property from the input/touchscreen/imx6ul_tsc.txt
bindings, since it describes the same. I didn't want to reproduce
bindings.

> > +- touchscreen-average-samples: Please see ../input/touchscreen/touchscreen.txt
> > +  for more information. Unlike the general binding, this is an array to specify
> > +  the samples for each pad. If not specified or invalid values are specified
> > +  the default value is taken.
> > +  Valid values: 1, 4, 16, 64, 256, 1024, 4096, 16384; default is 1.
> > +- touchscreen-pre-scaling: Please see ../input/touchscreen/touchscreen.txt for
> > +  more information. Unlike the general binding, this is an array to specify the
> > +  scaling factor for each pad. If not specified or invalid values are specified
> > +  the default value is taken.
> > +  Valid values: 1, 2, 4, 8, 16, 32, 64, 128; default is 1.
> > +- touchscreen-fuzz-pressure: Please see ../input/touchscreen/touchscreen.txt for
> > +  more information. Unlike the general binding, this is an array to specify the
> > +  noise (threshold) value for each pad. If not specified or invalid values are
> > +  specified the default value is taken.
> > +  Valid value range: 0 - 255; default is 20.
> > +
> > +Example:
> > +QT1050 with 3 non continuous key, key3 and key5 are disabled.
> > +
> > +touchkeys@41 {
> > +	compatible = "microchip,qt1050";
> > +	reg = <0x41>;
> > +	interrupt-parent = <&gpio0>;
> > +	interrupts = <17 IRQ_TYPE_EDGE_FALLING>;
> > +	linux,keycodes = <KEY_UP>, <KEY_RIGHT>, <KEY_RESERVED>, <KEY_DOWN>;
> > +	touchscreen-average-samples = <64>, <64>, <64>, <256>;
> > +	touchscreen-pre-scaling = <16>, <8>, <16>, <16>;
> > +};
