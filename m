From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 2/2] documentation/devicetree: Update GIC compat strings
Date: Wed, 21 May 2014 09:01:47 -0400
Message-ID: <20140521130147.GH8664@titan.lakedaemon.net>
References: <1400664501-4208-1-git-send-email-Nikolay.Borisov@arm.com>
 <1400664501-4208-3-git-send-email-Nikolay.Borisov@arm.com>
 <20140521102439.GE17827@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140521102439.GE17827@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Nikolay Borisov <Nikolay.Borisov-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org" <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Nikolay,

On Wed, May 21, 2014 at 11:24:39AM +0100, Mark Rutland wrote:
> [Adding devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org]
> 
> On Wed, May 21, 2014 at 10:28:21AM +0100, Nikolay Borisov wrote:
> > Document the addition of 2 new, implementation-agnostic compatible
> > strings. This allows for more flexibility such that new implementation 
> > can either state whether they are an extension of an existing implementation,
> > a brand new implementation or just that they conform to a standard revision
> > of the GIC spec.
> 
> From my POV it makes sense to have these to make it possible to write
> DTs with new GIC variants which are implementations of the standard
> rather than extensions of existing implementations.
> 
> However, DTs using these should also state exactly what variant they
> are, and those strings should be documented (even if not supported
> directly by the driver). It would be nice to have that mentioned in the
> commit message.

Please tweak the commit message as Mark suggested and resend, including
me in the Cc.  I'll queue it up for tglx.

> Otherwise:
> 
> Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> 

Also, please include Mark's Acks.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
