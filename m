From: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v2 2/2] media: ov9650: add device tree binding
Date: Mon, 8 Jan 2018 11:35:13 +0200
Message-ID: <20180108093513.nvr2e7vbt7imai2p@paasikivi.fi.intel.com>
References: <1515344064-23156-1-git-send-email-akinobu.mita@gmail.com>
 <1515344064-23156-3-git-send-email-akinobu.mita@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1515344064-23156-3-git-send-email-akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jacopo Mondi <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, "H . Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Akinobu,

Thanks for the update.

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
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov9650.txt b/Documentation/devicetree/bindings/media/i2c/ov9650.txt
> new file mode 100644
> index 0000000..506dfc5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ov9650.txt
> @@ -0,0 +1,36 @@
> +* Omnivision OV9650/OV9652 CMOS sensor
> +
> +Required Properties:
> +- compatible: shall be one of
> +	"ovti,ov9650"
> +	"ovti,ov9652"
> +- clocks: reference to the xvclk input clock.
> +
> +Optional Properties:
> +- reset-gpios: reference to the GPIO connected to the resetb pin, if any.
> +  Active is high.
> +- powerdown-gpios: reference to the GPIO connected to the pwdn pin, if any.
> +  Active is high.
> +
> +The device node shall contain one 'port' child node with one child 'endpoint'
> +subnode for its digital output video port, in accordance with the video
> +interface bindings defined in Documentation/devicetree/bindings/media/
> +video-interfaces.txt.
> +
> +Example:
> +
> +&i2c0 {
> +	ov9650: camera@30 {
> +		compatible = "ovti,ov9650";
> +		reg = <0x30>;
> +		reset-gpios = <&axi_gpio_0 0 GPIO_ACTIVE_HIGH>;
> +		powerdown-gpios = <&axi_gpio_0 1 GPIO_ACTIVE_HIGH>;
> +		clocks = <&xclk>;
> +
> +		port {
> +			ov9650_0: endpoint {
> +				remote-endpoint = <&vcap1_in0>;
> +			};
> +		};
> +	};
> +};

I was going to say you're missing the MAINTAINERS entry for this newly
added file but then I noticed that the entire driver is missing an entry.
Still this file should have a MAINTAINERS entry added for it independently
of that, in the same patch.

Cc Sylwester.

-- 
Kind regards,

Sakari Ailus
sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
