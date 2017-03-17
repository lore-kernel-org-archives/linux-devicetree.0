From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: Add INNOLUX P079ZCA panel bindings
Date: Thu, 16 Mar 2017 17:32:08 -0700
Message-ID: <20170317003205.GA8180@google.com>
References: <1489562353-10313-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1489562353-10313-1-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 15, 2017 at 03:19:12PM +0800, Chris Zhong wrote:
> The Innolux P079ZCA is a 7.85" panel with a 768X1024 resolution and
> connected to DSI using four lanes.
> 
> Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> 
> Changes in v2: None

You added documentation for the 'reg' property :)

Looks OK to me.

Reviewed-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

> 
>  .../bindings/display/panel/innolux,p079zca.txt     | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt b/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt
> new file mode 100644
> index 0000000..5c70a83
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt
> @@ -0,0 +1,23 @@
> +Innolux P079ZCA 7.85" 768x1024 TFT LCD panel
> +
> +Required properties:
> +- compatible: should be "innolux,p079zca"
> +- reg: DSI virtual channel of the peripheral
> +- power-supply: phandle of the regulator that provides the supply voltage
> +- enable-gpios: panel enable gpio
> +
> +Optional properties:
> +- backlight: phandle of the backlight device attached to the panel
> +
> +Example:
> +
> +	&mipi_dsi {
> +		panel {
> +			compatible = "innolux,p079zca";
> +			reg = <0>;
> +			power-supply = <...>;
> +			backlight = <&backlight>;
> +			enable-gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
> +			status = "okay";
> +		};
> +	};
> -- 
> 2.6.3
