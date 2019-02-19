From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 10/11] drm/panel: simple: Add NewEast
 Optoelectronics CO., LTD WJFH116008A panel support
Date: Tue, 19 Feb 2019 08:54:36 -0600
Message-ID: <CAL_Jsq+pyAd_kMMz+yKjqY=asAi1X1XguM58VjfVhPwD-xi-2w@mail.gmail.com>
References: <20190215050957.20755-1-anarsoul@gmail.com> <20190215050957.20755-11-anarsoul@gmail.com>
 <20190218183301.GA5480@bogus> <CA+E=qVcdDQJvssZgu23gM_gKvz2G5GAWcmjFBokE_V=WGJ4h6A@mail.gmail.com>
Reply-To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDJIP47K7MERBO5RWDRQKGQEETUMEOQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CA+E=qVcdDQJvssZgu23gM_gKvz2G5GAWcmjFBokE_V=WGJ4h6A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-linux <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 18, 2019 at 1:07 PM Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> On Mon, Feb 18, 2019 at 10:33 AM Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> >
> > On Thu, Feb 14, 2019 at 09:09:56PM -0800, Vasily Khoruzhick wrote:
> > > This commit adds support for the NewEast Optoelectronics CO., LTD
> > > WJFH116008A 11.6" 1920x1080 TFT LCD panel.
> > >
> > > Signed-off-by: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > ---
> > >  .../display/panel/neweast,wjfh116008a.txt     |  7 ++++
> > >  drivers/gpu/drm/panel/panel-simple.c          | 39 +++++++++++++++++++
> > >  2 files changed, 46 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/display/panel/neweast,wjfh116008a.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/panel/neweast,wjfh116008a.txt b/Documentation/devicetree/bindings/display/panel/neweast,wjfh116008a.txt
> > > new file mode 100644
> > > index 000000000000..d76579f9f55e
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/panel/neweast,wjfh116008a.txt
> > > @@ -0,0 +1,7 @@
> > > +NewEast Optoelectronics CO., LTD WJFH116008A 11.6" 1920x1080 TFT LCD panel
> > > +
> > > +Required properties:
> > > +- compatible: should be "neweast,wjfh116008a"
> > > +
> > > +This binding is compatible with the simple-panel binding, which is specified
> > > +in simple-panel.txt in this directory.
> >
> > We already established that this goes thru a standard eDP connector. We
> > should describe that and everything associated with it.
>
> I believe using eDP connector binding wouldn't help much in my case
> and it won't improve accuracy of hardware description while adding
> unnecessary code duplication (edp-connector will be pretty much
> simple-panel).
>
> Since currently there're no standalone connector drivers, implementing
> one requires significant refactoring of the code that I'm not
> familiar.

I'm not talking about drivers. I'm talking about bindings. Those are
not necessarily 1-1. There's no reason the simple panel driver can't
have an 'edp-connector' entry.

Also, since you have EDID, you should be using that for timing data
IMO, and the binding needs to have enough information to support that.
It may if DP-aux comes from the bridge chip or it may not if you need
to describe that connection. Again, this is independent from what
Linux chooses to do. If Linux chooses to have its own timing
information that's its choice. Another OS may choose to use EDID.

Rob
