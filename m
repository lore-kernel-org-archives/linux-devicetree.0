Return-Path: <SRS0=Vfqj=M6=gmail.com=dmitry.torokhov@kernel.org>
Date: Thu, 18 Oct 2018 11:23:29 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] Input: qt1050 - add Microchip AT42QT1050 support
Message-ID: <20181018182329.GC210757@dtor-ws>
References: <20180924151330.6114-1-m.felsch@pengutronix.de>
 <20181016034434.GA56342@dtor-ws>
 <20181017233153.s4ihu5gmc5qpul7u@pengutronix.de>
 <20181018003918.GA205061@dtor-ws>
 <20181018081308.gsvmdpprlqavwh45@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181018081308.gsvmdpprlqavwh45@pengutronix.de>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, voice.shen@atmel.com, raphaelpereira@gmail.com, linux-input@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

On Thu, Oct 18, 2018 at 10:13:08AM +0200, Marco Felsch wrote:
> Hi Dmitry,
> On 18-10-17 17:39, Dmitry Torokhov wrote:
> > On Thu, Oct 18, 2018 at 01:31:53AM +0200, Marco Felsch wrote:
> > > On 18-10-15 20:44, Dmitry Torokhov wrote:
> > > > On Mon, Sep 24, 2018 at 05:13:30PM +0200, Marco Felsch wrote:
> > > > > +static int qt1050_disable_key(struct regmap *map, int number)
> > > > > +{
> > > > > +	unsigned int reg;
> > > > > +
> > > > > +	switch (number) {
> > > > > +	case 0:
> > > > > +		reg = QT1050_DI_AKS_0;
> > > > > +		break;
> > > > > +	case 1:
> > > > > +		reg = QT1050_DI_AKS_1;
> > > > > +		break;
> > > > > +	case 2:
> > > > > +		reg = QT1050_DI_AKS_2;
> > > > > +		break;
> > > > > +	case 3:
> > > > > +		reg = QT1050_DI_AKS_3;
> > > > > +		break;
> > > > > +	case 4:
> > > > > +		reg = QT1050_DI_AKS_4;
> > > > > +		break;
> > 
> > I wonder if there is any value in doing
> > 
> > 	reg = QT1050_DI_AKS_0 + i + (i > 2);
> > 
> > and similarly for other registers.
> 
> Yes there is a gap in the register map and your approach is smart, but I
> find my less error prone (i.e. it should be (i > 1)) and easier to read
> it. Anyway I can change this if you find it better.

No, I was just wondering if we could avoid bunch of "switch"es in the
code. Maybe have static const array of structures for various registers
and offsets which you index by key number?

...

> > > > > +	if (IS_ENABLED(CONFIG_OF)) {
> > > > > +		err = qt1050_parse_dt(ts);
> > > > > +		if (err) {
> > > > > +			dev_err(dev, "Failed to parse dt: %d\n", err);
> > > > > +			return err;
> > > > > +		}
> > > > > +	} else {
> > > > > +		/* init each key with a valid code */
> > > > > +		for (i = 0; i < QT1050_MAX_KEYS; i++)
> > > > > +			ts->keys[i].keycode = KEY_1 + i;
> > > > > +	}
> > > > 
> > > > I'd rather we used generic device properties (i.e.
> > > > device_property_read_xxx() instead of of_property_read_xxx()) and did
> > > > not provide this fallback.
> > > 
> > > I'm with you, but I wanted to use the of_property_read_variable_*()
> > > helpers, since all properties can distinguish in their array size.
> > > Sure I can add a helper to reimplement that localy using the 
> > > device_property_read_xxx() functions. IMHO this will be a later on
> > > feature, if the acpi guys needs this features too. Is that okay?
> > 
> > Well, that is an argument for adding proper
> > device_property_read_variable_*(). However, after lookign at the binding
> > again, I wonder if you should not describe this as sub-nodes:
> 
> A device_property_read_variable_*() would be nice.

Then please add it ;)

> 
> > 
> > 	touchkeys@41 {
> > 		...
> > 		up@0 {
> > 			reg = <0>;
> > 			linux,code = <KEY_UP>;
> > 			average-samples = <64>;
> > 			pre-scaling = <16>;
> > 			pressure-threshold = <...>;
> > 		};
> > 
> > 		right@1 {
> > 			reg = <1>;
> > 			linux,code = <KEY_RIGHT>;
> > 			average-samples = <64>;
> > 			pre-scaling = <8>;
> > 			pressure-threshold = <2>;
> > 		};
> > 		...
> > 	};
> > 
> > and then use device_for_each_child_node() to parse it.
> 
> That's a good approach, thanks. I wanted to be similar with the other
> input bindings, which uses arrays for linux,code and scalar values for
> other properties. Since the qt1050 can configure each pad differently
> I used only arrays. Is it good to change the layout only for one deivce?
> Maybe it would better to implement the device_property_read_variable_*()
> helper.

We do have similar binding in input, namely
Documentation/devicetree/bindings/input/gpio-keys.txt
I think if keys form a simple array and not allow individual
configuration (noise, number of samples, etc), then weshoudl use
linux,keycodes binding, and if keys are individually controllable you
might want to use the sub-node approach.

Thanks.

-- 
Dmitry
