From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [v1, 0/1] gpio: dts: aspeed: Add SGPIO driver
Date: Wed, 25 Sep 2019 16:15:10 +0200
Message-ID: <CACRpkdbhRo62inQS96OfFO4iWkLn2+P+w1+6g+Y=HFvVyVnXAA@mail.gmail.com>
References: <1569351740-6285-1-git-send-email-hongweiz@ami.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1569351740-6285-1-git-send-email-hongweiz@ami.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hongwei Zhang <hongweiz@ami.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Joel Stanley <joel@jms.id.au>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Doug Anderson <armlinux@m.disordat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>, Russell King <linux@armlinux.org.u>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 24, 2019 at 9:02 PM Hongwei Zhang <hongweiz@ami.com> wrote:

> The related SGPIO driver has been accepted and merged into v5.4:
> _http://patchwork.ozlabs.org/patch/1150357/

Oh what a mess, it didn't add the necessary code into Kconfig
and Makefile, also names it sgpio-gpio.c when everything
else is named gpio-sgpio.c.

I guess I have to fix it up. My fault for missing.

Linus Walleij
