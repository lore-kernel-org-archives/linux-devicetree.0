From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 5/5] arm64: allwinner: a64: add SRAM
 controller device tree node
Date: Thu, 12 Apr 2018 16:58:06 +0200
Message-ID: <20180412145806.hsvxomh6vousrhq5@flea>
References: <20180411141641.14675-1-icenowy@aosc.io>
 <20180411141641.14675-6-icenowy@aosc.io>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="evvv32nlsy5xv6f6"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBCXIXXLAKGQEVGOTILA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180411141641.14675-6-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--evvv32nlsy5xv6f6
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi,

On Wed, Apr 11, 2018 at 10:16:41PM +0800, Icenowy Zheng wrote:
> Allwinner A64 has a SRAM controller, and in the device tree currently
> we have a syscon node to enable EMAC driver to access the EMAC clock
> register. As SRAM controller driver can now export regmap for this
> register, replace the syscon node to the SRAM controller device node,
> and let EMAC driver to acquire its EMAC clock regmap.
> 
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> index 1b2ef28c42bd..1c37659d9d41 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -168,10 +168,25 @@
>  		#size-cells = <1>;
>  		ranges;
>  
> -		syscon: syscon@1c00000 {
> -			compatible = "allwinner,sun50i-a64-system-controller",
> -				"syscon";
> +		sram_controller: sram-controller@1c00000 {
> +			compatible = "allwinner,sun50i-a64-sram-controller";
>  			reg = <0x01c00000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			sram_c: sram@18000 {
> +				compatible = "mmio-sram";
> +				reg = <0x00018000 0x28000>;
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +				ranges = <0 0x00018000 0x28000>;
> +
> +				de2_sram: sram-section@0 {
> +					compatible = "allwinner,sun50i-a64-sram-c";
> +					reg = <0x0000 0x28000>;
> +				};
> +			};

That doesn't look related at all to what's being discussed here, so
you'd rather add it as part of your DE2-enablement serie (or amend
your commit log to say why this is important to do it in this patch).

Maxime

-- 
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--evvv32nlsy5xv6f6--
