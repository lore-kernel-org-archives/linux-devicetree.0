From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC PATCH v2 2/4] Documentation: arm64/arm: dt bindings for numa.
Date: Tue, 25 Nov 2014 22:09:41 +0100
Message-ID: <2301278.uLKBUrWKt0@wuerfel>
References: <1416605010-10442-1-git-send-email-ganapatrao.kulkarni@caviumnetworks.com> <CAFpQJXUjYsTiHSyHdgtN9JPWGN8CByR4VwtSMJhwkAUWA4iV9w@mail.gmail.com> <2065254.jRdQcinOdg@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2065254.jRdQcinOdg@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Steve Capper <steve.capper-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Shannon Zhao <zhaoshenglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Roy Franz <roy.franz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Ganapatrao Kulkarni <ganapatrao.kulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, Ganapatrao Kulkarni <gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 25 November 2014 20:00:42 Arnd Bergmann wrote:
> On Tuesday 25 November 2014 08:15:47 Ganapatrao Kulkarni wrote:
> > > No, don't hardcode ARM specifics into a common binding either. I've looked
> > > at the ibm,associativity properties again, and I think we should just use
> > > those, they can cover all cases and are completely independent of the
> > > architecture. We should probably discuss about the property name though,
> > > as using the "ibm," prefix might not be the best idea.
> >
> > We have started with new proposal, since not got enough details how
> > ibm/ppc is managing the numa using dt.
> > there is no documentation and there is no power/PAPR spec for numa in
> > public domain and there are no single dt file in arch/powerpc which
> > describes the numa. if we get any one of these details, we can align
> > to powerpc implementation.
> 
> Basically the idea is to have an "ibm,associativity" property in each
> bus or device that is node specific, and this includes all CPUs and
> memory nodes. ...

I should have mentioned that the example I gave was still rather basic.
In a larger real-world system, you have more levels of associativity,
though not all of them are relevant for NUMA memory allocation.
Also, when you have levels that are not just a crossbar but instead
have multiple point-to-point connections or a ring bus, it gets more
complex, but you can still represent it with these properties.

For task placement, the associativity would also represent the
topology within one node (SMT threads, cores, clusters, chips,
mcms, sockets) as separate levels, and in large installations you
would have multiple levels of memory topology (memory controllers,
sockets, board/blade, chassis, rack, ...), which can get taken into
account for memory allocation to find the closest node. The metric
that you use here is how many levels within the topology are matching
between two devices (typically memory and i/o device, or memory and cpu).

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
