From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v2 3/5] mtd: nand: replace pxa3xx_nand driver by its rework called marvell_nand
Date: Sat, 23 Dec 2017 22:13:48 +0100
Message-ID: <87bmipb10z.fsf@belgarion.home>
References: <20171219132942.27433-1-miquel.raynal@free-electrons.com>
        <20171219132942.27433-4-miquel.raynal@free-electrons.com>
        <87608ycwx5.fsf@belgarion.home> <20171222230444.2c952ea0@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171222230444.2c952ea0@bbrezillon> (Boris Brezillon's message
        of "Fri, 22 Dec 2017 23:04:44 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Miquel Raynal <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Ezequiel Garcia <ezequi>
List-Id: devicetree@vger.kernel.org

Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> writes:

>> What I would propose instead is :
>>  - keep both the new marvell nand driver and the old pxa3xx_nand driver
>>  - switch pxa_defconfig to compile them both
>
> Didn't notice you were suggesting to compile both, which doesn't work
> because both drivers match the same devices, and only one of them
> can actually claim the device (likely the first one to register to the
> device model). So, to make it safe you need to have a
>
> 	depends on !MTD_NAND_PXA3xx
>
> in your MTD_NAND_MARVELL entry, which means only one driver can be
> compiled.
Mmm... that is I didn't explain to you what pxa_defconfig is designed for.
This defconfig is not for any board actually, it rather is a build coverage
tool.

> So let's find a way to fix the remaining issues you have instead of delaying
> the inevitable.
It's up to you of course, as long as my boards don't break, and nothing breaking
them is merged, I'm fine with it. It's just not the approach I usually choose,
I'm rather a 2-step guy, ie. merge the new one, then merge the switch (which can
be reverted easilly).

Cheers.

-- 
Robert
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
