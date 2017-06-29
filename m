From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v6 1/3] media: adv748x: Add adv7181, adv7182 bindings
Date: Thu, 29 Jun 2017 12:48:06 +0300
Message-ID: <3545799.UU4E5S7plQ@avalon>
References: <cover.13d48bb2ba66a5e11c962c62b1a7b5832b0a2344.1498575029.git-series.kieran.bingham+renesas@ideasonboard.com> <17f2a43c3500f610f8df2548f51555eb5ae03293.1498575029.git-series.kieran.bingham+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <17f2a43c3500f610f8df2548f51555eb5ae03293.1498575029.git-series.kieran.bingham+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kieran Bingham <kbingham-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, Kieran Bingham <kieran.bingham+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Tuesday 27 Jun 2017 16:03:32 Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> 
> Create device tree bindings documentation for the ADV748x.
> The ADV748x supports both the ADV7481 and ADV7482 chips which
> provide analogue decoding and HDMI receiving capabilities
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>

With the subject fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>

> ---
> v6:
>  - Clean up description and remove redundant text regarding optional
>    nodes
> 
>  Documentation/devicetree/bindings/media/i2c/adv748x.txt | 95 ++++++++++-
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/adv748x.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/adv748x.txt
> b/Documentation/devicetree/bindings/media/i2c/adv748x.txt new file mode
> 100644
> index 000000000000..21ffb5ed8183
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/adv748x.txt
> @@ -0,0 +1,95 @@
> +* Analog Devices ADV748X video decoder with HDMI receiver
> +
> +The ADV7481 and ADV7482 are multi format video decoders with an integrated
> +HDMI receiver. They can output CSI-2 on two independent outputs TXA and TXB
> +from three input sources HDMI, analog and TTL.
> +
> +Required Properties:
> +
> +  - compatible: Must contain one of the following
> +    - "adi,adv7481" for the ADV7481
> +    - "adi,adv7482" for the ADV7482
> +
> +  - reg: I2C slave address
> +
> +Optional Properties:
> +
> +  - interrupt-names: Should specify the interrupts as "intrq1", "intrq2"
> and/or +		     "intrq3". All interrupts are optional. The 
"intrq3"
> interrupt +		     is only available on the adv7481
> +  - interrupts: Specify the interrupt lines for the ADV748x
> +
> +The device node must contain one 'port' child node per device input and
> output +port, in accordance with the video interface bindings defined in
> +Documentation/devicetree/bindings/media/video-interfaces.txt. The port
> nodes +are numbered as follows.
> +
> +	  Name		Type		Port
> +	---------------------------------------
> +	  AIN0		sink		0
> +	  AIN1		sink		1
> +	  AIN2		sink		2
> +	  AIN3		sink		3
> +	  AIN4		sink		4
> +	  AIN5		sink		5
> +	  AIN6		sink		6
> +	  AIN7		sink		7
> +	  HDMI		sink		8
> +	  TTL		sink		9
> +	  TXA		source		10
> +	  TXB		source		11
> +
> +The digital output port nodes must contain at least one endpoint.
> +
> +Ports are optional if they are not connected to anything at the hardware
> level. +
> +Example:
> +
> +	video-receiver@70 {
> +		compatible = "adi,adv7482";
> +		reg = <0x70>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		interrupt-parent = <&gpio6>;
> +		interrupt-names = "intrq1", "intrq2";
> +		interrupts = <30 IRQ_TYPE_LEVEL_LOW>,
> +			     <31 IRQ_TYPE_LEVEL_LOW>;
> +
> +		port@7 {
> +			reg = <7>;
> +
> +			adv7482_ain7: endpoint {
> +				remote-endpoint = <&cvbs_in>;
> +			};
> +		};
> +
> +		port@8 {
> +			reg = <8>;
> +
> +			adv7482_hdmi: endpoint {
> +				remote-endpoint = <&hdmi_in>;
> +			};
> +		};
> +
> +		port@10 {
> +			reg = <10>;
> +
> +			adv7482_txa: endpoint {
> +				clock-lanes = <0>;
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = <&csi40_in>;
> +			};
> +		};
> +
> +		port@11 {
> +			reg = <11>;
> +
> +			adv7482_txb: endpoint {
> +				clock-lanes = <0>;
> +				data-lanes = <1>;
> +				remote-endpoint = <&csi20_in>;
> +			};
> +		};
> +	};

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
