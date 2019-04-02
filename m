From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v8 02/15] drm/sun4i: tcon: Compute DCLK
 dividers based on format, lanes
Date: Tue, 2 Apr 2019 19:03:39 +0530
Message-ID: <CAMty3ZD7yPg9hJNw9Yy1SYKPMPsmt3n1PD6PkyE9KJNpcTyZVA@mail.gmail.com>
References: <20190311133637.18334-1-jagan@amarulasolutions.com>
 <20190311133637.18334-3-jagan@amarulasolutions.com> <20190311153847.oz6ruqmptaq2befn@flea>
 <CAMty3ZChz=s7gdQyX9KnsAp1t5FrpouXGK74-r0SKJ89yJN67Q@mail.gmail.com>
 <20190319105307.omowzyhqu33e3pzy@flea> <CAMty3ZCjTLLw+zAfPKD3qZx_o9yti4MD0XL0Ve7VG1_6ToJ=pg@mail.gmail.com>
Reply-To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7MFH7A7EEBBP6JRXSQKGQEEQVIYPY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAMty3ZCjTLLw+zAfPKD3qZx_o9yti4MD0XL0Ve7VG1_6ToJ=pg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Maxime,

On Thu, Mar 21, 2019 at 7:40 PM Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> wrote:
>
> On Tue, Mar 19, 2019 at 4:23 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> >
> > On Mon, Mar 11, 2019 at 09:36:27PM +0530, Jagan Teki wrote:
> > > On Mon, Mar 11, 2019 at 9:08 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> > > >
> > > > On Mon, Mar 11, 2019 at 07:06:24PM +0530, Jagan Teki wrote:
> > > > > pll-video => pll-mipi => tcon0 => tcon0-pixel-clock is the typical
> > > > > MIPI clock topology in Allwinner DSI controller.
> > > > >
> > > > > TCON dotclock driver is computing the desired DCLK divider based on
> > > > > panel pixel clock along with input DCLK min, max divider values from
> > > > > tcon driver and that would eventually set the pll-mipi clock rate.
> > > > >
> > > > > The current code allows the TCON clock divider to have a default 4
> > > > > for min, max ranges that would fail to compute the desired pll-mipi
> > > > > rate while supporting new panels.
> > > > >
> > > > > So, add the computation logic 'format/lanes' to dclk min and max dividers
> > > > > and instead of default 4. This computation logic align with Allwinner A64
> > > > > BSP, hoping that would work even for A33.
> > > >
> > > > Last time we discussed this, we found out that this wasn't the case,
> > > > even in the BSP.
> > >
> > > This was the case for BSP to compute pll-mipi not for TCON_DSI clock
> > > register, SUN4I_TCON0_DCLK_REG, which marked the divider 4 by default.
> > >
> > > > What compelling evidence have you found that makes you say otherwise?
> > >
> > > divider 4 isn't worked, this I would mentioned before as well.
> >
> > Maybe you mentionned it before, but it's nowhere to be found in your
> > commit log.
>
> I have added it in 3rd paragraph in commit message, may be you missed
> it or you may look for different text.
>
> "The current code allows the TCON clock divider to have a default 4
> for min, max ranges that would fail to compute the desired pll-mipi
> rate while supporting new panels."
>
> >
> > > Tested this on 4 different panels, and below are the desired divider values
> > > and pll-mipi clock rate with respect to pixel clock frequency.
> > >
> > > - 55MHz pixel clock with 4-lane panel, and the desired DSI clock divider
> > >   is 6 with the output parent clock rate of 330MHz.
> > > - 30MHz pixel clock with 4-lane panel, and the desired DSI clock divider
> > >   is 6 with parent clock rate of 180MHz.
> > > - 27.5Mhz pixel clock with 2-lane pane, and the desired DSI clock divider
> > >   is 12 with the output parent clock rate of 330MHz.
> > > - 147MHz pixel clock with 4-lane panel, and the desired DSI clock divider
> > >   is 6 with the output parent clock rate of 882MHz.
> > >
> > > BSP trying to use this format/lane to compute dsi divider that in-turn
> > > using pll-mipi set_rate but TCON0_DCLK_REG keep constant 4.
> >
> > Feel free to reply to
> > http://lists.infradead.org/pipermail/linux-arm-kernel/2019-February/629596.html
>
> Yes, I have replied at that time itself, please check.
>
> http://lists.infradead.org/pipermail/linux-arm-kernel/2019-February/629673.html
>
> Here I have taken the pixel clock to 30Mhz for example in Bananapi
> panel, and the above gist the pixel is 148Mhz from another panel.

Any further comments?
