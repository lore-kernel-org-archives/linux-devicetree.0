From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 10/11] ARM: sun8i: h3: add display engine
 pipeline for TVE
Date: Wed, 7 Jun 2017 11:42:41 +0200
Message-ID: <20170607094241.65dcm42aacrn4eev@flea.lan>
References: <20170604160149.30230-1-icenowy@aosc.io>
 <20170604160149.30230-11-icenowy@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cfwhan3eeejuewto"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBHEV37EQKGQE2IF3K6Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170604160149.30230-11-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--cfwhan3eeejuewto
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Mon, Jun 05, 2017 at 12:01:48AM +0800, Icenowy Zheng wrote:
> +	soc {
> +		display_clocks: clock@1000000 {
> +			compatible = "allwinner,sun8i-a83t-de2-clk";
> +			reg = <0x01000000 0x100000>;
> +			clocks = <&ccu CLK_BUS_DE>,
> +				 <&ccu CLK_DE>;
> +			clock-names = "bus",
> +				      "mod";
> +			resets = <&ccu RST_BUS_DE>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			assigned-clocks = <&ccu CLK_DE>;
> +			assigned-clock-parents = <&ccu CLK_PLL_DE>;
> +			assigned-clock-rates = <432000000>;
> +		};

We discussed that already a few times, but there's no reason to do
so. If you need a downstream clock at a particular rate, call
clk_set_rate on it, period.

Whether its parent will be coming from PLL_DE or some other more
appriopriate clock is not relevant and doesn't make any difference.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--cfwhan3eeejuewto--
