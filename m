From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCHv0 0/3] ARM: mvebu: Enable NAND controller in NETGEAR
 ReadyNAS .dts files
Date: Sat, 7 Dec 2013 20:18:27 -0500
Message-ID: <20131208011827.GI11251@titan.lakedaemon.net>
References: <cover.1386370808.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cover.1386370808.git.arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Dec 07, 2013 at 12:12:53AM +0100, Arnaud Ebalard wrote:
> 
> Now that NAND controller support is available for Armada 370/XP
> (cb28e2537a6f: ARM: mvebu: Add support for NAND controller in
> Armada 370/XP), let's enable support for ReadyNAS boards.
> 
> The three commits in this series all include the partitions
> definitions specific to each ReadyNAS variant as delivered
> by NETGEAR with standard images.
> 
> As described in similar commits 2be2bc39c6f0 (ARM: mvebu: Enable
> NAND controller in Armada XP GP board) and d8c552dddfbf (ARM: 
> mvebu: Enable NAND controller in Armada 370 Mirabox),
> "marvell,keep-config" parameter is used as current support does
> not allow for setting of timing parameters yet.
> 
> Each patch has been tested on each specific device using Ezequiel's
> tree; last known bug having being fixed today.
> 
> Jason, Ezequiel, this is a v0. I do not mind at all waiting for a
> heads up to repost it later when every bit of nand support is where
> it should be.

This seems fine by me.  Once the binding are agreed upon, dts changes
can occur independent of code changes.

> Ezequiel, I have left a comment in the .dts file to indicate a lost
> reader that the last MB of last partition is in practice not
> writable.
> 
> Cheers,
> 
> a+
> 
> Arnaud Ebalard (3):
>   ARM: mvebu: Enable NAND controller in NETGEAR ReadyNAS 102 .dts file
>   ARM: mvebu: Enable NAND controller in NETGEAR ReadyNAS 104 .dts file
>   ARM: mvebu: Enable NAND controller in NETGEAR ReadyNAS 2120 .dts file
> 
>  arch/arm/boot/dts/armada-370-netgear-rn102.dts | 36 ++++++++++++++++++++++++++
>  arch/arm/boot/dts/armada-370-netgear-rn104.dts | 36 ++++++++++++++++++++++++++
>  arch/arm/boot/dts/armada-xp-netgear-rn2120.dts | 36 ++++++++++++++++++++++++++
>  3 files changed, 108 insertions(+)

Whole series applied to mvebu/dt

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
