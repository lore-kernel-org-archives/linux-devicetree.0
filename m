From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 04/19] clk: sunxi: Add TCON channel1 clock
Date: Fri, 6 Nov 2015 16:11:09 -0800
Message-ID: <20151107001109.GQ6114@lukather>
References: <1446214865-3972-1-git-send-email-maxime.ripard@free-electrons.com>
 <1446214865-3972-5-git-send-email-maxime.ripard@free-electrons.com>
 <20151030213734.GI19782@codeaurora.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xFawzEZLoq+g1Byu"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBH4D6WYQKGQE4SYJ3WI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151030213734.GI19782-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Wynter Woods <wynter-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--xFawzEZLoq+g1Byu
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Fri, Oct 30, 2015 at 02:37:34PM -0700, Stephen Boyd wrote:
> On 10/30, Maxime Ripard wrote:
> > The TCON is a controller generating the timings to output videos signals,
> > acting like both a CRTC and an encoder.
> > 
> > It has two channels depending on the output, each channel being driven by
> > its own clock (and own clock controller).
> > 
> > Add a driver for the channel 1 clock.
> > 
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> 
> Similar comments apply to patches 3 and 4. Was the same code
> copy/pasted two more times and then changed to have different
> values?

I don't really recall, but I probably used the same skeleton yeah.

> Looks like we should consolidate all that stuff into something more
> generic so that we don't have the same problems 3 times.

Does it?

They're both pretty different actually. One is a gate + mux + reset
(patch 3), the other one is actually a combination of two clocks, one
that is the parent of the other, the former being a gate + mux, the
latter a gate + div.

At least at the hardware level, they're very different, and adding
more code to deal with both case would complicate quite a lot the
probe code, for no real reasons.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--xFawzEZLoq+g1Byu--
