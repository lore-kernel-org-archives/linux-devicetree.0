From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: ACPI vs DT at runtime
Date: Thu, 21 Nov 2013 20:47:04 +0000
Message-ID: <20131121204704.E4487C40753@trevor.secretlab.ca>
References: <CAOesGMjKeRb=fFJM0MabDihbEiCGM4EqW9D5i_6-RFxTnpB4Qw@mail.gmail. com> <20131115095717.GC1709@e106331-lin.cambridge.arm.com> <5289A356. 4060004@jonmasters.org> <20131118150052.GC24408@sirena.org.uk> < 20131118191336.GB5886@quad.lixom.net> <20131119091216.GA4412@netboy> < 20131119184827.GD20967@quad.lixom.net> <20131120064056.GB5272@netboy> < 20131121192136.GA16735@n2100.arm.linux.org.uk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131121192136.GA16735-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Jon Masters <jonathan-Zp4isUonpHBD60Wz+7aTrA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 21 Nov 2013 19:21:36 +0000, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> On Wed, Nov 20, 2013 at 07:40:57AM +0100, Richard Cochran wrote:
> > Now, I never saw any proclamation or discussion about "DT is in flux"
> > on the arm list. If I had, I surely would have complained, and loudly.
> > AFAICT, this decision was made in rather private circles, but you talk
> > as if this was abundantly clear. *It was not.*
> 
> DT has been discussed several times over this year alone, which
> included discussions about the stability of bindings.  Various
> people in those threads (including myself) have put their views
> forward.
> 
> My position has been that if an interface ends up being published in a
> -final kernel, then it is part of the ABI, because a -final kernel is
> an end-product.  It's a final release which says "we've done the
> development, it's finished for users use."  If it's not then it shouldn't
> be in a -final kernel, or if it has to be there for development purposes,
> it needs to be hidden behind a "this is in development" label.
> 
> I've said that several times in the DT discussions and I believe
> basically been ignored.  Frankly, I've said my bit and I've given up
> caring.

Umm. Not sure why you feel ignored. We're absolutely going for stability
now.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
