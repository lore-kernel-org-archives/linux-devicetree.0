From: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v13 15/25] dt: bindings: Add a binding for flash LED
 devices associated to a sensor
Date: Tue, 19 Sep 2017 15:16:38 +0300
Message-ID: <20170919121638.znu2drbzzayxrbwz@paasikivi.fi.intel.com>
References: <20170915141724.23124-1-sakari.ailus@linux.intel.com>
 <20170915141724.23124-16-sakari.ailus@linux.intel.com>
 <8102551.bT9icskWgv@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8102551.bT9icskWgv@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Laurent,

On Tue, Sep 19, 2017 at 03:12:42PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Friday, 15 September 2017 17:17:14 EEST Sakari Ailus wrote:
> > Camera flash drivers (and LEDs) are separate from the sensor devices in
> > DT. In order to make an association between the two, provide the
> > association information to the software.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Acked-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
> > Acked-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/media/video-interfaces.txt | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt
> > b/Documentation/devicetree/bindings/media/video-interfaces.txt index
> > 852041a7480c..fdba30479b47 100644
> > --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> > +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > @@ -67,6 +67,14 @@ are required in a relevant parent node:
> >  		    identifier, should be 1.
> >   - #size-cells    : should be zero.
> > 
> > +
> > +Optional properties
> > +-------------------
> > +
> > +- flash-leds: An array of phandles, each referring to a flash LED, a
> > sub-node
> > +  of the LED driver device node.
> 
> What happens with non-LED flash controllers ?

We don't have any at the moment.

The way the bindings are currently defined (LED references are to
individual LEDs for instance) are specific to LED bindings. I'd rather not
make assumptions for e.g. Xenon flash devices. Which might never appear:
LED luminosity, efficiency and maximum current has been steadily increasing
over the past years.

-- 
Regards,

Sakari Ailus
sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
