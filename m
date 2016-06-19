From: Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>
Subject: Re: [PATCH 1/2] ubi: mount partitions specified in device tree
Date: Sun, 19 Jun 2016 16:35:05 +0200
Message-ID: <5766AD99.1040809@nod.at>
References: <1466277476-14853-1-git-send-email-hauke@hauke-m.de>
 <5765A14F.6020201@nod.at> <48242f26-7812-6957-6bf5-c12989b875b4@hauke-m.de>
 <20160618232054.GB29476@makrotopia.org> <57665D96.1070804@nod.at>
 <20160619112510.GA820@makrotopia.org> <576689CC.3030809@nod.at>
 <20160619130514.GB820@makrotopia.org> <57669BEA.5030306@nod.at>
 <20160619140952.GC820@makrotopia.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160619140952.GC820-g5gK2j5usbvCyp4qypjU+w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Golle <daniel-g5gK2j5usbvCyp4qypjU+w@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Daniel,

Am 19.06.2016 um 16:09 schrieb Daniel Golle:
>> DT already offer all you need and nothing hinders you from
>> using mtdparts=.
> 
> I know. However, it's much nicer to define partitions for a specific
> flash chip inside the device tree (I've sent a link to the DTS of the
> BTHOMEHUBV2B to illustrate that, please have a look at it and tell
> me if you'd really like that partitioning currently stored as
> device-tree nodes to be migrated back to 'mtdparts=...'.)

I'd be fine with having the partitions in DT and the UBI kernel parameters
as kernel cmdline also in DT.

>> I didn't recommend adding glibc+systemd in the initramfs. It can be very, very small
>> and trivial.
> 
> Again, please understand that the whole production firmware can be as
> small as 3.5 megs for kernel and rootfs. Of course we never use glibc
> or systemd anywhere.

I know these use cases, I design and maintain such stuff for customers.

> Yes, it can be done. But you would have to define your flash chips in
> device-tree, you may define the mtd partitions either in DT or by using
> mtdparts=... in the cmdline. Now to define which MTD device to
> ubiattach you will have to use ubi.mtd=X on the cmdline. If you defined
> your partitions inside the of_node of the flash chip, changes there
> (which do happen) may change the index of the partition you want to
> ubi-attach. C'mon. This *is* messy. Just having a compatible-flag to
> attach the partition would already greatly improve things.

You mean marking a MTD partition in DT and UBI will attach from it?
That makes sense.

To sum up, I asked a lot of questions to understand your use case(s).
Everything you described can be done with existing facilities.
But I agree that at least some UBI DT machinery would be nice to have
although we need to check with DT folks first.
At least marking an MTD partition should be fine, hopefully.

Brian, Boris, what do you think?

Thanks,
//richard
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
