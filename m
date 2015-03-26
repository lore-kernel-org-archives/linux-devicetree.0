From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v4 2/4] mfd: lubbock_cplds: add lubbock IO board
Date: Thu, 26 Mar 2015 22:38:54 +0100
Message-ID: <871tkbxwup.fsf@free.fr>
References: <20150216130549.GF14545@x1>
	<1170550770.470129293.1424093248596.JavaMail.root@zimbra1-e1.priv.proxad.net>
	<20150216162712.GR14545@x1> <87fva5a4i2.fsf@free.fr>
	<20150217074310.GT14545@x1>
	<alpine.LFD.2.11.1502171221300.22104@knanqh.ubzr>
	<20150218080719.GB5781@x1> <87a9088tam.fsf@free.fr>
	<20150325140725.GA11499@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150325140725.GA11499-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org> (Greg Kroah-Hartman's message
	of "Wed, 25 Mar 2015 15:07:25 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> writes:

> On Fri, Feb 20, 2015 at 05:02:57PM +0100, Robert Jarzmik wrote:
>> If there is no solution, I'll fallback through arch/arm/plat-pxa, not very nice,
>> but it has to land somewhere, I don't want lubbock to remain broken.
>
> drivers/platform/arm ?
Most certainly.

I'll submit that to drivers/platform/arm/pxa, and maintain that pxa tree. As for
drivers/platform/arm, do you want also maintainers to step up, or will you take
the review/merge burden ?

Cheers.

-- 
Robert
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
