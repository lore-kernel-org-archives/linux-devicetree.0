From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 6/7] arm64: allwinner: a64: add device
 tree node for HDMI simplefb
Date: Mon, 25 Jun 2018 17:59:28 +0200
Message-ID: <20180625155928.ep6xrqhbxwejjr4a@flea>
References: <20180622124540.56203-1-icenowy@aosc.io>
 <20180622124540.56203-5-icenowy@aosc.io>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="noanhksd45spdaor"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB25CYTMQKGQEAEIBWFA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180622124540.56203-5-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--noanhksd45spdaor
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Fri, Jun 22, 2018 at 08:45:39PM +0800, Icenowy Zheng wrote:
> As the U-Boot bootloader now is also capable of initialize the HDMI on
> A64 boards, add a simplefb device tree node for accessing the HDMI
> framebuffer initialized by the bootloader.
> 
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
> Changes in v2:
> - Dropped LCD SimpleFB as it's already added. LCD SimpleFB needs some
>   fix but the fix is present when adding DE2 CCU.
> 
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> index 318c4ba8ae9f..840753432ea5 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -68,6 +68,15 @@
>  				 <&display_clocks CLK_MIXER0>;
>  			status = "disabled";
>  		};
> +
> +		simplefb_hdmi: framebuffer-hdmi {
> +			compatible = "allwinner,simple-framebuffer",
> +				     "simple-framebuffer";
> +			allwinner,pipeline = "mixer1-lcd1-hdmi";
> +			clocks = <&display_clocks CLK_MIXER1>,
> +				 <&ccu CLK_TCON1>, <&ccu CLK_HDMI>;
> +			status = "disabled";
> +		};

This node should be before the lcd node

Maxime

-- 
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--noanhksd45spdaor--
