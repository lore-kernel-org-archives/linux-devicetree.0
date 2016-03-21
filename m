From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/4 v3] drm: Add DT bindings documentation for ARC PGU
 display controller
Date: Mon, 21 Mar 2016 08:04:19 -0500
Message-ID: <20160321130419.GA23913@rob-hp-laptop>
References: <1457710959-9562-1-git-send-email-abrodkin@synopsys.com>
 <1457710959-9562-3-git-send-email-abrodkin@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1457710959-9562-3-git-send-email-abrodkin@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 11, 2016 at 06:42:37PM +0300, Alexey Brodkin wrote:
> This add DT bindings documentation for ARC PGU display controller.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> Cc: Kumar Gala <galak@codeaurora.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: dri-devel@lists.freedesktop.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-snps-arc@lists.infradead.org
> ---
> 
> Changes v2 -> v3:
>  * Reverted back to initial larger version of example
>    with minor fixes (thanks Rob for spotting those).
> 
> Changes v1 -> v2:
>  * Removed everything except PGU node itself.
> 
>  .../devicetree/bindings/display/snps,arcpgu.txt    | 72 ++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/snps,arcpgu.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/snps,arcpgu.txt b/Documentation/devicetree/bindings/display/snps,arcpgu.txt
> new file mode 100644
> index 0000000..b130924
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/snps,arcpgu.txt
> @@ -0,0 +1,72 @@
> +ARC PGU
> +
> +This is a display controller found on several development boards produced
> +by Synopsys. The ARC PGU is an RGB streamer that reads the data from a
> +framebuffer and sends it to a single digital encoder (usually HDMI).
> +
> +Required properties:
> +  - compatible: "snps,arcpgu"
> +  - reg: Physical base address and length of the controller's registers.
> +  - clocks: A list of phandle + clock-specifier pairs, one for each
> +    entry in 'clock-names'.
> +  - clock-names: A list of clock names. For ARC PGU it should contain:
> +      - "pxlclk" for the clock feeding the output PLL of the controller.
> +  - encoder-slave: Phandle of encoder chip.

Drop this as discussed.

> +
> +Required sub-nodes:
> +  - port: The PGU connection to an encoder chip.
> +
> +Example:
> +
> +/ {
> +	...
> +
> +	pgu@XXXXXXXX {
> +		compatible = "snps,arcpgu";
> +		reg = <0xXXXXXXXX 0x400>;
> +		clocks = <&clock_node>;
> +		clock-names = "pxlclk";
> +		encoder-slave = <&encoder_node>;
> +
> +		port {
> +			pgu_output: endpoint {
> +				remote-endpoint = <&hdmi_enc_input>;
> +			};
> +		};
> +	};
> +
> +	/* HDMI encoder on I2C bus */
> +	i2c@XXXXXXXX {
> +		compatible = "...";
> +
> +		encoder_node:encoder_node@0xXX{

Don't use underscores in node names. Just "hdmi@xx"

> +			compatible="...";
> +
> +			ports {
> +				port@0 {
> +					reg = <0>;
> +					hdmi_enc_input:endpoint {
> +						remote-endpoint = <&pgu_output>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					hdmi_enc_output:endpoint {
> +						remote-endpoint = <&hdmi_connector_in>;
> +					};
> +				};
> +			};
> +		};
> +	}
> +
> +	hdmi0: connector {
> +		compatible = "hdmi-connector";
> +
> +		port {
> +			hdmi_connector_in: endpoint {
> +				remote-endpoint = <&hdmi_enc_output>;
> +			};
> +		};
> +	};
> +};
> -- 
> 2.5.0
> 
