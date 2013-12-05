From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v4 10/15] usb: phy: msm: Add device tree support and
 binding information
Date: Thu, 5 Dec 2013 10:41:50 +0000
Message-ID: <20131205104150.GJ29200@e106331-lin.cambridge.arm.com>
References: <1384267910-32066-1-git-send-email-iivanov@mm-sol.com>
 <1384267910-32066-11-git-send-email-iivanov@mm-sol.com>
 <20131115163818.GH24831@e106331-lin.cambridge.arm.com>
 <1384779277.13631.13.camel@iivanov-dev.int.mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384779277.13631.13.camel-yvhxILDKWb8ylMT5ByZ5bDRGLm/uyL/D0E9HWUfgJXw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Cc: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 18, 2013 at 12:54:37PM +0000, Ivan T. Ivanov wrote:
> Hi Mark, 
> 
> On Fri, 2013-11-15 at 16:38 +0000, Mark Rutland wrote: 
> > On Tue, Nov 12, 2013 at 02:51:45PM +0000, Ivan T. Ivanov wrote:
> > > From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
> > > 
> > > Allows MSM OTG controller to be specified via device tree.
> > > 
> > > Signed-off-by: Ivan T. Ivanov <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
> > > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > > ---
> > >  .../devicetree/bindings/usb/msm-hsusb.txt          |   57 +++++++++++++-
> > >  drivers/usb/phy/phy-msm-usb.c                      |   79 +++++++++++++++++---
> > >  2 files changed, 124 insertions(+), 12 deletions(-)

[...]

> > > +
> > > +- dr_mode:		One of "host", "peripheral" or "otg". Defaults to "otg"
> > 
> > If this has a default and thus isn't required, it should be listed as
> > optional.
> 
> This is part of the standard USB bindings, Perhaps I could just
> refer to:  Documentation/devicetree/bindings/usb/generic.txt

That would be fine, but it should also be moved to the optional
properties section.

> 
> 
> > 
> > > +
> > > +- vdccx-supply:	phandle to the regulator for the vdd supply for
> > > +				digital circuit operation.
> > > +- v1p8-supply:	phandle to the regulator for the 1.8V supply
> > > +- v3p3-supply:	phandle to the regulator for the 3.3V supply
> > > +
> > > +- qcom,otg-control: OTG control (VBUS and ID notifications) can be one of
> > > +				1 - PHY control
> > > +				2 - PMIC control
> > > +				3 - User control (via debugfs)
> > 
> > NAK. This does not seem like a description of the hardware, and given
> > the debugfs comment is fundamentally tied to the way Linux functions
> > today.
> 
> I will remove option 3, but rest are really property of the chipset. 

Can you elaborate on the diffence please?

> 
> > 
> > > +
> > > +Optional properties:
> > > +- qcom,phy-init-sequence: PHY configuration sequence. val, reg pairs
> > > +				terminate with -1
> > 
> > What is this? I'm really not keen on having arbitrary register/memory
> > poking sequences in the dt.
> 
> This is related Device Mode Eye Diagram test and values used could be
> different between chipsets.

Ok. Then we should encode the tuning data rather than adding a mechanism
to allow for writes to arbitrary addresses.

> 
> > 
> > Why does it need to be terminated? Surely the size of the property tells
> > you that it's terminated.
> 
> Yes. -1 termination could be done in driver.

Please do. There's no need for it to be in the DT.

Cheers,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
