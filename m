From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 2/5] drm: sun8i: add HDMI video support
 to A83T and H3
Date: Mon, 21 Nov 2016 11:09:38 -0600
Message-ID: <20161121170938.bmyb2f73gva7tgkj@rob-hp-laptop>
References: <cover.1479641523.git.moinejf@free.fr>
 <cea6a5397664213c6a917028ec2e429d25972490.1479641523.git.moinejf@free.fr>
Reply-To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDJIP47K7MERBWGUZTAQKGQEB5VOFGA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <cea6a5397664213c6a917028ec2e429d25972490.1479641523.git.moinejf-GANU6spQydw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Nov 20, 2016 at 10:56:23AM +0100, Jean-Francois Moine wrote:
> This patch adds a HDMI video driver to the Allwinner's SoCs A83T and H3.
> 
> Signed-off-by: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
> ---
>  .../devicetree/bindings/display/sunxi/hdmi.txt     |  53 ++
>  drivers/gpu/drm/sun8i/Kconfig                      |   7 +
>  drivers/gpu/drm/sun8i/Makefile                     |   2 +
>  drivers/gpu/drm/sun8i/de2_hdmi.c                   | 394 ++++++++++
>  drivers/gpu/drm/sun8i/de2_hdmi.h                   |  51 ++
>  drivers/gpu/drm/sun8i/de2_hdmi_io.c                | 839 +++++++++++++++++++++
>  6 files changed, 1346 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/sunxi/hdmi.txt
>  create mode 100644 drivers/gpu/drm/sun8i/de2_hdmi.c
>  create mode 100644 drivers/gpu/drm/sun8i/de2_hdmi.h
>  create mode 100644 drivers/gpu/drm/sun8i/de2_hdmi_io.c
> 
> diff --git a/Documentation/devicetree/bindings/display/sunxi/hdmi.txt b/Documentation/devicetree/bindings/display/sunxi/hdmi.txt
> new file mode 100644
> index 0000000..85709ab
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/sunxi/hdmi.txt
> @@ -0,0 +1,53 @@
> +Allwinner HDMI Transmitter
> +==========================
> +
> +The Allwinner HDMI transmitters are included in the SoCs.
> +They support audio and video.
> +
> +Required properties:
> + - #address-cells : should be <1>
> + - #size-cells : should be <0>
> + - compatible : should be one of
> +		"allwinner,sun8i-a83t-hdmi"
> +		"allwinner,sun8i-h3-hdmi"
> + - clocks : phandles to the HDMI clocks as described in
> +	Documentation/devicetree/bindings/clock/clock-bindings.txt
> + - clock-names : must be
> +		"gate" : bus gate
> +		"clock" : streaming clock
> +		"ddc-clock" : DDC clock
> + - resets : One or two phandles to the HDMI resets
> + - reset-names : when 2 phandles, must be
> +		"hdmi0" and "hdmi1"
> +
> +Required nodes:
> + - port: Audio and video input port nodes with endpoint definitions
> +	as defined in Documentation/devicetree/bindings/graph.txt.
> +	port@0 is video and port@1 is audio.

This should probably also have an output port to the hdmi-connector 
binding. It is not needed so much if this block handles DDC and HPD 
itself, but if those are a separate I2C controller and GPIO, 
respectively, then you need it for sure. There's also power on the 
connector or other connectors like muxed on Type-C. 


> +
> +Example:
> +
> +	hdmi: hdmi@01ee0000 {
> +		compatible = "allwinner,sun8i-a83t-hdmi";
> +		reg = <0x01ee0000 0x20000>;
> +		clocks = <&ccu CLK_BUS_HDMI>, <&ccu CLK_HDMI>,
> +			 <&ccu CLK_HDMI_DDC>;
> +		clock-names = "gate", "clock", "ddc-clock";
> +		resets = <&ccu RST_HDMI0>, <&ccu RST_HDMI1>;
> +		reset-names = "hdmi0", "hdmi1";
> +		...

Please show all properties in example.

> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		port@0 {			/* video */
> +			reg = <0>;
> +			hdmi_lcd1: endpoint {
> +				remote-endpoint = <&lcd1_hdmi>;
> +			};
> +		};
> +		port@1 {			/* audio */
> +			reg = <1>;
> +			hdmi_i2s2: endpoint {
> +				remote-endpoint = <&i2s2_hdmi>;
> +			};
> +		};
> +	};
