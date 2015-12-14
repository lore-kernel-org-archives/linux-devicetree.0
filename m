From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH for-4.4 2/2] doc: dt: mtd: partitions: add compatible
 property to "partitions" node
Date: Mon, 14 Dec 2015 15:49:14 +0100
Message-ID: <CAMuHMdVGW-7dQ3vAqVpUN_S7=T7dVp+jkMJR7nyZ9ePd+NnsyQ@mail.gmail.com>
References: <1449194529-145705-1-git-send-email-computersforpeace@gmail.com>
	<1449194529-145705-2-git-send-email-computersforpeace@gmail.com>
	<CAOiHx=kP8hT-UH=tfUZYYpr__i458-ZL3bOhcAJb8hmSbqBdCA@mail.gmail.com>
	<20151207175835.GM120110@google.com>
	<20151209011256.GV120110@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151209011256.GV120110-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, MTD Maling List <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Brian,

On Wed, Dec 9, 2015 at 2:12 AM, Brian Norris
<computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, Dec 07, 2015 at 09:58:35AM -0800, Brian Norris wrote:
>> On Sat, Dec 05, 2015 at 12:45:36PM +0100, Jonas Gorski wrote:
>> > On Fri, Dec 4, 2015 at 3:02 AM, Brian Norris
>> > <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> > >         // proposed
>> > >         partitions {
>> > >                 compatible = "partitions";
>> >
>> > "partitions" sounds mode like a device_type thing than a compatible
>> > name, maybe "fixed-partitions"? IMHO that would describe better what
>> > these are, and doesn't invite to think using compatible =
>> > "arm,arm-flash-structure", "partitions"; is a good idea.
>>
>> "fixed-partitions" sounds OK to me. If no objections, I'll apply these
>> patches, with (approximately) a:
>>
>> s/"partitions"/"fixed-partitions"/
>
> Pushed to linux-mtd.git with the above change.

Aarghl, hadn't seen this patch before.

This breaks the users that have already added the partitions subnodes
(armada-xp-lenovo-ix4-300d.dts and a few shmobile).

Will send patches to fix it...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
