From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: sun8i: v3s: add support for Lichee
 Pi Zero w/ dock board
Date: Mon, 15 May 2017 10:59:07 +0200
Message-ID: <20170515085907.cyitd47elgsy4cq4@flea.home>
References: <20170515084001.63123-1-icenowy@aosc.io>
 <20170515084001.63123-4-icenowy@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lfrikcicf257xyz4"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBXG34XEAKGQEOB6ZMRA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170515084001.63123-4-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--lfrikcicf257xyz4
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Mon, May 15, 2017 at 04:40:01PM +0800, Icenowy Zheng wrote:
> The Lichee Pi Zero board has a "dock board" which needs to be soldered
> with the 1.27mm stamp holes on a Lichee Pi Zero board.
> 
> It features:
> - Onboard MIC and headphone jack (not supported yet)
> - Ethernet port (not supported yet)
> - An extra MicroSD slot connected to MMC1 controller
> - four keys connected to the LRADC.
> 
> As it needs to be soldered with the main board to use, add a stand-alone
> device tree for it.
> 
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>

Applied all 4, thanks

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--lfrikcicf257xyz4--
