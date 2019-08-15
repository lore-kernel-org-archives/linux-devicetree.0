From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC 1/5] media: dt-bindings: Document 'location' property
Date: Thu, 15 Aug 2019 15:58:31 +0300
Message-ID: <20190815125831.GH13823@pendragon.ideasonboard.com>
References: <20190814202815.32491-1-jacopo@jmondi.org>
 <20190814202815.32491-2-jacopo@jmondi.org>
 <20190815065635.GJ6133@paasikivi.fi.intel.com>
 <20190815125548.kh2pdxzysafltswc@uno.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190815125548.kh2pdxzysafltswc@uno.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh+dt@kernel.org>, "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 15, 2019 at 02:55:48PM +0200, Jacopo Mondi wrote:
> On Thu, Aug 15, 2019 at 09:56:35AM +0300, Sakari Ailus wrote:
> > On Wed, Aug 14, 2019 at 10:28:11PM +0200, Jacopo Mondi wrote:
> > > Add the 'location' device property, used to specify the camera device
> > > mounting position. The property is particularly meaningful for mobile
> > > devices with a well defined usage orientation.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > ---
> > >  Documentation/devicetree/bindings/media/video-interfaces.txt | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > > index f884ada0bffc..819077b2649c 100644
> > > --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> > > +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > > @@ -89,6 +89,10 @@ Optional properties
> > >    but a number of degrees counter clockwise. Typical values are 0 and 180
> > >    (upside down).
> > >
> > > +- location: The camera device mounting position, relative to the device
> > > +  usage orientation. Possible values are:
> > > +  0 - Front camera. The image sensor is mounted on the front side of the device.
> > > +  1 - Back camera. The image sensor is mounted on the back side of the device.
> >
> > Would it make sense to make this a little more generic? Such as s/image
> > sensor/ device/, for instance?
> 
> Laurent seems to be of the opposite opinion, but i think staying as
> generic as possible might be a good idea. Now I have a linguistic
> problem though.
> 
>  +- location: The device mounting position, relative to the device
>  +  usage orientation. Possible values are:
>  +  0 - Front. The device is mounted on the front side of the device.
>  +  1 - Back. The device is mounted on the back side of the device.
> 
> So I need one "device" to indicate the lens/flash/image sensor and one
> to indicate the device they're installed on :) Any idea?
> 
> >
> > Is this also relevant for flash or lens devices?
> >
> > Flash (torch) devices could be present, at least principle, without a
> > camera. There once was even such a Nokia phone, 1100 unless I'm mistaken.
> > :-)
> 
> Not to mention that lenses are indeed installed in the same package as
> the camera sensor, but they're described as separate device nodes as
> flash leds are, so the mounting location might need to be specified in their
> device node properties too, even if it would be the same as the image
> sensor one.

For the lens I really don't think we need it. For the flash, I envision
it will be useful to know more about its physical location relative to
the camera sensor, but that will be a displacement, not a front/back
location as the flash should really be on the same side as the camera
sensor :-) Note that, technically speaking, it will not be the location
of the flash controller itself, but of its LED (or other light source).
A flash controller could possibly control multiple LEDs, for different
sensors, and possibly on different sides of the devices, so we may need
to create subnodes for light sources in the flash controller DT node.

-- 
Regards,

Laurent Pinchart
