From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] arm64: allwinner: h5: add support for
 Orange Pi Prime board
Date: Mon, 10 Apr 2017 09:09:29 +0200
Message-ID: <20170410070929.2qdg7h6d5salmvpw@lukather>
References: <20170407165630.7632-1-icenowy@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="54ptqkgyqgwscsy4"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBNO7VTDQKGQEE4GBSOI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170407165630.7632-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--54ptqkgyqgwscsy4
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Sat, Apr 08, 2017 at 12:56:30AM +0800, Icenowy Zheng wrote:
> Orange Pi Prime is a new Allwinner H5-based SBC by Xunlong.
> 
> It's like a Orange Pi Plus 2E with H3 replaced with H5, eMMC replaced
> with onboard SPI NOR Flash and wireless card changed to Realtek
> RTL8723BS (with Bluetooth functionality).
> 
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
>  arch/arm64/boot/dts/allwinner/Makefile             |   1 +
>  .../dts/allwinner/sun50i-h5-orangepi-prime.dts     | 202 +++++++++++++++++++++
>  2 files changed, 203 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-prime.dts
> 
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
> index 244e8b7565f9..92a84eea6b96 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -1,6 +1,7 @@
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-bananapi-m64.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pine64-plus.dtb sun50i-a64-pine64.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-orangepi-pc2.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-orangepi-prime.dtb
>  
>  always		:= $(dtb-y)
>  subdir-y	:= $(dts-dirs)
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-prime.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-prime.dts
> new file mode 100644
> index 000000000000..2ebfe6c359ed
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-prime.dts
> @@ -0,0 +1,202 @@
> +/*
> + * Copyright (C) 2016 ARM Ltd.

You're sure?

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--54ptqkgyqgwscsy4--
