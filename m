From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [RFC PATCH 3/7] doc: dt: mtd: partition: add on-flash format binding
Date: Tue, 15 Dec 2015 11:03:48 +0100
Message-ID: <CAMuHMdVUMHEAGSwF=nvbncHEj6Co9f6CofeVqZbrWzhaprBvGQ@mail.gmail.com>
References: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
	<1449292763-129421-4-git-send-email-computersforpeace@gmail.com>
	<CAOiHx=nz2bdA_R610ozsQHhccdcrHVVCamTtne5ReHrA-FcaaQ@mail.gmail.com>
	<CAOMqctTbUNd0GtY07YJuxem9HkU1WZ-NtO556=Yg2QrsF49Xjw@mail.gmail.com>
	<20151207013628.GC20139@voom.fritz.box>
	<20151210204324.GK144338@google.com>
	<20151212055105.GA17011@voom.fritz.box>
	<CAMuHMdXA4-BZpvtCM8_9fYWLzoVsuCXDqvF3G4cVd50Cqsfv0g@mail.gmail.com>
	<20151215060056.GB3011@voom.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151215060056.GB3011-1s0os16eZneny3qCrzbmXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, MTD Maling List <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi David,

On Tue, Dec 15, 2015 at 7:00 AM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>> If the only property needed is the partition table offset, it can be encoded
>> in the unit-address, and the "reg" property:
>>
>>         partitions {
>>
>>                 partition-table@xxxx {
>>                         reg = <0xxxx ...>;
>>                         ...
>>                 };
>>
>>                 ...
>>         };
>
> Urgh.. and that's abusing the unit address.

Why? The partition is part of the FLASH. In this respect, it doesn't differ
from other hardcoded partitions using the same DT syntax.
It would just have a compatible value indicating it's a partition table.

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
