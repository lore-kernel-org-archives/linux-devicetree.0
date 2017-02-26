From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH v2 1/2] of: add devm_ functions for populate and
 depopulate
Date: Sun, 26 Feb 2017 21:11:57 +0100
Message-ID: <20170226201157.xzg5b5tyrdlxkeyd@phenom.ffwll.local>
References: <1487952874-23635-1-git-send-email-benjamin.gaignard@linaro.org>
 <1487952874-23635-2-git-send-email-benjamin.gaignard@linaro.org>
 <CAL_Jsq+z9FcPowoMYXQ4aPfSYfL3D4ENoZxiTTO2pKJjnsRXOw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+z9FcPowoMYXQ4aPfSYfL3D4ENoZxiTTO2pKJjnsRXOw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 24, 2017 at 10:31:25AM -0600, Rob Herring wrote:
> On Fri, Feb 24, 2017 at 10:14 AM, Benjamin Gaignard
> <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > Lots of calls to of_platform_populate() are not unbalanced by a call
> > to of_platform_depopulate(). This create issues while drivers are
> > bind/unbind.
> >
> > In way to solve those issues is to add devm_of_platform_populate()
> > which will call of_platform_depopulate() when the device is unbound
> > from the bus.
> >
> > Signed-off-by: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> > version 2:
> > - simplify function prototype to only keep device as parameter
> >
> >  drivers/of/platform.c       | 71 +++++++++++++++++++++++++++++++++++++++++++++
> >  include/linux/of_platform.h | 11 +++++++
> >  2 files changed, 82 insertions(+)
> 
> For this and patch 2:
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Is this an ack for merging both through drm-misc, or should we do a
topic-branch dance here?

/me not sure anymore what we discussed here already

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
