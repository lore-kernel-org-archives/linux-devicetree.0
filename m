From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 10/11] arm64: dts: allwinner: Remove no
 longer used pinctrl/sun4i-a10.h header
Date: Fri, 27 Jan 2017 09:46:29 +0100
Message-ID: <20170127084629.hborqgkmm4exo7z7@lukather>
References: <20170124023230.3990-1-wens@csie.org>
 <20170124023230.3990-11-wens@csie.org>
 <20170126101529.j3fuku4hyy3pbge3@lukather>
 <CAGb2v66cQoPQzd6W1D8bZ5hSURfGP3icJjeoo1mNk2ccG9B2vw@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ciukemjlu7lplsqt"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBZMRVTCAKGQEQEBIVIY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAGb2v66cQoPQzd6W1D8bZ5hSURfGP3icJjeoo1mNk2ccG9B2vw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ciukemjlu7lplsqt
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Thu, Jan 26, 2017 at 07:23:25PM +0800, Chen-Yu Tsai wrote:
> On Thu, Jan 26, 2017 at 6:15 PM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > On Tue, Jan 24, 2017 at 10:32:29AM +0800, Chen-Yu Tsai wrote:
> >> All dts files for the sunxi platform have been switched to the generic
> >> pinconf bindings. As a result, the sunxi specific pinctrl macros are
> >> no longer used.
> >>
> >> Remove the #include entry with the following command:
> >>
> >>     sed -i -e '/pinctrl\/sun4i-a10.h/D' \
> >>       arch/arm64/boot/dts/allwinner/*.dts?
> >>
> >> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> >
> > Applied, thanks!
> >
> > Maybe we should also remove the header entirely?
> 
> I don't know. What do we do about deprecated bindings?

Well, we have to support the old device trees, but I don't think to be
expected to still compile them from the source

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--ciukemjlu7lplsqt--
