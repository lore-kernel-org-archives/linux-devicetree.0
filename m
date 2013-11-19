From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: ACPI vs DT at runtime
Date: Tue, 19 Nov 2013 10:48:27 -0800
Message-ID: <20131119184827.GD20967@quad.lixom.net>
References: <CAOesGMjKeRb=fFJM0MabDihbEiCGM4EqW9D5i_6-RFxTnpB4Qw@mail.gmail.com>
 <20131115095717.GC1709@e106331-lin.cambridge.arm.com>
 <5289A356.4060004@jonmasters.org>
 <20131118150052.GC24408@sirena.org.uk>
 <20131118191336.GB5886@quad.lixom.net>
 <20131119091216.GA4412@netboy>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131119091216.GA4412@netboy>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Masters <jonathan-Zp4isUonpHBD60Wz+7aTrA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

[Adding Grant]

On Tue, Nov 19, 2013 at 10:12:17AM +0100, Richard Cochran wrote:
> On Mon, Nov 18, 2013 at 11:13:36AM -0800, Olof Johansson wrote:
> > 
> > I know people have been frustrated that they need to keep the DT in sync with
> > the kernel. But we've always been upfront with the requirement, and why we've
> > been having it. We're now changing this requirement, which should help sort out
> > practically all of the concerns at hand.
> 
> Sorry, but this really gets my goat. When have you been upfront about
> the unstable DT idea?

As I said, from the very beginning. It's why we decided to have the DTS hosted
in the kernel tree as well. The approach has always been "we'll move it out
eventually when things settle down", but that's always been pushed off so far.

This is just a tangent and a distraction anyway: You should know by
now that we've decided to keep backwards compatibility going forward,
so any argument about why we did it differently before is leading nowhere.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
