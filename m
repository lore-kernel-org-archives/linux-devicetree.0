From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 0/4] ARM64: Initial Marvell IAP140 enablement
Date: Tue, 21 Feb 2017 19:26:40 +0100
Message-ID: <a8a1279c-4978-f612-e4cd-57b8645f3e79@suse.de>
References: <20170219032000.4674-1-afaerber@suse.de>
 <87bmtxatmt.fsf@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87bmtxatmt.fsf-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, info-PWLG29+z7hGxBmiGZ5/UTQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Gregory,

Am 20.02.2017 um 14:17 schrieb Gregory CLEMENT:
>  On dim., févr. 19 2017, Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org> wrote:
> 
>> This mini-series adds initial support for the Marvell IAP140 SoC (aka PXA1908)
>> and the Andromeda Box Edge development board.
> 
> Given the name of the SoC (PXA1908) and the fact that you reuse driver
> related to PXA, for me these SoC is neither a mvebu nor a berlin SoC.

That matches my understanding.

> So
> just to avoid any misunderstanding, I don't mind being CC and possibly
> doing review but I don't plan to take this patch ( I don't think the
> berlin maintainer will do it too). 

Sure. There did not seem to be a MAINTAINERS-documented maintainer for
dts/marvell/Makefile, so I CC'ed both MVEBU and Berlin for review, in
addition to the unclear-to-me PXA vs. MMP separation.

I was unsure about the sort order used: Is it that Berlin was first and
therefore Berlin comes before Armada (then iap140 goes last), or is it
sorted by ARCH_? Becomes relevant below.

>> In order to enable the 8250 UART driver, it reuses ARCH_PXA; but some drivers
>> enabled with ARCH_PXA don't build due to arm assembly or arm64's lack of mach-,
>> so their dependencies need to be limited to ARM alongside (blacklisted). The
>> alternative would of course be to choose a new ARCH_ symbol and to selectively
>> add it to drivers known working (whitelisting). The latter would require
>> finding a suitable name.
> 
> For this kind of issue you can have a look on what we did when
> introducing mvebu SoC using ARM64.

This is how you introduced MVEBU for arm64:

http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=b4f596b19624d14864596b5b43de5f04cadd4895

There was a discussion with Jisheng on whether to use ARCH_ARMADA_3700,
but since I did not propose ARCH_IAP140 here, what are you suggesting
exactly? Berlin does not sound like a BU name either.

What I am reading out of the documentation Thomas pointed to is that
ARCH_MMP would be more correct than ARCH_PXA, despite the PXA1908 name.

MMP does help with driver compilation. Just for the OF earlycon I still
need the PXA compatible fallback, or we would need to define an MMP
earlycon. Since mmp2.dtsi does not use the pxa compatible, I'll look
into the latter for v2.

MMP sorts before MVEBU, unlike PXA.

So MMP would mean Eric and Haojian only - I will drop the other Marvell
maintainers for v2 then, except where review comments have been provided.

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
