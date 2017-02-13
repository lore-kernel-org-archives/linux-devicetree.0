From: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Subject: Re: [linux-sunxi] Re: [PATCH 2/8] ARM: sun4i: Add display blocks
 for the sun4i dtsi.
Date: Mon, 13 Feb 2017 18:46:45 +0200
Message-ID: <1487004405.20308.3.camel@plaes.org>
References: <20170211174405.28395-1-plaes@plaes.org>
         <20170211174405.28395-3-plaes@plaes.org>
         <20170213091612.d5ifc4oi63xf7boi@lukather>
         <CAGb2v648uAKxpYaU_qhTLAyfe5snW1LG1VWmm+UMLRSQ5a7DKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGb2v648uAKxpYaU_qhTLAyfe5snW1LG1VWmm+UMLRSQ5a7DKg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wens-jdAy2FN1RRM@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2017-02-13 at 17:20 +0800, Chen-Yu Tsai wrote:
> On Mon, Feb 13, 2017 at 5:16 PM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > Hi,
> > 
> > On Sat, Feb 11, 2017 at 07:43:59PM +0200, Priit Laes wrote:
> > > Added basic display pipeline consisting of tcon, display backend
> > > and
> > > frontend blocks.
> > > 
> > > Signed-off-by: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
> > > ---
> > >  arch/arm/boot/dts/sun4i-a10.dtsi | 104
> > > +++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 104 insertions(+)
> > > 
> > > diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi
> > > b/arch/arm/boot/dts/sun4i-a10.dtsi
> > > index ba20b48..70991c9 100644
> > > --- a/arch/arm/boot/dts/sun4i-a10.dtsi
> > > +++ b/arch/arm/boot/dts/sun4i-a10.dtsi
> > > @@ -779,6 +779,45 @@
> > >                       #size-cells = <0>;
> > >               };
> > > 
> > > +             tcon0: lcd-controller@1c0c000 {
> > > +                     compatible = "allwinner,sun5i-a13-tcon";
> > 
> > There's a few bits here and there that need to be setup differently
> > in
> > A10, so you cannot reuse that compatible (same thing for the
> > other).
> > 
> > Also, I'd really like to have all the blocks listed here, and not
> > only
> > the first pipeline. Ideally, on the A10, the two pipelines should
> > be
> > enabled too.
> 
> The display pipeline driver has to be fixed before that can happen
> though. And I haven't started to work on what I proposed yet. Though
> if someone wants to take over I can forward any design plans I have.

Well, my plan was to get at least minimum bits mainlined and then build
additional features on top.

Wens, it would be cool though, if you could share your plans.

Unfortunately I have only single A10 device (with LVDS and mini-HDMI)
but I don't actually have other LVDS-displays I could easily use with
A20 devices (I have CubieTruck and A20-Olinuxino Micro).

Päikest,
Priit :)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
