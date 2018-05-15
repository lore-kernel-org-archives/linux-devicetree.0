From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 09/21] arm64: dts: allwinner: a64: Add HDMI support
Date: Tue, 15 May 2018 13:19:38 +0200
Message-ID: <20180515111938.ia6jttqijj2erxy4@flea>
References: <20180430114058.5061-1-jagan@amarulasolutions.com>
 <20180430114058.5061-10-jagan@amarulasolutions.com>
 <20180502113413.vv2r3ubfoh7gm3ms@flea>
 <CAMty3ZBheurXewQ8R53G_0gNLgv1jQkZbjAbaN30JQ6_ZVn7Eg@mail.gmail.com>
 <20180514084050.ix5corfuvx33gsyn@flea>
 <CAMty3ZDCubM2sLBfNVar-kA9djZ8PJDQJOS0Jwi6wWNVeK9mCg@mail.gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v7lac66a75aajndc"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBVME5PLQKGQE2LY5GEQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAMty3ZDCubM2sLBfNVar-kA9djZ8PJDQJOS0Jwi6wWNVeK9mCg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--v7lac66a75aajndc
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Mon, May 14, 2018 at 04:01:15PM +0530, Jagan Teki wrote:
> On Mon, May 14, 2018 at 2:10 PM, Maxime Ripard
> <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> > On Mon, May 14, 2018 at 02:03:36PM +0530, Jagan Teki wrote:
> >> On Wed, May 2, 2018 at 5:04 PM, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> >> > Hi,
> >> >
> >> > On Mon, Apr 30, 2018 at 05:10:46PM +0530, Jagan Teki wrote:
> >> >> +             hdmi_phy: hdmi-phy@1ef0000 {
> >> >> +                     compatible = "allwinner,sun50i-a64-hdmi-phy",
> >> >> +                                  "allwinner,sun8i-h3-hdmi-phy";
> >> >> +                     reg = <0x01ef0000 0x10000>;
> >> >> +                     clocks = <&ccu CLK_BUS_HDMI>, <&ccu CLK_HDMI_DDC>,
> >> >> +                              <&ccu CLK_PLL_VIDEO1>;
> >> >
> >> > You were discussing that the PLL0 could also be used to clock the PHY,
> >> > has that been figured out?
> >>
> >> This is what I understand from Fig: 3-3. Module Clock Diagram, both
> >> tcon0 and tcon1 are using HDMI. I'm thinking based on the tcon
> >> configuration we need use proper PLL or some logic to get common PLL
> >> don't know yet. Since this series adding tcon1 I've attached PLL1.
> >
> > You're not describing the TCON node here though, but the HDMI one, and
> > the HDMI block is listed in both the PLL video 0 and 1.
> 
> So how can we attach particular PLL with particular HDMI(PLL0 to HDMI0
> and so-on) or do we need to attached both the PLL's any suggestion?

I'm not sure what your question is here, just add the possibility to
have an extra PLL if that makes sense to the binding.

Maxime

-- 
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--v7lac66a75aajndc--
