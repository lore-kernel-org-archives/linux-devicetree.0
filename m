Return-Path: <robherring2@gmail.com>
Date: Mon, 13 May 2019 12:25:17 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC][PATCH] dt-bindings: iio: accel: add adi,adxl345.yaml
 binding
Message-ID: <20190513172517.GA1637@bogus>
References: <20190506114610.28083-1-alexandru.ardelean@analog.com>
 <CAL_JsqL-jKM-qpawVoaLaqTpZhqNNFmgAOjv_azSwOU6zFS08g@mail.gmail.com>
 <fdf60ff605e040ef24ae10c1e0b3b522de6ef9ab.camel@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fdf60ff605e040ef24ae10c1e0b3b522de6ef9ab.camel@analog.com>
To: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
Cc: "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, May 06, 2019 at 02:29:54PM +0000, Ardelean, Alexandru wrote:
> On Mon, 2019-05-06 at 09:17 -0500, Rob Herring wrote:
> > [External]
> > 
> > 
> > On Mon, May 6, 2019 at 6:46 AM Alexandru Ardelean
> > <alexandru.ardelean@analog.com> wrote:
> > > 
> > > This patch adds a YAML binding for the Analog Devices ADXL345 I2C/SPI
> > > accelerometer.
> > > 
> > > Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> > > ---
> > > 
> > > And now for the RFC part.
> > > Normally, I would dig into source-code to try to figure this out, but
> > > at
> > > this point-in-time, I am low on time/energy to do this.
> > > And maybe this helps trigger a discussion about this.
> > > 
> > > Apologies if this has been coverted on the devicetree mailing list, but
> > > at least we'd get some coverage on the IIO list (with this).
> > > 
> > > The ADXL345 device (as others) supports both I2C & SPI interfaces.
> > > 
> > > Question1: do we write 2 YAML files, or 1 ? I was looking at Zephyr
> > > (for
> > > some ideas/reference) but it seems to me that the YAML DT binding
> > > format is
> > > different than this one ? They write 2 files for ADXL372 (1 for SPI, 1
> > > for
> > > I2C).
> > > 
> > > Question1-a: one thing is that SPI requires some props to be `required`
> > > that would not be required for the I2C binding. This could be solved by
> > > doing 2 files, but if doing 1 YAML file, is there a way to do
> > > conditional
> > > `required` ? i.e. property is required if `SPI` ? not sure how to check
> > > for
> > > SPI vs I2C, it would be interesting (at some point) to somehow enforce
> > > SPI/I2C bindings correctness.
> > 
> > The challenge here is there's not really any way for the schema to
> > know which bus it is. The only ways to know this are knowing all
> > possible spi or i2c controller compatibles or using the parent node
> > name (which hasn't been strictly enforced). In order to get this
> > information available to the schema, we'd need to add the information
> > to the node. We do this with '$nodename'. We could add a '$bus'
> > property for example. The tools would have to understand different
> > buses and things like I2C muxes complicate doing that.
> > 
> > Once you have something like $bus available, you could either have 2
> > files with a custom 'select' that checks compatible and $bus or we
> > could have 1 file using if/then/else keywords. However, we don't yet
> > support if/then/else json-schema that was added in draft7, but that's
> > being worked on by Maxime Ripard.
> > 
> > However, for this case, I'd just not worry about the issue. Really,
> > spi-cpha and spi-cpol should not be required. If only 1 mode is
> > supported, the driver can know that. IOW, it is implied by the
> > compatible strings.
> > 
> > 
> > > Question2: `make dt_binding_check` seems to generate only the first
> > > example. Is this known behavior, or do I need to take something else
> > > into
> > > consideration ?
> > 
> > That's correct. I haven't figured out how to do a variable number of
> > examples in kbuild.
> 
> Then, would it be fine to have multiple examples, and wait for this to pop-
> in the YAML dt stuff at a later point in time ?
> Or, just 1 example ?

I've now fixed this by extracting each example into a sub-node in the 
generated dts file, so multiple examples are fine now. The only 
restriction is labels can't be repeated.

Rob
