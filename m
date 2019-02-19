From: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 10/11] drm/panel: simple: Add NewEast
 Optoelectronics CO., LTD WJFH116008A panel support
Date: Tue, 19 Feb 2019 13:35:26 -0800
Message-ID: <CA+E=qVcmLnr9sL7UjG2PSC0Ji5PhW=xOLQHGvRUG3yMMZW1hnw@mail.gmail.com>
References: <20190215050957.20755-1-anarsoul@gmail.com> <20190215050957.20755-11-anarsoul@gmail.com>
 <20190218183301.GA5480@bogus> <CA+E=qVcdDQJvssZgu23gM_gKvz2G5GAWcmjFBokE_V=WGJ4h6A@mail.gmail.com>
 <CAL_Jsq+pyAd_kMMz+yKjqY=asAi1X1XguM58VjfVhPwD-xi-2w@mail.gmail.com>
Reply-To: anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDV3B667TUHBBOHNWHRQKGQEKC67KLA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAL_Jsq+pyAd_kMMz+yKjqY=asAi1X1XguM58VjfVhPwD-xi-2w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-linux <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 19, 2019 at 6:54 AM Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> > I believe using eDP connector binding wouldn't help much in my case
> > and it won't improve accuracy of hardware description while adding
> > unnecessary code duplication (edp-connector will be pretty much
> > simple-panel).
> >
> > Since currently there're no standalone connector drivers, implementing
> > one requires significant refactoring of the code that I'm not
> > familiar.
>
> I'm not talking about drivers. I'm talking about bindings. Those are
> not necessarily 1-1. There's no reason the simple panel driver can't
> have an 'edp-connector' entry.

These aren't independent things. Bindings are useless without drivers.

Also how are you going to address mainlined platforms that have eDP
and use panel bindings? E.g. rk3399 supports eDP and uses panel
binding - see rk3399-gru-kevin.dts as example.

> Also, since you have EDID, you should be using that for timing data
> IMO, and the binding needs to have enough information to support that.
> It may if DP-aux comes from the bridge chip or it may not if you need
> to describe that connection. Again, this is independent from what
> Linux chooses to do. If Linux chooses to have its own timing
> information that's its choice. Another OS may choose to use EDID.

I see nothing wrong here - anx6345 driver reads EDID (over AUX) and
uses timing from it, if reading EDID failed it fallback to timings
defined in panel driver.

> Rob
