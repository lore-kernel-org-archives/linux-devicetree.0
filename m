From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v4 03/26] clk: sunxi-ng: Add check for
 maximum rate to NKM PLLs
Date: Tue, 20 Nov 2018 17:37:11 +0530
Message-ID: <CAMty3ZAbF8rPsmvXdLPQJfHL7bzeQyL0Psii9gyDiHaZW-UaMg@mail.gmail.com>
References: <20181113111633.20189-1-jagan@amarulasolutions.com>
 <20181113111633.20189-4-jagan@amarulasolutions.com> <20181113132658.niwy6bqdqzaeqpv2@flea>
 <CAMty3ZBTaeMBFYwyJ+8HqHBDAfEOPEYBt01jho1H4c3SBKbvEw@mail.gmail.com> <20181120105557.3mysirc3ga2h2334@flea>
Reply-To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7MFH7A7EEBB7HRZ7PQKGQEXFRHRWI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181120105557.3mysirc3ga2h2334@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 20, 2018 at 4:26 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
>
> On Thu, Nov 15, 2018 at 08:51:04PM +0530, Jagan Teki wrote:
> > > >  drivers/clk/sunxi-ng/ccu_nkm.c | 3 +++
> > > >  drivers/clk/sunxi-ng/ccu_nkm.h | 1 +
> > > >  2 files changed, 4 insertions(+)
> > > >
> > > > diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nkm.c
> > > > index 6b5ad990f802..b8b66cdd30bf 100644
> > > > --- a/drivers/clk/sunxi-ng/ccu_nkm.c
> > > > +++ b/drivers/clk/sunxi-ng/ccu_nkm.c
> > > > @@ -128,6 +128,9 @@ static unsigned long ccu_nkm_round_rate(struct ccu_mux_internal *mux,
> > > >       if (rate < nkm->min_rate)
> > > >               return nkm->min_rate;
> > > >
> > > > +     if (nkm->max_rate && rate > nkm->max_rate)
> > > > +             return nkm->max_rate;
> > > > +
> > >
> > > I would expect the test to be the same for the minimum and maximum cases.
> >
> > I don't have proper use-case for max rate test, I do verify by using
> > higher the rate on dclock, but nor sure.  May be I can skip the
> > max_rate patch?
>
> So you're sending more patches that you haven't really tested?

I didn't understand this question.

> Why are you sending them then?

I think I've mentioned in the first version patch itself, since it's
common code and many other callers might have used for rate
alternative I did it how other ccu dividers does. I have not added
just as simple.
>
> > Apart from this, any idea about this issue where SUN4I_TCON0_DCLK_REG
> > will only work with div upto 6 on A64 DSI panels[1], did you find the
> > same issue on A33?
>
> IIRC my panel was falling into the case where the divider was 4, so
> I've not fallen into that case.

OK, thanks.
