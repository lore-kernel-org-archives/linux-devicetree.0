From: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Re: [PATCH v3 17/25] dt-bindings: panel: Add
 Bananapi S070WV20-CT16 ICN6211 MIPI-DSI to RGB bridge
Date: Wed, 7 Nov 2018 21:20:03 +1100
Message-ID: <CAGRGNgX0eWUEzBUU0H_NRJitQmOgF1PxZP0BgQV+OMcDDuVVhA@mail.gmail.com>
References: <20181026144344.27778-1-jagan@amarulasolutions.com>
 <CGME20181029111305epcas5p2ee0ca644470de4e036762e000afbb71b@epcas5p2.samsung.com>
 <20181026144344.27778-18-jagan@amarulasolutions.com> <3c4c8a08-8c1e-1ac6-2b53-81389d69c97b@samsung.com>
 <CAGb2v66ENhmNXPz4PfdRJjNUNdpDNZYX2a3SH8AD6SMe9g2zLA@mail.gmail.com>
 <CAGRGNgWUpaG6W92CDBy7XCun10-TnPggTgY=iZ_4dg4E1cM7ew@mail.gmail.com> <CAMty3ZA7bWiJa0GVZbf3jDK+YSjJF8om6WuszeU6TX6rk+EZ1Q@mail.gmail.com>
Reply-To: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQIP76OUQLBBYPYRLPQKGQEISJNQGI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAMty3ZA7bWiJa0GVZbf3jDK+YSjJF8om6WuszeU6TX6rk+EZ1Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, jernej.skrabec-gGgVlfcn5nU@public.gmane.org, Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, "open list:COMMON CLK FRAMEWORK" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Nazzareno Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, "Mailing List, Arm" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jagan,

On Wed, Nov 7, 2018 at 5:13 AM Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> wrote:
>
> On Wed, Oct 31, 2018 at 2:46 PM Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >
> > Hi Jagan,
> >
> > On Wed, Oct 31, 2018 at 7:58 PM Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> > >
> > > On Wed, Oct 31, 2018 at 4:53 PM Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> > > >
> > > > On 26.10.2018 16:43, Jagan Teki wrote:
> > > > > Bananapi S070WV20-CT16 ICN6211 is 800x480, 4-lane MIPI-DSI to RGB
> > > > > bridge panel, which is available on same PCB with 24-bit RGB interface.
> > > > >
> > > > > So, this patch adds DSI specific binding details on existing
> > > > > dt-bindings file.
> > > > >
> > > > > Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> > > > > ---
> > > > > Changes for v3:
> > > > > - Use existing binding doc and update dsi details
> > > > > Changes for v2:
> > > > > - none
> > > > >
> > > > >  .../display/panel/bananapi,s070wv20-ct16.txt  | 31 +++++++++++++++++--
> > > > >  1 file changed, 29 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.txt b/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.txt
> > > > > index 35bc0c839f49..b7855dc7c66f 100644
> > > > > --- a/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.txt
> > > > > +++ b/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.txt
> > > > > @@ -1,12 +1,39 @@
> > > > >  Banana Pi 7" (S070WV20-CT16) TFT LCD Panel
> > > > >
> > > > > +S070WV20-CT16 is 7" 800x480 panel connected through a 24-bit RGB interface.
> > > > > +
> > > > > +Depending on the variant, the PCB attached to the panel module either
> > > > > +supports DSI, or DSI + 24-bit RGB. DSI is converted to 24-bit RGB via
> > > > > +an onboard ICN6211 MIPI DSI - RGB bridge chip, then fed to the panel
> > > > > +itself
> > > >
> > > > As I understand this is display board, which contains 'pure' RGB panel
> > > > S070WV20-CT16 and optionally ICN6211 DSI->RGB bridge.
> > > > These are separate devices, just connected by vendor to simplify its
> > > > assembly. Why don't you create then bridge driver for ICN6211 and RGB
> > > > panel driver for S070WV20-CT16 - it looks more generic.
> > > > Then you can describe both in dts and voila.
> > > > Creating drivers for every combo of devices (panel + bridge), just
> > > > because some vendor sells them together seems incorrect - we have
> > > > devicetree for it.
> > >
> > > Rob suggested this, and also the opposite: using the same
> > > "bananapi,s070wv20-ct16"
> > > compatible string for both types of connections, and have the driver deal with
> > > detecting the bus type.
> > >
> > > The thing about the bridge chip is that there's no available datasheet that
> > > describes all the parts of the init sequence, in fact none at all. I managed
> > > to work out some bits, but the others remain a mystery and must be hard-coded
> > > to match the panel. That would work against having a generic bridge driver.
> >
> > To me it seems logical that we'd model it as another step in the graph
> > between the DSI component and the panel. It's conceivable that some
> > other manufacturer will probably buy these for their panels and having
> > a somewhat generic driver seems vaguely future proof to me.
> >
> > As I see it, the weird init process belongs to the bridge chip and the
> > timings belong to the panel and we shouldn't "confuse" them by giving
> > them the same compatible.
>
> But the problem here is due to lack of information about the panel,
> the init process command opcode data values seem to based on the panel
> timings values. This look weird and ie reason for going into separate
> panel driver with different compatible.

I'd missed that particular wrinkle.

In that case, it makes sense to produce a panel driver with the bridge
chip's compatible.

Thanks,

-- 
Julian Calaby

Email: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Profile: http://www.google.com/profiles/julian.calaby/
