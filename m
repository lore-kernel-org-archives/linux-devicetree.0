From: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: [PATCH 3/3] iio: chemical: sps30: add device tree support
Date: Mon, 3 Dec 2018 13:10:31 +0000
Message-ID: <20181203131031.00006b26@huawei.com>
References: <20181124221415.10081-1-tduszyns@gmail.com>
        <20181124221415.10081-4-tduszyns@gmail.com>
        <20181125085939.421523d6@archlinux>
        <20181202182943.GA8286@arch>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181202182943.GA8286@arch>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Duszynski <tduszyns@gmail.com>
Cc: Jonathan Cameron <jic23@jic23.retrosnub.co.uk>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, 2 Dec 2018 19:29:44 +0100
Tomasz Duszynski <tduszyns@gmail.com> wrote:

> On Sun, Nov 25, 2018 at 08:59:39AM +0000, Jonathan Cameron wrote:
> > On Sat, 24 Nov 2018 23:14:15 +0100
> > Tomasz Duszynski <tduszyns@gmail.com> wrote:
> >  
> > > Add device tree support for Sensirion SPS30 particulate
> > > matter sensor.
> > >
> > > Signed-off-by: Tomasz Duszynski <tduszyns@gmail.com>  
> > one comment inine, around the fact we are trying to move
> > to generic names in DT where ever possible.  Now we don't
> > have a suitable one (IIRC) yet so time to make one up ;)
> >
> > +CC Rob for his input on that.  
> > > ---
> > >  .../bindings/iio/chemical/sensirion,sps30.txt        | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/iio/chemical/sensirion,sps30.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/iio/chemical/sensirion,sps30.txt b/Documentation/devicetree/bindings/iio/chemical/sensirion,sps30.txt
> > > new file mode 100644
> > > index 000000000000..6eee2709b5b6
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/iio/chemical/sensirion,sps30.txt
> > > @@ -0,0 +1,12 @@
> > > +* Sensirion SPS30 particulate matter sensor
> > > +
> > > +Required properties:
> > > +- compatible: must be "sensirion,sps30"
> > > +- reg: the I2C address of the sensor
> > > +
> > > +Example:
> > > +
> > > +sps30@69 {  
> > We should define a generic type.  Rob, what would work for this
> > one?
> >
> > particlesensor@69?
> >  
> 
> Wouldn't air-pollution-sensor be somewhat more generic? At least
> wikipedia has some article about that. Various other names like
> particle-sensor, pm-sensor, particulate-matter-sensor,
> air-quality-sensor, tend to return more or less similar number
> of search hits. Which means there's no universal naming convention.

I have not strong feeling in favor of a particular choice. 
Happy with wherever the discussion converges.

Jonathan
> 
> > > +	compatible = "sensirion,sps30";
> > > +	reg = <0x69>;
> > > +};  
> >  
