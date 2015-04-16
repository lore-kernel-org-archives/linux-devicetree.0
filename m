From: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC PATCH 0/5] Add smp booting support for Qualcomm ARMv8 SoCs
Date: Thu, 16 Apr 2015 22:39:51 +0100
Message-ID: <20150416213950.GA3302@e104818-lin.cambridge.arm.com>
References: <1428601031-5366-1-git-send-email-galak@codeaurora.org>
 <20150410100529.GA6854@e104818-lin.cambridge.arm.com>
 <20150414163613.GM28709@leverpostej>
 <07185B2C-3F37-4E70-9096-1EF5EA8D68CE@codeaurora.org>
 <20150414211720.GA56647@MBP>
 <CAF6AEGtoxNrCoxT5n0CXmKMnL-YprJ3DkAuM4Myi87WMxPqBGw@mail.gmail.com>
 <20150415133403.GB26099@e104818-lin.cambridge.arm.com>
 <CAF6AEGucYT4LHkFggR0fO_c7gZe7hD7STx1xwKrOvwsnnFbw7Q@mail.gmail.com>
 <20150416152121.GE819@e104818-lin.cambridge.arm.com>
 <CAF6AEGt3bf70MUWFU_kqtc8KDR09tMUCkXbqOq0SpOXU44moTg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAF6AEGt3bf70MUWFU_kqtc8KDR09tMUCkXbqOq0SpOXU44moTg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "abhimany-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <abhimany-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 16, 2015 at 01:17:32PM -0400, Rob Clark wrote:
> On Thu, Apr 16, 2015 at 11:21 AM, Catalin Marinas
> <catalin.marinas-5wv7dgnIgG8@public.gmane.org> wrote:
> > On Wed, Apr 15, 2015 at 11:01:17AM -0400, Rob Clark wrote:
> >> There are folks who are working to get saner, more-upstream kernels
> >> working on devices.. and improving kernel infrastructure for
> >> device-needs (well, in my neck of the woods, there is drm/kms atomic
> >> and dsi/panel framework stuff.. I'm sure other similar things in other
> >> kernel domains).  And it seems like that is a good thing to encourage,
> >> rather than stymie.
> >
> > I'm not looking to discourage individuals trying to get upstream support
> > for older boards. Should the need arise, we'll look at options which may
> > or may not include kernel changes (e.g. wrap the kernel in a shim).
> 
> I had wondered about that, but afaiu psci is a smc interface, and I
> would assume bootloader drops you out of secure mode before entering
> the kernel or whatever comes after first stage bootloader if you are
> chain-loading?

One option is to run the shim at EL2 (hyp mode) which can intercept the
SMC calls from EL1. Another option is to release all the CPUs from
firmware into the shim and use a spin-table enable method.

-- 
Catalin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
