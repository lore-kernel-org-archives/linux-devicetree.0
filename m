From: arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org (Arnaud Ebalard)
Subject: Re: [PATCHv0 2/2] arm: mvebu: clarify (e)SATA ports info in NETGEAR ReadyNAS 102 .dts file
Date: Fri, 24 Oct 2014 23:41:29 +0200
Message-ID: <87wq7pi1rq.fsf@natisbad.org>
References: <cover.1414185031.git.arno@natisbad.org>
	<4af680f9a68281755e31df2491f0590046138230.1414185031.git.arno@natisbad.org>
	<20141024212207.GC6436@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141024212207.GC6436-g2DYL2Zd6BY@public.gmane.org> (Andrew Lunn's message of "Fri,
	24 Oct 2014 23:22:07 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Johan Kristell <johan.kristell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> writes:

> On Fri, Oct 24, 2014 at 11:22:16PM +0200, Arnaud Ebalard wrote:
>> 
>> On NETGEAR ReadyNAS 102, the two disks are connected to the external
>> Marvell 88SE9170 SATA Controller connected to the PCIe bus. The rear
>> eSATA port is connected to the native Armada 370 SATA controller.
>> 
>> This patch updates the comments in .dts file wrt SATA interfaces and
>> reduces the number of ports for native Armada 370 interface from 1
>> to 2.
>
> Typ0. 
>
> Jason, can you swap the 1 and 2 around when you commit?
> Save having a v2.
>
> Otherwise
>
> Acked-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>

Good catch. Thanks, Andrew.

Cheers,

a+
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
