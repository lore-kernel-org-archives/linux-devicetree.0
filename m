From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] arm: dts: sun8i: split Allwinner H3 .dtsi
Date: Thu, 2 Mar 2017 14:58:12 +0100
Message-ID: <20170302135812.kvvqw6trjipjhhu5@lukather>
References: <20170301201342.47583-1-icenowy@aosc.xyz>
 <20170301201342.47583-3-icenowy@aosc.xyz>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2u5euainn4mpvuic"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB76J4DCQKGQEJGTV5WQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170301201342.47583-3-icenowy-ymACFijhrKM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--2u5euainn4mpvuic
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Thu, Mar 02, 2017 at 04:13:40AM +0800, Icenowy Zheng wrote:
> From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> 
> The new Allwinner H5 SoC is pin-compatible to the H3 SoC, but with the
> Cortex-A7 cores replaced by Cortex-A53 cores and the MMC controller
> updated. So we should really share almost the whole .dtsi.
> In preparation for that move the peripheral parts of the existing
> sun8i-h3.dtsi into a new sunxi-h3-h5.dtsi.
> The actual sun8i-h3.dtsi then includes that and defines the H3 specific
> parts on top of it.
> According to "Allwinner H3 Datasheet Version 1.2 Apr. 23, 2015" [1]
> Chapter 4.12. GIC and "Allwinner H5 Datasheet Revision 1.0 May. 20,
> 2016" [2] Chapter 4.12. GIC, the two SoCs both use ARM GIC-400 interrupt
> controller (see the "Note" after the interrupt source table), so the GIC
> node is extracted to sunxi-h3-h5.dtsi as well, and the compatible is
> changed to "arm,gic-400".

This should be in a separate patch.

> On the way get rid of skeleton.dtsi, as recommended in that very file.

That too.

> The inclusion of pinctrl-a10.h is also dropped, as it's now not needed
> at all after changing pinctrl binding to the generic pinconf binding.

And that as well...

> [1] http://linux-sunxi.org/File:Allwinner_H3_Datasheet_V1.2.pdf
> [2] https://github.com/OrangePiLibra/OrangePi_H5SDK/blob/master/Documentation/Hardware/H5_User_Manual.pdf

Please don't put URLs in commit logs.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--2u5euainn4mpvuic--
