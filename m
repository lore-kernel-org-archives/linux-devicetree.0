From: "Tirdea, Irina" <irina.tirdea-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: RE: [PATCH 3/3] iio: magn: bmc150_magn: Add devicetree binding
 documentation
Date: Wed, 22 Apr 2015 12:47:08 +0000
Message-ID: <1F3AC3675D538145B1661F571FE1805F19A5B3AA@irsmsx105.ger.corp.intel.com>
References: <1429267830-13681-1-git-send-email-irina.tirdea@intel.com>
 <1429267830-13681-4-git-send-email-irina.tirdea@intel.com>
 <55329DA9.1050305@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55329DA9.1050305-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [mailto:linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org] On Behalf Of Jonathan Cameron
> Sent: 18 April, 2015 21:09
> To: Tirdea, Irina; linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Hartmut Knaack; Lars-Peter Clausen; Peter Meerwald; Rob Herring; Pawel Moll; Mark Rutland; Ian
> Campbell; Kumar Gala
> Subject: Re: [PATCH 3/3] iio: magn: bmc150_magn: Add devicetree binding documentation
> 
> On 17/04/15 11:50, Irina Tirdea wrote:
> > Add binding documentation for Bosch BMC150 magnetometer.
> >
> > Signed-off-by: Irina Tirdea <irina.tirdea-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> > ---
> >  .../bindings/iio/magnetometer/bmc150_magn.txt        | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/bmc150_magn.txt
> >
> > diff --git a/Documentation/devicetree/bindings/iio/magnetometer/bmc150_magn.txt
> b/Documentation/devicetree/bindings/iio/magnetometer/bmc150_magn.txt
> > new file mode 100644
> > index 0000000..4ed035c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/magnetometer/bmc150_magn.txt
> > @@ -0,0 +1,20 @@
> > +* Bosch BMC150 magnetometer sensor
> > +
> > +http://ae-bst.resource.bosch.com/media/products/dokumente/bmc150/BST-BMC150-DS000-04.pdf
> > +
> > +Required properties:
> > +
> > +  - compatible : should be "bosch,bmc150_magn"
> > +  - reg : the I2C address of the magnetometer
> > +
> > +Optional properties:
> > +
> > +  - gpios : should be device tree identifier of the magnetometer DRDY pin
> Hmm. Under device tree this should be done as an interrupt.  You only
> (currently) need the dubious frig with gpios for ACPI I think.
Using the gpios declared like this, it will go the same code path as the ACPI.
I wasn't sure which to list in the optional properties, so I used gpios because the other magnetometer device tree
bindings listed also gpios.

It is better to specify the interrupt directly since it will be handled by the core, so I will remove gpios and list interrupts
instead.

Thanks,
Irina

> > +
> > +Example:
> > +
> > +bmc150_magn@12 {
> > +        compatible = "bosch,bmc150_magn";
> > +        reg = <0x12>;
> > +        interrupt-gpio = <&gpio1 0 1>;
> > +};
> >
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
