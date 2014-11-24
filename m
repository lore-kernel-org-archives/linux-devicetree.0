From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC PATCH v2 3/4] arm64:thunder: Add initial dts for Cavium's Thunder SoC in 2 Node topology.
Date: Mon, 24 Nov 2014 18:01:58 +0100
Message-ID: <2750247.HT2ynjYizJ@wuerfel>
References: <1416605010-10442-1-git-send-email-ganapatrao.kulkarni@caviumnetworks.com> <4080571.JcHDsAZ9EV@wuerfel> <CAFECyb8aObzJeiL4uB+N6D83GKqJ5tgYGJJJQXRQiEqMegg3Ng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFECyb8aObzJeiL4uB+N6D83GKqJ5tgYGJJJQXRQiEqMegg3Ng-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roy Franz <roy.franz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Ganapatrao Kulkarni <ganapatrao.kulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Salter <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, steve.capper-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ganapat Rao P Kulkarni <gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 24 November 2014 11:32:46 Roy Franz wrote:
> >
> > I don't know how much history is behind this binding. Have you looked
> > at the sPAPR way of doing this? I don't remember exactly how that is
> > done, but we'd need a good reason to discard that and implement
> > something else for arm64.
> >
> > If we create a new binding, I don't think the 'numa-map' node you
> > have here is the best solution. We already have device nodes for each
> > memory segment and each CPU in the system. Why not work with those
> > nodes directly?
> 
> The DT memory nodes don't exist in an EFI system, as the EFI memory
> map is used instead.
> Using EFI as the boot firmware doesn't require the use of ACPI for
> hardware description,
> so the EFI/DT case is one that we should support.

But they /could/ exist, right? Can we just require them to be
present in order to use NUMA features?

I don't think it's a good idea to require a new representation
of the memory nodes in DT to make NUMA work when we already have
one that is almost always there.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
