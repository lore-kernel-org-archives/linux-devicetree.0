From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/5] ARM: dts: armada388: rework clearfog's .dtsi references
Date: Wed, 04 Jan 2017 17:31:05 +0100
Message-ID: <87wpeaeqie.fsf@free-electrons.com>
References: <E1cO454-00083C-Tj@rmk-PC.armlinux.org.uk>
        <E1cO4UH-0008SR-GW@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E1cO4UH-0008SR-GW-eh5Bv4kxaXIk46pC+1QYvQNdhmdF6hFW@public.gmane.org> (Russell King's
        message of "Mon, 02 Jan 2017 15:25:25 +0000")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Russell,
 
 On lun., janv. 02 2017, Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org> wrote:

> This patch series, based upon the previous series adding Clearfog Base
> support, reworks the clearfog .dtsi file to reference nodes by label
> rather than by path.
>
> Not everything is moved - just those which had labels at the time the
> patches were created.

All the series is applied on mvebu/dt, however I would like to have a
commit log for the first patch before pushing it to arm-soc.

Thanks,

Gregory


>
>  arch/arm/boot/dts/armada-388-clearfog-base.dts     |  15 +
>  arch/arm/boot/dts/armada-388-clearfog.dtsi         | 353 ++++++++++-----------
>  .../arm/boot/dts/armada-38x-solidrun-microsom.dtsi | 113 ++++---
>  3 files changed, 245 insertions(+), 236 deletions(-)

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
