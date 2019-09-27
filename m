From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [v2, 2/2] gpio: dts: aspeed: Add SGPIO driver
Date: Fri, 27 Sep 2019 13:50:28 +0200
Message-ID: <CACRpkdY4RsqAOykyS-9GEFvF--3bmf=UjzADx8U18z=gTHBb4g@mail.gmail.com>
References: <1569439337-10482-1-git-send-email-hongweiz@ami.com> <1569439337-10482-3-git-send-email-hongweiz@ami.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1569439337-10482-3-git-send-email-hongweiz@ami.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hongwei Zhang <hongweiz@ami.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Joel Stanley <joel@jms.id.au>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Doug Anderson <armlinux@m.disordat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>, Russell King <linux@armlinux.org.u>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 25, 2019 at 9:22 PM Hongwei Zhang <hongweiz@ami.com> wrote:

> Add SGPIO driver support for Aspeed AST2500 SoC.
>
> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>

I sent a separate patch to fix this up the way I want it with the file
named gpio-aspeed-sgpio.c and CONFIG_GPIO_ASPEED_SGPIO.

I don't want to mix up the namespaces of something Aspeed-generic
with the namespace of the GPIO subsystem. SGPIO is the name
of a specific Aspeed component.

Yours,
Linus Walleij
