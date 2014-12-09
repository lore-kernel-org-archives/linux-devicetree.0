From: Zi Shen Lim <zlim.lnx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v2 1/4] arm64: defconfig: increase NR_CPUS range to 2-128
Date: Mon, 8 Dec 2014 17:57:03 -0800
Message-ID: <CAMDttNe33ie9vgyEn8GHz+8isadaDfXXUJcp5mQM-42_mx3Pbw@mail.gmail.com>
References: <1416605010-10442-1-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
	<1416605010-10442-2-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
	<3519779.ILzEnWe9lP@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3519779.ILzEnWe9lP@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Ganapatrao Kulkarni <ganapatrao.kulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Steve Capper <steve.capper-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, roy.franz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Ganapatrao Kulkarni <gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On Mon, Nov 24, 2014 at 3:53 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>
> On Saturday 22 November 2014 02:53:27 Ganapatrao Kulkarni wrote:
> > Raising the maximum limit to 128. This is needed for Cavium's
> > Thunder system that will have 96 cores on Multi-node system.
> >
> > Signed-off-by: Ganapatrao Kulkarni <ganapatrao.kulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
> >
>
> Could we please raise the compile-time limit to the highest number that
> you are able to boot successfully on some existing machine?
>
> There isn't much point in doubling this every few months.

Agreed. If we look back at [1], Mark Rutland has actually compiled and
boot-tested NR_CPUS=4096 on Juno.

[1] https://lkml.org/lkml/2014/9/8/537

>
>         Arnd
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
