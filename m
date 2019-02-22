From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 10/11] drm/panel: simple: Add NewEast
 Optoelectronics CO., LTD WJFH116008A panel support
Date: Fri, 22 Feb 2019 12:37:16 -0600
Message-ID: <20190222183716.GA7627@bogus>
References: <20190215050957.20755-1-anarsoul@gmail.com>
 <20190215050957.20755-11-anarsoul@gmail.com>
 <20190218183301.GA5480@bogus>
 <CA+E=qVcdDQJvssZgu23gM_gKvz2G5GAWcmjFBokE_V=WGJ4h6A@mail.gmail.com>
 <CAL_Jsq+pyAd_kMMz+yKjqY=asAi1X1XguM58VjfVhPwD-xi-2w@mail.gmail.com>
 <CA+E=qVcmLnr9sL7UjG2PSC0Ji5PhW=xOLQHGvRUG3yMMZW1hnw@mail.gmail.com>
Reply-To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDJIP47K7MERBXUCYHRQKGQE4SKJ4XI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CA+E=qVcmLnr9sL7UjG2PSC0Ji5PhW=xOLQHGvRUG3yMMZW1hnw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-linux <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 19, 2019 at 01:35:26PM -0800, Vasily Khoruzhick wrote:
> On Tue, Feb 19, 2019 at 6:54 AM Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> 
> > > I believe using eDP connector binding wouldn't help much in my case
> > > and it won't improve accuracy of hardware description while adding
> > > unnecessary code duplication (edp-connector will be pretty much
> > > simple-panel).
> > >
> > > Since currently there're no standalone connector drivers, implementing
> > > one requires significant refactoring of the code that I'm not
> > > familiar.
> >
> > I'm not talking about drivers. I'm talking about bindings. Those are
> > not necessarily 1-1. There's no reason the simple panel driver can't
> > have an 'edp-connector' entry.
> 
> These aren't independent things. Bindings are useless without drivers.

What I mean is bindings for panels and connectors are basically the same 
thing. The kernel handles them quite differently, but that is a kernel 
design decision independent of bindings. Another client (of DT) may do 
things differently or the kernel may do things differently in the 
future.

There is not any simple panel binding really. This originated I think 
from a 'simple-panel' compatible that was originally attempted. What we 
have is a collection of common properties for panels which panel 
bindings can use. And we have some common panel docs too. I've been 
meaning to clean-up and unify all this. What I'd like is a pool of 
common properties for any connector or panel to use. Then we can define 
what subset any panel or connector use. When there's something standard 
across devices like LVDS modes or eDP connectors, then we can further 
define a subset. It is easiest if these subsets are also encapsulated by 
a compatible string, but that's not required and some times undesirable. 
For the latter, the 'simple-panel' compatible is what I'm thinking of. 
It needs to have a well defined meaning such as following some spec.

> Also how are you going to address mainlined platforms that have eDP
> and use panel bindings? E.g. rk3399 supports eDP and uses panel
> binding - see rk3399-gru-kevin.dts as example.

I'm not.

Supporting eDP and having a standard eDP connector are 2 different 
things. I'd guess chromebooks would do something standard, but I've got 
no idea. Assuming they do, there's nothing to do for existing bindings. 
They are already defined. But I imagine having a 'edp-connector' 
fallback would be helpful to the chromebook folks.

We can easily map a specific binding to a specific or generic driver. So 
if we ever have a generic eDP connector driver, then we could perhaps 
move rk3399-gru-kevin to use that. Kind of depends if it matches 
whatever set of properties is defined for eDP connectors.

> > Also, since you have EDID, you should be using that for timing data
> > IMO, and the binding needs to have enough information to support that.
> > It may if DP-aux comes from the bridge chip or it may not if you need
> > to describe that connection. Again, this is independent from what
> > Linux chooses to do. If Linux chooses to have its own timing
> > information that's its choice. Another OS may choose to use EDID.
> 
> I see nothing wrong here - anx6345 driver reads EDID (over AUX) and
> uses timing from it, if reading EDID failed it fallback to timings
> defined in panel driver.

Okay, I didn't look at the driver part closely. So really, it's just 
having a fallback compatible and defining what that includes.

Rob
