From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 4/7] mtd: add of_match_mtd_parser() and
 of_mtd_match_mtd_parser() helpers
Date: Mon, 7 Dec 2015 13:00:30 -0600
Message-ID: <CAL_JsqJ_dN6tDhjmB29Li6zxTcOcNRbr8Hw2MfnUAT3uWDgzuQ@mail.gmail.com>
References: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
 <1449292763-129421-5-git-send-email-computersforpeace@gmail.com>
 <CAL_JsqLV1mDpW9tD0XjWRxZSSsYuDiqHbuADQmBUtACgYiHJ+w@mail.gmail.com> <20151207181308.GN120110@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151207181308.GN120110-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 7, 2015 at 12:13 PM, Brian Norris
<computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Sun, Dec 06, 2015 at 08:45:40PM -0600, Rob Herring wrote:
>> On Fri, Dec 4, 2015 at 11:19 PM, Brian Norris
>> <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> >  drivers/of/of_mtd.c            | 33 +++++++++++++++++++++++++++++++++
>>
>> BTW, this file should be moved to drivers/mtd/ at some point.
>
> How about s/at some point/now/ ?

Great.

> I can send a separate patch. It also
> seems like these should just get linked into the 'mtd' module (when
> CONFIG_OF=y) instead of having a tiny module for just a few functions.

Agreed.

> Why did files like this get placed here anyway? Is there a reason that
> there are things like of_net and of_pci here too?

Things started out here, but as the number of subsystems and
associated bindings grew it became evident that binding specific
things should go with the subsystems. I also have a secret goal to
eliminate drivers/of. Don't tell anyone.

of_net should probably move, just no one has had the itch to do it.
PCI is a bit special and somewhat tied into the rest of the core.

Rob
