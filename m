From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v7 6/6] arm64: dts: sunxi: add support for
 the Orange Pi PC 2 board
Date: Mon, 6 Mar 2017 11:37:29 +0100
Message-ID: <20170306103729.y7tsj6dyydf2zmmr@lukather>
References: <20170305233138.64574-1-icenowy@aosc.xyz>
 <20170305233138.64574-7-icenowy@aosc.xyz>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="i53faqghmsgutwnl"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB2PX6TCQKGQEW4PPK3I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170305233138.64574-7-icenowy-ymACFijhrKM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--i53faqghmsgutwnl
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Mon, Mar 06, 2017 at 07:31:38AM +0800, Icenowy Zheng wrote:
> From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> 
> The Orange Pi PC 2 is a typical single board computer using the
> Allwinner H5 SoC. Apart from the usual suspects it features three
> separately driven USB ports and a Gigabit Ethernet port.
> Also it has a SPI NOR flash soldered, from which the board can boot
> from. This enables the SBC to behave like a "real computer" with
> built-in firmware.
> 
> Add the board specific .dts file, which includes the H5 .dtsi and
> enables the peripherals that we support so far.
> 
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> [Icenowy: dropped all GPIO pinctrl nodes, change red LED gpio,
>  change MMC cd to active-low, rename some node names to prevent
>  underscores]
> Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>

And here your prefix should be "arm64: allwinner: h5:"

(This also applies to your previous patch).

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--i53faqghmsgutwnl--
