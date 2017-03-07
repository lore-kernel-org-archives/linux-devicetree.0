From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v8 0/6] Allwinner H5 and Orange Pi PC2 support
Date: Tue, 7 Mar 2017 18:07:51 +0100
Message-ID: <20170307170751.n6tvrztet724pxfl@lukather>
References: <20170306171750.7491-1-icenowy@aosc.xyz>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4yddkeq36jswtmax"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB2GR7PCQKGQEW6UAAVQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170306171750.7491-1-icenowy-ymACFijhrKM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--4yddkeq36jswtmax
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Tue, Mar 07, 2017 at 01:17:44AM +0800, Icenowy Zheng wrote:
> Allwinner H5 is a 64-bit SoC with a design like the 32-bit
> H3, and it's pin-to-pin compatible with H3.
> 
> This patchset adds support for it, along with the first available
> board -- Orange Pi PC2.
> 
> Several H5 boards by Sinovoip Banana Pi and FriendlyARM Nano Pi
> are coming, so we should get ready for them.
> 
> CCU changes are already said to be merged by Maxime Ripard, so
> this patchset now contains only device tree patches.
> 
> Commit messages are changed by the suggestion of Maxime.
> 
> This patchset depends on patchset [1] to finally take effect. At
> least the patch 1 of that patchset is needed if you want to test
> the kernel image -- without it the pinctrl driver won't be built
> and the kernel will become unusable without pinctrl.

It's still not the prefixes I told you to use. I merged your patches
and fixed, but please use the right one next time (and be consistent
in your ARM vs arm usage).

Thanks for your work!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--4yddkeq36jswtmax--
