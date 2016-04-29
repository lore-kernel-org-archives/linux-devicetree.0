From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC v5 3/4] gpio: move clps711x, moxart, ts4800 and gpio-ge into gpio-generic
Date: Fri, 29 Apr 2016 16:18:20 +0200
Message-ID: <CACRpkdaX1xeGJxV9K-GkTAh87SctqyhkJ+VN6mwUdtD19tz99g@mail.gmail.com>
References: <cover.1461888822.git.chunkeey@googlemail.com>
	<9e5cc9e957144bd5d4081573ef959f931281eaaa.1461888822.git.chunkeey@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9e5cc9e957144bd5d4081573ef959f931281eaaa.1461888822.git.chunkeey@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, Kumar Gala <galak@codeaurora.org>, Alexander Shiyan <shc_work@mail.ru>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 29, 2016 at 2:53 AM, Christian Lamparter
<chunkeey@googlemail.com> wrote:

> This patch integrates these GPIO drivers into gpio-generic.
>
> Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>

Very elegant. Let's wait for some feedback/ACKs from
the driver maintainers, but this looks very nice.

Do you want to address Andy's optimization suggestion directly
or as a follow-on patch?

Yours,
Linus Walleij
