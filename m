From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v4 2/2] iio: Add OF support
Date: Wed, 6 Feb 2013 17:53:46 -0800
Message-ID: <20130207015346.GA15240@roeck-us.net>
References: <1360009566-26347-1-git-send-email-linux@roeck-us.net>
 <1360009566-26347-3-git-send-email-linux@roeck-us.net>
 <20130206182923.GA14417@roeck-us.net>
 <5112B101.7040709@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5112B101.7040709-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Anton Vorontsov <cbou-JGs/UdohzUI@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 06, 2013 at 07:37:37PM +0000, Jonathan Cameron wrote:
> On 02/06/2013 06:29 PM, Guenter Roeck wrote:
> > Provide bindings and parse OF data during initialization.
> > 
> > Signed-off-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> looks good to me.  Couple of little queries inline.
> 
[ ... ]

> > +
> > +Example for a configuration with trigger:
> > +
> > +	adc@35 {
> > +		compatible = "maxim,max1139";
> > +		reg = <0x35>;
> > +
> > +		adc: iio-device {
> > +			#io-channel-cells = <1>;
> > +		};
> > +		trigger: iio-trigger {
> > +			#io-channel-cells = <1>;
> Why would the trigger have channel-cells?
> So far we don't have any device tree stuff for the triggers.

I thought about keeping the example and adding a note that trigger support is
not currently implemented, but a better idea is to replace it with a second iio
device. I'll do that unless someone objects.

	adc@35 {
		compatible = "some-vendor,some-adc";
		reg = <0x35>;

		adc1: iio-device@0 {
			#io-channel-cells = <1>;
			/* other properties */
		};
		adc2: iio-device@1 {
			#io-channel-cells = <1>;
			/* other properties */
		};
	};

> > +
> > +==Example==
> > +
> > +	adc: max1139@35 {
> > +		compatible = "maxim,max1139";
> > +		reg = <0x35>;
> > +		#io-channel-cells = <1>;
> > +	};
> > +
> > +	...
> > +
> > +	iio_hwmon {
> > +		compatible = "iio-hwmon";
> > +		io-channels = <&adc 0>, <&adc 1>, <&adc 2>,
> > +			<&adc 3>, <&adc 4>, <&adc 5>,
> > +			<&adc 6>, <&adc 7>, <&adc 8>,
> > +			<&adc 9>, <&adc 10>, <&adc 11>;
> > +		io-channel-names = "vcc", "vdd", "vref", "1.2V";
> This example still seems a little odd. Why give one where there are
> more channels than names?

I replaced the example with

	iio_hwmon {
		compatible = "iio-hwmon";
		io-channels = <&adc 0>, <&adc 1>, <&adc 2>,
			<&adc 3>, <&adc 4>, <&adc 5>,
			<&adc 6>, <&adc 7>, <&adc 8>,
			<&adc 9>;
		}; 

	some_consumer {
		compatible = "some-consumer";
		io-channels = <&adc 10>, <&adc 11>;
		io-channel-names = "adc1", "adc2";
	};

Guenter
