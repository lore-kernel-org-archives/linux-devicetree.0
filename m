From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v7 00/23] drm/sun4i: Allwinner A64 MIPI-DSI support
Date: Fri, 1 Feb 2019 21:21:43 +0530
Message-ID: <CAMty3ZABvrb+Eu8D7uiGvBALRetnphsRg-RennRSNH5-_q-9bw@mail.gmail.com>
References: <20190201154232.10505-1-jagan@amarulasolutions.com> <20190201154858.z6xqdaxccxya2wqr@flea>
Reply-To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7MFH7A7EEBBG6W2HRAKGQEVRAREEY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190201154858.z6xqdaxccxya2wqr@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 1, 2019 at 9:19 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
>
> On Fri, Feb 01, 2019 at 09:12:09PM +0530, Jagan Teki wrote:
> > Here is next version changes for Allwinner A64 MIPI-DSI support
> >
> > This series grouped the changes like previous version[1] with different
> > sets to support three different panels types that can fit into the DSI
> > controller.
> >
> > set:1, for 4-lane, burst mode support
> > - patch 0001: 0009, DSI controller changes that support burst mode.
> >
> > set:2, for A64 DSI support
> > - patch 0010: tcon dclk divider computation based on A64 BSP.
> > - patch 0011: 0017, Allwinner A64 DSI controller changes.
> >
> > set:3, enable 4-lane burst mode panel:
> > - patch 0018: Overlay patch that enable Feiyang FY07024DI26A30-D
> >   burst mode panel on Pine64-LTS
> >
> > set:4, enable 4-lane video mode panel:
> > - patch 0019: msg type MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM support
> > - patch 0020: Overlay patch that enable Bananapi S070WV20-CT16 ICN6211
> >   panel on Bananapi M64
> >
> > set:5, enable 2-lane video mode panel:
> > - patch 0021, 0022: DSI hfp and hbp timings fixes
> > - patch 0023: Enable Techstar TS8550B panel on Amarula A64-Relic
>
> You do realise that pushing through a series while the previous
> version's discussion hasn't settled yet will not get you anywhere,
> right?

Except the clock, I made few changes with your previous comments. Yes
we can still under clock discussion page, no issues on that. just to
group the remaining patches to finalize if any issues on those.
