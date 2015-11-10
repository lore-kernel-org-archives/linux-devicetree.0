From: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [PATCH] of: Print rather than WARN'ing when overlap check fails
Date: Wed, 11 Nov 2015 08:47:03 +1100
Message-ID: <1447192023.25407.0.camel@ellerman.id.au>
References: <1447132113-31434-1-git-send-email-mpe@ellerman.id.au>
	 <063D6719AE5E284EB5DD2968C1650D6D1CBCEE2E@AcuExch.aculab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <063D6719AE5E284EB5DD2968C1650D6D1CBCEE2E-VkEWCZq2GCInGFn1LkZF6NBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Laight <David.Laight-ZS65k/vG3HxXrIkS9f7CXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org" <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "mitchelh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <mitchelh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2015-11-10 at 09:41 +0000, David Laight wrote:

> From: Michael Ellerman

> > Sent: 10 November 2015 05:09
> > __rmem_check_for_overlap() is called very early in boot, and on some
> > powerpc systems it's not safe to call WARN that early in boot.
> > 
> > If the overlap check fails the system will oops instead of printing a
> > warning. Furthermore because it's so early in boot the console is not up
> > and the user doesn't see the oops, they just get a dead system.
> 
> Wouldn't it be better to add the required checks to WARN()?

Yes obviously it would. But that's less simple than it sounds. I'm working on
it.

cheers

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
