From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v8 0/2] gpio: uniphier: UniPhier GPIO driver
Date: Mon, 16 Oct 2017 10:24:15 +0200
Message-ID: <CACRpkdbRtpsmkp5BZcCH4vOvqoeMT_1UGUkOEoJ+mYypgnKezA@mail.gmail.com>
References: <1507808176-5223-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1507808176-5223-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 12, 2017 at 1:36 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Changes in v8:
>   - Move dt-binding header to binding commit
>   - Add MAINTAINERS entry for the binding doc
>   - Add a consumer example to the binding doc

This v8 looks OK to me.

The stuff is still hard to understand, but that is because the HW is
very complex and strangely designed, not because of the driver
author. I really think you did your best, thanks!

I'll wait some days and see if the DT people have something to say
before applying it, but I'm as happy as I can be I guess.

Yours,
Linus Walleij
