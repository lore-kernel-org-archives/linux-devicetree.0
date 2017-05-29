From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: sun8i: v3s: add PWM pinmux nodes
Date: Mon, 29 May 2017 09:01:03 +0200
Message-ID: <20170529070103.bsmvqmxnflapm6wy@flea.home>
References: <20170524121320.4171-1-icenowy@aosc.io>
 <20170524121320.4171-2-icenowy@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="si5ayuikvcyve6th"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBOUOV7EQKGQECCQ5MCQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170524121320.4171-2-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--si5ayuikvcyve6th
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi,

On Wed, May 24, 2017 at 08:13:19PM +0800, Icenowy Zheng wrote:
> Allwinner V3s have two PWM channels, the first channel can be only at
> PB4 pin, and the second channel PB5.
> 
> Add their pinmux configurations.
> 
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-v3s.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v3s.dtsi
> index bb080c4bd22c..db3328a2c89a 100644
> --- a/arch/arm/boot/dts/sun8i-v3s.dtsi
> +++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
> @@ -239,6 +239,16 @@
>  				pins = "PC0", "PC1", "PC2", "PC3";
>  				function = "spi0";
>  			};
> +
> +			pwm0_pins: pwm0 {
> +				pins = "PB4";
> +				function = "pwm0";
> +			};
> +
> +			pwm1_pins: pwm1 {
> +				pins = "PB5";
> +				function = "pwm1";
> +			};

Please order the nodes alphabetically.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--si5ayuikvcyve6th--
