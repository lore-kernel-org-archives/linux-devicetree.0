From: Christian Lamparter <chunkeey@googlemail.com>
Subject: Re: [RFC v5 3/4] gpio: move clps711x, moxart, ts4800 and gpio-ge into gpio-generic
Date: Fri, 29 Apr 2016 21:06:11 +0200
Message-ID: <1518049.pLhlI1cuZi@debian64>
References: <cover.1461888822.git.chunkeey@googlemail.com> <9e5cc9e957144bd5d4081573ef959f931281eaaa.1461888822.git.chunkeey@googlemail.com> <CACRpkdaX1xeGJxV9K-GkTAh87SctqyhkJ+VN6mwUdtD19tz99g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaX1xeGJxV9K-GkTAh87SctqyhkJ+VN6mwUdtD19tz99g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, =?ISO-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>, Kumar Gala <galak@codeaurora.org>, Alexander Shiyan <shc_work@mail.ru>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: devicetree@vger.kernel.org

On Friday, April 29, 2016 04:18:20 PM Linus Walleij wrote:
> On Fri, Apr 29, 2016 at 2:53 AM, Christian Lamparter
> <chunkeey@googlemail.com> wrote:
> 
> > This patch integrates these GPIO drivers into gpio-generic.
> >
> > Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
> 
> Very elegant. Let's wait for some feedback/ACKs from
> the driver maintainers, but this looks very nice.
Oh by the way: who's maintaining them? get_maintainer.pl just
lists the usual gpio people. I can try to add the module authors.
However, I don't know if these are working or dead. I ran into an
issue once (for something else) that I got the dreaded "delivery
notification failed" messages, but I can't rebroadcast them on the
ML (because that would be very silly).

Anyway, I'll rebase my patch series (without the two patches you
had already merged)

> Do you want to address Andy's optimization suggestion directly
> or as a follow-on patch?
Oh, this is a RFC. I didn't expect anything to be merged just yet.
Of course, I'll try to integrate his suggestion. I'll do that once
I reply to Rob/Mark/You about the "linux,gpio-mmio",
"memory-mapped-gpio" situation etc.

Regards,
Christian Lamparter
