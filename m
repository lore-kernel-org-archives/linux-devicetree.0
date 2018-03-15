From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH v5 1/3] dt-bindings: display: bridge: Document
 THC63LVD1024 LVDS decoder
Date: Fri, 16 Mar 2018 00:43:34 +0100
Message-ID: <20180315234334.GA3432@bigcity.dyn.berto.se>
References: <1521130316-1221-1-git-send-email-jacopo+renesas@jmondi.org>
 <1521130316-1221-2-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1521130316-1221-2-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: architt@codeaurora.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, airlied@linux.ie, horms@verge.net.au, magnus.damm@gmail.com, geert@linux-m68k.org, sergei.shtylyov@cogentembedded.com, robh+dt@kernel.org, mark.rutland@arm.com, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Jacopo,

Thanks for your patch,

On 2018-03-15 17:11:54 +0100, Jacopo Mondi wrote:
> Document Thine THC63LVD1024 LVDS decoder device tree bindings.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  .../bindings/display/bridge/thine,thc63lvd1024.txt | 66 ++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> new file mode 100644
> index 0000000..8225c6a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> @@ -0,0 +1,66 @@
> +Thine Electronics THC63LVD1024 LVDS decoder
> +-------------------------------------------
> +
> +The THC63LVD1024 is a dual link LVDS receiver designed to convert LVDS streams
> +to parallel data outputs. The chip supports single/dual input/output modes,
> +handling up to two two input LVDS stream and up to two digital CMOS/TTL outputs.
> +
> +Single or dual operation modes, output data mapping and DDR output modes are
> +configured through input signals and the chip does not expose any control bus.
> +
> +Required properties:
> +- compatible: Shall be "thine,thc63lvd1024"
> +
> +Optional properties:
> +- vcc-supply: Power supply for TTL output and digital circuitry
> +- cvcc-supply: Power supply for TTL CLOCKOUT signal
> +- lvcc-supply: Power supply for LVDS inputs
> +- pvcc-supply: Power supply for PLL circuitry
> +- pdwn-gpios: Power down GPIO signal. Active low
> +- oe-gpios: Output enable GPIO signal. Active high
> +
> +The THC63LVD1024 video port connections are modeled according
> +to OF graph bindings specified by Documentation/devicetree/bindings/graph.txt
> +
> +Required video port nodes:
> +- Port@0: First LVDS input port
> +- Port@2: First digital CMOS/TTL parallel output
> +
> +Optional video port nodes:
> +- Port@1: Second LVDS input port
> +- Port@3: Second digital CMOS/TTL parallel output
> +
> +Example:
> +--------
> +
> +	thc63lvd1024: lvds-decoder {
> +		compatible = "thine,thc63lvd1024";
> +
> +		vcc-supply = <&reg_lvds_vcc>;
> +		lvcc-supply = <&reg_lvds_lvcc>;
> +
> +		pdwn-gpio = <&gpio4 15 GPIO_ACTIVE_LOW>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				lvds_dec_in_0: endpoint {
> +					remote-endpoint = <&lvds_out>;
> +				};
> +			};
> +
> +			port@2{
> +				reg = <2>;
> +
> +				lvds_dec_out_2: endpoint {
> +					remote-endpoint = <&adv7511_in>;
> +				};
> +
> +			};
> +
> +		};
> +	};
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas Söderlund
