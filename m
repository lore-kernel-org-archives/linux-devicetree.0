From: Tomasz Duszynski <tduszyns@gmail.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: iio: chemical: pms7003: add device
 tree support
Date: Sat, 9 Feb 2019 17:49:12 +0100
Message-ID: <20190209164908.GA2888@arch>
References: <20190201215759.14569-1-tduszyns@gmail.com>
 <20190201215759.14569-4-tduszyns@gmail.com>
 <20190202171247.0d0fc122@archlinux>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190202171247.0d0fc122@archlinux>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>
Cc: Tomasz Duszynski <tduszyns@gmail.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pmeerw@pmeerw.net, johan@kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Feb 02, 2019 at 05:12:47PM +0000, Jonathan Cameron wrote:
> On Fri,  1 Feb 2019 22:57:59 +0100
> Tomasz Duszynski <tduszyns@gmail.com> wrote:
>
> > Add device tree support for Plantower PMS7003 particulate matter sensor.
> >
> > Signed-off-by: Tomasz Duszynski <tduszyns@gmail.com>
> Hi Tomasz,
>
> Sorry, I clearly didn't look at this in enough detail on earlier versions.
> I think the set gpio is rather device specific so should have a vendor
> prefix.
>
> I would also like to get an opinion on the generic name from the devicetree
> maintainers before we start to standardise on it.
>
> Thanks,
>
> Jonathan
>
> > ---
> >  .../iio/chemical/plantower,pms7003.txt        | 20 +++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt
> >
> > diff --git a/Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt b/Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt
> > new file mode 100644
> > index 000000000000..cbad95480e04
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt
> > @@ -0,0 +1,20 @@
> > +* Plantower PMS7003 particulate matter sensor
> > +
> > +Required properties:
> > +- compatible: must be "plantower,pms7003"
> > +- vcc-supply: phandle to the regulator that provides power to the sensor
> > +
> > +Optional properties:
> > +- set-gpios: phandle to the GPIO connected to the SET line
>
> Hmm. This is a somewhat 'unusual' one so should probably have a vendor prefix.
>

Makes sense. I'll respin the series with this extra change you're
suggesting.

> > +- reset-gpios: phandle to the GPIO connected to the RESET line
>
> reset is common and clear in meaning, so vendor prefix probably not appropriate.
> > +
> > +Refer to serial/slave-device.txt for generic serial attached device bindings.
> > +
> > +Example:
> > +
> > +&uart0 {
> > +	air-pollution-sensor {
> > +		vcc-supply = <&reg_vcc5v0>;
> > +		compatible = "plantower,pms7003";
> > +	};
> > +};
>
