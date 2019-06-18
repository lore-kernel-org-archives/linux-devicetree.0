From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: Re: [PATCH v2 5/9] drm/sun4i: tcon_top: Register
 clock gates in probe
Date: Tue, 18 Jun 2019 15:23:41 +0800
Message-ID: <CAGb2v64htYr+iRUnLx0hKkqCtYa0GbzZJEvb-ViyJFAYzU1sig@mail.gmail.com>
References: <20190614164324.9427-1-jagan@amarulasolutions.com>
 <20190614164324.9427-6-jagan@amarulasolutions.com> <20190617114503.pclqsf6bo3ih47nt@flea>
 <CAGb2v66RU=m0iA9VoBiYbake+mDoiiGcd5gGGXvNCBjhY2n+Dw@mail.gmail.com> <CAMty3ZA0J+2fSRwX+tS-waJDLMyTOf6UY_1pHjXe0qOk5QuzrQ@mail.gmail.com>
Reply-To: wens-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBC5DULUAKGQEV36Z66Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAMty3ZA0J+2fSRwX+tS-waJDLMyTOf6UY_1pHjXe0qOk5QuzrQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-amarula <linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 18, 2019 at 3:12 PM Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> wrote:
>
> On Mon, Jun 17, 2019 at 6:31 PM Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> >
> > On Mon, Jun 17, 2019 at 7:45 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> > >
> > > On Fri, Jun 14, 2019 at 10:13:20PM +0530, Jagan Teki wrote:
> > > > TCON TOP have clock gates for TV0, TV1, dsi and right
> > > > now these are register during bind call.
> > > >
> > > > Of which, dsi clock gate would required during DPHY probe
> > > > but same can miss to get since tcon top is not bound at
> > > > that time.
> > > >
> > > > To solve, this circular dependency move the clock gate
> > > > registration from bind to probe so-that DPHY can get the
> > > > dsi gate clock on time.
> > >
> > > It's not really clear to me what the circular dependency is?
> > >
> > > if you have a chain that is:
> > >
> > > tcon-top +-> DSI
> > >          +-> D-PHY
> > >
> > > There's no loop, right?
> >
> > Looking at how the DTSI patch structures things (without going into
> > whether it is correct or accurate):
> >
> > The D-PHY is not part of the component graph. However it requests
> > the DSI gate clock from the TCON-TOP.
> >
> > The TCON-TOP driver, in its current form, only registers the clocks
> > it provides at component bind time. Thus the D-PHY can't successfully
> > probe until the TCON-TOP has been bound.
> >
> > The DSI interface requires the D-PHY to bind. It will return -EPROBE_DEFER
> > if it cannot request it. This in turn goes into the error path of
> > component_bind_all, which unbinds all previous components.
> >
> > So it's actually
> >
> >     D-PHY -> TCON-TOP -> DSI
> >       ^                   |
> >       |--------------------
> >
> > I've not checked, but I suspect there's no possibility of having other
> > drivers probe (to deal with deferred probing) within component_bind_all.
> > Otherwise we shouldn't run into this weird circular dependency issue.
> >
> > So the question for Jagan is that is this indeed the case? Does this
> > patch solve it, or at least work around it.
>
> Yes, this is what I was mentioned in initial version, since the "dsi"
> gate in tcon top is registering during bind, the dphy of dsi
> controller won't get the associated clock for "mod" so it is keep on
> returning -EPROBE_DEFER. By moving the clock gate registration to
> probe, everything bound as expected.

I believe you failed to mention the DSI block, which is the part that
completes the circular dependency. Don't expect others to have full
awareness of the context. You have to provide it in your commit log.

ChenYu
