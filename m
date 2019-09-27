From: Hongwei Zhang <hongweiz@ami.com>
Subject: [v2, 2/2] gpio: dts: aspeed: Add SGPIO driver
Date: Fri, 27 Sep 2019 11:55:48 -0400
Message-ID: <1569599748-31181-1-git-send-email-hongweiz@ami.com>
References: <1569439337-10482-3-git-send-email-hongweiz@ami.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1569439337-10482-3-git-send-email-hongweiz@ami.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, linux-gpio@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Cc: Hongwei Zhang <hongweiz@ami.com>, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Doug Anderson <armlinux@m.disordat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Thanks Linus,

> 
> I sent a separate patch to fix this up the way I want it with the file named gpio-aspeed-sgpio.c and 
> CONFIG_GPIO_ASPEED_SGPIO.
> 
> I don't want to mix up the namespaces of something Aspeed-generic with the namespace of the GPIO 
> subsystem. SGPIO is the name of a specific Aspeed component.
> 
> Yours,
> Linus Walleij

I agree and gpio-aspeed-sgpio.c is better.

Regards,
--Hongwei
