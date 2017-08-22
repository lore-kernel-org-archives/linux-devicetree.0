From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: sun7i: Rename sun7i-a20-olinuxino-lime2-emmc
Date: Tue, 22 Aug 2017 22:20:54 +0200
Message-ID: <20170822202054.hpyl3ndo3apduone@flea.home>
References: <20170822114313.9038-1-stefan@olimex.com>
 <20170822114313.9038-4-stefan@olimex.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bewte7l4iqutbhld"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBMNE6LGAKGQEUNJNECQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170822114313.9038-4-stefan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Stefan Mavrodiev <stefan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--bewte7l4iqutbhld
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi,

On Tue, Aug 22, 2017 at 02:43:13PM +0300, Stefan Mavrodiev wrote:
> Rename dts file for A20-OLinuXino-LIME2-eMMC to match Olimex Ltd.
> naming convention.
> 
> <board-name>-exGB - option with <x>GB eMMC chip
> <board-name>-nxGB - option with <x>GB NAND chip
> <board-name>-sxMB - option with <x>MB SPI FLASH chip
> 
> For example:
> 	A20-OLinuXino-LIME2-e4GB - 4GB eMMC
> 	A20-OLinuXIno-LIME2-n4GB - 4GB NAND
> 	A20-OLinuXIno-LIME2-n8GB - 8GB NAND

I'm not going to merge this patch, because it basically breaks all the
bootloaders scripts, distros or build systems out there. We have a
name, let's stick with that.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--bewte7l4iqutbhld--
