From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 07/27] dt-bindings: clock: sun8i-de2: Add H6
 DE3 clock description
Date: Tue, 4 Sep 2018 17:05:16 +0800
Message-ID: <CAGb2v67udJ1_668Q4MFb3MbEQXzukNBKtEu3FYHsw+QyVA9J2Q@mail.gmail.com>
References: <20180902072643.4917-1-jernej.skrabec@siol.net>
 <20180902072643.4917-8-jernej.skrabec@siol.net> <CAGb2v65AsKzEH3AgmQi+RRvVa6AO-cpAckGnNkvWwONsCCsoxw@mail.gmail.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBXEVXHOAKGQEVRH2PKI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v65AsKzEH3AgmQi+RRvVa6AO-cpAckGnNkvWwONsCCsoxw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 4, 2018 at 4:59 PM Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
>
> Hi,
>
> On Sun, Sep 2, 2018 at 3:27 PM Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org> wrote:
> >
> > This commit adds necessary description and dt includes for H6 DE3 clock.
> > It is very similar to others, but memory region has some additional
> > registers not found in DE2.
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/clock/sun8i-de2.txt | 5 +++--
> >  include/dt-bindings/clock/sun8i-de2.h                 | 3 +++
> >  include/dt-bindings/reset/sun8i-de2.h                 | 1 +
> >  3 files changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/sun8i-de2.txt b/Documentation/devicetree/bindings/clock/sun8i-de2.txt
> > index e94582e8b8a9..41a52c2acffd 100644
> > --- a/Documentation/devicetree/bindings/clock/sun8i-de2.txt
> > +++ b/Documentation/devicetree/bindings/clock/sun8i-de2.txt
> > @@ -1,5 +1,5 @@
> > -Allwinner Display Engine 2.0 Clock Control Binding
> > ---------------------------------------------------
> > +Allwinner Display Engine 2.0/3.0 Clock Control Binding
> > +------------------------------------------------------
> >
> >  Required properties :
> >  - compatible: must contain one of the following compatibles:
> > @@ -8,6 +8,7 @@ Required properties :
> >                 - "allwinner,sun8i-v3s-de2-clk"
> >                 - "allwinner,sun50i-a64-de2-clk"
> >                 - "allwinner,sun50i-h5-de2-clk"
> > +               - "allwinner,sun50i-h6-de3-clk"
> >
> >  - reg: Must contain the registers base address and length
> >  - clocks: phandle to the clocks feeding the display engine subsystem.
> > diff --git a/include/dt-bindings/clock/sun8i-de2.h b/include/dt-bindings/clock/sun8i-de2.h
> > index 3bed63b524aa..7768f73b051e 100644
> > --- a/include/dt-bindings/clock/sun8i-de2.h
> > +++ b/include/dt-bindings/clock/sun8i-de2.h
> > @@ -15,4 +15,7 @@
> >  #define CLK_MIXER1             7
> >  #define CLK_WB                 8
> >
> > +#define CLK_BUS_ROT            9
> > +#define CLK_ROT                        10
> > +
> >  #endif /* _DT_BINDINGS_CLOCK_SUN8I_DE2_H_ */
> > diff --git a/include/dt-bindings/reset/sun8i-de2.h b/include/dt-bindings/reset/sun8i-de2.h
> > index 9526017432f0..1c36a6ac86d6 100644
> > --- a/include/dt-bindings/reset/sun8i-de2.h
> > +++ b/include/dt-bindings/reset/sun8i-de2.h
> > @@ -10,5 +10,6 @@
> >  #define RST_MIXER0     0
> >  #define RST_MIXER1     1
> >  #define RST_WB         2
> > +#define RST_ROT                3
>
> Looking at the DE 2.0 register guide, the "Rotate" related fields are also
> found on the A83T. So this is not DE 3.0 specific. And you could also have
> the H6 DE3 compatible fall back to the A83T for the common parts.

I take that back. The A83T has a different clock tree structure because it
lacks the DE mod clock, so it's not compatible.

> ChenYu
>
> >
> >  #endif /* _DT_BINDINGS_RESET_SUN8I_DE2_H_ */
> > --
> > 2.18.0
> >
