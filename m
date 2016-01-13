From: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 0/4] mtd: atmel_nand: Add support for NAND Flash on SAMA5D2
Date: Wed, 13 Jan 2016 13:56:11 +0100
Message-ID: <CAGkQfmNDZmKDJYMuVizbb-+3nXX2DAqDCOf8qE0DNR-3Y2Etcg@mail.gmail.com>
References: <1452609223-14790-1-git-send-email-romain.izard.pro@gmail.com>
 <56951F91.1090101@atmel.com> <CAGkQfmOmgiKwziQ+HuJTN1Qk1aHEXBWYcE1LT+XT2d-Xv7kxNw@mail.gmail.com>
 <56963918.7040809@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56963918.7040809-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Yang, Wenyou" <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org, Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2016-01-13 12:46 GMT+01:00 Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>:
>> Ok. It might be a good idea to update the MAINTAINERS file, as Josh Wu's
>> atmel address now bounces, and it is still referenced there.
>
> It's already done and pushed to arm-soc. It's in linux-next:
> http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/MAINTAINERS#n2000
>
> It will appear in Linus' tree in a couple of days ;-)
>
Good. As I based my developments on the linux-4.1-at91 branch from the Linux4SAM
github which does not contain the update, I missed it.

>>> I also think that Wenyou did some work regarding this support. So you'll
>>> have to coordinat together.
>>
>> Is it possible to know what are the developments in progress regarding
>> SAMA5D2 drivers? The github repository does not expose any working trees,
>> and only the
>
> Which github repository are you talking about?
>
> The Linux4SAM github contains all that is need to work with sama5d2
> (linux-4.1-at91 branch):
> https://github.com/linux4sam/linux-at91/tree/linux-4.1-at91

That's the one. My point is that there is no hint in there that Wenyou worked
on supporting the NAND controller for SAMA5D2. So I wondered if there were
other repositories I missed with more recent information.

> Developments in progress are listed in the Linux4SAM page:
> http://www.at91.com/linux4sam/bin/view/Linux4SAM/Sama5d2XplainedMainPage
>
> I admit that it's not copleted, but you'll have an idea here as well:
> http://www.at91.com/linux4sam/bin/view/Linux4SAM/Sama5d2XplainedMainPage
>
Both URLs are the same, are you sure it's the correct link? It's a very
informative page and I often use it when I need information on the SAMA5D2.
But I have a hard time finding something about work in progress in it.


Best regards,
-- 
Romain Izard
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
