From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] media: ov9650: add device tree binding
Date: Thu, 11 Jan 2018 14:40:22 -0600
Message-ID: <20180111204022.rhcttpptc4id6fk6@rob-hp-laptop>
References: <1515344064-23156-1-git-send-email-akinobu.mita@gmail.com>
 <1515344064-23156-3-git-send-email-akinobu.mita@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1515344064-23156-3-git-send-email-akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jacopo Mondi <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, "H . Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 08, 2018 at 01:54:24AM +0900, Akinobu Mita wrote:
> Now the ov9650 driver supports device tree probing.  So this adds a
> device tree binding documentation.
> 
> Cc: Jacopo Mondi <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
> Cc: H. Nikolaus Schaller <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
> Cc: Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>
> Cc: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Cc: Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>
> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> * Changelog v2
> - Split binding documentation, suggested by Rob Herring and Jacopo Mondi
> - Improve the wording for compatible property in the binding documentation,
>   suggested by Jacopo Mondi
> - Improve the description for the device node in the binding documentation,
>   suggested by Sakari Ailus
> 
>  .../devicetree/bindings/media/i2c/ov9650.txt       | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov9650.txt

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
