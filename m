From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V4] dts/imx6q-b850v3: Use megachips-stdpxxxx-ge-b850v3-fw
 bridges (LVDS-DP++)
Date: Thu, 16 Mar 2017 10:34:59 +0800
Message-ID: <20170316023457.GU3618@dragon>
References: <20170314092302.7317-1-peter.senna@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170314092302.7317-1-peter.senna@collabora.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter Senna Tschudin <peter.senna@collabora.com>
Cc: mark.rutland@arm.com, heiko@sntech.de, airlied@linux.ie, daniel.vetter@ffwll.ch, peter.senna@gmail.com, dri-devel@lists.freedesktop.org, tiwai@suse.com, thierry.reding@gmail.com, laurent.pinchart@ideasonboard.com, jslaby@suse.cz, martyn.welch@collabora.co.uk, Rob Herring <robh@kernel.org>, architt@codeaurora.org, mchehab@osg.samsung.com, linux@armlinux.org.uk, javier@dowhile0.org, treding@nvidia.com, linux@roeck-us.net, martin.donnelly@ge.com, devicetree@vger.kernel.org, p.zabel@pengutronix.de, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, eballetbo@gmail.com, Fabio Estevam <fabio.estevam@nxp.com>, rmk+kernel@armlinux.org.uk, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, kernel@pengutronix.de, galak@codeaurora.org, enric.balletbo@collabora.com, akpm@linux-foundation.org, davem@davemloft.net
List-Id: devicetree@vger.kernel.org

On Tue, Mar 14, 2017 at 10:23:02AM +0100, Peter Senna Tschudin wrote:
> Configures the megachips-stdpxxxx-ge-b850v3-fw bridges on the GE
> B850v3 dts file.
> 
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Martyn Welch <martyn.welch@collabora.co.uk>
> Cc: Martin Donnelly <martin.donnelly@ge.com>
> Cc: Javier Martinez Canillas <javier@dowhile0.org>
> Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Signed-off-by: Peter Senna Tschudin <peter.senna@collabora.com>

To match i.MX patch style, the subject prefix should be something like
'ARM: dts: imx6q-b850v3: ...'.

> ---
> Subject was [PATCH V4 4/4] ...
> But patches 1, 2, and 3 are already upstream and were not resent.
> 
> Changes from V3:
>  - Newline fixes
>  - Removed 'status = "okay";' from '&mux2_i2c2'
>  - Sorted device nodes in order of unit address
> 
> Unchanged since V1.
>  arch/arm/boot/dts/imx6q-b850v3.dts | 66 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6q-b850v3.dts b/arch/arm/boot/dts/imx6q-b850v3.dts
> index d78514c..ef67b47 100644
> --- a/arch/arm/boot/dts/imx6q-b850v3.dts
> +++ b/arch/arm/boot/dts/imx6q-b850v3.dts
> @@ -72,6 +72,14 @@
>  		fsl,data-mapping = "spwg";
>  		fsl,data-width = <24>;
>  		status = "okay";
> +
> +		port@4 {
> +			reg = <4>;
> +

Great, it's been fixed.

> +			lvds0_out: endpoint {
> +				remote-endpoint = <&stdp4028_in>;
> +			};
> +		};
>  	};
>  };
>  
> @@ -142,3 +150,61 @@
>  		reg = <0x4a>;
>  	};
>  };
> +
> +&mux2_i2c2 {
> +	clock-frequency = <100000>;
> +
> +	stdp2690@72 {
> +		compatible = "megachips,stdp2690-ge-b850v3-fw";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0x72>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;

But this one ...

> +				stdp2690_in: endpoint {
> +					remote-endpoint = <&stdp4028_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;

... here ...

> +				stdp2690_out: endpoint {
> +					/* Connector for external display */
> +				};
> +			};
> +		};
> +	};
> +
> +	stdp4028@73 {
> +		compatible = "megachips,stdp4028-ge-b850v3-fw";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0x73>;
> +		interrupt-parent = <&gpio2>;
> +		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;

... here ...

> +				stdp4028_in: endpoint {
> +					remote-endpoint = <&lvds0_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;

... and here.

I fixed up all of them and applied patch.

Shawn

> +				stdp4028_out: endpoint {
> +					remote-endpoint = <&stdp2690_in>;
> +				};
> +			};
> +		};
> +	};
> +};
> -- 
> 2.9.3
> 
