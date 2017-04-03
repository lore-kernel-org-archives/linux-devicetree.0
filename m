From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 6/15] dt-bindings: display: sun4i: Add HDMI
 display bindings
Date: Mon, 3 Apr 2017 22:59:53 +0200
Message-ID: <20170403205953.vdf5ynyvktpiheax@lukather>
References: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard@free-electrons.com>
 <f1d46b79f933df724a6750d557ebe9517b6339b5.1488876832.git-series.maxime.ripard@free-electrons.com>
 <20170315172622.lb6vy7cmbwaf7crn@rob-hp-laptop>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vy7wvwz2minz7rwk"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBSXPRLDQKGQEZGHUC2I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170315172622.lb6vy7cmbwaf7crn@rob-hp-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--vy7wvwz2minz7rwk
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi Rob,

On Wed, Mar 15, 2017 at 12:26:22PM -0500, Rob Herring wrote:
> > +HDMI Encoder
> > +------------
> > +
> > +The HDMI Encoder supports the HDMI video and audio outputs, and does
> > +CEC. It is one end of the pipeline.
> > +
> > +Required properties:
> > +  - compatible: value must be one of:
> > +    * allwinner,sun5i-a10s-hdmi
> > +  - reg: base address and size of memory-mapped region
> > +  - clocks: phandles to the clocks feeding the HDMI encoder
> > +    * ahb: the HDMI interface clock
> > +    * mod: the HDMI module clock
> > +    * pll-0: the first video PLL
> > +    * pll-1: the second video PLL
> > +  - clock-names: the clock names mentioned above
> > +
> > +  - ports: A ports node with endpoint definitions as defined in
> > +    Documentation/devicetree/bindings/media/video-interfaces.txt. The
> > +    first port should be the input endpoint.
> 
> You need an output port to an HDMI connector node and an audio port.

I started to look at the audio, and I can't find a use for an audio
port in the OF graph. As far as I understand, we will be using the
hdmi-codec, that still requires an ASoC card to create the link
between our i2s controller and the HDMI controller.

This work perfectly for us, but as far as I know, the simple-card
stuff only requires a phandle, and not an OF graph endpoint, right?

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--vy7wvwz2minz7rwk--
