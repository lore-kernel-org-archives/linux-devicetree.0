From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 1/2] media: ov7740: Document device tree bindings
Date: Mon, 4 Dec 2017 14:24:43 -0600
Message-ID: <20171204202443.jiizsqu6yfpsugj4@rob-hp-laptop>
References: <20171204065858.3138-1-wenyou.yang@microchip.com>
 <20171204065858.3138-2-wenyou.yang@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171204065858.3138-2-wenyou.yang-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wenyou Yang <wenyou.yang-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 04, 2017 at 02:58:57PM +0800, Wenyou Yang wrote:
> Add the device tree binding documentation for the ov7740 sensor driver.
> 
> Signed-off-by: Wenyou Yang <wenyou.yang-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> ---
> 
> Changes in v6: None
> Changes in v5: None
> Changes in v4: None
> Changes in v3:
>  - Explicitly document the "remote-endpoint" property.
> 
> Changes in v2: None
> 
>  .../devicetree/bindings/media/i2c/ov7740.txt       | 47 ++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov7740.txt

Please add acks when posting new versions.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
