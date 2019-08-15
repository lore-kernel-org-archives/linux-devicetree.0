From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [RFC 1/5] media: dt-bindings: Document 'location' property
Date: Thu, 15 Aug 2019 09:56:35 +0300
Message-ID: <20190815065635.GJ6133@paasikivi.fi.intel.com>
References: <20190814202815.32491-1-jacopo@jmondi.org>
 <20190814202815.32491-2-jacopo@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190814202815.32491-2-jacopo@jmondi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Jacopo,

On Wed, Aug 14, 2019 at 10:28:11PM +0200, Jacopo Mondi wrote:
> Add the 'location' device property, used to specify the camera device
> mounting position. The property is particularly meaningful for mobile
> devices with a well defined usage orientation.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  Documentation/devicetree/bindings/media/video-interfaces.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> index f884ada0bffc..819077b2649c 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> @@ -89,6 +89,10 @@ Optional properties
>    but a number of degrees counter clockwise. Typical values are 0 and 180
>    (upside down).
> 
> +- location: The camera device mounting position, relative to the device
> +  usage orientation. Possible values are:
> +  0 - Front camera. The image sensor is mounted on the front side of the device.
> +  1 - Back camera. The image sensor is mounted on the back side of the device.

Would it make sense to make this a little more generic? Such as s/image
sensor/ device/, for instance?

Is this also relevant for flash or lens devices?

Flash (torch) devices could be present, at least principle, without a
camera. There once was even such a Nokia phone, 1100 unless I'm mistaken.
:-)

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
