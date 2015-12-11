From: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 0/7] mtd: partitions: add of_match_table support
Date: Fri, 11 Dec 2015 16:34:10 +0100
Message-ID: <CAOMqctQVMCEa_k4xMW1qooEpe8X1-NhUOjD6pp0qJpDP_H+8hw@mail.gmail.com>
References: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
 <CAMuHMdUJXHs_OhT0da+kzc=D4MOFUT9BB3eJ+7a_p6DYx-PKBA@mail.gmail.com>
 <20151210205449.GL144338@google.com> <CAMuHMdV-uethsChWVZGSx1JNcAofODmg14ppGYJP2ewfwhEv1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdV-uethsChWVZGSx1JNcAofODmg14ppGYJP2ewfwhEv1Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, David Hendricks <dhendrix-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, MTD Maling List <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11 December 2015 at 09:44, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
> Hi Brian,
>
> On Thu, Dec 10, 2015 at 9:54 PM, Brian Norris
> <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Sat, Dec 05, 2015 at 11:15:54AM +0100, Geert Uytterhoeven wrote:
>>> On Sat, Dec 5, 2015 at 6:19 AM, Brian Norris
>>> <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> > There have been several discussions [1] about adding a device tree binding for
>>> > associating flash devices with the partition parser(s) that are used on the
>>> > flash. There are a few reasons:
>>> >
>>> >  (1) drivers shouldn't have to be encoding platform knowledge by listing what
>>> >      parsers might be used on a given system (this is the currently all that's
>>> >      supported)
>>> >  (2) we can't just scan for all supported parsers (like the block system does), since
>>> >      there is a wide diversity of "formats" (no standardization), and it is not
>>> >      always safe or efficient to attempt to do so, particularly since many of
>>> >      them allow their data structures to be placed anywhere on the flash, and
>>> >      so require scanning the entire flash device to find them.
>>>
>>> I read the second reason, but would it be useful to (partially) merge
>>> block/partitions/ and drivers/mtd/partitions/, so I can use e.g. msdos
>>> partitions
>>> on an mtd device??
>>
>> I kinda agree with Michal: is there a good use case?
>
> I don't have an immediate use case.
> Just looking at it from a high-level viewpoint.
>
>> Really, MTD partitioning is not a highly-scalable design. Particularly,
>> it's not typically that well-suited to large (read: unreliable) NAND
>> flash, where fixing partitions at the raw flash level mostly serves to
>> restrict UBI's ability to wear-level across the device. For that sort of
>> case, it's best if people are using UBI volumes on a (mostly?)
>> unpartitioned MTD, instead of using MTD partitions as the main
>> separation mechanism. Also, most partition designs (either MTD or block)
>> aren't very robust against bitflips, read disturb, etc.
>>
>> IOW, I wouldn't expect MBR or GPT to work well on large raw NAND flash,
>> and so I don't plan to do that sort of work myself. If you can provide
>> some better argument for it, and some nice maintainable code to go with
>> it, then of course it could be considered :)
>
> There's also NOR FLASH (e.g. SPI-NOR), which is what most boards I'm
> working on have.
>

Yes, you can dump the content of a NOR flash to a file, attach a loop
device to it, and if block devices had the ability to use flash
partitioning access the different partitions.

Maybe it would be more useful to use some kind of mtdloop, though.
There might even be one already. I never needed it.

Thanks

Michal
