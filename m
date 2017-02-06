From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH V7 3/4] drm/bridge: Add driver for GE B850v3 LVDS/DP++
 Bridge
Date: Mon, 6 Feb 2017 09:45:45 +0100
Message-ID: <20170206084545.ke7riv6nacypqw2f@phenom.ffwll.local>
References: <CACvgo535iyFvdOWzQHRnU++Ye0GgyZyN3R9ALSXRP7k3EPyRGA@mail.gmail.com>
 <3e31-58931d80-1-221fa900@101383713>
 <CACvgo50bOZ=jzeJc_J4_7fpiEh9-ATKo1KOhAia2679AGA=mng@mail.gmail.com>
 <20170203080040.qn53xnpojxzk4qoi@phenom.ffwll.local>
 <CACvgo53BpgFwr3-LRhe8QpvD3ZRMr7huaRKyp5PTAY6O60J3xA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACvgo53BpgFwr3-LRhe8QpvD3ZRMr7huaRKyp5PTAY6O60J3xA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter Senna Tschudin <peter.senna-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, Peter Senna Tschudin <peter.senna-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, martin.donnelly-JJi787mZWgc@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>Ru
List-Id: devicetree@vger.kernel.org

On Fri, Feb 03, 2017 at 12:25:24PM +0000, Emil Velikov wrote:
> On 3 February 2017 at 08:00, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org> wrote:
> > On Thu, Feb 02, 2017 at 12:37:21PM +0000, Emil Velikov wrote:
> >>  - Daniel, gents - is drm-misc aimed at devs with limited (no?)
> >> review/commit history in the area and/or the kernel in general ?
> >> In this case, Peter have quite noticeable experience [in kernel
> >> development] with little-to no in DRM.
> >> Should one draw a line in the sand somewhere ?
> >
> > We're fairly lenient with accepting new drivers already, and for drivers
> > in drm-misc we require some checks and peer review to make sure new folks
> > learn faster. But it's an expirement, I fully expect some fallout and then
> > some learnign and fine tuning from that, and maybe we even need to crank
> > requirements back up to a much higher level of experience.
> >
> > But for drivers I'm honestly not too concerned: As long as there's some
> > process in place to foster learning&collaboration (which I think will be
> > better with this) I really don't see much harm in merging non-perfect
> > driver code.
> >
> Thank you Daniel, this is very well said. Being lenient to begin with
> and adjusting where/if needed is the more welcoming approach, indeed.
> Doubt there'll be (m)any cases of (ab|mis)use but even if so, nobody
> can see the future.

Yeah, the big idea behind drm-misc is also to make drm more welcoming for
new folks, and I think starting with a small driver or a few driver
patches for hw you have lying around for hacking is a great way. And every
once in a while we can "trick" one of these newbies into doing some cool
core refactoring or cleanup, and maybe even to stick around for a while.

All for world domination and other evil purposes ofc :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
