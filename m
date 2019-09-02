From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC 1/5] media: dt-bindings: Document 'location' property
Date: Mon, 2 Sep 2019 11:02:11 +0300
Message-ID: <20190902080211.GD4777@pendragon.ideasonboard.com>
References: <20190814202815.32491-1-jacopo@jmondi.org>
 <20190814202815.32491-2-jacopo@jmondi.org>
 <20190815065635.GJ6133@paasikivi.fi.intel.com>
 <20190901172414.GB1047@bug>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190901172414.GB1047@bug>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Jacopo Mondi <jacopo@jmondi.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh+dt@kernel.org>, "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Pavel,

On Sun, Sep 01, 2019 at 07:24:15PM +0200, Pavel Machek wrote:
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
> > 
> > Is this also relevant for flash or lens devices?
> > 
> > Flash (torch) devices could be present, at least principle, without a
> > camera. There once was even such a Nokia phone, 1100 unless I'm mistaken.
> > :-)
> 
> Well, I'd call them LEDs, not camera flashes ... if there's no camera. And IIRC 
> these devices had LEDs on top of the phone... so neither front nor back side.

I would go for the name "torch" in that case. It really depends on the
device, but in any case, the torch LEDs would have a location (and we
would possibly need to expand this property to
include the top, bottom, left and right sides).

-- 
Regards,

Laurent Pinchart
