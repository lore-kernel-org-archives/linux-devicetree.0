From: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 10/11] drm/panel: simple: Add NewEast
 Optoelectronics CO., LTD WJFH116008A panel support
Date: Wed, 6 Mar 2019 22:12:14 -0800
Message-ID: <CA+E=qVdmq=TurodsKEuGD5tE8qMvwVBWTc=ay5QerB8c6LuvVw@mail.gmail.com>
References: <20190215050957.20755-1-anarsoul@gmail.com> <20190215050957.20755-11-anarsoul@gmail.com>
 <20190218183301.GA5480@bogus> <CA+E=qVcdDQJvssZgu23gM_gKvz2G5GAWcmjFBokE_V=WGJ4h6A@mail.gmail.com>
 <CAL_Jsq+pyAd_kMMz+yKjqY=asAi1X1XguM58VjfVhPwD-xi-2w@mail.gmail.com>
 <CA+E=qVcmLnr9sL7UjG2PSC0Ji5PhW=xOLQHGvRUG3yMMZW1hnw@mail.gmail.com> <20190222183716.GA7627@bogus>
Reply-To: anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDV3B667TUHBBWPMQLSAKGQE2ZBB37I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190222183716.GA7627@bogus>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-linux <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 22, 2019 at 10:37 AM Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> There is not any simple panel binding really. This originated I think
> from a 'simple-panel' compatible that was originally attempted. What we
> have is a collection of common properties for panels which panel
> bindings can use. And we have some common panel docs too. I've been
> meaning to clean-up and unify all this.

I'm afraid I'm not right person to clean it up. My understanding of
what different kind of panels and connectors need is pretty limited.
Moreover I'm doing pinebook hacking in my spare time which is few
hours a week and major panel/connector bindings clean up is not
something I want to invest my time in.

Since it seems to be a blocker I'll wait for someone to clean up
panel/connector bindings and then respin the series. Meanwhile it'll
live in my github.

Thanks for review and sharing your ideas.

Regards,
Vasily
