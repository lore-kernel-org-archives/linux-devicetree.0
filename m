From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: sun8i: a33: add dts for Q8 tablets
 with different resolution
Date: Mon, 21 Aug 2017 10:40:53 +0200
Message-ID: <20170821084053.s4qmhlvgsmckmqgh@flea.lan>
References: <20170817074926.3410-1-icenowy@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iqktnigwrr7zd4sp"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBFVZ5LGAKGQEYFULIZY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170817074926.3410-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--iqktnigwrr7zd4sp
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Thu, Aug 17, 2017 at 03:49:26PM +0800, Icenowy Zheng wrote:
> Q8 tablets with Allwinner A33 SoC now come with two kind of LCD, either
> 800x480 or 1024x600.
> 
> In order for sun4i-drm to be able to choose correct LCD configuration,
> two different device trees should be present, one for a resolution.
> 
> Add stub device trees for two resolutions.
> 
> As the sun4i-drm driver still has some problems to support the LCDs, the
> real LCD device nodes are not added to the device tree files.
> 
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>

This should be an overlay, ideally applied by the bootloader.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--iqktnigwrr7zd4sp--
