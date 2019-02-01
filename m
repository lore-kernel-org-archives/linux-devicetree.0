From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 3/3] dt-bindings: iio: chemical: pms7003: add device
 tree support
Date: Fri, 1 Feb 2019 10:12:31 +0100
Message-ID: <20190201091231.GZ3691@localhost>
References: <20190127181916.19948-1-tduszyns@gmail.com>
 <20190127181916.19948-4-tduszyns@gmail.com>
 <20190128075819.GK3691@localhost>
 <20190128184332.GA25627@arch>
 <20190130091254.GN3691@localhost>
 <20190131204000.GA14750@arch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190131204000.GA14750@arch>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Duszynski <tduszyns@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, jic23@jic23.retrosnub.co.uk
List-Id: devicetree@vger.kernel.org

On Thu, Jan 31, 2019 at 09:40:04PM +0100, Tomasz Duszynski wrote:
> On Wed, Jan 30, 2019 at 10:12:54AM +0100, Johan Hovold wrote:
> > On Mon, Jan 28, 2019 at 07:43:33PM +0100, Tomasz Duszynski wrote:
> > > On Mon, Jan 28, 2019 at 08:58:19AM +0100, Johan Hovold wrote:
> > > > On Sun, Jan 27, 2019 at 07:19:16PM +0100, Tomasz Duszynski wrote:
> > > > > Add device tree support for Plantower PMS7003 particulate matter sensor.
> > > > >
> > > > > Signed-off-by: Tomasz Duszynski <tduszyns@gmail.com>
> > > > > ---
> > > > >  .../iio/chemical/plantower,pms7003.txt        | 19 +++++++++++++++++++
> > > > >  1 file changed, 19 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt b/Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt
> > > > > new file mode 100644
> > > > > index 000000000000..e4c7f2fb1e30
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt
> > > > > @@ -0,0 +1,19 @@
> > > > > +* Plantower PMS7003 particulate matter sensor
> > > > > +
> > > > > +Required properties:
> > > > > +- compatible: must be "plantower,pms7003"
> > > > > +
> > > > > +Optional properties:
> > > > > +- vcc-supply: phandle to the regulator that provides power to the sensor
> > > >
> > > > Shouldn't this one be a required property?
> > > >
> > >
> > > Driver does not use regulator framework hence to me this property fits
> > > here better.
> >
> > The device tree describes hardware, not any particular driver.
> >
> > That said, there is a bit of an on-going debate on whether mandatory
> > supplies (from a hardware perspective) should always be represented in
> > device tree or not.
> >
> > 	https://lore.kernel.org/lkml/20181123133126.GF2089@sirena.org.uk/T/#u
> >         https://lore.kernel.org/lkml/20180409102244.GB11532@sirena.org.uk/T/#u
> > 	https://lore.kernel.org/lkml/20180425171123.xhyoay3nu463btoq@rob-hp-laptop/T/#u
> >
> 
> Even after going through this threads I am still unconvinced that
> vcc-supply should be a requirement. Making this a mandatory property
> would automatically imply using *_regulator_get() in a driver code
> (on condition one is adding regulator support). In case there
> isn't any physically connected we end up with a dummy one and a warning.

How would the device work at all without a physical vcc supply?

> Is it how this should work?

As Mark mentioned in the threads above, you could add a fixed,
always-on regulator for cases where the device is always powered.

Boards failing to describe this supply would still work on Linux, but
would end up with a dummy regulator and a warning.

> > > > > +- set-gpios: phandle to the GPIO connected to the SET line
> > > > > +- reset-gpios: phandle to the GPIO connected to the RESET line
> > > > > +
> > > > > +Refer to serial/slave-device.txt for generic serial attached device bindings.
> > > > > +
> > > > > +Example:
> > > > > +
> > > > > +&uart0 {
> > > > > +	pms7003 {
> > > >
> > > > The node name should be generic and reflect the functionality rather
> > > > than model. Perhaps "pms" will do here.
> > >
> > > Agree, ideally we should have a generic dt name for this kind of sensors
> > > (something like air-pollution-sensor perhaps?). But unfortunately there isn't
> > > anything available now so I guess compatible part name should be okay
> > > (besides this is the type of naming commonly used in other iio bindings).
> >
> > What's wrong with particulate matter sensor ("pms")?
> >
> > Seems like a better fix than any particular model name to me at least.
> >
> 
> Personally I would vote for a more descriptive node name, for example:
> particulate-matter-sensor or air-pollution-sensor or other name
> which clearly shows what device we are dealing with.

Spelling it out seems preferable, yes. You know the domain better than
I do; I only suggest you come up with a generic node name.

Johan
