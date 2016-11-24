From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [RFC PATCH 2/2] arm64: dts: enable the MUSB
 controller of Pine64 in host-only mode
Date: Thu, 24 Nov 2016 20:53:48 +0100
Message-ID: <20161124195348.t53xxasm6hlvwz7s@lukather>
References: <20161122165902.62543-1-icenowy@aosc.xyz>
 <20161122165902.62543-2-icenowy@aosc.xyz>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="udl64kciofqmjzg7"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBTMK3XAQKGQEVUEADTQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20161122165902.62543-2-icenowy-ymACFijhrKM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--udl64kciofqmjzg7
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Wed, Nov 23, 2016 at 12:59:02AM +0800, Icenowy Zheng wrote:
> A64 has a MUSB controller wired to the USB PHY 0, which is connected
> to the upper USB Type-A port of Pine64.
> 
> As the port is a Type-A female port, enable it in host-only mode in the
> device tree, which makes devices with USB Type-A male port can work on
> this port (which is originally designed by Pine64 team).
> 
> Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>

Applied both, thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--udl64kciofqmjzg7--
