From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH 0/4] ARM64: Initial Marvell IAP140 enablement
Date: Tue, 21 Feb 2017 23:26:47 +0100
Message-ID: <8737f7yyc8.fsf@belgarion.home>
References: <20170219032000.4674-1-afaerber@suse.de>
        <87bmtxatmt.fsf@free-electrons.com>
        <a8a1279c-4978-f612-e4cd-57b8645f3e79@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a8a1279c-4978-f612-e4cd-57b8645f3e79-l3A5Bk7waGM@public.gmane.org> ("Andreas
        \=\?utf-8\?Q\?F\=C3\=A4rber\=22's\?\= message of "Tue, 21 Feb 2017 19:26:40 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, info-PWLG29+z7hGxBmiGZ5/UTQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org> writes:

> Hi Gregory,
>
> Am 20.02.2017 um 14:17 schrieb Gregory CLEMENT:
>>  On dim., févr. 19 2017, Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org> wrote:
>> 
>>> This mini-series adds initial support for the Marvell IAP140 SoC (aka PXA1908)
>>> and the Andromeda Box Edge development board.
>> 
>> Given the name of the SoC (PXA1908) and the fact that you reuse driver
>> related to PXA, for me these SoC is neither a mvebu nor a berlin SoC.
>
> That matches my understanding.

...zip...
> What I am reading out of the documentation Thomas pointed to is that
> ARCH_MMP would be more correct than ARCH_PXA, despite the PXA1908 name.
I agree here.

PXA for me are XScale micro-architecture based SoCs, quite old. PXA1908 has a
quite recent Cortex-A53 (or several of them), which makes me think its either an
MMP or something newer than MMP.

> MMP does help with driver compilation. Just for the OF earlycon I still
> need the PXA compatible fallback, or we would need to define an MMP
> earlycon. Since mmp2.dtsi does not use the pxa compatible, I'll look
> into the latter for v2.
>
> MMP sorts before MVEBU, unlike PXA.
>
> So MMP would mean Eric and Haojian only - I will drop the other Marvell
> maintainers for v2 then, except where review comments have been provided.
Yes please.

Cheers.

-- 
Robert
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
