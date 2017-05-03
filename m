From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 3/8] clk: sunxi-ng: Add class of phase
 clocks supporting MMC new timing modes
Date: Wed, 3 May 2017 22:34:02 +0200
Message-ID: <20170503203402.5mwhx5wjniav24nd@lukather>
References: <20170503031658.29299-1-wens@csie.org>
 <20170503031658.29299-4-wens@csie.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rgbzhspct3f4eex6"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBO75VDEAKGQEWWDUNLA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170503031658.29299-4-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--rgbzhspct3f4eex6
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Wed, May 03, 2017 at 11:16:53AM +0800, Chen-Yu Tsai wrote:
> The MMC clocks on newer SoCs, such as the A83T and H3, support the
> "new timing mode". Under this mode, the output of the clock is divided
> by 2, and the clock delays no longer apply.
> 
> Due to how the clock tree is modeled and setup, we need to model
> this function in two places, the master mmc clock and the two
> child phase clocks. In the mmc clock, we can easily model the
> mode bit as an extra variable post-divider. In the phase clocks,
> we check the bit and return -ENOTSUPP if the bit is set, signaling
> that the phase clocks are not to be used.
> 
> This patch introduces a class of phase clocks that checks the
> timing mode bit.

We've been over this quite some times already...

How do you retrieve the mode used in the clock so that you can also
switch the MMC driver in the new mode?

And do you prevent that from happening on the DT we already have that
use the old clock drivers that do not support this new timing at all?

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--rgbzhspct3f4eex6--
