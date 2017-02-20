From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/4] Documentation: devicetree: arm: Document Marvell
 IAP140
Date: Mon, 20 Feb 2017 14:58:25 +0100
Message-ID: <20170220145825.5f7cbe74@free-electrons.com>
References: <20170219032000.4674-1-afaerber@suse.de>
        <20170219032000.4674-3-afaerber@suse.de>
        <20170220135646.2b0219c1@free-electrons.com>
        <cac4ed13-5952-cccc-fee7-d9c29e77d8bb@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cac4ed13-5952-cccc-fee7-d9c29e77d8bb-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, info-PWLG29+z7hGxBmiGZ5/UTQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

On Mon, 20 Feb 2017 14:16:13 +0100, Andreas Färber wrote:

> I'm confused now. According to Marvell IR [0] they are NASDAQ-listed as
> MRVL. My understanding is that in that case the official vendor prefix
> becomes mrvl. Why not here?

Not sure why, but as of today, we have a mix of "mrvl" and "marvell" in
the tree, and "marvell" is the one official listed in
vendor-prefixes.txt.

> Any comments on the iap140 vs. pxa1908 naming? The Communication
> Processors section has disappeared from marvell.com, so I couldn't
> verify whether IAP140 was renamed from PXA1908 or whether both coexist
> and we should add a second compatible string here?

I don't have an opinion on this because I'm not familiar with this
family of Marvell SoCs. However, the only thing I would recommend is
that you send a patch to update Documentation/arm/Marvell/README to
document this PXA1908/IAP140 thing. This is particularly important
since this document mentions PXA1908 already.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
