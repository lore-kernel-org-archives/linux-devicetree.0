From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RFC 1/2] Dcumentation: bridge: Add documentation for ps8640 DT
 properties
Date: Fri, 16 Oct 2015 14:04:47 +0100
Message-ID: <20151016130447.GD2054@leverpostej>
References: <1444997709-57293-1-git-send-email-ck.hu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1444997709-57293-1-git-send-email-ck.hu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>, Thierry Reding <treding@nvidia.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, Inki Dae <inki.dae@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>, Sean Paul <seanpaul@chromium.org>, Vincent Palatin <vpalatin@chromium.org>, Andy Yan <andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, Russell King <rmk+kernel@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, yingjoe.chen@mediatek.com, eddie.huang
List-Id: devicetree@vger.kernel.org

On Fri, Oct 16, 2015 at 08:15:08PM +0800, CK Hu wrote:
> From: Jitao Shi <jitao.shi@mediatek.com>
> 
> Add documentation for DT properties supported by ps8640
> DSI-eDP converter.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../devicetree/bindings/video/bridge/ps8640.txt    |   48 ++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/video/bridge/ps8640.txt
> 
> diff --git a/Documentation/devicetree/bindings/video/bridge/ps8640.txt b/Documentation/devicetree/bindings/video/bridge/ps8640.txt
> new file mode 100644
> index 0000000..450b5df
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/video/bridge/ps8640.txt
> @@ -0,0 +1,48 @@
> +ps8640-bridge bindings
> +
> +Required properties:
> +	- compatible: "parade,ps8640"
> +	- reg: first i2c address of the bridge

Ther can be multiple addresses?

> +	- power-gpios: OF device-tree gpio specification for power pin.
> +	- reset-gpios: OF device-tree gpio specification for reset pin.
> +	- mode-sel-gpios: OF device-tree gpio specification for mode-sel pin.
> +	- ps8640-1v2-supply: OF device-tree regulator specification for 1v2.
> +	- ps8640-3v3-supply: OF device-tree regulator specification for 3v3.

There's no need for the "ps8640-" prefix on these two. Please drop it.

> +Optional properties:
> +	- video interfaces: Device node can contain video interface port
> +			    nodes for panel according to [1].

Replace this part with:

The device node can contain video interface port nodes per the
video-interfaces binding [1].

Thanks,
Mark.

> +
> +[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +Example:
> +	edp-bridge@18 {
> +		compatible = "parade,ps8640";
> +		reg = <0x18>;
> +		power-gpios = <&pio 116 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&pio 115 GPIO_ACTIVE_HIGH>;
> +		mode-sel-gpios = <&pio 92 GPIO_ACTIVE_HIGH>;
> +		ps8640-1v2-supply = <&ps8640_fixed_1v2>;
> +		ps8640-3v3-supply = <&mt6397_vgp2_reg>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				ps8640_in: endpoint {
> +					remote-endpoint = <&dsi0_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				ps8640_out: endpoint {
> +					remote-endpoint = <&panel_in>;
> +				};
> +			};
> +		};
> +	};
> -- 
> 1.7.9.5
> 
