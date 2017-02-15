From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: armada-385-linksys: fix DSA compatible property
Date: Wed, 15 Feb 2017 15:56:03 +0100
Message-ID: <87r32zcxks.fsf@free-electrons.com>
References: <20170209152702.23036-1-ralph.sennhauser@gmail.com>
        <20170209155155.GA29882@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170209155155.GA29882-g2DYL2Zd6BY@public.gmane.org> (Andrew Lunn's message of "Thu,
        9 Feb 2017 16:51:55 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralph Sennhauser <ralph.sennhauser-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..." <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Ralph and Andrew,
 
 On jeu., févr. 09 2017, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> wrote:

> On Thu, Feb 09, 2017 at 04:27:02PM +0100, Ralph Sennhauser wrote:
>> The switch to the new DSA binding used "marvell,mv88e6095" for the
>> compatible property which doesn't exist, use "marvell,mv88e6085"
>> instead.
>> 
>> Fixes: 455b82f03f52 ("ARM: dts: armada-385-linksys: Utilize new DSA binding")
>> Signed-off-by: Ralph Sennhauser <ralph.sennhauser-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> Hi Ralph
>
> Good catch.
>
> Reviewed-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
>
> Gregory, this is in the mvebu dt branch and need fixing there.


Applied on mvebu/dt if it can't go through arm-soc I will submitted as a
fix for v4.11-rc1.

Thanks,

Gregory


>
> [Goes away to look at the other dts files]
>
> O.K. Florian only made this typ0 once in the patchset.
>
>      Andrew

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
