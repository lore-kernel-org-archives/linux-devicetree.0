From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH v4] ARM: dts: r8a7794: Add SMP support
Date: Wed, 29 Nov 2017 11:40:15 +0100
Message-ID: <20171129104014.e5dwdhgb77cfm6q7@verge.net.au>
References: <1511876341-8639-1-git-send-email-geert+renesas@glider.be>
 <20171129082636.zwbwetif6vuxxfww@verge.net.au>
 <CAMuHMdWE6=3FaCxjuaLAK4HJdP4UoGXiBJkrdWVXYA6ZR+7uuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdWE6=3FaCxjuaLAK4HJdP4UoGXiBJkrdWVXYA6ZR+7uuA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 29, 2017 at 09:30:03AM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Wed, Nov 29, 2017 at 9:26 AM, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org> wrote:
> > On Tue, Nov 28, 2017 at 02:39:01PM +0100, Geert Uytterhoeven wrote:
> >> From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> >>
> >> Add the device tree node for the Advanced Power Management Unit (APMU).
> >> Use the "enable-method" prop to  point out that the APMU should be used
> >> for the SMP support.
> >>
> >> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> >> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> >> ---
> >> Dependency 3fd45a136ff61bb5 ("ARM: shmobile: rcar-gen2: Make sure
> >> CNTVOFF is initialized on CA7/15") is part of v4.15-rc1.
> >
> > sorry if this is a bit of a sore topic but I'd like to ask what sort of
> > testing this patch has seen. Are there any regressions in the area of
> > CPU hotplug, suspend to RAM and so on...
> 
> Last time I tried, CPU hotplug worked fine (on Alt).
> I cannot test suspend to RAM due to remote access.
> 
> Sergei?

Thanks for your help testing this. Both CPU hotplug and suspend-to-RAM
seem to work fine on Alt.o

I have applied this with:

Tested-by: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
