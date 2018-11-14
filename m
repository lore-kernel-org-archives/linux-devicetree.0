From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v4 25/26] [DO NOT MERGE] arm64: dts:
 allwinner: bananapi-m64: Bananapi S070WV20-CT16 DSI panel
Date: Wed, 14 Nov 2018 16:48:39 +0530
Message-ID: <CAMty3ZAa97_zHTyxfbV+8d7fUMaEuvB_Kg-SYLY42kMEoiJLyA@mail.gmail.com>
References: <20181113111633.20189-1-jagan@amarulasolutions.com>
 <20181113111633.20189-26-jagan@amarulasolutions.com> <20181113122204.337db8b1@donnerap.cambridge.arm.com>
 <CAMty3ZBQXcnU=490KREa=F-qctMtRep9-rrhrPd1UZStnV=hqw@mail.gmail.com>
 <CAGb2v669dkf2qaUDaosJEKSRKpPRVKWszb6BLL2NrAjWwp3t2Q@mail.gmail.com> <CAGb2v64YOV48UwHc8-=jDt2Bp_4mNb3iuyEzj0d+GOQE_oT-Xg@mail.gmail.com>
Reply-To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7MFH7A7EEBBHEJWDPQKGQEICPYURI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v64YOV48UwHc8-=jDt2Bp_4mNb3iuyEzj0d+GOQE_oT-Xg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 14, 2018 at 2:52 PM Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
>
> On Wed, Nov 14, 2018 at 2:58 PM Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> >
> > On Wed, Nov 14, 2018 at 2:31 PM Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> wrote:
> > >
> > > On Tue, Nov 13, 2018 at 5:52 PM Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org> wrote:
> > > >
> > > > On Tue, 13 Nov 2018 16:46:32 +0530
> > > > Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> wrote:
> > > >
> > > > Hi,
> > > >
> > > > > This patch add support for Bananapi S070WV20-CT16 DSI panel to
> > > > > BPI-M64 board.
> > > > >
> > > > > DSI panel connected via board DSI port with,
> > > > > - DC1SW as AVDD supply
> > > >
> > > > Are you sure of that? I don't see anything in the schematic to support
> > > > this. The only power lines that go to the DSI connector are DCDC1 and
> > > > PS. DC1SW is only connected to PortD on the SoC and to the Ethernet PHY.
> > > > Is there anything I miss?
> > >
> > > Thanks for the comment, yes dc1sw is connected in ephy. I have reused
> > > dc1, BSP is attached lcd_power1 to axp81x_dc1sw [1]. I just looking
> > > for someone to comment, may be we can skip this regulator attachment.
> >
> > That seems sketchy. The schematics show the connector has feeds from both
> > the unregulated output IPSOUT (PS) and DCDC1. For designs with RGB LCD
> > panels, we only see the PS feed. Since the LCD panel can be used in either
> > RGB or MIPI DSI mode, I highly suspect the DCDC1 supply feeds the bridge
> > IC.
> >
> > As for DC1SW, this is likely referenced because it provides power to the
> > GPIO lines that are used to control the LCD panel. If you don't provide
> > power, you can't pull them up.
> >
> > While many of us dislike FEX and the new FEX-derived device tree, they
> > do provide some information, such as regulator usage. Note that each
> > regulator output has multiple names, which likely denote specific
> > usages.
> >
> > I've asked BPI for schematics on the bridge board. Hopefully we'll
> > have something in more detail. In the meantime, I suggest leaving
> > this panel out of your next submission, and focus on getting the bulk
> > of the dsi driver and dts changes in first.
>
> I got the schematics, but unfortunately I can't share them publicly.
>
> It looks like VCC-MIPI on the connector is not connected to anything.
> All power is provided from IPSOUT, first through a current limiter IC
> turned on and off by LCD_PWR_EN, and then through some voltage regulators
> to provide the voltages for various parts of the panel, including LCD,
> capacitive touch, and the MIPI-DSI bridge. There's even an onboard EEPROM,
> though I'm not sure what that's for.

So there is no concern supply regulators on panel side, only VCC-DSI.

>
> > >
> > > >
> > > > > - DCDC1 as DVDD supply
> > > >
> > > > That seems right, but doesn't match with what you write below.
> > >
> > > Commit need to fix s/DCDC1/DLDO1
> > >
> > > >
> > > > > - PD6 gpio for reset pin
>
> This toggles reset for both the panel itself and for the MIPI-DSI bridge.
>
> > > > > - PD5 gpio for backlight enable pin
>
> This enables the backlight's regulator.
>
> > > > > - PD7 gpio for backlight vdd supply
>
> This enables power to the whole panel module.
>
> Then you also have the two GPIOs for the capacitive touch controller.
> And also the I2C bus for the controller, and the EEPROM.

Thanks, for the details. I have verified w/ vcc-dsi-supply attached to
dldo1 and the panel with reset w/o any supply regulators.
