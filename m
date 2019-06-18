From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [linux-sunxi] Re: [PATCH v2 5/9] drm/sun4i: tcon_top: Register
 clock gates in probe
Date: Tue, 18 Jun 2019 12:42:23 +0530
Message-ID: <CAMty3ZA0J+2fSRwX+tS-waJDLMyTOf6UY_1pHjXe0qOk5QuzrQ@mail.gmail.com>
References: <20190614164324.9427-1-jagan@amarulasolutions.com>
 <20190614164324.9427-6-jagan@amarulasolutions.com> <20190617114503.pclqsf6bo3ih47nt@flea>
 <CAGb2v66RU=m0iA9VoBiYbake+mDoiiGcd5gGGXvNCBjhY2n+Dw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGb2v66RU=m0iA9VoBiYbake+mDoiiGcd5gGGXvNCBjhY2n+Dw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>, Michael Trimarchi <michael@amarulasolutions.com>, linux-sunxi <linux-sunxi@googlegroups.com>, linux-amarula <linux-amarula@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 17, 2019 at 6:31 PM Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Mon, Jun 17, 2019 at 7:45 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
> > On Fri, Jun 14, 2019 at 10:13:20PM +0530, Jagan Teki wrote:
> > > TCON TOP have clock gates for TV0, TV1, dsi and right
> > > now these are register during bind call.
> > >
> > > Of which, dsi clock gate would required during DPHY probe
> > > but same can miss to get since tcon top is not bound at
> > > that time.
> > >
> > > To solve, this circular dependency move the clock gate
> > > registration from bind to probe so-that DPHY can get the
> > > dsi gate clock on time.
> >
> > It's not really clear to me what the circular dependency is?
> >
> > if you have a chain that is:
> >
> > tcon-top +-> DSI
> >          +-> D-PHY
> >
> > There's no loop, right?
>
> Looking at how the DTSI patch structures things (without going into
> whether it is correct or accurate):
>
> The D-PHY is not part of the component graph. However it requests
> the DSI gate clock from the TCON-TOP.
>
> The TCON-TOP driver, in its current form, only registers the clocks
> it provides at component bind time. Thus the D-PHY can't successfully
> probe until the TCON-TOP has been bound.
>
> The DSI interface requires the D-PHY to bind. It will return -EPROBE_DEFER
> if it cannot request it. This in turn goes into the error path of
> component_bind_all, which unbinds all previous components.
>
> So it's actually
>
>     D-PHY -> TCON-TOP -> DSI
>       ^                   |
>       |--------------------
>
> I've not checked, but I suspect there's no possibility of having other
> drivers probe (to deal with deferred probing) within component_bind_all.
> Otherwise we shouldn't run into this weird circular dependency issue.
>
> So the question for Jagan is that is this indeed the case? Does this
> patch solve it, or at least work around it.

Yes, this is what I was mentioned in initial version, since the "dsi"
gate in tcon top is registering during bind, the dphy of dsi
controller won't get the associated clock for "mod" so it is keep on
returning -EPROBE_DEFER. By moving the clock gate registration to
probe, everything bound as expected.
