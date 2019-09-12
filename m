Return-Path: <mchehab@kernel.org>
Date: Thu, 12 Sep 2019 09:51:47 -0300
From: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 01/10] media: dt-bindings: Document 'location'
 property
Message-ID: <20190912095120.4a592631@coco.lan>
In-Reply-To: <20190827122126.GQ5054@pendragon.ideasonboard.com>
References: <20190827092339.8858-1-jacopo@jmondi.org>
	<20190827092339.8858-2-jacopo@jmondi.org>
	<20190827122126.GQ5054@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo@jmondi.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, tfiga@google.com, Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Em Tue, 27 Aug 2019 15:21:26 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hi Jacopo,
> 
> Thank you for the patch.
> 
> On Tue, Aug 27, 2019 at 11:23:27AM +0200, Jacopo Mondi wrote:
> > Add the 'location' device property, used to specify the camera device
> > mounting position. The property is particularly meaningful for mobile
> > devices with a well defined usage orientation.
> > 
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  .../devicetree/bindings/media/video-interfaces.txt     | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > index f884ada0bffc..865f4142f432 100644
> > --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> > +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > @@ -89,6 +89,16 @@ Optional properties
> >    but a number of degrees counter clockwise. Typical values are 0 and 180
> >    (upside down).
> > 
> > +- location: The camera sensor mounting location, expressed as a position
> > +  relative to the usage orientation of the device the sensor is installed on.  
> 
> DT bindings being ABIs, we need to be precise and thorough there. One
> particular point that bothers me is that the property is named location,
> and its description refers to camera sensor mounting location.

Yeah, "location" doesn't sound a good name for me neither.
 
> 
> I see two options to fix this. One of them is to rename the property to
> camera-location, but that would limit its future usage for other types
> of devices. The other one is to document the property as applying to a
> "device" instead of a "camera sensor", and add one sentence stating that
> this property is valid for camera sensors only.
> 
> This will require finding another name for the device that the device is
> mounted on though, as using device twice would be very confusing.
> 
> > +  Possible values are:
> > +  0 - Front. The image sensor is mounted on the front facing side of the device.
> > +  For mobile devices such as smartphones, tablets and laptops the front side is
> > +  the user facing side of the device.
> > +  1 - Back. The image sensor is mounted on the back side of the device, which is
> > +  defined as the opposite side of the front facing one.
> > +  2 - External. The image sensor is connected to the device by extension cables,
> > +  and can be freely moved, regardless of the device position. 

Hmm...

Besides the point that Laurent and Rob already commented, just those 3 options 
doesn't seem good enough. I was reading a public article yesterday about a new
device (Samsung Galaxy Fold[1]) with comes with 6 cameras, being 3 at back, 
1 at front, when the device is opened, and 1 camera that could be either at the
back or at the front, depending if the device is opened or not. 

Btw, on a device with multiple cameras at the same side, it would
make sense to also be able to uniquely identify the location of each
sensor somehow.

There are also some other new devices with a front motorized slider camera
that sits hidden inside the phone, until when someone uses it.

Thanks,
Mauro
