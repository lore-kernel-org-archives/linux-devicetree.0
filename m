From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun8i: r40/v40: rewrite BPi M2
 Berry DTS to rebase on M2 Ultra
Date: Thu, 26 Jul 2018 14:41:19 +0200
Message-ID: <20180726124119.dwne2sncws2p3sdi@flea>
References: <20180724163655.61365-1-icenowy@aosc.io>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="e565z7acyzl3z52t"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB64C47NAKGQEAYJMXZA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180724163655.61365-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--e565z7acyzl3z52t
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Wed, Jul 25, 2018 at 12:36:55AM +0800, Icenowy Zheng wrote:
> Banana Pi designs the BPi M2 Berry board to be software compatible with
> BPi M2 Ultra,

Do you have a reference for this?

> so it's based on M2 Ultra with some function cuts, including:
> 
> - 2048MiB DRAM -> 1024MiB (this should be proceed by the bootloader);
> - dropped a LED;
> - dropped eMMC;
> - dropped USB2 and connect USB1 to a 4-port HUB.

Is it the exhaustive list?

I'm a bit reluctant to merge that kind of patches usually, since that
would also imply that each time someone will commit something to the
M2-Ultra, it would automatically apply to the M2-Berry, without any
easy way to tell and / or test.

Maxime

-- 
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--e565z7acyzl3z52t--
