From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 14/15] arm64: dts: allwinner: a64: Add
 DSI pipeline
Date: Wed, 24 Oct 2018 19:10:48 +0100
Message-ID: <20181024181048.w4iwebtac6wzmgt4@flea>
References: <20181023155035.9101-1-jagan@amarulasolutions.com>
 <20181023155035.9101-15-jagan@amarulasolutions.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ce5b5wkoh6xeauxh"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBNHLYLPAKGQEF5NZQ4Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20181023155035.9101-15-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ce5b5wkoh6xeauxh
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Tue, Oct 23, 2018 at 09:20:34PM +0530, Jagan Teki wrote:
> The A64 has a MIPI-DSI block which is similar to A31
> without mod clock.
> 
> So, add dsi node with A64 compatible, dphy node with
> A31 compatible and finally connect dsi to tcon0 to
> make proper DSI pipeline.
> 
> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> ---
> Changes for v2:
> - use A64 dphy compatible
> 
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> index f3a66f888205..f82e6b165d57 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -320,6 +320,11 @@
>  					#address-cells = <1>;
>  					#size-cells = <0>;
>  					reg = <1>;
> +
> +					tcon0_out_dsi: endpoint@1 {
> +						reg = <1>;
> +						remote-endpoint = <&dsi_in_tcon0>;

You need to set the allwinner,channel property there.

> +					};
>  				};
>  			};
>  		};
> @@ -818,6 +823,46 @@
>  			#interrupt-cells = <3>;
>  		};
>  
> +
> +		dsi: dsi@1ca0000 {
> +			compatible = "allwinner,sun50i-a64-mipi-dsi";
> +			reg = <0x01ca0000 0x1000>;
> +			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_MIPI_DSI>;
> +			clock-names = "bus";
> +			resets = <&ccu RST_BUS_MIPI_DSI>;
> +			phys = <&dphy>;
> +			phy-names = "dphy";
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <0>;
> +
> +					dsi_in_tcon0: endpoint {
> +						remote-endpoint = <&tcon0_out_dsi>;
> +					};
> +				};
> +			};
> +		};
> +
> +		dphy: d-phy@1ca1000 {
> +			compatible = "allwinner,sun50i-a64-mipi-dphy",
> +				     "allwinner,sun6i-a31-mipi-dphy";
> +			reg = <0x01ca1000 0x1000>;
> +			clocks = <&ccu CLK_BUS_MIPI_DSI>,
> +				 <&ccu CLK_DSI_DPHY>;
> +			clock-names = "bus", "mod";
> +			resets = <&ccu RST_BUS_MIPI_DSI>;
> +			status = "disabled";
> +			#phy-cells = <0>;
> +		};
> +

You have to order the nodes per ascending physical address ordering.

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--ce5b5wkoh6xeauxh--
