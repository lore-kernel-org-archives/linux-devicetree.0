From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v4 01/10] media: dt-bindings: marvell,mmp2-ccic: Add
 Marvell MMP2 camera
Date: Mon, 29 Apr 2019 13:28:09 +0300
Message-ID: <20190429102809.qlwwgzgwzh4raz2q@valkosipuli.retiisi.org.uk>
References: <20190429091632.2462285-1-lkundrak@v3.sk>
 <20190429091632.2462285-2-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190429091632.2462285-2-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, James Cameron <quozl@laptop.org>, Pavel Machek <pavel@ucw.cz>, Libin Yang <lbyang@marvell.com>, Albert Wang <twang13@marvell.com>, jacopo mondi <jacopo@jmondi.org>
List-Id: devicetree@vger.kernel.org

Hi Lubomir,

On Mon, Apr 29, 2019 at 11:16:23AM +0200, Lubomir Rintel wrote:
> Add Marvell MMP2 camera host interface.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> 
> ---
> Changes since v3:
> - Dropped the video-interfaces.txt reference
> - Clarify "clocks", "clock-names" and "clock-output-names" descriptions
> - Refer to other documentation by full path
> 
> Changes since v2:
> - Added #clock-cells, clock-names, port
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
>  
> .../bindings/media/marvell,mmp2-ccic.txt      | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/marvell,mmp2-ccic.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.txt b/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.txt
> new file mode 100644
> index 000000000000..cf7767268c52
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.txt
> @@ -0,0 +1,38 @@
> +Marvell MMP2 camera host interface
> +
> +Required properties:
> + - compatible: Should be "marvell,mmp2-ccic".
> + - reg: Register base and size.
> + - interrupts: The interrupt number.
> + - #clock-cells: Nust be 0.

"Must".

> +
> +Optional properties:
> + - clocks: Reference to the input clock as specified by
> +           Documentation/devicetree/bindings/clock/clock-bindings.txt.
> + - clock-names: Names of the clocks used; "axi" for the AXI bus interface,
> +                "func" for the peripheral clock and "phy" for the parallel
> +                video bus interface.
> + - clock-output-names: Optional clock source for sensors. Shall be "mclk".
> +
> +Required subnodes:
> + - port: The parallel bus interface port with a single endpoint linked to
> +         the sensor's endpoint as described in
> +         Documentation/devicetree/bindings/media/video-interfaces.txt.

Both parallel and Bt.656 are supported. So you'll need the bus-type
property. Looking further the datasheet, you'll also need pclk-sample,
hsync-active and vsync-active properties. I'd make them mandatory for the
endpoint (the two latter are for parallel mode only).

> +
> +Example:
> +
> +	camera0: camera@d420a000 {
> +		compatible = "marvell,mmp2-ccic";
> +		reg = <0xd420a000 0x800>;
> +		interrupts = <42>;
> +		clocks = <&soc_clocks MMP2_CLK_CCIC0>;
> +		clock-names = "axi";
> +		#clock-cells = <0>;
> +		clock-output-names = "mclk";
> +
> +		port {
> +			camera0_0: endpoint {
> +				remote-endpoint = <&ov7670_0>;

Please also add the above properties here.

> +			};
> +		};
> +	};

-- 
Kind regards,

Sakari Ailus
