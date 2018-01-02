From: jacopo mondi <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/4] [media] dt/bindings: Add bindings for OV5695
Date: Tue, 2 Jan 2018 10:19:10 +0100
Message-ID: <20180102091910.GD4314@w540>
References: <1514534905-21393-1-git-send-email-zhengsq@rock-chips.com>
 <1514534905-21393-2-git-send-email-zhengsq@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1514534905-21393-2-git-send-email-zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shunqian Zheng <zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ddl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Shunqian,

On Fri, Dec 29, 2017 at 04:08:23PM +0800, Shunqian Zheng wrote:
> Add device tree binding documentation for the OV5695 sensor.
>
> Signed-off-by: Shunqian Zheng <zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
>  .../devicetree/bindings/media/i2c/ov5695.txt       | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5695.txt
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5695.txt b/Documentation/devicetree/bindings/media/i2c/ov5695.txt
> new file mode 100644
> index 0000000..8d87dbc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ov5695.txt
> @@ -0,0 +1,38 @@
> +* Omnivision OV5695 MIPI CSI-2 sensor
> +
> +Required Properties:
> +- compatible: should be "ovti,ov5695"
> +- clocks: reference to the 24M xvclk input clock.
> +- clock-names: should be "xvclk".
> +- dovdd-supply: Digital I/O voltage supply, 1.8 volts
> +- avdd-supply: Analog voltage supply, 2.8 volts
> +- dvdd-supply: Digital core voltage supply, 1.2 volts
> +- reset-gpios: Low active reset gpio
> +
> +The device node must contain one 'port' child node for its digital output
> +video port, in accordance with the video interface bindings defined in
> +Documentation/devicetree/bindings/media/video-interfaces.txt.
> +
> +Example:
> +&i2c1: camera-sensor@36 {

I think what Rob asked for in his v1 review was to have a
"camera-sensor" node which is a child of the "i2c1" interface node.

I would expect something like:

&i2c1 {
        pinctrl-names ...
        pinctrl-0...

        camera-sensor@36 {

                compatible = "ovti,ov5695";
                ...
        };
};

Thanks
   j
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
