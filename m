From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 0/3] Allwinner H6 Ethernet support
Date: Mon, 5 Nov 2018 10:00:42 +0100
Message-ID: <20181105090042.u5x2h6rek4nyaghc@flea>
References: <20181103123238.4665-1-icenowy@aosc.io>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tg23n6htzoo3f5qs"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBRMNQDPQKGQEB4WBQUA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20181103123238.4665-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Corentin Labbe <clabbe-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "David S . Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--tg23n6htzoo3f5qs
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Sat, Nov 03, 2018 at 08:32:35PM +0800, Icenowy Zheng wrote:
> This patchset introduces Allwinner H6 Ethernet support with code already
> available for A64.
> 
> As the EMAC on H6 is similar to A64 ones, support for them are directly
> reused, by using fallback compatible strings.
> 
> Patches about system controller in v1 is sent by Jernej Skabrec as part
> of his H6 display patchset, and already gets applied.
> 
> NOTE: This patchset targets the final version of Pine H64, and also
> supports the early sample of Pine H64 model B. However, it's not
> compatible with the early sample of Pine H64 model A. Please DO NOT test
> this patchset on the Pine H64 model A samples.

Applied thanks!
Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--tg23n6htzoo3f5qs--
