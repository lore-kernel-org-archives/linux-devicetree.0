From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 7/15] dt-bindings: display: sun4i: Add
 allwinner,tcon-channel property
Date: Sun, 26 Mar 2017 23:11:22 +0200
Message-ID: <20170326211122.ofbl4z25imyyyn3f@lukather>
References: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard@free-electrons.com>
 <46fdec2d680d539652f87d79c627973b3a568438.1488876832.git-series.maxime.ripard@free-electrons.com>
 <20170315173753.6zywfxapdczu2i34@rob-hp-laptop>
 <CAGb2v67A2T4KeLBttAGLKoo7igBTnQH+5yxN-jJo1k7Ewfd9mQ@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zyqbyw7y52pdpduq"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB5FC4PDAKGQEM2BTNZA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAGb2v67A2T4KeLBttAGLKoo7igBTnQH+5yxN-jJo1k7Ewfd9mQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--zyqbyw7y52pdpduq
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Fri, Mar 17, 2017 at 11:34:45AM +0800, Chen-Yu Tsai wrote:
> On Thu, Mar 16, 2017 at 1:37 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > On Tue, Mar 07, 2017 at 09:56:26AM +0100, Maxime Ripard wrote:
> >> The Allwinner Timings Controller has two, mutually exclusive, channels.
> >> When the binding has been introduced, it was assumed that there would be
> >> only a single user per channel in the system.
> >>
> >> While this is likely for the channel 0 which only connects to LCD displays,
> >> it turns out that the channel 1 can be connected to multiple controllers in
> >> the SoC (HDMI and TV encoders for example). And while the simultaneous use
> >> of HDMI and TV outputs cannot be achieved, switching from one to the other
> >> at runtime definitely sounds plausible.
> >>
> >> Add an extra property, allwinner,tcon-channel, to specify for a given
> >> endpoint which TCON channel it is connected to, while falling back to the
> >> previous mechanism if that property is missing.
> >
> > I think perhaps TCON channels should have been ports rather than
> > endpoints. The fact that the channels are mutually exclusive can be
> > handled in the driver and doesn't really matter in the binding. How
> > painful would it be to rework things to move TCON channel 1 from port 0,
> > endpoint 1 to port 1?
> 
> Having a separate output port for channel 1 was one option we discussed.
> However it wouldn't work well with the kernel's of_graph based crtc
> detection (drm_of_find_possible_crtcs / drm_of_find_possible_crtcs),
> which has the crtcs bound via the output port. As the logic is used
> by multiple drivers, I'm not sure it's easy to rework or test.

Can't we use a different logic than drm_of_find_possible_crtcs to fill
the same role?

> Also, we still have to support old device trees using channel 1 from
> output port 0 endpoint 1. This is the TV encoder on sun5i (A10s/A13/R8).

We could probably work something out if we go that way to deal with
old DTs though.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--zyqbyw7y52pdpduq--
