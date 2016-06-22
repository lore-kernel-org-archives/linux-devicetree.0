From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH V3] ARM: dts: sun7i: Add dts file for
 Bananapi M1 Plus board
Date: Wed, 22 Jun 2016 11:57:23 +0200
Message-ID: <20160622095723.GU26668@lukather>
References: <20160617095602.14612-1-luoyi.ly@gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vKcNkqnJHUUp475E"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBJOCVG5QKGQEE6UQOCI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20160617095602.14612-1-luoyi.ly-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: luoyi.ly-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--vKcNkqnJHUUp475E
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Fri, Jun 17, 2016 at 05:56:02PM +0800, luoyi.ly-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: Luo Yi <luoyi.ly-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Add support for the Bananapi M1 Plus A20 development board from
> sinovoip.com.cn . This board is nearly a clone of the Lemaker's
> Bananapro, but differ with the wlan chipset connection and i2s pinout.
> And I also enable the integrated audio codec on default.

This patch content is fine, but there's a lot of small issues:
  - You're not indenting the nodes properly
  - You're missing your Signed-off-by tag
  - And probably other stuff

This has all been reported by checkpatch.

Make sure you run checkpatch, make the modifications needed so that
you don't have any warnings or errors anymore, and resubmit it.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--vKcNkqnJHUUp475E--
