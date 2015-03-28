From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v4 2/4] mfd: lubbock_cplds: add lubbock IO board
Date: Sat, 28 Mar 2015 14:24:02 +0100
Message-ID: <201503281424.02583.arnd@arndb.de>
References: <20150216130549.GF14545@x1> <201503280335.16280.arnd@arndb.de> <87fv8pwmm0.fsf@free.fr>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87fv8pwmm0.fsf-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Saturday 28 March 2015, Robert Jarzmik wrote:
> It's not as much a problem as a generic question : does a driver belong to
> arch/* ?
> 
> Personaly it would have been far simpler for me to have it through the pxa tree,
> but I want to be sure it's the right place. Others will follow, pxa mainstone is
> such a candidate.
> 
> I was thinking so far that arch/arm/mach-* was for machine description,
> ie. wirings, interconnections, initial setup etc ... The "driver" part, ie. code
> really driving dynamics in IPs was as per my understanding in drivers/...
> 
> Now I can create arch/arm/mach-pxa/lubbock_cplds.c, that won't make any
> difference to me, provided that it's the right thing to do.

If we had a lot of these, we would probably put them somewhere under drivers.
and find a maintainer for them. Given that this is an exceptional case for
an older machine, my feeling is that leaving the code in mach-pxa is the least
effort for now.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
