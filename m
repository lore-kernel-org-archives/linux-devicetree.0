From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Re: [PATCH v2 00/26] arm64: allwinner: Add A64 DE2
 HDMI support
Date: Tue, 5 Jun 2018 15:25:39 +0200
Message-ID: <20180605132539.m54xwfzfs6btrmtc@flea>
References: <20180518094536.17201-1-jagan@amarulasolutions.com>
 <20180518095913.nzl3sr5wn6cg4ra5@flea>
 <CAMty3ZC13J+bCWK_=9816Lu-5ctC0UfF4-XR3yNSpHdH8q8Faw@mail.gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b6opfkfolfd5hoil"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBZ463LMAKGQEBV7P6RI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAMty3ZC13J+bCWK_=9816Lu-5ctC0UfF4-XR3yNSpHdH8q8Faw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--b6opfkfolfd5hoil
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Tue, Jun 05, 2018 at 06:23:57PM +0530, Jagan Teki wrote:
> On Fri, May 18, 2018 at 3:29 PM, Maxime Ripard
> <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> > On Fri, May 18, 2018 at 03:15:10PM +0530, Jagan Teki wrote:
> >> Allwinner A64 has display engine pipeline like other Allwinner SOC's A83T/H3/H5.
> >>
> >> A64 behaviour similar to Allwinner A83T where
> >> Mixer0 => TCON0 => LVDS/RGB/MIPI-DSI
> >> Mixer1 => TCON1 => HDMI
> >> as per Display System Block DiagramAllwinner_A64_User_Manual_V1.1.pdf
> >>
> >> This is second patch-set followed with previous RFC[1] and first series[2]
> >> and merely concentrated on HDMI pipeline through TCON1 and rest will add eventually.
> >>
> >> This series fixed previous version comments
> >> - about documenting fallback compatibles
> >> - adding new compatible for mixer1
> >> - support for multiple DW HDMI PHY clock parents (thanks, to Jernej)
> >>
> >> Note:
> >> Pine64 boards are unable to get edid by default like other A64 boards,
> >> but forcing 'video=HDMI-A-1:1920x1080@60D' kernel command line can
> >> create edid with display on penel.
> >
> > There's no point in trying to push this without the SRAM issue being
> > solved. It is required, and won't be merged unless this is addressed.
> 
> is SRAM issue resolved? if so may be I will try to test it on top.

I'd expect the one working on this to push a solution to solve this.

Maxime

-- 
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--b6opfkfolfd5hoil--
