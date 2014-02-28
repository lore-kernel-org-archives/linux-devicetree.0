From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 8/9] Doc/DT: Add DT binding documentation for TFP410
	encoder
Date: Fri, 28 Feb 2014 14:37:28 +0100
Message-ID: <1393594648.3802.30.camel@paszta.hi.pengutronix.de>
References: <1393590016-9361-1-git-send-email-tomi.valkeinen@ti.com>
	<1393590016-9361-9-git-send-email-tomi.valkeinen@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1393590016-9361-9-git-send-email-tomi.valkeinen@ti.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Am Freitag, den 28.02.2014, 14:20 +0200 schrieb Tomi Valkeinen:
> Add DT binding documentation for TFP410 encoder
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Archit Taneja <archit@ti.com>
> ---
>  .../devicetree/bindings/video/ti,tfp410.txt        | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/video/ti,tfp410.txt
> 
> diff --git a/Documentation/devicetree/bindings/video/ti,tfp410.txt b/Documentation/devicetree/bindings/video/ti,tfp410.txt
> new file mode 100644
> index 000000000000..6a5a04627584
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/video/ti,tfp410.txt
> @@ -0,0 +1,41 @@
> +TFP410 DPI to DVI encoder
> +=========================
> +
> +Required properties:
> +- compatible: "ti,tfp410"
> +
> +Optional properties:
> +- gpios: power-down gpio

Maybe call this powerdown-gpios?

> +Required nodes:
> +- Video port 0 for DPI input
> +- Video port 1 for DVI output
> +
> +Example
> +-------
> +
> +tfp410: encoder@0 {
> +	compatible = "ti,tfp410";
> +	gpios = <&twl_gpio 2 GPIO_ACTIVE_LOW>;
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +
> +			tfp410_in: endpoint@0 {
> +				remote-endpoint = <&dpi_out>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			tfp410_out: endpoint@0 {
> +				remote-endpoint = <&dvi_connector_in>;
> +			};
> +		};
> +	};
> +};

regards
Philipp
