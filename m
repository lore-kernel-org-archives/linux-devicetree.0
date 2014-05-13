From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCHv2 1/4] of: make of_update_property() usable earlier in
 the boot process
Date: Tue, 13 May 2014 13:00:43 -0400
Message-ID: <20140513170043.GG27822@titan.lakedaemon.net>
References: <1399975839-5311-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1399975839-5311-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAL_JsqLNnLjeo2tM=z5bcn4DJD_5-uFRGkk6wAWnvGZyo9Y7pg@mail.gmail.com>
 <20140513163026.18a0fa61@free-electrons.com>
 <20140513153006.GC27822@titan.lakedaemon.net>
 <20140513175404.319d067d@free-electrons.com>
 <CAL_JsqJhKy=whJE25me07YFxEMX+gCch42ZF_Z5_5xfsfAvFXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJhKy=whJE25me07YFxEMX+gCch42ZF_Z5_5xfsfAvFXA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Albin Tonnerre <albin.tonnerre-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 13, 2014 at 11:58:08AM -0500, Rob Herring wrote:
> On Tue, May 13, 2014 at 10:54 AM, Thomas Petazzoni
> <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > Dear Jason Cooper,
> >
> > On Tue, 13 May 2014 11:30:06 -0400, Jason Cooper wrote:
> >
> >> > Well, I guess it's a per-maintainer choice:
> >> >
> >> > git log | grep "^Fixes:"
> >> >
> >> >     Fixes: 54fe26a900bc528f3df1e4235cb6b9ca5c6d4dc2 ('ARM: mvebu: Add thermal quirk for the Armada 375 DB board')
> >>
> >> Well, just because the maintainer is an idiot and didn't catch it isn't
> >> an excuse to continue the behavior. ;-)
> 
> To be fair, documentation was added last week! I only noticed now
> because I just found and read the documentation. In the future, I'll
> probably forget and not notice thus becoming an idiot again. ;)

um.. I thought that was me.  I usually don't make it a habit of calling
other people idiot.  I reserve that for myself. ;-)

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
