From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/2] media:imx274 device tree binding file
Date: Tue, 12 Sep 2017 11:42:08 -0500
Message-ID: <20170912164208.gdsyrmovf337wc66@rob-hp-laptop>
References: <20170901203243.25694-1-leonl@leopardimaging.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170901203243.25694-1-leonl-+iDsysdzPxZTt5vwKEO50dBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leon Luo <leonl-+iDsysdzPxZTt5vwKEO50dBPR1lH4CV8@public.gmane.org>
Cc: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 01, 2017 at 01:32:42PM -0700, Leon Luo wrote:
> The binding file for imx274 CMOS sensor V4l2 driver
> 
> Signed-off-by: Leon Luo <leonl-+iDsysdzPxZTt5vwKEO50dBPR1lH4CV8@public.gmane.org>
> ---
> v4:
>  - no changes
> v3:
>  - remove redundant properties and references
>  - document 'reg' property
> v2:
>  - no changes
> ---
>  .../devicetree/bindings/media/i2c/imx274.txt       | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx274.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/imx274.txt b/Documentation/devicetree/bindings/media/i2c/imx274.txt
> new file mode 100644
> index 000000000000..1f03256b35db
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/imx274.txt
> @@ -0,0 +1,32 @@
> +* Sony 1/2.5-Inch 8.51Mp CMOS Digital Image Sensor
> +
> +The Sony imx274 is a 1/2.5-inch CMOS active pixel digital image sensor with
> +an active array size of 3864H x 2202V. It is programmable through I2C
> +interface. The I2C address is fixed to 0x1a as per sensor data sheet.
> +Image data is sent through MIPI CSI-2, which is configured as 4 lanes
> +at 1440 Mbps.
> +
> +
> +Required Properties:
> +- compatible: value should be "sony,imx274" for imx274 sensor
> +- reg: I2C bus address of the device
> +
> +Optional Properties:
> +- reset-gpios: Sensor reset GPIO
> +
> +For further reading on port node refer to
> +Documentation/devicetree/bindings/media/video-interfaces.txt.

You need to specify here exactly how many ports and endpoints for each 
port. With that,

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
