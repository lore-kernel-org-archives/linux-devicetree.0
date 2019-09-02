Return-Path: <robherring2@gmail.com>
Message-ID: <5d6d1b60.1c69fb81.f3a3a.1619@mx.google.com>
Date: Mon, 02 Sep 2019 14:38:40 +0100
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 01/10] media: dt-bindings: Document 'location' property
References: <20190827092339.8858-1-jacopo@jmondi.org>
 <20190827092339.8858-2-jacopo@jmondi.org>
 <20190827122126.GQ5054@pendragon.ideasonboard.com>
 <20190829124639.tzjp63tqnojnytlq@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190829124639.tzjp63tqnojnytlq@uno.localdomain>
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, tfiga@google.com, "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, Aug 29, 2019 at 02:46:40PM +0200, Jacopo Mondi wrote:
> Hi Laurent,
> 
> On Tue, Aug 27, 2019 at 03:21:26PM +0300, Laurent Pinchart wrote:
> > Hi Jacopo,
> >
> > Thank you for the patch.
> >
> > On Tue, Aug 27, 2019 at 11:23:27AM +0200, Jacopo Mondi wrote:
> > > Add the 'location' device property, used to specify the camera device
> > > mounting position. The property is particularly meaningful for mobile
> > > devices with a well defined usage orientation.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > ---
> > >  .../devicetree/bindings/media/video-interfaces.txt     | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > > index f884ada0bffc..865f4142f432 100644
> > > --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> > > +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > > @@ -89,6 +89,16 @@ Optional properties
> > >    but a number of degrees counter clockwise. Typical values are 0 and 180
> > >    (upside down).
> > >
> > > +- location: The camera sensor mounting location, expressed as a position
> > > +  relative to the usage orientation of the device the sensor is installed on.
> >
> > DT bindings being ABIs, we need to be precise and thorough there. One
> > particular point that bothers me is that the property is named location,
> > and its description refers to camera sensor mounting location.
> >
> > I see two options to fix this. One of them is to rename the property to
> > camera-location, but that would limit its future usage for other types
> > of devices. The other one is to document the property as applying to a
> > "device" instead of a "camera sensor", and add one sentence stating that
> > this property is valid for camera sensors only.
> >
> > This will require finding another name for the device that the device is
> > mounted on though, as using device twice would be very confusing.
> 
> I had the same concern, but I cannot find another term to convey
> this... suggestions?

For accelerometers and/or gyroscopes, we already have 'mount-matrix'. 
That would replace 'rotation'. Maybe we can do something similar here?

Rob
