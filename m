From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v3 2/4] dt-bindings: maxbotix,mb1232: Add MaxBotix i2c
 ultrasonic rangers
Date: Sun, 31 Mar 2019 11:34:07 +0100
Message-ID: <20190331113407.5df5f41d@archlinux>
References: <20190317203526.4pcwo4gdrrng44v7@arbad>
        <20190328175134.GA15033@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190328175134.GA15033@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Andreas Klinger <ak@it-klinger.de>, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, mark.rutland@arm.com, afaerber@suse.de, arnd@arndb.de, davem@davemloft.net, gregkh@linuxfoundation.org, johan@kernel.org, khilman@baylibre.com, knaack.h@gmx.de, lars@metafoo.de, linux-kernel@vger.kernel.org, martin.blumenstingl@googlemail.com, mchehab+samsung@kernel.org, m.othacehe@gmail.com, nicolas.ferre@microchip.com, pmeerw@pmeerw.net, songqiang1304521@gmail.com, treding@nvidia.com, techsupport@maxbotix.com
List-Id: devicetree@vger.kernel.org

On Thu, 28 Mar 2019 12:51:35 -0500
Rob Herring <robh@kernel.org> wrote:

> On Sun, Mar 17, 2019 at 09:35:27PM +0100, Andreas Klinger wrote:
> > Add doc for dt binding maxbotix,mb1232. This binding is for MaxBotix
> > I2CXL-MaxSonar ultrasonic rangers which share a common i2c interface.
> > 
> > Signed-off-by: Andreas Klinger <ak@it-klinger.de>
> > ---
> >  .../bindings/iio/proximity/maxbotix,mb1232.txt     | 31 ++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.txt b/Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.txt
> > new file mode 100644
> > index 000000000000..0e9df87eca1d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.txt
> > @@ -0,0 +1,31 @@
> > +* MaxBotix I2CXL-MaxSonar ultrasonic distance sensor of type  mb1202,
> > +  mb1212, mb1222, mb1232, mb1242, mb7040 or mb7137 using the i2c interface
> > +  for ranging
> > +
> > +Required properties:
> > + - compatible:		"maxbotix,mb1202",
> > +			"maxbotix,mb1212",
> > +			"maxbotix,mb1222",
> > +			"maxbotix,mb1232",
> > +			"maxbotix,mb1242",
> > +			"maxbotix,mb7040" or
> > +			"maxbotix,mb7137"
> > +
> > + - reg:			i2c address of the device, see also i2c/i2c.txt
> > +
> > +Optional properties:
> > + - interrupt-parent:	Interrupt controller to use  
> 
> Don't need this as it is implied and could be in the parent.
> 
> Otherwise,
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
I tidied that up.

Thanks,

Jonathan

> 
> > +
> > + - interrupts:		Interrupt used to announce the preceding reading
> > +			request has finished and that data is available.
> > +			If no interrupt is specified the device driver
> > +			falls back to wait a fixed amount of time until
> > +			data can be retrieved.
> > +
> > +Example:
> > +proximity@70 {
> > +	compatible = "maxbotix,mb1232";
> > +	reg = <0x70>;
> > +	interrupt-parent = <&gpio2>;
> > +	interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
> > +};
> > -- 
> > 2.11.0  
