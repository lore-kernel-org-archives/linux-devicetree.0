From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/7] clk: sunxi-ng: add support for H6 PRCM CCU
Date: Fri, 4 May 2018 17:06:53 +0200
Message-ID: <20180504150653.n2rqqhr45hrpjfw6@flea>
References: <20180503183847.11046-1-icenowy@aosc.io>
 <20180503183847.11046-2-icenowy@aosc.io>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ol54axoa4kjh4s7e"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBDXOWHLQKGQEGXC4A7Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180503183847.11046-2-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ol54axoa4kjh4s7e
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Fri, May 04, 2018 at 02:38:41AM +0800, Icenowy Zheng wrote:
> The H6 has clock/reset controls in PRCM part, like old SoCs such as H3
> and A64. However, the PRCM CCU is rearranged; the register arragement
> is now similar to the main CCU of H6, and the PRCM now has two APB
> buses to control -- one is clocked from AHB clock derivde from AR100
> clock, the other is clocked from the same mux with AR100 clock.
> Therefore a new driver is written for it.
> 
> As there's no official document about the PRCM in H6, all the information
> are indirectly collected from BSP and parts of the document, and the
> information source is noted as comments in the driver's source code. If
> reliable information is provided furtherly, the driver needs to be
> rechecked.
> 
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>

Applied, thanks!
Maxime

-- 
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--ol54axoa4kjh4s7e--
