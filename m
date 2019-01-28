From: Tomasz Duszynski <tduszyns@gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: iio: chemical: pms7003: add device
 tree support
Date: Mon, 28 Jan 2019 19:43:33 +0100
Message-ID: <20190128184332.GA25627@arch>
References: <20190127181916.19948-1-tduszyns@gmail.com>
 <20190127181916.19948-4-tduszyns@gmail.com>
 <20190128075819.GK3691@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190128075819.GK3691@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Tomasz Duszynski <tduszyns@gmail.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, jic23@jic23.retrosnub.co.uk
List-Id: devicetree@vger.kernel.org

On Mon, Jan 28, 2019 at 08:58:19AM +0100, Johan Hovold wrote:
> On Sun, Jan 27, 2019 at 07:19:16PM +0100, Tomasz Duszynski wrote:
> > Add device tree support for Plantower PMS7003 particulate matter sensor.
> >
> > Signed-off-by: Tomasz Duszynski <tduszyns@gmail.com>
> > ---
> >  .../iio/chemical/plantower,pms7003.txt        | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt
> >
> > diff --git a/Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt b/Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt
> > new file mode 100644
> > index 000000000000..e4c7f2fb1e30
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt
> > @@ -0,0 +1,19 @@
> > +* Plantower PMS7003 particulate matter sensor
> > +
> > +Required properties:
> > +- compatible: must be "plantower,pms7003"
> > +
> > +Optional properties:
> > +- vcc-supply: phandle to the regulator that provides power to the sensor
>
> Shouldn't this one be a required property?
>

Driver does not use regulator framework hence to me this property fits
here better.

> > +- set-gpios: phandle to the GPIO connected to the SET line
> > +- reset-gpios: phandle to the GPIO connected to the RESET line
> > +
> > +Refer to serial/slave-device.txt for generic serial attached device bindings.
> > +
> > +Example:
> > +
> > +&uart0 {
> > +	pms7003 {
>
> The node name should be generic and reflect the functionality rather
> than model. Perhaps "pms" will do here.
>

Agree, ideally we should have a generic dt name for this kind of sensors
(something like air-pollution-sensor perhaps?). But unfortunately there isn't
anything available now so I guess compatible part name should be okay
(besides this is the type of naming commonly used in other iio bindings).

> > +		compatible = "plantower,pms7003";
> > +	};
> > +};
>
> Johan
