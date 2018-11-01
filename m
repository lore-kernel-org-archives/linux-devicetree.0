From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH 5/7] arm64: allwinner: h6: Add RTC node
Date: Thu, 1 Nov 2018 14:32:34 +0530
Message-ID: <CAMty3ZBJiDrr0hqgzMMQ76R7=+agsHyjYQGTrebH=_q5Ax2xXA@mail.gmail.com>
References: <20181031183634.29640-1-jagan@amarulasolutions.com>
 <20181031183634.29640-5-jagan@amarulasolutions.com> <CAGb2v64fnpCh_rCy-9m8xgXmAZQGab1==f7cr332QfgueyuRNw@mail.gmail.com>
 <CAMty3ZAW5KndyJj81obK49MKczdbk4SoUncmiiE_OhH1g7qFUA@mail.gmail.com> <CAGb2v67WZmG7qPqf_UoR4v=Zm2AbS8pcOQsWJPRVHr-i2NvRPA@mail.gmail.com>
Reply-To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7MFH7A7EEBBN4C5PPAKGQELDWQJJA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v67WZmG7qPqf_UoR4v=Zm2AbS8pcOQsWJPRVHr-i2NvRPA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 1, 2018 at 1:23 PM Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
>
> On Thu, Nov 1, 2018 at 3:33 PM Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> wrote:
> >
> > On Thu, Nov 1, 2018 at 8:25 AM Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> > >
> > > On Thu, Nov 1, 2018 at 2:37 AM Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> wrote:
> > > >
> > > > From: Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
> > > >
> > > > RTC controller is similar to A31, so use the same compatible
> > > > for H6 and update interrupt numbers as per manual.
> > >
> > > No. Unfortunately they are not that compatible. The A31 does not have
> > > the RTC clock output. So everyone got it wrong. :( Plus the clock rate
> > > of the internal RC oscillator varies between SoCs. I'm working on a
> > > series of patches to correct this. Stay tuned.
> >
> > 4 bit, EXT_LOSC_EN of LOSC_CTRL_REG (0x00) seem available in H6. I can
> > see external clock working with WIFI for A31 compatible.
>
> That bit turns on the external crystal, i.e. X32KIN and X32KOUT pins.

This is what I confused, the same signal pins available there in A64
schematics but no bit to enable external OSC in LOSC_CTRL_REG.

But the X32KFOUT pin which is 0x60 , BIT(0) is enabled in A64, H6 w/o
this LOSC_CTRL_REG which I don't know exactly or may be feed it by
default not sure.

>
> I'm talking about the X32KFOUT pin, which feeds the WiFi module the
> LPO clock in typical Allwinner designs. That is controlled by register
> 0x60, and is not present on the A31. That is the clock you say is
> working. You have the two confused.
>
> The clock tree looks like this:
>
> IOSC -----------------------------\
>                                    SUN6I_LOSC_CTRL_EXT_OSC mux ---->
> LOSC --> (to CCU)
> 32k crystal --> EXT_LOSC_EN gate -/                              \
>                                                                   \
>                                                                   /
>       (to WiFi) <-- X32KFOUT pin <-- LOSC_OUT_GATING_EN gate <---/

Yes, I understand this. But for A33, A64 there is no EXT_LOSC_EN which
is directly feed to WIFI from LOSC as per manual but from schematic
signals X32KI and X32KO were present.

>
> The bottom part does not exist in the A31. Meanwhile we've been claiming that
> all later RTC modules that actually have that part are compatible with the A31.
> Also the IOSC part has different clock rates for different chips.
>
> Do you see the problem?

>From external crystal point of view, between A33, A64 vs H6 I only see
the difference in EXT_LOSC_EN external oscillator enable bit only
available in H6 manual.

Regarding, rtc-sun6i. we can manage the external clock stuff via
"clock-output-names" with rtc->ext_losc and mentioning external
oscillator outputs on DTSI. since A31, don't have external clock to
wifi then we can skip those properties.

What do you think?
