Return-Path: <SRS0=F3AM=N3=labundy.com=jeff@kernel.org>
Date: Thu, 15 Nov 2018 21:08:10 -0600
From: Jeff LaBundy <jeff@labundy.com>
Subject: Re: [PATCH 1/2] dt-bindings: input: touchscreen: iqs5xx: Add bindings
Message-ID: <20181116030810.GA6146@labundy.com>
References: <1541390242-8355-1-git-send-email-jeff@labundy.com>
 <20181112171718.GA16647@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181112171718.GA16647@bogus>
To: Rob Herring <robh@kernel.org>
Cc: dmitry.torokhov@gmail.com, devicetree@vger.kernel.org, linux-input@vger.kernel.org, rydberg@bitmath.org, mark.rutland@arm.com
List-ID: <devicetree@vger.kernel.org>

Thank you for your review Rob; acknowledged/agreed on all counts
and I will address your feedback in a v2.

On Mon, Nov 12, 2018 at 11:17:21AM -0600, Rob Herring wrote:
> On Sun, Nov 04, 2018 at 09:57:21PM -0600, Jeff LaBundy wrote:
> > This patch adds binding documentation for the Azoteq IQS550/572/525
> > family of trackpad/touchscreen controllers.
> > 
> > Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> > ---
> >  .../bindings/input/touchscreen/iqs5xx.txt          | 123 +++++++++++++++++++++
> >  .../devicetree/bindings/vendor-prefixes.txt        |   1 +
> >  2 files changed, 124 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/iqs5xx.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/input/touchscreen/iqs5xx.txt b/Documentation/devicetree/bindings/input/touchscreen/iqs5xx.txt
> > new file mode 100644
> > index 0000000..d201f68
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/input/touchscreen/iqs5xx.txt
> > @@ -0,0 +1,123 @@
> > +Azoteq IQS550/572/525 Trackpad/Touchscreen Controller
> > +
> > +Required properties:
> > +
> > +- compatible			: One of "azoteq,iqs550", "azoteq,iqs572" or
> > +				  "azoteq,iqs525".
> 
> Format as 1 per line please.
> 
> > +
> > +- reg				: I2C slave address for the device.
> > +
> > +- interrupts			: GPIO to which the device's RDY output is
> > +				  connected (see [0] for more information).
> > +
> > +- reset-gpios			: GPIO to which the device's NRST input is
> > +				  connected (see [1] for more information).
> > +				  Hardware reset access is required so as to
> > +				  facilitate in-system firmware replacement.
> 
> Active low?
> 
> > +
> > +Optional properties:
> > +
> > +- azoteq,exp-ver-major		: Major field of the export file version number
> > +				  (0 through 255 inclusive). This property must
> > +				  be specified as a '/bits/ 8' value.
> > +
> > +- azoteq,exp-ver-minor		: Minor field of the export file version number
> > +				  (0 through 255 inclusive). This property must
> > +				  be specified as a '/bits/ 8' value.
> > +
> > +				  The export file version number is a customer-
> > +				  assigned parameter embedded in the device's
> > +				  firmware at the time it is exported from the
> > +				  manufacturer's PC-based configuration tool.
> > +
> > +				  If the export file version number stored in
> > +				  the device's nonvolatile memory does not match
> > +				  the number specified here, the driver replaces
> > +				  the firmware on the device with that which is
> > +				  stored on the local filesystem (for which the
> > +				  export file version number must match).
> > +
> > +				  If both major and minor fields are omitted or
> > +				  specified as zero, the driver does not query
> > +				  the device's export file version number.
> > +
> > +- touchscreen-min-x		: Minimum horizontal coordinate that can be
> > +				  reported by the device. If this property is
> > +				  omitted, zero is used.
> > +
> > +- touchscreen-min-y		: Minimum vertical coordinate that can be
> > +				  reported by the device. If this property is
> > +				  omitted, zero is used.
> > +
> > +- touchscreen-size-x		: Horizontal resolution (in pixels) of the touch
> > +				  area. If this property is omitted, the default
> > +				  horizontal resolution embedded in the device's
> > +				  firmware is used.
> > +
> > +- touchscreen-size-y		: Vertical resolution (in pixels) of the touch
> > +				  area. If this property is omitted, the default
> > +				  vertical resolution embedded in the device's
> > +				  firmware is used.
> > +
> > +- touchscreen-max-pressure	: Maximum touch strength that can be reported by
> > +				  the device, specified as the sum of the deltas
> > +				  across all channels impacted by a touch event.
> > +				  A channel's delta is calculated as its count
> > +				  value minus a reference, where the count value
> > +				  is inversely proportional to the channel's
> > +				  capacitance. The maximum touch strength is
> > +				  therefore dependent on hardware configuration
> > +				  and can vary by application.
> > +
> > +- touchscreen-fuzz-x		: Hysteresis level (in pixels) applied to the
> > +				  horizontal coordinates reported by the device.
> > +
> > +- touchscreen-fuzz-y		: Hysteresis level (in pixels) applied to the
> > +				  vertical coordinates reported by the device.
> > +
> > +- touchscreen-fuzz-pressure	: Hysteresis level applied to the strength level
> > +				  reported by the device, specified in the same
> > +				  units as touchscreen-max-pressure (deltas).
> > +
> > +- touchscreen-inverted-x	: Boolean to indicate that the horizontal axis
> > +				  of the touch area is inverted. Inversion is
> > +				  applied relative to that which may already be
> > +				  embedded in the device's firmware.
> > +
> > +- touchscreen-inverted-y	: Boolean to indicate that the vertical axis
> > +				  of the touch area is inverted. Inversion is
> > +				  applied relative to that which may already be
> > +				  embedded in the device's firmware.
> > +
> > +- touchscreen-swapped-x-y	: Boolean to indicate that the horizontal and
> > +				  vertical axes of the touch area are swapped.
> > +				  Transposition is applied relative to that
> > +				  which may already be embedded in the device's
> > +				  firmware.
> 
> No need to define all these standard properties again. Just reference 
> touchscreen.txt. If you have any additional constraints, then add them 
> here.
> 
> > +
> > +[0]: Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> > +[1]: Documentation/devicetree/bindings/gpio/gpio.txt
> > +
> > +Example:
> > +
> > +	&i2c1 {
> > +		/* ... */
> > +
> > +		iqs550: iqs550@74 {
> 
> touchscreen@74
> 
> > +			compatible = "azoteq,iqs550";
> > +			reg = <0x74>;
> > +			interrupt-parent = <&gpio>;
> > +			interrupts = <17 1>;
> > +			reset-gpios = <&gpio 27 0>;
> > +
> > +			azoteq,exp-ver-major = /bits/ 8 <1>;
> > +			azoteq,exp-ver-minor = /bits/ 8 <0>;
> > +
> > +			touchscreen-size-x = <640>;
> > +			touchscreen-size-y = <480>;
> > +
> > +			touchscreen-max-pressure = <16000>;
> > +		};
> > +
> > +		/* ... */
> > +	};
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > index a38d8bf..d2ed740 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > @@ -49,6 +49,7 @@ avia	avia semiconductor
> >  avic	Shanghai AVIC Optoelectronics Co., Ltd.
> >  axentia	Axentia Technologies AB
> >  axis	Axis Communications AB
> > +azoteq	Azoteq (Pty) Ltd
> >  bananapi BIPAI KEJI LIMITED
> >  bhf	Beckhoff Automation GmbH & Co. KG
> >  boe	BOE Technology Group Co., Ltd.
> > -- 
> > 2.7.4
> > 
> 
> 
