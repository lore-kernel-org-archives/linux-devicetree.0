Return-Path: <robherring2@gmail.com>
Date: Thu, 29 Aug 2019 18:02:07 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-binding: iio: Add optional label property
Message-ID: <20190829230207.GA22979@bogus>
References: <1566876924-63608-1-git-send-email-preid@electromag.com.au>
 <1566876924-63608-2-git-send-email-preid@electromag.com.au>
 <a30b6dca-c598-135a-0559-1018dd5f5fde@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a30b6dca-c598-135a-0559-1018dd5f5fde@xilinx.com>
To: Michal Simek <michal.simek@xilinx.com>
Cc: Phil Reid <preid@electromag.com.au>, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, mark.rutland@arm.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Aug 28, 2019 at 08:09:19AM +0200, Michal Simek wrote:
> On 27. 08. 19 5:35, Phil Reid wrote:
> > This optional property defines a symbolic name for the device.
> > 
> > Signed-off-by: Phil Reid <preid@electromag.com.au>
> > ---
> >  Documentation/devicetree/bindings/iio/iio-bindings.txt | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/iio/iio-bindings.txt b/Documentation/devicetree/bindings/iio/iio-bindings.txt
> > index 68d6f8ce063b..ffeae5aad8b5 100644
> > --- a/Documentation/devicetree/bindings/iio/iio-bindings.txt
> > +++ b/Documentation/devicetree/bindings/iio/iio-bindings.txt
> > @@ -18,12 +18,17 @@ Required properties:
> >  		   with a single IIO output and 1 for nodes with multiple
> >  		   IIO outputs.
> >  
> > +Optional properties:
> > +label:		   A symbolic name for the device.
> > +
> > +
> >  Example for a simple configuration with no trigger:
> >  
> >  	adc: voltage-sensor@35 {
> >  		compatible = "maxim,max1139";
> >  		reg = <0x35>;
> >  		#io-channel-cells = <1>;
> > +		label = "adc_voltage_sensor";
> >  	};
> >  
> >  Example for a configuration with trigger:
> > 
> 
> Just for the record. This patch has been created based on initial
> discussion about label property. And Rob had not problem with using
> label in connection to ina226. https://lkml.org/lkml/2019/8/27/1213

I didn't, but based on the name here I'm less convinced. 'label' is 
supposed to be for needing to distinguish between more than 1 of 
something. A name like 'adc_voltage_sensor' doesn't really.

Rob
