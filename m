From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/3] ARM: dts: sun8i: Add basic dtsi file
 for Allwinner R40
Date: Thu, 28 Sep 2017 17:11:03 +0200
Message-ID: <20170928151103.ov3o5pn5h7inzzan@flea>
References: <20170928092543.45648-1-icenowy@aosc.io>
 <20170928092543.45648-2-icenowy@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i2udpxaukzgohm6x"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBEVCWTHAKGQEXNJEX6Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170928092543.45648-2-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--i2udpxaukzgohm6x
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi,

On Thu, Sep 28, 2017 at 09:25:41AM +0000, Icenowy Zheng wrote:
> +		/*
> +		 * The max-frequency properties in all MMC controller nodes
> +		 * are conservative values proven to work on Banana Pi M2
> +		 * Ultra (the first community available R40 board).
> +		 * As the board doesn't wire MMC3 out, the property is not
> +		 * set in MMC3.
> +		 * TODO: measure the accurate max frequency of the controllers.
> +		 */
> +		mmc0: mmc@1c0f000 {
> +			compatible = "allwinner,sun8i-r40-mmc",
> +				     "allwinner,sun50i-a64-mmc";
> +			reg = <0x01c0f000 0x1000>;
> +			clocks = <&ccu CLK_BUS_MMC0>, <&ccu CLK_MMC0>;
> +			clock-names = "ahb", "mmc";
> +			resets = <&ccu RST_BUS_MMC0>;
> +			reset-names = "ahb";
> +			pinctrl-0 = <&mmc0_pins>;
> +			pinctrl-names = "default";
> +			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> +			max-frequency = <25000000>;
> +			status = "disabled";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};

Sorry if it wasn't really clear, but my point was more than you should
just drop the max-frequency property

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--i2udpxaukzgohm6x--
