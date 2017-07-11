From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 8/9] dt-bindings: iio: humidity: hts221: support open
 drain mode
Date: Tue, 11 Jul 2017 19:26:56 +0100
Message-ID: <20170711192656.7fd08a1c@kernel.org>
References: <20170709165704.26311-1-lorenzo.bianconi@st.com>
        <20170709165704.26311-9-lorenzo.bianconi@st.com>
        <20170711025158.vpt6bcznkhi3bslm@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170711025158.vpt6bcznkhi3bslm@rob-hp-laptop>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 10 Jul 2017 21:51:58 -0500
Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> On Sun, Jul 09, 2017 at 06:57:03PM +0200, Lorenzo Bianconi wrote:
> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/iio/humidity/hts221.txt | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/iio/humidity/hts221.txt b/Documentation/devicetree/bindings/iio/humidity/hts221.txt
> > index fca263e13400..732b83c06c08 100644
> > --- a/Documentation/devicetree/bindings/iio/humidity/hts221.txt
> > +++ b/Documentation/devicetree/bindings/iio/humidity/hts221.txt
> > @@ -5,6 +5,14 @@ Required properties:
> >  - reg: i2c address of the sensor / spi cs line
> >  
> >  Optional properties:
> > +- drive-open-drain: the interrupt/data ready line will be configured  
> 
> Needs a vendor prefix and "drdy-open-drain" would be more specific.
This is straight out of the pinctrl bindings and has been used in a few
other places as well.  I can see it should really be more obviously
associated with the drdy pin though.  A few IIO drivers already
use this binding (st sensors and the lsm6dsx).  If we are going
to decide it's a bad idea we should deprecate those bindings and
add whatever we do here as well.

Jonathan
> 
> > +  as open drain, which is useful if several sensors share the same
> > +  interrupt line. This is a boolean property.
> > +  (This binding is taken from pinctrl/pinctrl-bindings.txt)
> > +  If the requested interrupt is configured as IRQ_TYPE_LEVEL_HIGH or
> > +  IRQ_TYPE_EDGE_RISING a pull-down resistor is needed to drive the line
> > +  when it is not active, whereas a pull-up one is needed when interrupt
> > +  line is configured as IRQ_TYPE_LEVEL_LOW or IRQ_TYPE_EDGE_FALLING.
> >  - interrupt-parent: should be the phandle for the interrupt controller
> >  - interrupts: interrupt mapping for IRQ. It should be configured with
> >    flags IRQ_TYPE_LEVEL_HIGH, IRQ_TYPE_EDGE_RISING, IRQ_TYPE_LEVEL_LOW or
> > -- 
> > 2.13.1
> > 
> > --
> > To unsubscribe from this list: send the line "unsubscribe devicetree" in
> > the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html  
