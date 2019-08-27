Return-Path: <SRS0=V9zI=WX=ideasonboard.com=laurent.pinchart@kernel.org>
Date: Tue, 27 Aug 2019 15:21:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 01/10] media: dt-bindings: Document 'location' property
Message-ID: <20190827122126.GQ5054@pendragon.ideasonboard.com>
References: <20190827092339.8858-1-jacopo@jmondi.org>
 <20190827092339.8858-2-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190827092339.8858-2-jacopo@jmondi.org>
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, tfiga@google.com, Rob Herring <robh+dt@kernel.org>, "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Jacopo,

Thank you for the patch.

On Tue, Aug 27, 2019 at 11:23:27AM +0200, Jacopo Mondi wrote:
> Add the 'location' device property, used to specify the camera device
> mounting position. The property is particularly meaningful for mobile
> devices with a well defined usage orientation.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../devicetree/bindings/media/video-interfaces.txt     | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> index f884ada0bffc..865f4142f432 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> @@ -89,6 +89,16 @@ Optional properties
>    but a number of degrees counter clockwise. Typical values are 0 and 180
>    (upside down).
> 
> +- location: The camera sensor mounting location, expressed as a position
> +  relative to the usage orientation of the device the sensor is installed on.

DT bindings being ABIs, we need to be precise and thorough there. One
particular point that bothers me is that the property is named location,
and its description refers to camera sensor mounting location. 

I see two options to fix this. One of them is to rename the property to
camera-location, but that would limit its future usage for other types
of devices. The other one is to document the property as applying to a
"device" instead of a "camera sensor", and add one sentence stating that
this property is valid for camera sensors only.

This will require finding another name for the device that the device is
mounted on though, as using device twice would be very confusing.

> +  Possible values are:
> +  0 - Front. The image sensor is mounted on the front facing side of the device.
> +  For mobile devices such as smartphones, tablets and laptops the front side is
> +  the user facing side of the device.
> +  1 - Back. The image sensor is mounted on the back side of the device, which is
> +  defined as the opposite side of the front facing one.
> +  2 - External. The image sensor is connected to the device by extension cables,
> +  and can be freely moved, regardless of the device position.

It could be something else than cables (wireless possibly ?). I would
phrase this along the lines of "The device is not attached directly to
the [device], or is attached in a way that allows it to move to
different locations."

> 
>  Optional endpoint properties
>  ----------------------------

-- 
Regards,

Laurent Pinchart
