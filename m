From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 4/7] mtd: add of_match_mtd_parser() and
 of_mtd_match_mtd_parser() helpers
Date: Mon, 7 Dec 2015 10:13:08 -0800
Message-ID: <20151207181308.GN120110@google.com>
References: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
 <1449292763-129421-5-git-send-email-computersforpeace@gmail.com>
 <CAL_JsqLV1mDpW9tD0XjWRxZSSsYuDiqHbuADQmBUtACgYiHJ+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqLV1mDpW9tD0XjWRxZSSsYuDiqHbuADQmBUtACgYiHJ+w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Dec 06, 2015 at 08:45:40PM -0600, Rob Herring wrote:
> On Fri, Dec 4, 2015 at 11:19 PM, Brian Norris
> <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >  drivers/of/of_mtd.c            | 33 +++++++++++++++++++++++++++++++++
> 
> BTW, this file should be moved to drivers/mtd/ at some point.

How about s/at some point/now/ ? I can send a separate patch. It also
seems like these should just get linked into the 'mtd' module (when
CONFIG_OF=y) instead of having a tiny module for just a few functions.

Why did files like this get placed here anyway? Is there a reason that
there are things like of_net and of_pci here too?

Brian
