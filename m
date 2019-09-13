Return-Path: <SRS0=IrBn=XI=xs4all.nl=hverkuil-cisco@kernel.org>
Subject: Re: [PATCH v3 03/11] dt-bindings: video-interfaces: Expand rotation
 description
References: <20190912201055.13964-1-jacopo@jmondi.org>
 <20190912201055.13964-4-jacopo@jmondi.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <b69060da-9f14-c0d1-0fc1-a930d9f0c82f@xs4all.nl>
Date: Fri, 13 Sep 2019 15:50:27 +0200
MIME-Version: 1.0
In-Reply-To: <20190912201055.13964-4-jacopo@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Jacopo Mondi <jacopo@jmondi.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, tfiga@google.com, pavel@ucw.cz, Rob Herring <robh+dt@kernel.org>
Cc: "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 9/12/19 10:10 PM, Jacopo Mondi wrote:
> Expand the 'rotation' property description to define the direction and
> orientation of the axis around which the device mounting rotation is
> expressed.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../devicetree/bindings/media/video-interfaces.txt        | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> index e71b90a29d7a..8ab51e0bb63e 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> @@ -85,9 +85,11 @@ Optional properties
> 
>  - lens-focus: A phandle to the node of the focus lens controller.
> 
> -- rotation: The device, typically an image sensor, is not mounted upright,
> -  but a number of degrees counter clockwise. Typical values are 0 and 180
> -  (upside down).
> +- rotation: The device, typically an image sensor, mounting rotation expressed
> +  as counterclockwise rotation degrees along the axis perpendicular to
> +  the device mounting surface directed away from it. Typical values are
> +  0 degrees for upright mounted devices and 180 degrees for devices mounted
> +  upside down.

Same as with patch 1/11:

"The mount rotation of the device (typically an image sensor) expressed..."

Regards,

	Hans

> 
>  - location: The device, typically an image sensor or a flash LED, mounting
>    location expressed as a position relative to the usage orientation of the
> --
> 2.23.0
> 
