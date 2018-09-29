From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: light: bh1750: Add device tree
 binding documentation
Date: Sat, 29 Sep 2018 12:26:02 +0100
Message-ID: <20180929122602.66dde03d@archlinux>
References: <20180922210539.6670-1-decatf@gmail.com>
        <20180927193137.GA14849@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180927193137.GA14849@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: ryang <decatf@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Mark Rutland <mark.rutland@arm.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 27 Sep 2018 14:31:37 -0500
Rob Herring <robh@kernel.org> wrote:

> On Sat, Sep 22, 2018 at 05:05:38PM -0400, ryang wrote:
> > Document device tree bindings for ROHM BH1750 ambient light sensor driver.
> > 
> > Signed-off-by: ryang <decatf@gmail.com>
> > ---
> >  .../devicetree/bindings/iio/light/bh1750.txt   | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/iio/light/bh1750.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/iio/light/bh1750.txt b/Documentation/devicetree/bindings/iio/light/bh1750.txt
> > new file mode 100644
> > index 000000000000..468350cc7af6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/light/bh1750.txt
> > @@ -0,0 +1,18 @@
> > +ROHM BH1750 - ALS, Ambient light sensor
> > +
> > +Required properties:
> > +
> > +- compatible: Must be one of:
> > +    "rohm,bh1710"
> > +    "rohm,bh1715"
> > +    "rohm,bh1721"
> > +    "rohm,bh1750"
> > +    "rohm,bh1751"
> > +- reg: the I2C address of the sensor
> > +
> > +Example:
> > +
> > +bh1750@23 {  
> 
> light-sensor@23
> 
> Otherwise,
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
Fixed up.  Thanks Rob.

Jonathan

> 
> > +	compatible = "rohm,bh1750";
> > +	reg = <0x23>;
> > +};
> > -- 
> > 2.17.1
> >   
