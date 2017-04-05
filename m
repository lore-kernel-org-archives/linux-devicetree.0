From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 10/11] arm64: allwinner: a64: enable AXP803
 regulators for Pine64
Date: Wed, 5 Apr 2017 08:13:39 +0200
Message-ID: <20170405061339.lo76zihtqmhlkpgh@lukather>
References: <20170404180145.12897-1-icenowy@aosc.io>
 <20170404180145.12897-11-icenowy@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4qwk5wtbo3zpgy2n"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBE4WSLDQKGQE7QJYWJQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170404180145.12897-11-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--4qwk5wtbo3zpgy2n
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Wed, Apr 05, 2017 at 02:01:44AM +0800, Icenowy Zheng wrote:
> Add support of AXP803 regulators in the Pine64 device tree, in order to
> enable many future functionalities, e.g. Wi-Fi.
> 
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
>  .../arm64/boot/dts/allwinner/sun50i-a64-pine64.dts | 109 +++++++++++++++++++++
>  1 file changed, 109 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> index 2132d8e6cb3d..7da074f95065 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> @@ -106,6 +106,115 @@
>  	};
>  };
>  
> +#include "axp803.dtsi"
> +
> +&reg_aldo1 {
> +	regulator-min-microvolt = <2800000>;
> +	regulator-max-microvolt = <2800000>;
> +	regulator-name = "vcc-csi";
> +};
> +
> +&reg_aldo2 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <1800000>;
> +	regulator-max-microvolt = <3300000>;
> +	regulator-name = "vcc-pl";
> +};
> +
> +&reg_aldo3 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <2700000>;
> +	regulator-max-microvolt = <3300000>;
> +	regulator-name = "vcc-pll-avcc";
> +};
> +
> +&reg_dc1sw {
> +	regulator-name = "vcc-phy";
> +};
> +
> +&reg_dcdc1 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <3300000>;
> +	regulator-max-microvolt = <3300000>;
> +	regulator-name = "vcc-3v3";
> +};
> +
> +&reg_dcdc2 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <1000000>;
> +	regulator-max-microvolt = <1300000>;
> +	regulator-name = "vdd-cpux";
> +};
> +
> +/* DCDC3 is polyphased with DCDC2 */
> +
> +&reg_dcdc5 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <1500000>;
> +	regulator-max-microvolt = <1500000>;
> +	regulator-name = "vcc-dram";
> +};
> +
> +&reg_dcdc6 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <1100000>;
> +	regulator-max-microvolt = <1100000>;
> +	regulator-name = "vdd-sys";
> +};
> +
> +&reg_dldo1 {
> +	regulator-min-microvolt = <3300000>;
> +	regulator-max-microvolt = <3300000>;
> +	regulator-name = "vcc-hdmi";
> +};
> +
> +&reg_dldo2 {
> +	regulator-min-microvolt = <3300000>;
> +	regulator-max-microvolt = <3300000>;
> +	regulator-name = "vcc-mipi";
> +};
> +
> +&reg_dldo3 {
> +	regulator-min-microvolt = <3300000>;
> +	regulator-max-microvolt = <3300000>;
> +	regulator-name = "avdd-csi";
> +};
> +
> +&reg_dldo4 {
> +	regulator-min-microvolt = <3300000>;
> +	regulator-max-microvolt = <3300000>;
> +	regulator-name = "vcc-wifi";
> +};
> +
> +&reg_eldo1 {
> +	regulator-min-microvolt = <1800000>;
> +	regulator-max-microvolt = <1800000>;
> +	regulator-name = "cpvdd";
> +};
> +
> +&reg_eldo3 {
> +	regulator-min-microvolt = <1800000>;
> +	regulator-max-microvolt = <1800000>;
> +	regulator-name = "vdd-1v8-csi";
> +};
> +
> +&reg_fldo1 {
> +	regulator-min-microvolt = <1200000>;
> +	regulator-max-microvolt = <1200000>;
> +	regulator-name = "vcc-1v2-hsic";
> +};
> +
> +&reg_fldo2 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <1100000>;
> +	regulator-max-microvolt = <1100000>;
> +	regulator-name = "vdd-cpus";
> +};

Why do you need to always power the AR100 on?

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--4qwk5wtbo3zpgy2n--
