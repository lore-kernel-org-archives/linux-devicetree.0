From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/4] [media] dt/bindings: Add bindings for OV2685
Date: Tue, 26 Dec 2017 17:28:55 -0600
Message-ID: <20171226232855.egppgy22ywketxi6@rob-hp-laptop>
References: <1514211086-13440-1-git-send-email-zhengsq@rock-chips.com>
 <1514211086-13440-4-git-send-email-zhengsq@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1514211086-13440-4-git-send-email-zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shunqian Zheng <zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ddl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 25, 2017 at 10:11:26PM +0800, Shunqian Zheng wrote:
> Add device tree binding documentation for the OV2685 sensor.
> 
> Signed-off-by: Shunqian Zheng <zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
>  .../devicetree/bindings/media/i2c/ov2685.txt       | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov2685.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov2685.txt b/Documentation/devicetree/bindings/media/i2c/ov2685.txt
> new file mode 100644
> index 0000000..c62db9c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ov2685.txt
> @@ -0,0 +1,35 @@
> +* Omnivision OV2685 MIPI CSI-2 sensor
> +
> +Required Properties:
> +- compatible: should be "ovti,ov2685"
> +- clocks: reference to the 24M xvclk input clock.
> +- clock-names: should be "xvclk".
> +- avdd-supply: Analog voltage supply, 2.8 volts
> +- dvdd-supply: Digital core voltage supply, 1.2 volts
> +- reset-gpios: Low active reset gpio
> +
> +The device node must contain one 'port' child node for its digital output
> +video port, in accordance with the video interface bindings defined in
> +Documentation/devicetree/bindings/media/video-interfaces.txt.
> +
> +Example:
> +	ucam: ov2680@3c {

camera-sensor@3c

> +		compatible = "ovti,ov2685";
> +		reg = <0x3c>;

> +		pinctrl-names = "default";
> +		pinctrl-0 = <&clk_24m_cam &ucam_rst>;

Not documented.

> +
> +		clocks = <&cru SCLK_TESTCLKOUT1>;
> +		clock-names = "xvclk";
> +
> +		avdd-supply = <&pp2800_cam>;
> +		dovdd-supply = <&pp1800>;
> +		reset-gpios = <&gpio2 3 GPIO_ACTIVE_LOW>;
> +
> +		port {
> +			ucam_out: endpoint {
> +				remote-endpoint = <&mipi_in_ucam>;
> +				data-lanes = <1>;
> +			};
> +		};
> +	};
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
