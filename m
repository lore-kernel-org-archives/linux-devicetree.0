From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 1/2] media:imx274 device tree binding file
Date: Sun, 24 Sep 2017 14:39:49 -0500
Message-ID: <20170924193949.el6gtsbxx5c3gd3v@rob-hp-laptop>
References: <20170924075329.9927-1-leonl@leopardimaging.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170924075329.9927-1-leonl-+iDsysdzPxZTt5vwKEO50dBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leon Luo <leonl-+iDsysdzPxZTt5vwKEO50dBPR1lH4CV8@public.gmane.org>
Cc: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Sep 24, 2017 at 12:53:28AM -0700, Leon Luo wrote:
> The binding file for imx274 CMOS sensor V4l2 driver
> 
> Signed-off-by: Leon Luo <leonl-+iDsysdzPxZTt5vwKEO50dBPR1lH4CV8@public.gmane.org>
> ---
> v6:
>  - no changes
> v5:
>  - add 'port' and 'endpoint' information
> v4:
>  - no changes
> v3:
>  - remove redundant properties and references
>  - document 'reg' property
> v2:
>  - no changes
> ---
>  .../devicetree/bindings/media/i2c/imx274.txt       | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx274.txt

Please add acks when posting new versions.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
