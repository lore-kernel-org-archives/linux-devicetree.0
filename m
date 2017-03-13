From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V3 4/4] dts/imx6q-b850v3: Use
 megachips-stdpxxxx-ge-b850v3-fw bridges (LVDS-DP++)
Date: Mon, 13 Mar 2017 20:41:37 +0800
Message-ID: <20170313124134.GF3618@dragon>
References: <cover.1488555615.git.peter.senna@collabora.com>
 <d5c297680eb82fd7ef63f7f5dafffc22b98d2345.1488555615.git.peter.senna@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <d5c297680eb82fd7ef63f7f5dafffc22b98d2345.1488555615.git.peter.senna@collabora.com>
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

On Fri, Mar 03, 2017 at 04:57:10PM +0100, Peter Senna Tschudin wrote:
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
> ---
> Unchanged since V1.
> 
>  arch/arm/boot/dts/imx6q-b850v3.dts | 68 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6q-b850v3.dts b/arch/arm/boot/dts/imx6q-b850v3.dts
> index b237429..3ec54da 100644
> --- a/arch/arm/boot/dts/imx6q-b850v3.dts
> +++ b/arch/arm/boot/dts/imx6q-b850v3.dts
> @@ -72,6 +72,13 @@
>  		fsl,data-mapping = "spwg";
>  		fsl,data-width = <24>;
>  		status = "okay";
> +
> +		port@4 {
> +			reg = <4>;

Have a newline between property list and child node.

> +			lvds0_out: endpoint {
> +				remote-endpoint = <&stdp4028_in>;
> +			};
> +		};
>  	};
>  };
>  
> @@ -146,3 +153,64 @@
>  &usdhc2 {
>  	status = "disabled";
>  };
> +
> +&mux2_i2c2 {
> +	status = "okay";

This okay status doesn't seem really necessary to me.  If it does,
please put it at the end of property list.

> +	clock-frequency = <100000>;
> +
> +	stdp4028@73 {
> +		compatible = "megachips,stdp4028-ge-b850v3-fw";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +

Drop this newline, as in general we do not add newline in middle of
property list.

> +		reg = <0x73>;
> +

Ditto

> +		interrupt-parent = <&gpio2>;
> +		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				stdp4028_in: endpoint {
> +					remote-endpoint = <&lvds0_out>;
> +				};
> +			};

Have a newline between nodes.

> +			port@1 {
> +				reg = <1>;
> +				stdp4028_out: endpoint {
> +					remote-endpoint = <&stdp2690_in>;
> +				};
> +			};
> +		};
> +	};
> +
> +	stdp2690@72 {

Sort device nodes under bus in order of unit address.  That said,
stdp2690@72 should go before stdp4028@73.

Shawn

> +		compatible = "megachips,stdp2690-ge-b850v3-fw";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		reg = <0x72>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				stdp2690_in: endpoint {
> +					remote-endpoint = <&stdp4028_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				stdp2690_out: endpoint {
> +					/* Connector for external display */
> +				};
> +			};
> +		};
> +	};
> +};
> -- 
> 2.9.3
> 
