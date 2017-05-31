From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 0/6] clk: sunxi-ng: Add support for
 A83T's PRCM
Date: Wed, 31 May 2017 21:58:27 +0200
Message-ID: <20170531195827.kcbkwf5k2mh4q4re@flea.home>
References: <20170531075824.657-1-wens@csie.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qkey6pgizbckwfak"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBZGAXTEQKGQEFJMXWFA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170531075824.657-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--qkey6pgizbckwfak
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Wed, May 31, 2017 at 03:58:18PM +0800, Chen-Yu Tsai wrote:
> Hi everyone,
> 
> This is the remaining parts of my A83T PRCM support series, along with
> changes requested by Maxime.
> 
> Patch 1 updates the device tree bindings for the PRCM, adding pll-periph
> to the list of required clocks
> 
> Patch 2 adds a device node for the PRCM on the A83T SoC, updated from v1
> to include the pll-periph clock.
> 
> Patch 3 exports the PLL_PERIPH0 clock from the CCU on the H3/H5, for
> consumption by the PRCM.
> 
> Patch 4 adds the pll-periph clock to the PRCM device node on the H3/H5.
> 
> Patch 5 / 6 are the same as 3 / 4, but for the A64.

Applied, thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--qkey6pgizbckwfak--
